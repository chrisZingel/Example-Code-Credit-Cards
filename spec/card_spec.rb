require "#{File.dirname(__FILE__)}/spec_helper"

describe Card do
  before do
    @valid_card = "341234567890123"
    @in_valid_card ="invalid_account_number"
  end

  it "for a valid AMEX card it should classify it as a AMEX cards" do
    Card.new(@valid_card).card_type.should eq("AMEX")
  end

  it "for a invalid AMEX card it should not classify it as a AMEX cards" do
    Card.new(@in_valid_card).card_type.should_not eq("AMEX")
  end
end
