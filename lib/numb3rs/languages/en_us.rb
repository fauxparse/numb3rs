module Numb3rs
  module Languages
    class EnUs < EnUk
      def in_words(number, *args)
        return "negative " + in_words(-number) if number < 0
        @cached[number] || returning("") do |s|
          s << case number
          when         0..99          then ([ in_words(number - number % 10), in_words(number % 10) ] - %w(zero)).join("-")
          when       100..999         then partial_words(number, 100)
          when     1_000..999_999     then partial_words(number, 1000)
          when 1_000_000..999_999_999 then partial_words(number, 1_000_000)
          else "many"
          end
          @cached[number] = s if number < 1000 and @cached[number].nil?
        end
      end

    protected
      def partial_words(number, magnitude)
        ([ in_words(number / magnitude) + " " + in_words(magnitude).sub(/^a(n)? /, ""), in_words(number % magnitude) ] - %w(zero)).join(number % magnitude < 100 ? " " : ", ")
      end
    end
  end
end
