class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :secret
      t.string :uid
      t.string :redirect_uri

      t.timestamps
    end
  end
end
