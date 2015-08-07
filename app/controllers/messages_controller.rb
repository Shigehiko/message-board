class MessagesController < ApplicationController
  def index
    # Messageを全て取得する。
    
    @messages = Message.all
  end
  ## ここから追記
  def create
    @message = Message.new(message_params)
  if @message.save
    redirect_to root_path , notice: 'メッセージを保存しました'
  

  else
      # メッセージが保存できなかった時
      @messages = Message.all
      flash.now[:alert] = "メッセージの保存に失敗しました。"
      render 'index'
    end
  ## ここまで
end
end