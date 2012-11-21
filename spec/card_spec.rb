require "#{File.dirname(__FILE__)}/spec_helper"

describe "Card classifications" do
  describe "for the Discover  card" do
    before do
      @valid_cards = ["6011123456789012"]
      @in_valid_card ="invalid_account_number"
      @card_classification = "Discover"
    end

    it "for a valid Discover card it should classify it as a Discover cards" do
      @valid_cards.each do |valid_card|
        Card.new(valid_card).card_type.should eq(@card_classification)
      end
    end

    it "for a invalid Discover card it should not classify it as a Discover cards" do
      Card.new(@in_valid_card).card_type.should_not eq(@card_classification)
    end
  end
  describe "for the AMEX card" do
    before do
      @valid_cards = ["341234567890123","371234567890123"]
      @in_valid_card ="invalid_account_number"
      @card_classification = "AMEX"
    end

    it "for a valid AMEX card it should classify it as a AMEX cards" do
      @valid_cards.each do |valid_card|
        Card.new(valid_card).card_type.should eq(@card_classification)
      end
    end

    it "for a invalid AMEX card it should not classify it as a AMEX cards" do
      Card.new(@in_valid_card).card_type.should_not eq(@card_classification)
    end
  end
end
