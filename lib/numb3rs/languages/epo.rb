module Numb3rs
  module Languages
    class Epo < EnUk
      def initialize
        @cached = {
          0 => "nulo",
          1 => "unu",
          2 => "du",
          3 => "tri",
          4 => "kvar",
          5 => "kvin",
          6 => "ses",
          7 => "sep",
          8 => "ok",
          9 => "naŭ",
          10 => "dek",
          100 => "cent",
          1000 => "mil",
          1000000 => "miliono"
        }
      end
      
      def in_words(number, *args)
        @cached[number] || returning("") do |s|
          s << case number
          when         0..99          then partial_words(number, 10)
          when       100..999         then partial_words(number, 100)
          when     1_000..999_999     then partial_words(number, 1000)
          when 1_000_000..999_999_999 then partial_words(number, 1_000_000)
          else "?"
          end
          @cached[number] = s if number < 1000 and @cached[number].nil?
        end
      end

    protected
      def partial_words(number, magnitude)
        maj, min = number / magnitude, number % magnitude
        ([ (maj == 1 ? "" : in_words(maj) + (magnitude < 1000 ? "" : " ")) + in_words(magnitude), in_words(min) ] - [ in_words(0) ]).join(" ")
      end
    end
  end
end
