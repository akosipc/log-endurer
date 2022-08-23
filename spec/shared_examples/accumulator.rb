# frozen_string_literal: true

RSpec.shared_examples 'an accumulator giving a view' do |index, uri, ip_address|
  subject(:do_accumulate) { described_class.new(file_path:).send(:accumulate) }

  let(:file_path) { '../spec/support/webserver.log' }

  it 'returns the values' do
    views = do_accumulate

    expect(views[index].decorate).to eq [uri, ip_address]
  end
end
