class GamesController < ApplicationController

  def new
    authenticate
    @game = Game.new
  end

  def create
    # Só permite se estiver logado
    authenticate

    @game = Game.new(params[:game])
    current_user.profile.games << @game

    if current_user.save
      flash[:success] = "Jogo criado com sucesso"
      redirect_to current_user
    else
      render :action => 'new'
    end
  end

  def edit
    authenticate

    @game = Game.find(params[:id])
  end

  def update
    authenticate

    @game = Game.find(params[:id])
    if @game.update_attributes(params[:game])
      redirect_to user_path(current_user), :notice => "Atributos atualizados"
    else
      render :action => 'edit'
    end
  end

  def add_bits
    # Somente ajax
    render :root_path if not request.xhr?
    # Somente se logado
    authenticate

    game = Game.find(params[:id])
    game.likes << current_user.profile unless game.likes.include?(current_user.profile)
    
    if not game.save!
      flash[:error] = "Erro ao salvar bit"
    end

    render :text => game.likes.count
  end

  def remove_bits
    puts "="*100
    # Somente ajax
    render :root_path if not request.xhr?
    # Somente se logado
    authenticate

    game = Game.find(params[:id])
    
    if game.likes.include?(current_user.profile)
      game.likes.delete(current_user.profile)
    end
    
    if not game.save!
      flash[:error] = "Erro ao salvar bit"
    end

    render :text => game.likes.count
  end
end
