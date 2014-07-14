class OrderItem < ActiveRecord::Base
  # relationships
  belongs_to  :order
  belongs_to  :ordered_item,
                class_name: "MenuItem"
  has_many :order_item_options
end
