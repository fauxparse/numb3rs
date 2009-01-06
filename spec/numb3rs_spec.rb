require File.dirname(__FILE__) + '/spec_helper'

describe "Numb3rs" do
  @test_cases = {
    "en-uk" => {
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
    },
    "fr" => {
                0 => "zéro",
               20 => "vingt",
               21 => "vingt-et-un",
               75 => "soixante-quinze",
               98 => "quatre-vingt-dix-huit",
              100 => "cent",
              107 => "cent sept",
              200 => "deux cents",
              202 => "deux cent deux",
              634 => "six cent trente-quatre",
            1_000 => "mille",
            2_009 => "deux mille neuf",
          123_456 => "cent vingt-trois mille, quatre cent cinquante-six",
        1_000_000 => "un million",
        1_000_001 => "un million un",
        1_048_576 => "un million, quarante-huit mille, cinq cent soixante-seize",
      456_789_012 => "quatre cent cinquante-six million, sept cent quatre-vingt-neuf mille douze"
    }
  }
  
  @test_cases.each_pair do |lang, cases|
    describe "(#{lang})" do
      cases.each_pair do |i, a|
        it "should convert #{i} to '#{a}'" do
          i.in_words(lang).should == a
        end
      end
    end
  end
  
  it "should default to UK English" do
    123.in_words.should == "a hundred and twenty-three"
  end
end