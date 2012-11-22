
module CardType 
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
      return "Unknown"
    end
  end

  def valid_card_type?
    !(name == "Unknown")
  end

  private
  def first_digits(number_of_digits)
    @card_number[0..(number_of_digits - 1 )]
  end

  def begins_with?(*args)
    return_value =false
    args.each do |arg|
      return_value =true if (first_digits(arg.length) == arg)
    end
    return_value
  end

  def length_being?(number_of_digits)
    @card_number.length == number_of_digits
  end
end
