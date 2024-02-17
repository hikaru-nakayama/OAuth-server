class CreateAccessTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :access_tokens do |t|
      t.string :value, null: false
      t.integer :user_id, null: false
      t.string :client_id, null: false
      t.datetime :expierd_at, null: false

      t.timestamps
    end
  end
end
