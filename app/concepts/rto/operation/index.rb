module Rto::Operation
  class Index < Trailblazer::Operation
    step :model
    step :set_total_rtos
    step :search_rtos
    step :paginate
    step :set_response_data

    def model(ctx, current_user:, **)
      ctx[:model] = Rto.all
    end

    def set_total_rtos(ctx, model:, **)
      ctx[:total_rtos] = model.size
    end

    def search_rtos(ctx, model:, params:, **)
      search_value = params.dig(:search, :value)&.squish
      return true if search_value.blank? || search_value.length < 3

      ctx[:model] = model.where(
      "rtos.name ILIKE ? OR rtos.city ILIKE ?",
      "%#{search_value}%",
      "#{search_value}%"
      )
    end

    def paginate(ctx, params:, model:,**)
      offset = params[:start].to_i
      limit = params[:length].to_i
      ctx[:model] = model.offset(offset).limit(limit)
    end

    def set_response_data(ctx, **)
      ctx[:response_data] = {
        model: ctx[:model],
        total_rtos: ctx[:total_rtos]
      }
    end
  end
end