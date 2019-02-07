class StatusCake < Service
  def message(params)
    status_params = params.permit(:Name, :Status, :StatusCode)
    "#{status_params[:Name]} state changed to *#{status_params[:Status]} (#{status_params[:StatusCode]})*"
  end

end
