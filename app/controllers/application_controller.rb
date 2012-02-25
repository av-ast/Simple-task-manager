class ApplicationController < ActionController::Base
    protect_from_forgery

    private

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    protected

    def require_login
        unless logged_in?
            # flash[:error] = "You must be logged in to access this section"
            redirect_to login_url # halts request cycle
        end
    end

    helper_method :current_user
end
