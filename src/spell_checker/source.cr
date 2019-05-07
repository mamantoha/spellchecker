require "compiler/crystal/syntax/*"

module SpellChecker
  class Source
    getter path : String?
    getter source : String

    @lexer : Crystal::Lexer
    getter token : Crystal::Token

    def initialize(@source : String, @path = nil)
      @lexer = Crystal::Lexer.new(@source).tap do |l|
        l.filename = @path
        l.comments_enabled = true
      end

      @token = @lexer.next_token
    end

    def perform
      while @token.type != :EOF
        if @token.type == :COMMENT
          puts @token.inspect
          # puts @token.type
          # puts @token.value
        end

        @token = @lexer.next_token
      end
    end
  end
end
