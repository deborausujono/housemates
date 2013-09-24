class Membership < ActiveRecord::Base
	#Associations
  belongs_to :house
  belongs_to :person
end
