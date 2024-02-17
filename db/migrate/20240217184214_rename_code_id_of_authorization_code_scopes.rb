class RenameCodeIdOfAuthorizationCodeScopes < ActiveRecord::Migration[7.0]
  def change
    rename_column :authorization_code_scopes, :code_id, :authorization_code_id
  end
end
