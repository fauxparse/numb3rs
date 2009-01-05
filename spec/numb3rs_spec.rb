require File.dirname(__FILE__) + '/spec_helper'

describe "Numb3rs" do
  @test_cases = {
             -1 => "minus one",
              0 => "zero",
             20 => "twenty",
             21 => "twenty-one",
            100 => "a hundred",
            107 => "a hundred and seven",
            634 => "six hundred and thirty-four",
          1_000 => "a thousand",
          2_009 => "two thousand and nine",
        123_456 => "a hundred and twenty-three thousand, four hundred and fifty-six",
      1_000_000 => "a million",
      1_000_001 => "a million and one",
      1_048_576 => "one million, forty-eight thousand, five hundred and seventy-six",
    456_789_012 => "four hundred and fifty-six million, seven hundred and eighty-nine thousand and twelve"
  }
  
  @test_cases.each_pair do |i, a|
    it "should convert #{i} to '#{a}'" do
      i.in_words.should == a
    end
  end
end