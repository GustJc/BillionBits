class UsersController < ApplicationController

  def show
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "Não foi possivel encontrar usuário"
      redirect_to :action => 'new'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Sua conta foi criada"
      redirect_to @user
    else
      render 'new'
    end
  end
end
