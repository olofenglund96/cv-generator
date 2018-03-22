class Cv
  include Mongoid::Document
  #include Mongoid::Attributes::Dynamic
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :personal_letter, type: String
  embeds_many :experiences
  accepts_nested_attributes_for  :experiences
end
