class RemoveTokenFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :token, :string
  end
end
