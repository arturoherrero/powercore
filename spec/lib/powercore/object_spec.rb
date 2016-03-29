RSpec.describe Object do
  describe "#assert" do
    it "asserts the statement containing a boolean expression" do
      expect { assert(1 == 2) }.to raise_error(AssertError)
      expect { assert(1 == 1) }.to_not raise_error
      expect(assert(1 == 1)).to eq(nil)
    end
  end

  describe "#in?" do
    it "checks if self is present in the given object" do
      expect(1.in?([1, 2, 3])).to eq(true)
      expect("lo".in?("hello")).to eq(true)
      expect(:b.in?({ a: 100, b: 200 })).to eq(true)
    end
  end

  describe "#metaclass" do
    let(:object) { Object.new }

    it "returns the eigenclass of the object" do
      expect(object.metaclass).to eq(object.singleton_class)
    end
  end

  describe "#not_nil?" do
    it "checks if an object is not nil" do
      expect(nil.not_nil?).to eq(false)
      expect(1.not_nil?).to eq(true)
    end
  end

  describe "true.- and false.-" do
    it "emulates Smalltalk's conditionals" do
      expect((1 == 1).--> { true } { false }).to eq(true)
      expect((4 == 2).--> { true } { false }).to eq(false)
    end
  end

  describe "pipe | it" do
    it "pipes à la Bash/Elixir" do
      expect([1,2,3] |
        ->(array)  { array.first } |
        ->(int)    { int.to_s } |
        ->(string) { string + "2" }
      ).to eq("12")

      expect([1,2,3] | :first | :to_s | ->(s) { s + "2" }).to eq("12")
    end
  end
end
