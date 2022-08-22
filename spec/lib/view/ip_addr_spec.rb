require 'spec_helper'

RSpec.describe View::IPAddr, type: :klass do
  describe '#new' do
    subject(:do_initialize) { described_class.new(string) }
  
    context 'when class settings was set to non-strict' do
      context 'when the string passed fits the format' do
        let(:string) { '255.255.255.255' }

        it 'returns the instance of the View::IPAddr and set the IP Address' do
          klass = do_initialize

          expect(klass.ip_address).to eq '255.255.255.255'
        end
      end

      context 'when the string passed does not fit the format' do
        let(:string) { 'this_is_a_string' }

        it 'raises an error about the IP address passed' do
          expect {
            expect(do_initialize).to be_falsey
          }.to raise_error(described_class::InvalidArgumentError)
        end
      end
    end
  end
end
