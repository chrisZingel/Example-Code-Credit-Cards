require "#{File.dirname(__FILE__)}/spec_helper"

describe "Card classifications" do
    before do
      @valid_cards = ["4234567890123",
                      "4234567890123456" ]
      @in_valid_card ="invalid_account_number"
      @card_classification = "Visa"
    end
end
