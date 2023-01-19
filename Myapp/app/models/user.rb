class User < ApplicationRecord
  attr_accessor :old_password

  has_secure_password validations: false

  validates :password, confirmation: true, allow_blank: true,
    length: {minimum: 6, maximum: 70}
  
  validates :email, presence: true, uniqueness: true
  validate :password_complexity

  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/

    def password_complexity
      # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
      return if password.blank? || password =~ /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/
  
      msg = 'complexity requirement not met. Length should be 8-70 characters and ' \
            'include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
      errors.add :password, msg
    end
  end
end
