class Education
  include Mongoid::Document
  field :school, type: String
  field :subject, type: String
  field :description, type: String
  embedded_in :cv, inverse_of: :educations
end
