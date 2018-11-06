# frozen_string_literal: true

describe Mysql2::Extensions do
  context 'class' do
    it 'has a version number' do
      expect(Mysql2::Extensions::VERSION).not_to be_nil
    end
  end

  context '#query' do
    let :client do
      Mysql2::Client.new username: 'root',
                         password: ''
    end

    context 'when valid sql' do
      it 'return array result' do
        sql = <<~MYSQL
          SELECT 42;
        MYSQL
        result = client.query sql

        expect(result).to be_a Array
      end
    end

    context 'when invalid sql' do
      it 'return exception with queried sql' do
        sql = <<~MYSQL
          SELECT foo;
        MYSQL

        result = expect { client.query sql }
        result.to raise_error(Mysql2::Error, /SQL: #{sql}$/)
      end
    end
  end
end
