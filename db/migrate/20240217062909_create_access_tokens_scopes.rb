class CreateAccessTokensScopes < ActiveRecord::Migration[7.0]
  def change
    create_table :access_tokens_scopes do |t|
      t.string :access_token, null: false
      t.string :scope, null: false

      t.timestamps
    end
  end
end
