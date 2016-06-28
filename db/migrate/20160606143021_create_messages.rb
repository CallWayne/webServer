class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :sender #Sender
      t.text :content_enc #Inhalt entschlüsselt
      t.text :iv #
      t.text :key_recipient_enc
      t.text :sig_service
      t.text :sig_recipient
      t.text :recipient

      t.timestamps null: false
    end
  end
end
