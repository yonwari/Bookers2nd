class AddColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :title, :text
    add_column :books, :body, :text
    add_column :books, :image_id, :text
    add_column :books, :user_id, :integer
  end
end
