module Numb3rs
  @cached = {
    0 => "zero",
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen",
    20 => "twenty",
    30 => "thirty",
    40 => "forty",
    50 => "fifty",
    60 => "sixty",
    70 => "seventy",
    80 => "eighty",
    90 => "ninety",
    100 => "a hundred",
    1_000 => "a thousand",
    1_000_000 => "a million",
    1_000_000_000 => "a billion",
    1_000_000_000_000 => "a trillion",
  }

  def self.in_words(number)
    return "minus " + in_words(-number) if number < 0
    @cached[number] || returning("") do |s|
      s << case number
      when         0..99          then ([ in_words(number - number % 10), in_words(number % 10) ] - %w(zero)).join("-")
      when       100..999         then partial_words(number, 100)
      when     1_000..999_999     then partial_words(number, 1000)
      when 1_000_000..999_999_999 then partial_words(number, 1000_000)
      else "many"
      end
      s.sub! /^one /, "a " unless number > 1_000_000 and number % 1_000_000 > 100
      @cached[number] = s if number < 1000 and @cached[number].nil?
    end
  end
  
protected
  def self.partial_words(number, magnitude)
    ([ in_words(number / magnitude) + " " + in_words(magnitude).sub(/^a(n)? /, ""), in_words(number % magnitude) ] - %w(zero)).join(number % magnitude < 100 ? " and " : ", ")
  end
end
