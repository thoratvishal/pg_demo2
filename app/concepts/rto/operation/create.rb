module Rto::Operation
  class Create < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step :build_model
      step Contract::Build( constant: Rto::Contract::Form )

      def build_model(ctx, **)
        ctx[:model] = Rto.new
      end
    end

    step Subprocess(Present)
    step Contract::Validate(key: :rto)
    step Contract::Persist()
  end
end