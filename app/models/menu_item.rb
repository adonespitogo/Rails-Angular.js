class MenuItem < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  # relationships
  has_and_belongs_to_many :item_options

  has_and_belongs_to_many :branch_menu_categories,
                            class_name: "BranchMenuCategory",
                            join_table: "menu_categories_menu_items"

  has_many :menu_categories, through: :branch_menu_categories

  has_many :branches, through: :branch_menu_categories

end
