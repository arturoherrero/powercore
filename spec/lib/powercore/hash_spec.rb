RSpec.describe Hash do
  describe "#compact" do
    it "removes all nil elements" do
      expect({a: 1, b: nil, c: 3}.compact).to eq({a: 1, c: 3})
    end
  end

  describe "#except" do
    it "returns the hash without keys specified" do
      expect({a: 1, b: nil, c: nil, d: 4}.except(:b, :d)).to eq({a: 1, c: nil})
    end
  end
end
