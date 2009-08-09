# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{numb3rs}
  s.version = "0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matt Powell"]
  s.date = %q{2009-08-09}
  s.description = %q{Numb3rs converts numbers into words in an aesthetically pleasing manner.}
  s.email = %q{fauxparse@gmail.com}
  s.files = ["README.rdoc", "Rakefile", "init.rb", "install.rb", "lib", "lib/numb3rs", "lib/numb3rs/extensions", "lib/numb3rs/extensions/fixnum.rb", "lib/numb3rs/languages", "lib/numb3rs/languages/en_uk.rb", "lib/numb3rs/languages/en_us.rb", "lib/numb3rs/languages/epo.rb", "lib/numb3rs/languages/fr.rb", "lib/numb3rs/languages/ro.rb", "lib/numb3rs/languages/tlh.rb", "lib/numb3rs.rb", "spec", "spec/numb3rs_spec.rb", "spec/spec_helper.rb", "tasks", "tasks/numb3rs_tasks.rake", "uninstall.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/fauxparse/numb3rs}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{Numb3rs converts numbers into words in an aesthetically pleasing manner.}
end
