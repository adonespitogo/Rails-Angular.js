class Payment < ActiveRecord::Base
  # relations
  belongs_to :order
end
