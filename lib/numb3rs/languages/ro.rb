module Numb3rs
  module Languages
    class Ro
      def initialize
        @cached = {
          :masculine => {
            0 => "zero",
            1 => "unu",
            2 => "doi",
            3 => "trei",
            4 => "patru",
            5 => "cinci",
            6 => "şase",
            7 => "şapte",
            8 => "opt",
            9 => "nouă",
            10 => "zece",
            11 => "unsprezece",
            14 => "paisprezece",
            16 => "şaisprezece",
            60 => "şaizeci",
            100 => "o sută"
          }
        }
        
        @cached[:feminine] = @cached[:masculine].merge({
          1 => "una",
          2 => "două",
          12 => "douăsprezece"
        })
        
        @cached[:neuter] = @cached[:masculine].merge({
          2 => "două",
          12 => "douăsprezece"
        })
      end
      
      def in_words(number, gender = :masculine)
        return "minus " + in_words(-number) if number < 0 # TODO figure out what this is
        @cached[gender][number] || returning("") do |s|
          s << case number
          when        11..19          then in_words(number % 10, gender) + "sprezece"
          when        20..99          then ([ in_words(number / 10, :masculine) + "zeci", in_words(number % 10, gender) ] - [in_words(0, gender)]).join(" şi ")
          when       101..199         then [ "o sută", in_words(number % 100, gender) ].join(" ")
          when       200..999         then ([ in_words(number / 100, :feminine), "sute", in_words(number % 100, gender) ] - [in_words(0, gender)]).join(" ")
          when     1_000..999_999     then partial_words(number, 1000, "mie", "mii", gender, :feminine)
          when 1_000_000..999_999_999 then partial_words(number, 1_000_000, "milion", "milioane", gender, :feminine)
          else "mulţi"
          end
          @cached[number] = s if number < 1000 and @cached[number].nil?
        end
      end

    protected
      def partial_words(number, magnitude, singular, plural, gender, number_gender = :masculine)
        maj, min = number / magnitude, number % magnitude
        ([ (maj == 1 ? "o" : in_words(maj, number_gender)) + (maj > 19 ? " de " : " ") + (maj == 1 ? singular : plural), in_words(min, gender) ] - [in_words(0, gender)]).join(" ")
      end
    end
  end
end
