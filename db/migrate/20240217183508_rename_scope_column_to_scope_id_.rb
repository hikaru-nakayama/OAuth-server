class RenameScopeColumnToScopeId < ActiveRecord::Migration[7.0]
  def change
    rename_column :authorization_code_scopes, :code, :code_id
    rename_column :authorization_code_scopes, :scope, :scope_id
    rename_column :access_tokens_scopes, :access_token, :access_token_id
    rename_column :access_tokens_scopes, :scope, :scope_id
  end
end
