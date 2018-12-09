class Review < ApplicationRecord

  belongs_to  :user #one user per review
  belongs_to :food  #one food per review

end
