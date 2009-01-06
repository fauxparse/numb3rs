module Numb3rs
  module Languages
    class Fr < EnUk
      def initialize
        @cached = {
          0 => "zéro",
          1 => "un",
          2 => "deux",
          3 => "trois",
          4 => "quatre",
          5 => "cinq",
          6 => "six",
          7 => "sept",
          8 => "huit",
          9 => "neuf",
          10 => "dix",
          11 => "onze",
          12 => "douze",
          13 => "treize",
          14 => "quatorze",
          15 => "quinze",
          16 => "seize",
          17 => "dix-sept",
          18 => "dix-huit",
          19 => "dix-neuf",
          20 => "vingt",
          30 => "trente",
          40 => "quarante",
          50 => "cinquante",
          60 => "soixante",
          80 => "quatre-vingts",
          100 => "cent",
          1_000 => "mille",
          1_000_000 => "un million",
          1_000_000_000 => "un milliard",
          1_000_000_000_000 => "un un billion",
        }
      end
      
      def in_words(number, *args)
        return "minus " + in_words(-number) if number < 0 # TODO this is NOT French, I am pretty sure
        @cached[number] || returning("") do |s|
          s << case number
          when    61..79, 81..99      then ([ in_words(number - number % 20).sub(/s$/, ""), in_words(number % 20) ] - [ in_words(0) ]).join("-")
          when         0..99          then ([ in_words(number - number % 10), in_words(number % 10) ] - [ in_words(0) ]).join(number % 10 == 1 ? "-et-" : "-")
          when       100..999         then partial_words(number, 100)
          when     1_000..999_999     then partial_words(number, 1000)
          when 1_000_000..999_999_999 then partial_words(number, 1_000_000)
          else "trop"
          end
          @cached[number] = s if number < 1000 and @cached[number].nil?
        end
      end

    protected
      def partial_words(number, magnitude)
        grand, petit = number / magnitude, number % magnitude
        if magnitude == 100 && petit == 0
          in_words(grand) + " cents"
        else
          ([ (magnitude < 1_000_000 && grand == 1 ? "" : in_words(grand) + " ") + in_words(magnitude).sub(/^un /, ""), in_words(petit) ] - [ in_words(0) ]).join(petit < 100 ? " " : ", ")
        end
      end
    end
  end
end
