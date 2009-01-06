module Numb3rs
  @languages = {}
  
  def self.in_words(number, lang = "en-uk")
    language(lang).in_words(number)
  end
  
protected
  def self.language(lang = "en-uk")
    @languages[lang] ||= "Numb3rs::Languages::#{lang.downcase.gsub('-', '_').classify}".constantize.new
  end
end
