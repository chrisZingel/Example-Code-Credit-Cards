class Card
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
    (0..@card.number.length - 1 ).each {|a| card_number_to_array.push(@card.number.send(:[],a).to_i) }
    card_number_to_array
  end

end


class CardType 
  def initialize(card)
    @card =card
  end

  def name
    case 
    when begins_with?("4") && (length_being?(13) || length_being?(16))
      return   "Visa"
    when begins_with?("51","52","53","54","55") && length_being?(16)
      return   "MasterCard"
    when begins_with?("6011") && length_being?(16)
      return   "Discover"
    when begins_with?("34", "37") && length_being?(15)
      return   "AMEX"
    else
      return nil
    end
  end

  private
  def first_digits(number_of_digits)
    @card.number[0..(number_of_digits - 1 )]
  end

  def begins_with?(*args)
    return_value =false
    args.each do |arg|
      return_value =true if (first_digits(arg.length) == arg)
    end
    return_value
  end

  def length_being?(number_of_digits)
    @card.number.length == number_of_digits
  end
end
