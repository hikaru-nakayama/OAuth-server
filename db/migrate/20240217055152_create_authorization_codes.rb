class CreateAuthorizationCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :authorization_codes do |t|
      t.string :value, null: false
      t.integer :user_id, null: false
      t.string :client_id, null: false
      t.string :redirect_uri
      t.datetime :expierd_at, null: false

      t.timestamps
    end
  end
end
