class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(:email => params[:session][:email].downcase).first
    puts "+"*80, user
    if user and user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = 'Você entrou.'
      redirect_to user
    else
      flash[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
