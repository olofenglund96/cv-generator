class Cv
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :personal_letter, type: String
  embeds_many :experience
  accepts_nested_attributes_for :experience, reject_if: :all_blank, allow_destroy: true
end
