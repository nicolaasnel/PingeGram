class Pingdom < Service
  def message(params)
    pingdom_params = params.permit(:check_name, :current_state, :previous_state)
    "#{pingdom_params[:check_name]} state changed from #{pingdom_params[:previous_state]} to *#{pingdom_params[:current_state]}*"
  end

end
