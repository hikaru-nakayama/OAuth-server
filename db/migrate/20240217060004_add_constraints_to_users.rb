class AddConstraintsToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :login_id, false
    add_index :users, :login_id, unique: true
  end
end
