require 'spec_helper'

RSpec.describe Commander, type: :service do
  describe '#new' do
    subject(:do_initialize) { described_class.new(file_path: file_path) }

    context 'when the filepath is existing' do
      let!(:file_path) { '../spec/support/webserver.log' }

      it 'returns an instance of the class and doesn\'t return the error' do
        expect(do_initialize).to be_instance_of described_class
      end
    end

    context 'when the filepath is not existing' do
      let!(:file_path) { './neck_message.log' }

      it 'returns a Commander::InvalidFilePathError' do
        expect {
          do_initialize
        }.to raise_error(Commander::InvalidFilePathError)
      end
    end
  end
end
