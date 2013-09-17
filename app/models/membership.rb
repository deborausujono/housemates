class Membership < ActiveRecord::Base
  belongs_to :house
  belongs_to :person
end
