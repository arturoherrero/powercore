RSpec.describe Kernel do
  describe "λ" do
    let(:my_proc) { λ { } }

    it "is equivalent to lambda" do
      expect(my_proc).to receive(:call)
      my_proc.call
    end
  end
end
