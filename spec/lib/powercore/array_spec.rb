RSpec.describe Array do
  describe "#average" do
    it "calculates the mean of the elements" do
      expect([1, 2, 3, 4].average).to eq(2.5)
    end
  end

  describe "#drop" do
    context "positive number" do
      it "drops first n elements -keeping Ruby behavior-" do
        expect([1, 2, 3, 4].drop(0)).to eq([1, 2, 3, 4])
        expect([1, 2, 3, 4].drop(2)).to eq([3, 4])
        expect([1, 2, 3, 4].drop(7)).to eq([])
      end
    end

    context "negative number" do
      it "drops last n elements" do
        expect([1, 2, 3, 4].drop(-2)).to eq([1, 2])
        expect([1, 2, 3, 4].drop(-1)).to eq([1, 2, 3])
        expect([1, 2, 3, 4].drop(-7)).to eq([])
      end
    end
  end

  describe "#fetch_dig" do
    let(:array) { [[1, [2, 3]]] }

    it "extracts the nested value specified by the sequence of indexes" do
      expect(array.fetch_dig(0, 1, 1)).to eq(3)
    end

    context "key can't be found" do
      it "raises an IndexError exception" do
        expect { array.fetch_dig(1, 2, 3) }.to raise_error(IndexError)
      end

      context "the optional code block is specified" do
        it "runs the code block and returns its result" do
          expect(array.fetch_dig(1, 2, 3) { 2 }).to eq(2)
          expect(array.fetch_dig(1, 2, 3) { 2 - 1 + 1 }).to eq(2)
        end
      end
    end
  end

  describe "#head" do
    it "returns the head of the array" do
      expect([1, 2, 3].head).to eq(1)
      expect([].head).to eq(nil)
    end
  end

  describe "#histogram" do
    it "builds the histogram in a hash" do
      expect([2, 1, 2, 2, 3, 3].histogram).to eq({ 1 => 1, 2 => 3, 3 => 2 })
    end
  end

  describe "#mean" do
    it "calculates the mean of the elements" do
      expect([1, 2, 3, 4].mean).to eq(2.5)
      expect([].mean).to eq(nil)
    end
  end

  describe "#median" do
    it "calculates the median of the elements" do
      expect([1, 2, 3, 4, 5].median).to eq(3)
      expect([1, 2, 3, 4].median).to eq(2.5)
      expect([].median).to eq(nil)
    end
  end

  describe "#mode" do
    it "finds the mode value/s" do
      expect([].mode).to eq([])
      expect([1, 2, 3, 4].mode).to eq([1, 2, 3, 4])
      expect([1, 2, 2, 4].mode).to eq([2])
      expect([1, 1, 2, 4, 4].mode).to eq([1, 4])
    end
  end

  describe "#percentile" do
    it "returns the percentile value for a given percentage" do
      expect([1, 2, 3, 4].percentile(49)).to eq(2)
      expect([1, 2, 3, 4].percentile(50)).to eq(3)
      expect([1, 2, 3, 4, 5].percentile(50)).to eq(3)
      expect([].percentile(50)).to eq(nil)
    end
  end

  describe "#take" do
    context "positive number" do
      it "returns first n elements -keeping Ruby behavior-" do
        expect([1, 2, 3, 4].take(0)).to eq([])
        expect([1, 2, 3, 4].take(2)).to eq([1, 2])
        expect([1, 2, 3, 4].take(7)).to eq([1, 2, 3, 4])
      end
    end

    context "negative number" do
      it "returns last n elements" do
        expect([1, 2, 3, 4].take(-2)).to eq([3, 4])
        expect([1, 2, 3, 4].take(-1)).to eq([4])
        expect([1, 2, 3, 4].take(-7)).to eq([1, 2, 3, 4])
      end
    end
  end

  describe "#tail" do
    it "get the tail of the array" do
      expect([1, 2, 3, 4].tail).to eq([2, 3, 4])
    end
  end

  describe "#transpose" do
    context "array of arrays" do
      it "transposes the rows and columns -keeping Ruby behavior-" do
        expect([[1, 2], [3, 4]].transpose).to eq([[1, 3], [2, 4]])
      end
    end

    context "array of ranges" do
      it "transposes the rows and columns" do
        expect([(1..2), (3..4)].transpose).to eq([[1, 3], [2, 4]])
      end
    end
  end
end
