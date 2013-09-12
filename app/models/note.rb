class Note < ActiveRecord::Base
  belongs_to :person #should belong to house instead
  attr_accessible :text, :person_id
end
