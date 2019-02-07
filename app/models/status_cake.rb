class StatusCake < Service
  def message(params)
    status_params = params.permit(:Name, :Status, :StatusCode)
    "#{status_params[:Name]} state changed to *#{pingdom_params[:Status]} (#{pingdom_params[:StatusCode]})*"
  end

end
