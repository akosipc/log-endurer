# frozen_string_literal: true

require 'spec_helper'

RSpec.describe View, type: :model do
  describe '#new' do
    subject(:do_initialize) { described_class.new(line) }

    context 'when the line is parsable' do
      let(:line) { '/help_page/1 126.318.035.038' }

      it 'returns with the instance of the View and set the value for URI' do
        klass = do_initialize

        expect(klass.uri.value).to eq '/help_page/1'
      end

      it 'returns with the instance of the View and set the value for IP Address' do
        klass = do_initialize

        expect(klass.ip_address.value).to eq '126.318.035.038'
      end
    end

    context 'when the line is not parsable due to URI' do
      let(:line) { 'just_a_string 126.318.035.038' }

      it 'raises an error message about the URI' do
        expect do
          do_initialize
        end.to raise_error(View::Base::InvalidArgumentError)
      end
    end

    context 'when the line is not parsable due to IP address' do
      let(:line) { '/help_page/1 12321321398573' }

      it 'raises an error message about the IP address format' do
        expect do
          do_initialize
        end.to raise_error(View::Base::InvalidArgumentError)
      end
    end
  end
end
