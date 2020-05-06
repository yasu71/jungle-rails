class User < ActiveRecord::Base
  
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }

  before_save :downcase_fields

  def downcase_fields
      self.email.downcase
  end

  def self.authenticate_with_credentials(email, password)
    lowercase_email = email.strip.downcase
    user = User.find_by_email(lowercase_email)

    if user && user.authenticate(password)
      return user
    else
      return nil
    end

  end
  
end
