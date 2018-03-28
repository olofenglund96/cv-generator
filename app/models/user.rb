class User
  include Mongoid::Document
  before_save {self.email = email.downcase}
  field :name, type: String
  field :email, type: String

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name, presence: true
  validates :email, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  #Should be some kind of index thing here to prevent duplicates further. Something like this:
  #index({ remote_id: 1, user_id: 1 }, { unique: true })
end