module CardType 
  def name
    case
    when begins_with(4) && (length_being?(13) || length_being?(16))
      "Visa"
    when begins_with((51..55)) && length_being?(16)
      "MasterCard"
    when begins_with(6011) && length_being?(16)
      "Discover"
    when begins_with([34,37]) && length_being?(15)
      "AMEX"
    else
      "Unknown"
    end
  end

  def valid_card_type?
    name != "Unknown"
  end

  private
  def begins_with(args)
    str ='\A' +
     (case
    when args.is_a?(Numeric)
      args.to_s
    when args.is_a?(Array)
      args.join("|")
    when args.is_a?(Range)
      args.to_a.join("|")
    else
      raise "unknown type in method begins_with"
    end) + '\d*\Z'
    card_number.match(Regexp.new(str))
  end

  def length_being?(number_of_digits)
    card_number.length == number_of_digits
  end
end
