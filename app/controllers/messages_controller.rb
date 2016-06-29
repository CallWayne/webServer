class MessagesController < ApplicationController
  require 'openssl'
  skip_before_action :verify_authenticity_token
  skip_before_filter :verify_authenticity_token
  
  def create
    if checktime == true
      @user = User.find_by(login: params[:login])

      pubKey = OpenSSL::PKey::RSA.new(Base64.decode64(@user.pubkey_user))

      pubKey.public_decrypt(Base64.decode64(params[:sig_service]))

      @message = Message.create(sender: params[:login],
                              content_enc: params[:content_enc],
                              iv: params[:iv],
                              key_recipient_enc: params[:key_recipient_enc],
                              sig_service: params[:sig_service],
                              sig_recipient: params[:sig_recipient],
                              recipient: params[:recipient])
      render plain: "Test"
    else
      head 400;
    end
  end




  def message
    #if checktime == true
      #@user = User.find_by(login: params[:login])

      #pubKey = OpenSSL::PKey::RSA.new(Base64.decode64(@user.pubkey_user))

      #pubKey.public_decrypt(Base64.decode64(params[:sig_service]))

      message = Message.where(recipient: params[:login])
        render json: message.to_json(only: %w(sender content_enc iv key_recipient_enc sig_recipient created_at))
  end

  def checktime
    timestamp = Time.now.to_i
    if ((((timestamp - (params[:timestamp]).to_i) / 1.minute) <= 5))
      return true
    else
      return nil
    end
  end
end



