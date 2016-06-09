class MessagesController < ApplicationController
  def create
    begin
      #MASTERKEY mit Hilfe des SHA256 Algorithmus erzeugen
      sha256 = OpenSSL::Digest::SHA256.new
      #SIG_SERVICE (Digitale Signatur) erzeugen
      digest = sha256.hexdigest(params[:timestamp].to_s + params[:recipient].to_s + params[:sender].to_s + params[:cipher].to_s + params[:iv].to_s + params[:key_recipient_enc].to_s + params[:sig_recipient].to_s)
      #PUBLIC_KEY besorgen
      public_key = OpenSSL::PKey::RSA.new(Base64.decode64(User.find_by_name(params[:login]).public_key))
      #SIG_SERVICE entschlüsseln
      decrypt_digest = public_key.public_decrypt(Base64.decode64(params[:sig_service]))
      #gibt es den User?
      if User.exists?(login: params[:recipient]) then
        #SIG_SERVICE prüfen
        if decrypt_digest == digest then
          #ist die Nachricht älter als 5 Minuten?
          if (Time.now.to_i - params[:timestamp].to_i) < 300 and (Time.now.to_i - params[:timestamp].to_i) >= 0  then
            @message = Message.new(message_params)
            @message.is_called = 0
            #Nachricht speichern
            @message.save
                head 200
          else
            head 400
          end
        else
          head 400
        end
      else
        head 400
      end
    end
  end

  def message

  end

  def message_params
    params.require(:message).permit(:timestamp, :recipient, :sig_service, :login, :cipher, :iv, :key_recipient_enc, :sig_recipient, :signature)
  end
end


