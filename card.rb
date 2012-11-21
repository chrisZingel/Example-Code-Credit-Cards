class Card
  def initialize(card_number)
    @card_number = card_number.to_s.gsub(/\D/,"")
  end

  def begins_with(number_of_digits)
    @card_number[0..number_of_digits]
  end

  def length_being?(number_of_digits)
    @card_number.length == number_of_digits
  end

  def card_type
    case 
    when ["34","37"].include?(begins_with(1)) && length_being?(15)
      return   "AMEX"
    end
  end
end

