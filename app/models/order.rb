class Order < ActiveRecord::Base
  # relationships
  belongs_to :branch
  has_many :order_items
  has_many :payments
end
