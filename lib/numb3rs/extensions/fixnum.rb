module Numb3rs
  module Extensions
    module Fixnum
      def in_words(lang = "en-uk")
        Numb3rs.in_words(self, lang)
      end
    end
  end
end
