class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.text :salt_masterkey
      t.text :pubkey_user
      t.text :privkey_user_enc

      t.timestamps null: false
    end
  end
end
