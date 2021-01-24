class AddUrlsToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :urls, :string
  end
end
