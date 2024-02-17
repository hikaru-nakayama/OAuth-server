class CreateAuthorizationCodeScopes < ActiveRecord::Migration[7.0]
  def change
    create_table :authorization_code_scopes do |t|
      t.string :code, null: false
      t.string :scope, null: false

      t.timestamps
    end
  end
end
