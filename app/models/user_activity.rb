class UserActivity < ActiveRecord::Base
  # relations
  belongs_to :user
  belongs_to :parent, class_name: "UserActivity", foreign_key: "parent_id"
  has_one :child, class_name: "UserActivity", foreign_key: "parent_id"
end
