class Experience
  include Mongoid::Document
  field :company, type: String
  field :description, type:String;
  field :start_date, type:Date;
  field :end_date, type:Date;
  embedded_in :cv, inverse_of: :experiences
  validates :company, :start_date, :end_date, :description, presence: true
end
