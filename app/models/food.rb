class Food < ApplicationRecord

    belongs_to :user
    belongs_to :category
    has_many :reviews

    has_attached_file :food_image, styles: { food_index: "350x250>", food_show: "400x450>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :food_image, content_type: /\Aimage\/.*\z/

end
