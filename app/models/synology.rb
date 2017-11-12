class Synology < Service
  def message(params)
    params.permit(:message)[:message]
  end

end
