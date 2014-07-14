class Restaurant < ActiveRecord::Base
  # RELATIONSHIPS
  has_and_belongs_to_many :cuisines
end
