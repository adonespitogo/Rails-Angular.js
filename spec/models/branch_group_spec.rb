require 'rails_helper'

RSpec.describe BranchGroup, :type => :model do
  before(:each) do
    @branch_group = BranchGroup.make!
    @restaurant = @branch_group.restaurant

    @branch1 = Branch.make!
    @branch2 = Branch.make!
    @branch_group.branches << [@branch1, @branch2]

    @branch_menu_category1 = BranchMenuCategory.make!(branch: @branch1)
    @branch_menu_category2 = BranchMenuCategory.make!(branch: @branch2)

    @menu_category1 = @branch_menu_category1.menu_category
    @menu_category2 = @branch_menu_category2.menu_category

    @menu_item1 = MenuItem.make!
    @menu_item2 = MenuItem.make!

    @branch_menu_category1.menu_items << [@menu_item1, @menu_item2]
    @branch_menu_category2.menu_items << @menu_item2

  end
  context "Relationship queries" do
    it "should return all menu items belongs to it" do
      assert_equal @branch_group.menu_items.count, 2
    end

    it "should filter menu items by category" do |variable|
      assert_equal @branch_group.menu_items_by_category(@menu_category1.id).count, 2
      assert_equal @branch_group.menu_items_by_category(@menu_category2.id).first, @menu_item2
    end

    it "shoould return all categories in all each branches" do
      BranchMenuCategory.make!(branch: @branch1, menu_category: @menu_category2)
      BranchMenuCategory.make!(branch: @branch2, menu_category: @menu_category1)
      # @branch2.branch_menu_categories << @branch_menu_category1
      assert_equal 2, @branch_group.branches_categories.count
    end
  end
end
