module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
    # The session method provided by Rails is distinct from the SessionsController.
    # We can treat session as a hash. It represents a temporary cookie on the user's
    # browser containing an encrypted version of the user's id. This allows us to
    # retrieve the id on subsequent pages using session[:user_id]
    # In contrast to the persistent cookie created by the cookies method, this
    # cookie expires when the browser is closed.
  end

  # Returns the currently logged-in user 
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

end
