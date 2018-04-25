class Education
  include Mongoid::Document
  field :school, type: String
  field :subject, type: String
  field :description, type: String
  field :start_date, type: Date;
  field :end_date, type: Date;
  embedded_in :cv, inverse_of: :educations
end
