# frozen_string_literal: true

require 'mysql2/extensions/version'

require 'mysql2'

# Mysql2
module Mysql2
  # Client
  class Client
    # Alias of the original method
    #
    # @see https://www.rubydoc.info/gems/mysql2/0.5.2/Mysql2%2FClient:query
    #   Mysql2::Client#query
    alias old_query query

    # Query database
    #
    # @example
    #   .query 'SELECT name FROM users'
    #   # => [{ 'name' => 'bob' }]
    #   .query 'SELECT * FROM user'
    #   # => Mysql2::Error (Table 'user' doesn't exist; SQL: SELECT * FROM user)
    #
    # @param [String] sql
    # @param [Hash] options
    # @return [Array <Hash>]
    # @raise [Mysql2::Error] Error message with sql query
    def query(sql, options = {})
      result = old_query(sql, options)
      result.to_a
    rescue Mysql2::Error => e
      raise Mysql2::Error, "#{e.message}; SQL: #{sql}"
    end
  end
end
