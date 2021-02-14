class AddContentToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :content, :text
    add_index  :posts, :content
  end
end
