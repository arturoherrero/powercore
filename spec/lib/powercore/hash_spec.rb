RSpec.describe Hash do
  describe "#except" do
    it "returns the hash without the keys specified" do
      expect({ a: 1, b: nil, c: nil, d: 4 }.except(:b, :d)).to eq({ a: 1, c: nil })
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

  describe "#first" do
    it "returns the first element" do
      expect({ a: 1, b: 2, c: 3 }.first).to eq({ a: 1 })
      expect({}.first).to eq(nil)
    end

    context "with paremeter" do
      it "returns the first n elements" do
        expect({}.first(0)).to eq({})
        expect({ a: 1, b: 2, c: 3 }.first(0)).to eq({})
        expect({ a: 1, b: 2, c: 3 }.first(2)).to eq({ a: 1, b: 2 })
        expect({ a: 1, b: 2, c: 3 }.first(4)).to eq({ a: 1, b: 2, c: 3 })
      end
    end
  end

  describe "#head" do
    it "returns the first element" do
      expect({ a: 1, b: nil, c: nil, d: 4 }.head).to eq({ a: 1 })
    end
  end

  describe "#init" do
    it "returns the rest of the hash without its last element" do
      expect({ a: 1, b: 2, c: 3 }.init).to eq({ a: 1, b: 2 })
    end
  end

  describe "#last" do
    it "returns the last element" do
      expect({ a: 1, b: 2, c: 3 }.last).to eq({ c: 3 })
    end
  end

  describe "#tail" do
    it "returns the rest of the hash without its first element" do
      expect({ a: 1, b: 2, c: 3 }.tail).to eq({ b: 2, c: 3 })
    end
  end
end
