# frozen_string_literal: true

RSpec.shared_examples 'an accumulator giving a view' do |index, uri, ip_address|
  subject(:do_accumulate) { described_class.new(file_path:).send(:accumulate) }

  let(:file_path) { '../spec/support/webserver.log' }

  it 'returns the values' do
    views = do_accumulate

    expect(views[index].decorate).to eq [uri, ip_address]
  end
end

RSpec.shared_examples 'an accumulator sorting the hash' do |key, value_count|
  subject(:do_sort) { klass.sort_by_views(klass.unique_views) }

  let(:file_path) { '../spec/support/webserver.log' }
  let(:klass) { described_class.new(file_path:) }

  it 'returns the values' do
    result = do_sort

    expect(result[key].count).to eq value_count
  end
end
