class Cv
  include Mongoid::Document
  field :cv_name
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :personal_letter, type: String
  embeds_many :experiences
  embeds_many :educations
  accepts_nested_attributes_for :educations
  accepts_nested_attributes_for  :experiences
end
