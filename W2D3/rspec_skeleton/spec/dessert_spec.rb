require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "rob") }
  let(:dessert) {Dessert.new("cake", 10, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("cake")
    end
    it "sets a quantity" do
      expect(dessert.quantity).to eq(10)
    end
    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
      expect(dessert.ingredients).to be_a(Array)
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("cake", "apple", "rob")}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before(:each) do
      dessert.add_ingredient("sugar")
      dessert.add_ingredient("flour")
      dessert.add_ingredient("vanilla")
    end
    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients).to include("sugar")
    end
  end

  describe "#mix!" do
    ingreds = %w(flour sugar butter water)
    before(:each) do
      dessert.add_ingredient("flour")
      dessert.add_ingredient("sugar")
      dessert.add_ingredient("butter")
      dessert.add_ingredient("water")
    end

    it "shuffles the ingredient array" do
      expect(dessert.ingredients).to eq(ingreds)
      dessert.mix!
      expect(dessert.ingredients).to_not eq(ingreds)
    end
  end

  describe "#eat" do
    before(:each) do
      dessert.eat(10)
    end
    it "subtracts an amount from the quantity" do
      expect(dessert.quantity).to eq(0)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {dessert.eat(20)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Rob")
      expect(dessert.serve).to eq("Rob has made 10 cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
