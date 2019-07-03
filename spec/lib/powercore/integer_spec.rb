RSpec.describe Integer do
  describe "#clamp" do
    it "clamps a comparable between a lower and upper bound" do
      expect(1.clamp(3, 6)).to eq(3)
      expect(5.clamp(3, 6)).to eq(5)
      expect(8.clamp(3, 6)).to eq(6)
    end

    it "clamps a comparable between a lower and upper bound of a Range" do
      expect(1.clamp(3..6)).to eq(3)
      expect(5.clamp(3..6)).to eq(5)
      expect(8.clamp(3..6)).to eq(6)
    end
  end

  describe "#degrees" do
    it "converts a number of degrees into radians" do
      expect(90.degrees).to eq(1.5707963267948966)
    end
  end

  describe "#negative" do
    it "negates the number" do
      expect(1.negative).to eq(-1)
    end
  end

  describe "#ordinal" do
    it "returns the ordinal" do
      expect(1.ordinal).to eq("1st")
      expect(2.ordinal).to eq("2nd")
      expect(3.ordinal).to eq("3rd")
      expect(4.ordinal).to eq("4th")
      expect(12.ordinal).to eq("12th")
      expect(13.ordinal).to eq("13th")
    end
  end
end
