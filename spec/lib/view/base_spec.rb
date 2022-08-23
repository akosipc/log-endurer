# frozen_string_literal: true

require 'spec_helper'

RSpec.describe View::Base, type: :klass do
  describe '#validate!' do
    subject(:do_validate) { described_class.new('').send(:validate!) }

    it 'raises an error NotImplemented Error' do
      expect do
        do_validate
      end.to raise_error(described_class::NotImplementedError)
    end
  end
end
