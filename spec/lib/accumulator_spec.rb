require 'spec_helper'
require 'csv'

RSpec.describe Accumulator, type: :klass do
  let(:lines) do
    [
      '/help_page/1 126.318.035.038',
      '/contact 184.123.665.067',
      '/home 184.123.665.067',
      '/about/2 444.701.448.104',
      '/help_page/1 929.398.951.889',
      '/index 444.701.448.104',
      '/help_page/1 722.247.931.582',
      '/about 061.945.150.735',
      '/help_page/1 646.865.545.408',
      '/home 235.313.352.950'
    ]
  end

  let(:klass) { described_class.new(lines) }

  describe '#accumulate' do
    subject(:do_accumulate) { klass.accumulate }

    it 'does accumulate' do
      do_accumulate
    end
  end
end
