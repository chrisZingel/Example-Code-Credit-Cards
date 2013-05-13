require "#{File.dirname(__FILE__)}/card_type"
require "#{File.dirname(__FILE__)}/validation"
class Card
  attr_accessor :card_number
  include CardType
  include Validation

  def initialize(card_number)
    @card_number = card_number.to_s.gsub(/\D/,"")
  end

end



