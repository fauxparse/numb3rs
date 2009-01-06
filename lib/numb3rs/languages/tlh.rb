module Numb3rs
  module Languages
    class Tlh < EnUk
      def initialize
        @cached = {
          0 => "pagh",
          1 => "wa'",
          2 => "cha'",
          3 => "wej",
          4 => "loS",
          5 => "vagh",
          6 => "jav",
          7 => "Soch",
          8 => "chorgh",
          9 => "Hut",
          10 => "wa'maH",
          100 => "wa'vatlh",
          1000 => "wa'SaD",
          10_000 => "wa'netlh",
          100_000 => "wa'blp",
          1_000_000 => "wa'uy'"
        }
      end
      
      def in_words(number, *args)
        @cached[number] || returning("") do |s|
          return "?" if number < 0
          6.downto(1).collect { |i| 10 ** i }.each do |k|
            if number >= k
              s << in_words(number / k) + @cached[k].sub(/^wa'/, "") + (number % k == 0 ? "" : (" " + in_words(number % k)))
              break
            end
          end
          @cached[number] = s if number < 1000 and @cached[number].nil?
        end
      end
    end
  end
end
