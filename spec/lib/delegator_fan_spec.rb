require 'spec_helper'

describe DelegatorFan do
  class TestClass
    attr_accessor :records
    extend DelegatorFan
    delegator_fan :records, :data
  end

  describe "#delegator_fan" do
    it "returns the values from all the elements in the collection" do
       tc = TestClass.new
       record_1 = double('Record', data: 'data 1')
       record_2 = double('Record', data: 'data 2')
       tc.records = [ record_1, record_2]
       expect(tc.data).to eql([ 'data 1', 'data 2'])
    end
  end
end
