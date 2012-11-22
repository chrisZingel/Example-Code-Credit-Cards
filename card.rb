require "#{File.dirname(__FILE__)}/card_type"
class Card

  include CardType
  def initialize(card_number)
    @card_number = card_number.to_s.gsub(/\D/,"")
  end
  def number
    @card_number
  end 
  def number=(val)
    @card_number = val
  end


end

class Validation
  def initialize(card)
    @card =card
  end

  def to_s
    card_is_valid? == true ? "(valid)" : "(invalid)"
 end

  def card_is_valid?
    luhn_algorithm && validated_card_type?
  end

  def luhn_algorithm
    total=0
    card_number_to_array.reverse.each_with_index {|val, index| 
      total +=  (index == 0 || index % 2 == 0 ) ? val : adjust_for_digit_than_9(val * 2 )
    }
    (total % 10 ) == 0
  end

  private
  def validated_card_type?
    CardType.new(@card).valid_card_type?
  end


  def adjust_for_digit_than_9(val)
    (val > 9) ? ( 1 + val - 10 ) : val
  end

  def card_number_to_array
    card_number_to_array=[]
    (0..@card.number.length - 1 ).each {|a| card_number_to_array.push(@card.number.send(:[],a).to_i) }
    card_number_to_array
  end

end


