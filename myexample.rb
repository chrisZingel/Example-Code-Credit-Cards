#!/usr/bin/ruby
require 'rubygems'
require 'bundler/setup'
require File.join(File.dirname(__FILE__), '/card')


class TerminalWindow
  def self.credit_numbers
    @raw_records
  end

  def self.data_input
    @raw_records, a =[], "enter_card_details"
    puts "Enter credit cards (enter a blank line to stop)"
    while a != ""
      a = gets.chomp
      @raw_records << a unless a == ""
    end
  end

  def self.display_results
    format="%10s %20s %10s\n"
    printf(format, "card type", "Card Number", "valid")
    printf(format, "--------", "--------------", "-----")
    credit_numbers.each do |p|
      print_card_details(p)
    end
  end
  private

  def self.print_card_details(card_number, format = "%10s %20s %10s\n")
    card =Card.new(card_number)
    printf(format, card.name, card.card_number, card.valid_description)
  end


end

TerminalWindow.data_input
TerminalWindow.display_results
