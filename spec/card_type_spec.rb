require "#{File.dirname(__FILE__)}/spec_helper"

describe "Card classifications" do
  describe "for the Visa" do
    before do
      @valid_cards = ["4234567890123",
                      "4234567890123456" ]
      @in_valid_card ="invalid_account_number"
      @card_classification = "Visa"
    end

    it "for a valid Visa card it should classify it as a Visa cards" do
      @valid_cards.each do |valid_card|
        CardType.new(valid_card).name.should eq(@card_classification)
      end
    end

    it "for a invalid Visa card it should not classify it as a Visa cards" do
      CardType.new(@in_valid_card).name.should_not eq(@card_classification)
    end
  end
  describe "for the MasterCard" do
    before do
      @valid_cards = ["5134567890123456",
                      "5234567890123456",
                      "5334567890123456",
                      "5434567890123456",
                      "5534567890123456" ]
      @in_valid_card ="invalid_account_number"
      @card_classification = "MasterCard"
    end

    it "for a valid MasterCard card it should classify it as a MasterCard cards" do
      @valid_cards.each do |valid_card|
        CardType.new(valid_card).name.should eq(@card_classification)
      end
    end

    it "for a invalid MasterCard card it should not classify it as a MasterCard cards" do
      CardType.new(@in_valid_card).name.should_not eq(@card_classification)
    end
  end
  describe "for the Discover" do
    before do
      @valid_cards = ["6011123456789012"]
      @in_valid_card ="invalid_account_number"
      @card_classification = "Discover"
    end

    it "for a valid Discover card it should classify it as a Discover cards" do
      @valid_cards.each do |valid_card|
        CardType.new(valid_card).name.should eq(@card_classification)
      end
    end

    it "for a invalid Discover card it should not classify it as a Discover cards" do
      CardType.new(@in_valid_card).name.should_not eq(@card_classification)
    end
  end
  describe "for the AMEX " do
    before do
      @valid_cards = ["341234567890123","371234567890123"]
      @in_valid_card ="invalid_account_number"
      @card_classification = "AMEX"
    end

    it "for a valid AMEX card it should classify it as a AMEX cards" do
      @valid_cards.each do |valid_card|
        CardType.new(valid_card).name.should eq(@card_classification)
      end
    end

    it "for a invalid AMEX card it should not classify it as a AMEX cards" do
      CardType.new(@in_valid_card).name.should_not eq(@card_classification)
    end
  end
end
