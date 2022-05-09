# frozen_string_literal: true

require_relative '../lib/web_page_logger'

RSpec.describe WebPageLogger do
  describe '#initialize' do
    context 'with missing file' do
      it 'returns a FileNotFound exception' do
        expect { described_class.new('test_webserver.log') }.to raise_error(FileNotFound)
      end
    end

    context 'with wrong extension file' do
      let(:log_file) { 'spec/fixtures/files/invalid_file_format.txt' }
      it 'returns a InvalidFileFormat exception' do
        expect { described_class.new(log_file) }.to raise_error(InvalidFileFormat)
      end
    end

    context 'with valid log file' do
      let(:log_file) { File.open('spec/fixtures/files/valid_webserver.log') }
      it 'returns initialized WebPageLogger object' do
        expect(described_class.new(log_file)).to be_a(WebPageLogger)
      end
    end
  end

  describe '#call' do
    let(:log_file) { File.open('spec/fixtures/files/valid_webserver.log') }
    let(:result_output) do
      <<~RESPONSE

        Total Visits
        ==============================
        /contact 3 visits.
        /home 3 visits.
        /index 3 visits.
        /about 2 visits.
        /about/2 1 visits.
        ==============================

        Unique Views
        ==============================
        /index 3 unique views.
        /about 2 unique views.
        /contact 2 unique views.
        /home 2 unique views.
        /about/2 1 unique views.
        ==============================
      RESPONSE
    end

    it 'prints the result on the console.' do
      expect { described_class.new(log_file).call }.to output(result_output).to_stdout
    end
  end
end
