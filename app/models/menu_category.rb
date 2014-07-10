class MenuCategory < ActiveRecord::Base
  # relationships
  has_and_belongs_to_many :branch_groups
end
