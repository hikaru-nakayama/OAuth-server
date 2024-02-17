class ChangeDataType < ActiveRecord::Migration[7.0]
  def change
    change_column :authorization_code_scopes, :scope_id, :integer
    change_column :authorization_code_scopes, :code_id, :integer
    change_column :access_tokens_scopes, :access_token_id, :integer
    change_column :access_tokens_scopes, :scope_id, :integer

  end
end
