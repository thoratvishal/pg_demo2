require "reform"

module Rto::Contract
  class Form < Reform::Form
    property :name
    property :location
    property :city
    property :state
    property :address
  end
end