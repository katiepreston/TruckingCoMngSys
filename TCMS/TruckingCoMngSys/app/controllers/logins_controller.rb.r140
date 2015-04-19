class LoginsController < ApplicationController
  before_action :check_session, only: [:landing]
  before_action :check_session_with_message, except: [:login, :authenticate]
  before_action :no_cache

  protected
  def no_cache
    expires_now
  end

  private

  def check_session
    redirect_to action: "login" if session[:user] == nil
  end

  def check_session_with_message
    redirect_to({action: "login"}, notice: "You must be logged in") if session[:user] == nil
  end


  public
  def login
  end

  def logout
    reset_session
  end

  def authenticate
    @user = Employee.find_by(username: params[:username])

    
    if @user.nil?
      reset_session
      redirect_to({ action: "login"}, notice: "Invalid Username")
      return
    end
    if @user = @user.authenticate(params[:password])
      reset_session
      session[:user] = @user.id
      session[:account_type] = @user.account_type
    else
      @user = nil
      reset_session
      redirect_to(root_url, notice: "Invalid Password")
      return
    end

    redirect_to action: "landing"
  end

  def landing
  end

end
