# frozen_string_literal: true

require_relative '../lib/result'

RSpec.describe Result do
  let(:parsed_data) do
    {
      '/about' => ['061.945.150.735', '126.318.035.038'],
      '/about/2' => ['444.701.448.104'],
      '/contact' => ['184.123.665.067', '184.123.665.067', '543.910.244.929'],
      '/home' => ['184.123.665.067', '235.313.352.950', '184.123.665.067'],
      '/index' => ['444.701.448.104', '316.433.849.805', '802.683.925.780']
    }
  end

  describe '#initialize' do
    it { expect(described_class.new(parsed_data)).to be_a(Result) }
  end

  describe '#call' do
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
      expect { described_class.new(parsed_data).call }.to output(result_output).to_stdout
    end
  end
end
