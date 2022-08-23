# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Commander, type: :service do
  let(:file_path) { '../spec/support/webserver.log' }

  describe '#new' do
    subject(:do_initialize) { described_class.new(file_path:) }

    context 'when the filepath is existing' do
      it 'returns an instance of the class and doesn\'t return the error' do
        expect(do_initialize).to be_instance_of described_class
      end
    end

    context 'when the filepath is not existing' do
      let(:file_path) { './neck_message.log' }

      it 'returns a Commander::InvalidFilePathError' do
        expect do
          do_initialize
        end.to raise_error(Commander::InvalidFilePathError)
      end
    end
  end

  describe '#unique_views' do
    subject(:do_unique_views) { klass.unique_views }

    let(:klass) { described_class.new(file_path:) }

    it 'compiles all of the unique views by ip_address' do
      expect(klass).to receive(:accumulate).and_call_original

      do_unique_views
    end
  end

  describe '#accumulate' do
    subject(:do_accumulate) { described_class.new(file_path:).send(:accumulate) }

    it_behaves_like 'an accumulator giving a view', 0, '/help_page/1', '126.318.035.038'
    it_behaves_like 'an accumulator giving a view', 499, '/about', '543.910.244.929'

    it 'accumulates and returns an array' do
      expect(do_accumulate).to be_instance_of Array
    end
  end
end
