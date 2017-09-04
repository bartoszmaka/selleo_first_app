class AddPostsAndComments < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :user
      t.string :title
      t.text :content
    end

    create_table :comments do |t|
      t.references :post
      t.references :user
      t.string :content
    end
  end
end
