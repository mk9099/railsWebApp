require 'test_helper'

class ReviewTest < ActiveSupport::TestCase

    test "invalid rating" do
      @review = reviews(:one)
      @review.rating = nil
      assert_not @review.save, "Saved with an invalid rating"
    end

    test "invalid comment" do
      @review = reviews(:one)
      @review.comment = nil
      assert_not @review.save, "Saved with an invalid comment"
    end

end
