require 'spec_helper'

RSpec.describe Commander, type: :service do
  let(:file_path) { '../spec/support/webserver.log' }

  describe '#new' do
    subject(:do_initialize) { described_class.new(file_path: file_path) }

    context 'when the filepath is existing' do
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

  describe '#unique_views' do
    let(:klass) { described_class.new(file_path: file_path) }
    subject(:do_unique_views) { klass.unique_views }

    it 'compiles all of the unique views by ip_address' do
      expect(klass).to receive(:accumulate).and_call_original
      output = do_unique_views

      expect(output).to be_instance_of Hash
      expect(output['/about'].count).to eq 21
    end
  end

  describe '#accumulate' do
    subject(:do_accumulate) { described_class.new(file_path: file_path).send(:accumulate) }

    it 'accumulates the views for the file into objects' do
      views = do_accumulate

      expect(views).to be_instance_of Array
      expect(views.length).to eq 500
      expect(views.first).to be_instance_of View
      expect(views.first.uri.value).to eq '/help_page/1'
      expect(views.first.ip_address.value).to eq '126.318.035.038'

      expect(views.last.uri.value).to eq '/about'
      expect(views.last.ip_address.value).to eq '543.910.244.929'
    end
  end
end
