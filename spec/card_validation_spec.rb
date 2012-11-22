require "#{File.dirname(__FILE__)}/spec_helper"

describe "Card Validation" do
  before do
    @valid_card = "4408 0412 3456 7893"
    @invalid_card = "4417 1234 5678 9112"
    @in_valid_card_with_vaild_luhn = "9408 0412 3456 7843"
  end

  it "for an invalidated card doesn't passes the Luhn algorithm" do
    card =Card.new(@invalid_card) 
    Validation.new(card).luhn_algorithm.should_not eq (true)
  end
  it "for a validated card passes the Luhn algorithm" do
    card =Card.new(@valid_card) 
    Validation.new(card).luhn_algorithm.should eq (true)
  end
  it "for a valided luhn algorithm and card type the card is valid" do 
    card =Card.new(@valid_card) 
    Validation.new(card).card_is_valid?.should eq (true)
  end
  it "for a valided luhn algorithm and invalid card type then the card is invalid" do 
    card =Card.new(@in_valid_card_with_vaild_luhn) 
    Validation.new(card).card_is_valid?.should_not eq (true)
  end

end
