RSpec.describe Range do
  describe "#init" do
    it "returns the initial part of the range without its last element" do
      expect((0..3).init).to eq(0..2)
      expect(("a".."z").init).to eq("a".."y")
    end
  end

  describe "#tail" do
    it "returns the rest of the range without its first element" do
      expect((0..3).tail).to eq(1..3)
      expect(("a".."z").tail).to eq("b".."z")
    end
  end
end
