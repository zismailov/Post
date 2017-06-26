class AddFuzzyStrMatch < ActiveRecord::Migration[5.1]
  def self.up
    ActiveRecord::Base.connection.execute("CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;")
  end

  def self.down
    ActiveRecord::Base.connection.execute("DROP EXTENSION fuzzystrmatch;")
  end
end
