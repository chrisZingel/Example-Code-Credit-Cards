require "#{File.dirname(__FILE__)}/spec_helper"

describe Card do
  before do
    @valid_card = "341234567890123"
  end

  it "should classify AMEX cards" do
    Card.new(@valid_card).card_type.should eq("AMEX")
  end
end
