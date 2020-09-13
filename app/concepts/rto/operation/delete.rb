module Rto::Operation
  class Delete < Trailblazer::Operation
    step Model(Rto, :find_by)
    step :delete!

    def delete!(ctx, model:, **)
      model.destroy
    end
  end
end