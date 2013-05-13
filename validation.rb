require "#{File.dirname(__FILE__)}/card_type"

module Validation
  def valid_description
    card_is_valid?  ? "(valid)" : "(invalid)"
  end

  def card_is_valid?
    luhn_algorithm && valid_card_type?
  end

  def luhn_algorithm
    total=0
    card_number_to_array.reverse.each_with_index {|val, index| 
      total +=  (index == 0 || index % 2 == 0 ) ? val : adjust_for_digit_than_9(val * 2 )
    }
    (total % 10 ) == 0
  end

  private

  def adjust_for_digit_than_9(val)
    (val > 9) ? ( 1 + val - 10 ) : val
  end

  def card_number_to_array
    card_number_to_array=[]
    (0..card_number.length - 1 ).each {|a| card_number_to_array.push(card_number.send(:[],a).to_i) }
    card_number_to_array
  end

end
