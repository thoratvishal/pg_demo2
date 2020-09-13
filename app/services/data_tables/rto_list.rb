module DataTables
  class RtoList < Base
    def initialize(current_user, params)
      @params = params
      @result = Rto::Operation::Index.(params: @params, current_user: current_user)
      @rtos = @result.success? ? @result[:response_data][:model] : []
      @current_user = current_user
      @errors = @result[:errors] || ""
    end

    def as_json(_options = {})
      {
        draw:            @params[:draw].to_i,
        data:            data,
        recordsTotal:    count,
        recordsFiltered: count,
        error:           errors
      }
    end

    private

    def count
      @result[:response_data] ? @result[:response_data][:total_rtos] : 0
    end

    def errors
      @result.failure? ? @errors : ''
    end

    def data
      @data ||= @rtos.map do |rto|
        [
          rto[:name]&.titleize || "-",
          rto[:location]&.titleize || "-",
          rto[:city]&.titleize || "-",
          rto[:state]&.titleize || "-",
          rto[:address]&.titleize || "-",
          rto_action_tags(rto)
        ].compact
      end
    end
  end
end