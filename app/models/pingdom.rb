class Pingdom < Service
  attr_reader :params

  def message(params)
    @params = params
    "#{pingdom_params[:check_name]} state changed from #{pingdom_params[:previous_state]} to *#{pingdom_params[:current_state]}*"
  end

  private

    def pingdom_params
      @_pingdom_params = params.permit(:check_name, :current_state, :previous_state)
    end
end
