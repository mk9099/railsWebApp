class Food < ApplicationRecord

    belongs_to :user      #one user per food
    belongs_to :category  #one category per food
    has_many :reviews     #each food can have a number of reviews

    has_attached_file :food_image, styles: { food_index: "350x250>", food_show: "400x450>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :food_image, content_type: /\Aimage\/.*\z/ #specifies the sizes of the images being displayed on the show and index page

    validates :name, :description, :ingrediants, presence: true

end
