class AddCulumnPublicUidToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :public_uid, :string
    add_index  :posts, :public_uid, unique: true
  end
end
