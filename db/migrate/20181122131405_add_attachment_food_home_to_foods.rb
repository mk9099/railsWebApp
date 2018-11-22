class AddAttachmentFoodHomeToFoods < ActiveRecord::Migration[5.0]
  def self.up
    change_table :foods do |t|
      t.attachment :food_home
    end
  end

  def self.down
    remove_attachment :foods, :food_home
  end
end
