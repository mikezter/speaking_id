require 'rubygems'
require 'test/unit'
require 'active_support'
require 'active_record'
require 'sqlite3'

RAILS_ROOT = File.dirname(__FILE__) + '/../../../..'
require File.expand_path(File.join(RAILS_ROOT, 'config/environment.rb'))

def load_schema
  ActiveRecord::Base.establish_connection({
    'adapter' => 'sqlite3',
    'database' => File.dirname(__FILE__) + '/speaking_id.sqlite3'
  })

  load(File.dirname(__FILE__) + '/schema.rb')
  require File.dirname(__FILE__) + '/../rails/init.rb'
end

