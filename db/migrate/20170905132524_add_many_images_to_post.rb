class AddManyImagesToPost < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :image
    add_column :posts, :images, :json
  end
end
