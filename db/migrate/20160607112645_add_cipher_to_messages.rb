class AddCipherToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :cipher, :string
  end
end
