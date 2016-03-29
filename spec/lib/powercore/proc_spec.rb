RSpec.describe Proc do
  let(:multiply_2) { ->(var) { var * 2 } }
  let(:sum_3)      { ->(var) { var + 3 } }

  describe "#>>" do
    it "forward composes a new proc" do
      multiply_2_then_add_3 = multiply_2 >> sum_3
      expect(multiply_2_then_add_3.call(3)).to eq(9)
    end
  end

  describe "#<<" do
    it "reverse composes a new proc" do
      sum_3_then_multiply_2 = multiply_2 << sum_3
      expect(sum_3_then_multiply_2.call(3)).to eq(12)
    end
  end
end
