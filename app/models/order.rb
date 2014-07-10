class Order < ActiveRecord::Base
  # relationships
  belongs_to :branch
end
