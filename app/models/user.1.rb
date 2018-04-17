class User
  include Mongoid::Document
  devise(:database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :confirmable)

  validates :email, uniqueness: true
  validates :email, format: { with: Devise::email_regexp }
  validates :firstname, :lastname, presence: true, format: { with: /\A[\p{L}\p{M}*\-\p{Zs}]{2,}\z/ }
  validates :password_confirmation, presence: true, on: :create
end
