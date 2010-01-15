require File.dirname(__FILE__) + '/speaking_id/speaking_id'

if defined?(ActiveRecord)
  ActiveRecord::Base.instance_eval {extend SpeakingId::ClassMethods}
end
