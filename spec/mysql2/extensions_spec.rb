# frozen_string_literal: true

RSpec.describe Mysql2::Extensions do
  it 'has a version number' do
    expect(Mysql2::Extensions::VERSION).not_to be nil
  end

  describe '#query' do
    let(:client) { Mysql2::Client.new(username: 'root') }

    context 'with successful' do
      it '#query' do
        result = client.query('SELECT 42')
        expect(result).to be_a Array
      end
    end

    context 'with error' do
      it '#query' do
        expect { client.query('foo') }.to raise_error(Mysql2::Error, /SQL: foo/)
      end
    end
  end
end
