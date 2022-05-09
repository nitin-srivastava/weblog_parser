# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../lib/parser'
RSpec.describe Parser do
  describe '#initialize' do
    it { expect(described_class.new('webserver.log')).to be_a(Parser) }
  end

  describe '#parse' do
    let(:parser) { described_class.new(log_file) }
    context 'with empty webserver file' do
      let(:log_file) { 'spec/fixtures/files/empty_webserver.log' }
      it 'should raise an EmptyLogFile exception' do
        expect { parser.parse }.to raise_error(EmptyLogFile)
      end
    end

    context 'with invalid data' do
      let(:log_file) { File.open('spec/fixtures/files/invalid_webserver_data.log', 'r') }
      it 'should raise an InvalidDataFormat exception' do
        expect { parser.parse }.to raise_error(InvalidDataFormat)
      end
    end

    context 'with valid file format' do
      let(:log_file) { File.open('spec/fixtures/files/valid_webserver.log') }
      let(:parsed_data) do
        {
          '/about' => ['061.945.150.735', '126.318.035.038'],
          '/about/2' => ['444.701.448.104'],
          '/contact' => ['184.123.665.067', '184.123.665.067', '543.910.244.929'],
          '/home' => ['184.123.665.067', '235.313.352.950', '184.123.665.067'],
          '/index' => ['444.701.448.104', '316.433.849.805', '802.683.925.780']
        }
      end

      it 'should raise an InvalidLogData exception' do
        expect(parser.parse).to eq(parsed_data)
      end
    end
  end
end
