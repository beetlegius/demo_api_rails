class AuthenticateUser
  prepend SimpleCommand

  def initialize(user)
    @email = user[:email]
    @password = user[:password]
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_accessor :email, :password

  def user
    @user ||= User.find_by!(email: email)
    return @user if @user.authenticate(password)
    errors.add :password, 'Invalid credentials'
  end

end
