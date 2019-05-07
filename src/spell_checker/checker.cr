module SpellChecker
  class Checker
    property errors : Array(String)
    @dictationary : Hunspell

    def initialize(locale = "en_US")
      @dictationary = Hunspell.new(locale)
      @errors = [] of String
    end

    def check_spelling(input : String)
      words = input.split(/(*UCP)[^[:word:]]/)

      words.each do |word|
        @errors << word unless @dictationary.spellcheck(word)
      end
    end
  end
end
