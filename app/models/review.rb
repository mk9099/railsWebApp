class Review < ApplicationRecord

  belongs_to  :user #one user per review
  belongs_to :food  #one food per review

  validates :rating, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 0}, presence: true
  validates :comment, presence: true

end
