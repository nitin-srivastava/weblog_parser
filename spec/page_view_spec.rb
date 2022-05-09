# frozen_string_literal: true

require_relative '../lib/page_view'
require_relative '../lib/parser'
RSpec.describe PageView do
  let(:file) { File.open('spec/fixtures/files/valid_webserver.log') }
  let(:parser) { Parser.new(file) }

  describe '#initialize' do
    it { expect(described_class.new({})).to be_a(PageView) }
  end

  describe '#list' do
    let(:parsed_data) { parser.parse }
    let(:page_view) { described_class.new(parsed_data) }

    context 'all views' do
      let(:response_views) do
        { '/contact' => 3, '/home' => 3, '/index' => 3, '/about' => 2, '/about/2' => 1 }
      end
      it 'returns a hash of webpages and their number of views' do
        expect(page_view.list).to eq(response_views)
      end
    end

    context 'unique views' do
      let(:response_unique_views) do
        { '/index' => 3, '/about' => 2, '/contact' => 2, '/home' => 2, '/about/2' => 1 }
      end
      it 'returns a hash of webpages and their unique number of views' do
        expect(page_view.list(unique: true)).to eq(response_unique_views)
      end
    end
  end
end
