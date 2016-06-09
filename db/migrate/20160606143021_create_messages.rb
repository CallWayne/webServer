class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :sender #Sender
      t.text :content_enc #Inhalt entschlüsselt
      t.string :iv #
      t.string :key_recipient_enc
      t.string :sig_service
      t.string :sig_recipient
      t.string :recipient

      t.timestamps null: false
    end
  end
end
