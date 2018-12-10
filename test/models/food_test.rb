require 'test_helper'

class FoodTest < ActiveSupport::TestCase

  setup do
    @food = foods(:one)
    @foodTwo = foods(:two)
  end

  test "invalid no name" do
    @food.name = nil
    assert_not @food.save, "Saved with no name"
  end

  test "invalid no description" do
    @food.description = nil
    assert_not @food.save, "Saved with no description"
  end

  test "invalid no ingrediants" do
    @food.ingrediants = nil
    assert_not @food.save, "Saved with no ingrediants"
  end

  test "without user" do
    @food.user = nil
    assert_not @food.save, "saved with no user"
  end

  test "without category" do
    @food.category = nil
    assert_not @food.save, "saved with no user"
  end

  test "#reviews" do
    
  end

end
