module LoginHelper
  def log_in(user)
    post login_path, params: { session: { email: user.email, password: user.password  } }
  end
end
