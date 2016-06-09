class MessagesController < ApplicationController
  def create
    begin
      #MASTERKEY mit Hilfe des SHA256 Algorithmus erzeugen
      #sha256 = OpenSSL::Digest::SHA256.new
      #SIG_SERVICE (Digitale Signatur) erzeugen
     # digest = sha256.hexdigest(params[:timestamp].to_s + params[:recipient].to_s + params[:sender].to_s + params[:cipher].to_s + params[:iv].to_s + params[:key_recipient_enc].to_s + params[:sig_recipient].to_s)
      #PUBLIC_KEY besorgen
      #public_key = OpenSSL::PKey::RSA.new(Base64.decode64(User.find_by_name(params[:login]).public_key))
      #SIG_SERVICE entschlüsseln
      #decrypt_digest = public_key.public_decrypt(Base64.decode64(params[:sig_service]))
      #gibt es den User?
      #if User.exists?(login: params[:recipient]) then
        #SIG_SERVICE prüfen
        #if decrypt_digest == digest then
          #ist die Nachricht älter als 5 Minuten?
         # if (Time.now.to_i - params[:timestamp].to_i) < 300 and (Time.now.to_i - params[:timestamp].to_i) >= 0  then
      Message.new(sender: params[:user], content_enc: params[:content_enc], iv: params[:iv], key_recipient_enc: params[:key_recipient_enc], sig_service: params[:sig_service], sig_recipient: params[:sig_recipient], recipient: params[:recipient], cipher: params[:cipher])

               # head 200
          #else
           # head 400
         # end
       # else
          #head 400
       # end
     # else
        #head 400
     # end
    #end
    end
  end


  def message
    begin
      # Überprüfen ob User existiert
      user = User.find_by(login: params[:login]) # User zu dem die Nachricht gehört
      render json: user.messages.last.to_json

      #sha256 = OpenSSL::Digest::SHA256.new
      # signature berechnen
      #digest = sha256.hexdigest(params[:login] + params[:timestamp].to_s)
      # public_key des Users aus der Datenbank holen
      #public_key = OpenSSL::PKey::RSA.new(Base64.decode64(User.find_by_name(params[:id]).public_key))
      # signature vom Client mit public_key entschlüsseln
      #decrypt_digest = public_key.public_decrypt(Base64.decode64(params[:signature]))
      # signature überprüfen
      #if decrypt_digest == digest
        # Überprüfen ob Nachricht nicht älter als fünf Minuten
       # if (Time.now.to_i - params[:timestamp].to_i) < 300 and (Time.now.to_i - params[:timestamp].to_i) >= 0
          # Alle neuen Nachrichten des Users abrufen.
          #@messages = Message.where(recipient: params[:id])
          # Wenn keine gefunden, dann Status 5 zurückgeben, sonst Nachrichten zurückgeben
          #if(@messages.blank?)
           # head 400
          #else
           # @messages.each do |m|
            #  m.is_called = true
             # m.save
            #end

         # end
        #else
         # head 400
        #end
     # else
      #  head 400
     # end

    end
  end

end


