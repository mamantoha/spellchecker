require "hunspell"
require "./spell_checker/**"

# `SpellChecker` is spellchecker for Crystal code and documentation.
module SpellChecker
  VERSION = "0.1.0"

  extend self

  def run
    run(Dir["**/*.cr"])
  end

  def run(files)
    files.each do |path|
      source = Source.new(File.read(path))
    end
  end
end
