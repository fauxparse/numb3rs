module Numb3rs
  module Extensions
    module Fixnum
      def in_words(lang = nil, *args)
        Numb3rs.in_words(self, lang, *args)
      end
    end
  end
end
