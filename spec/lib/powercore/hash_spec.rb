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

  describe "#fetch_dig" do
    let(:hash) { { foo: {bar: {baz: 1}}} }

    it "extracts the nested value specified by the sequence of idx objects" do
      expect(hash.fetch_dig(:foo, :bar, :baz)).to eq(1)
    end

    context "key can't be found" do
      it "raises an KeyError exception" do
        expect { hash.fetch_dig(:foo, :zot, :xyz) }.to raise_error(KeyError)
      end

      context "the optional code block is specified" do
        it "runs the code block and its result returned" do
          expect(hash.fetch_dig(:foo, :zot, :xyz) { 2 }).to eq(2)
        end
      end
    end
  end
end
