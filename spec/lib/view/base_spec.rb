require 'spec_helper'

RSpec.describe View::Base, type: :klass do
  describe '#new' do
    subject(:do_initialize) { described_class.new('') }
  
    it 'calls the private method called `validate!`' do
      expect_any_instance_of(described_class).to receive(:validate!)

      do_initialize
    end
  end

  describe '#validate!' do
    subject(:do_validate) { described_class.new('').send(:validate!) }

    it 'raises an error NotImplemented Error' do
      expect {
        do_validate
      }.to raise_error(described_class::NotImplementedError)
    end
  end
end
