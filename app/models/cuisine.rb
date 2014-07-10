class Cuisine < ActiveRecord::Base
  # RELATIONSHIPS
  has_and_belongs_to_many :restaurants
end
