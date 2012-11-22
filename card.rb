require "#{File.dirname(__FILE__)}/card_type"
require "#{File.dirname(__FILE__)}/validation"
class Card

  include CardType
  include Validation

  def initialize(card_number)
    @card_number = card_number.to_s.gsub(/\D/,"")
  end
  def card_number
    @card_number
  end 
  def card_number=(val)
    @card_number = val
  end


end



