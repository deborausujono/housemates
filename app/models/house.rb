class House < ActiveRecord::Base
	# Mass-assignments
  attr_accessible :name, :public

  # Associations
  has_many :people

  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :public, inclusion: { in: [true, false] }
end
