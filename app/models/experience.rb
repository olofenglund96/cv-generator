class Experience
  include Mongoid::Document
  field :experience_1, type: String
  field :experience_2, type: String
  field :experience_3, type: String
  embedded_in :cv
end
