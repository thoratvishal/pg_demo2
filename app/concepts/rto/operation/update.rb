module Rto::Operation
  class Update < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(Rto, :find_by)
      step Contract::Build( constant: Rto::Contract::Form )
    end

    step Nested(Present)
    step Contract::Validate( key: :rto )
    step Contract::Persist()
  end
end