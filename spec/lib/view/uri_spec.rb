# frozen_string_literal: true

require 'spec_helper'

RSpec.describe View::URI, type: :klass do
  describe '#new' do
    subject(:do_initialize) { described_class.new(string) }

    context 'when class settings was set to non-strict' do
      context 'when the string passed fits the format' do
        let(:string) { '/home/1' }

        it 'returns the instance of the View::URI and set the URI' do
          klass = do_initialize

          expect(klass.value).to eq '/home/1'
        end
      end

      context 'when the string passed does not fit the format' do
        let(:string) { 'this_is_a_string' }

        it 'raises an error about the URI passed' do
          expect do
            expect(do_initialize).to be_falsey
          end.to raise_error(described_class::InvalidArgumentError)
        end
      end
    end
  end
end
