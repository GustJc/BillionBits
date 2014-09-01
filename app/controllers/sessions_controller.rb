class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      flash[:success] = 'Você entrou.'
      redirect_to root_path
    else
      flash[:alert] = 'Combinação invalida'
      render :action => 'new'
    end
  end

  def destroy
    reset_session
    flash[:alert] = 'Você saio.'
    redirect_to root_url, :error => "Você saio"
  end
end
