class AddFieldsToUser < ActiveRecord::Migration
  def up
  	add_column :users, :username, :string
  	add_column :users, :fullname, :string
  	add_column :users, :birthdate, :date
  end

  def down
  	remove_column :users, :username
  	remove_column :users, :fullname
  	remove_column :users, :birthdate
  end
end
