class Employee < ActiveRecord::Base
  # RELATIONSHIPS
  belongs_to :branch
  belongs_to :user

  delegate :firstname, :lastname, :branches, :avatar, :email, :phone_number, to: :user
end
