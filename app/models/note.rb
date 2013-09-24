class Note < ActiveRecord::Base
  #Mass-assignments
  attr_accessible :text, :person_id, :house_id

  #Associations
  belongs_to :person
  belongs_to :house

  # Validations
  validates :text, :person_id, :house_id, presence: true
end
