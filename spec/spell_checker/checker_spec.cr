require "../spec_helper"

describe SpellChecker::Checker do
  checker = SpellChecker::Checker.new

  it "should work if the spelling of each word is correct" do
    checker.check_spelling("Richard Of York Gave Battle In Vain")
    checker.errors.should be_empty
  end

  it "should return words with incorrect spelling" do
    checker.check_spelling("s0me r4ndom stuff")
    checker.errors.should eq(["s0me", "r4ndom"])
  end
end
