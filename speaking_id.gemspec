Gem::Specification.new do |s|
  s.name = "speaking_id"
  s.version = "0.2.2"
  s.date = "2010-06-16"

  s.description = "Lightweight Ruby on Rails gem to handle slugs for Active Record objects."
  s.summary = "Creates simple and secure slugs from a given string or random slugs."
  s.homepage = "http://github.com/martinjagusch/speaking_id"

  s.authors = "Martin Jagusch"
  s.email = "m@martinjagusch.com"

  s.require_paths = ["lib"]
  s.files = Dir["lib/**/*"] + Dir["rails/**/*"] + Dir["test/**/*"] + ["LICENSE", "README.rdoc", "Rakefile"]
  s.extra_rdoc_files = ["README.rdoc", "LICENSE"]

  s.has_rdoc = true
  s.rdoc_options = ["--line-numbers", "--inline-source", "--charset=UTF-8", "--title", "SpeakingId", "--main", "README.rdoc"]

  s.rubygems_version = "1.3.5"
  s.required_rubygems_version = Gem::Requirement.new(">= 1.2")
  
  s.add_dependency("activerecord", ">= 2.0.0")
  s.add_dependency("activesupport", ">= 2.0.0")
end
