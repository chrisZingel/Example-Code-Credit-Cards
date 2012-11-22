require "#{File.dirname(__FILE__)}/spec_helper"

describe "Card Validation" do
  before do
    @valid_card = "4408 0412 3456 7893"
    @invalid_card = "4417 1234 5678 9112"
  end

  it "for an invalidated card doesn't passes the Luhn algorithm" do
    card =Card.new(@invalid_card) 
    Validation.new(card).luhn_algorithm.should_not eq (true)
  end
  it "for a validated card passes the Luhn algorithm" do
    card =Card.new(@valid_card) 
    Validation.new(card).luhn_algorithm.should eq (true)
  end
end
