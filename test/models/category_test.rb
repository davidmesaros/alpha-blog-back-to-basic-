require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(:name => "sport")
  end

  test "category should be active" do
      assert @category.valid?
  end

  test "name should be present" do
      @category.name = ''
      assert_not @category.valid?# run the code find any error true if it clear and false if not 
  end

  test "name should be unique" do
     @category.save
     category2 = Category.new(name:"sport")
     assert_not category2.valid?
  end

  test "name should not be too long" do
    @category.name = "a"* 26
    assert_not @category.valid?
  end

  test "name should not be too short" do
    @category.name = 'aa'
    assert_not @category.valid?
  end

end