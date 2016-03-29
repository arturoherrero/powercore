RSpec.describe Date do
  describe ".date" do
    it "returns the current day" do
      expect(Date.now).to eq(Date.parse(Time.now.to_s))
    end
  end
end
