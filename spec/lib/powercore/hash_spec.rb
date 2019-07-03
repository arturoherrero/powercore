RSpec.describe Hash do
  describe "#except" do
    it "returns the hash without the keys specified" do
      expect({ a: 1, b: nil, c: nil, d: 4 }.except(:b, :d)).to eq(a: 1, c: nil)
    end
  end

  describe "#fetch_dig" do
    let(:hash) { { foo: { bar: { baz: 1 } } } }

    it "extracts the nested value specified by the sequence of keys" do
      expect(hash.fetch_dig(:foo, :bar, :baz)).to eq(1)
    end

    context "key can't be found" do
      it "raises a KeyError exception" do
        expect { hash.fetch_dig(:foo, :zot, :xyz) }.to raise_error(KeyError)
      end

      context "the optional code block is specified" do
        it "runs the code block and returns its result" do
          expect(hash.fetch_dig(:foo, :zot, :xyz) { 2 }).to eq(2)
        end
      end
    end
  end
end
