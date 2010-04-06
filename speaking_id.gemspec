Gem::Specification.new do |s|
  s.name = "speaking_id"
  s.version = "0.2.0"
  s.date = "2010-04-06"

  s.summary = "Lightweight Ruby on Rails gem to handle slugs for Active Record objects."
  s.description = "Creates simple and secure slugs from a given string or random slugs."
  s.homepage = "http://github.com/venlix/speaking_id"

  s.authors = ["Martin Jagusch"]
  s.email = "m@venlix.net"

  s.require_paths = ["lib"]
  s.files = Dir["lib/**/*"] + Dir["rails/**/*"] + Dir["test/**/*"] + ["LICENSE", "README.rdoc", "Rakefile"]
  s.extra_rdoc_files = ["README.rdoc", "LICENSE"]

  s.has_rdoc = true
  s.rdoc_options = ["--line-numbers", "--inline-source", "--charset=UTF-8", "--title", "SpeakingId", "--main", "README.rdoc"]

  s.rubygems_version = "1.3.5"
  s.required_rubygems_version = Gem::Requirement.new(">= 1.2")
end

