# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../lib/formatted_output'

RSpec.describe FormattedOutput do
  let(:file) { File.open('spec/fixtures/files/valid_webserver.log') }
  let(:views) do
    { '/contact' => 3, '/home' => 3, '/index' => 3, '/about' => 2, '/about/2' => 1 }
  end
  let(:uniq_views) do
    { '/index' => 3, '/about' => 2, '/contact' => 2, '/home' => 2, '/about/2' => 1 }
  end

  describe '#initialize' do
    it { expect(described_class.new(views)).to be_a(FormattedOutput) }
  end

  describe '#call' do
    let(:total_views_output) do
      <<~RESPONSE

        Total Visits
        ==============================
        /contact 3 visits.
        /home 3 visits.
        /index 3 visits.
        /about 2 visits.
        /about/2 1 visits.
        ==============================
      RESPONSE
    end
    let(:uniq_views_output) do
      <<~RESPONSE

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
      expect { described_class.new(views).call('Total Visits', 'visits') }.to output(total_views_output).to_stdout
      expect do
        described_class.new(uniq_views).call('Unique Views', 'unique views')
      end.to output(uniq_views_output).to_stdout
    end
  end
end
