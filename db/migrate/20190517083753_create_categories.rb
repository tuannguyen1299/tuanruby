class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
# Day la file migration của rails, nhìn gọn hơn laraveo đúng không
# 