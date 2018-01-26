class User < ApplicationRecord
  enum role: %w(member admin superadmin)
  has_secure_password

  def is_role?(*roles)
    roles.any? { |a_role| role == a_role }
  end
end
