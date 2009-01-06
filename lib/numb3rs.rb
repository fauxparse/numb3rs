module Numb3rs
  @languages = {}
  
  attr_accessor :default_language
  @default_language = "en-uk"
  
  def self.in_words(number, lang = nil)
    language(lang || @default_language).in_words(number)
  end
  
protected
  def self.language(lang = "en-uk")
    @languages[lang] ||= "Numb3rs::Languages::#{lang.downcase.gsub('-', '_').camelize}".constantize.new
  end
end
