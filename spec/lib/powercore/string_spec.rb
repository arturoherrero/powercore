RSpec.describe String do
  describe "#first" do
    it "returns the first character" do
      expect("abc".first).to eq("a")
      expect("".first).to eq(nil)
    end

    context "with paremeter" do
      it "returns the first n characters" do
        expect("".first(0)).to eq("")
        expect("abc".first(0)).to eq("")
        expect("abc".first(2)).to eq("ab")
        expect("abc".first(4)).to eq("abc")
      end
    end
  end

  describe "#head" do
    it "returns the first character" do
      expect("abc".head).to eq("a")
      expect("".head).to eq(nil)
    end
  end

  describe "#init" do
    it "returns the initial part of the string without its last character" do
      expect("abc".init).to eq("ab")
    end
  end

  describe "#last" do
    it "returns the last character" do
      expect("abc".last).to eq("c")
      expect("".last).to eq(nil)
    end

    context "with paremeter" do
      it "returns the last n characters" do
        expect("abc".last(0)).to eq("")
        expect("abc".last(2)).to eq("bc")
        expect("abc".last(4)).to eq("abc")
      end
    end
  end

  describe "#tail" do
    it "returns the rest of the string without its first character" do
      expect("abc".tail).to eq("bc")
      expect("".tail).to eq(nil)
    end
  end

  describe "#to_bool" do
    it "converts the given string into a boolean object" do
      expect("true".to_bool).to eq(true)
      expect("false".to_bool).to eq(false)
    end

    context "not valid string" do
      it "raises an error" do
        expect { "t".to_bool }.to raise_error(ArgumentError, "wrong element t")
      end
    end
  end
end
