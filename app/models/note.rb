class Note < ActiveRecord::Base
  belongs_to :person
  attr_accessible :text, :person_id
end
