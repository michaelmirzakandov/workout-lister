class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(name: params[:user][:name])
  
      user = user.try(:authenticate, params[:user][:password])
  
      return redirect_to(controller: 'sessions', action: 'new') unless user
  
      session[:user_id] = user.id
  
      @user = user
  
      redirect_to controller: 'welcome', action: 'home'
    end

    def omniauth
      user = User.find_or_create_by(uid: request.env['omniauth.auth'][:uid]) do |u|
        u.name = request.env['omniauth.auth'][:info][:name]
        u.password = SecureRandom.hex(15)
      end
      if user.valid?
        session[:user_id] = user.id
        @user = user
        redirect_to controller: 'welcome', action: 'home'
      else
        redirect_to '/'
      end        
    end
  
    def destroy
      session.delete :user_id
  
      redirect_to '/'
    end
  end