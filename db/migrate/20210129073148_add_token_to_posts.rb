class AddTokenToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :token, :string
  end
end
