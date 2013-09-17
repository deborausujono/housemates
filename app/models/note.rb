class Note < ActiveRecord::Base
  belongs_to :person
  belongs_to :house
  attr_accessible :text, :person_id, :house_id

  # Validations
  validates :text, :person_id, :house_id, presence: true
end
