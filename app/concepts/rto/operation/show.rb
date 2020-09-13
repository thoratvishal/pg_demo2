module Rto::Operation
  class Show < Trailblazer::Operation
    step Model(Rto, :find_by)
    fail :not_found

    def not_found(ctx, **)
      ctx[:errors] = "Rto Not Found"
    end
  end
end