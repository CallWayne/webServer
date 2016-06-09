# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(login: "Niklas", salt_masterkey: "test", pubkey_user: "hehehe", privkey_user_enc: "Verschlüsselter privkey")
User.create(login: "Josua", salt_masterkey: "test", pubkey_user: "hehehe", privkey_user_enc: "Verschlüsselter privkey")
Message.create(sender: "Niklas", content_enc:"test", iv:"test", key_recipient_enc:"test", sig_service: "test", sig_recipient:"test", recipient: "Josua", cipher: "test")
Message.create(sender: "Josua", content_enc:"test", iv:"test", key_recipient_enc:"test", sig_service: "test", sig_recipient:"test", recipient: "Niklas", cipher: "test")