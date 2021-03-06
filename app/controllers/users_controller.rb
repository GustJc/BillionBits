class UsersController < ApplicationController

  def new
    @user = User.new
    @user.build_profile
  end

  def create
    @user = User.new(params[:user])
    @user.profile.update_attributes(params[:user][:profile])
    # Autosave and rollback profile
    if @user.save
      flash[:success] = "Sua conta foi criada"
      redirect_to @user
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to root_path, :notice => "Atributos atualizados"
    else
      render :action => 'edit'
    end
  end

  def show
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "Não foi possivel encontrar usuário"
      redirect_to :action => 'new'
    end
  end
end
