class AddUidAndNicknameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string
    add_column :users, :nickname, :string
    add_index :users, :uid, :unique => true
  end
end
