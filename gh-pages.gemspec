require File.expand_path("../lib/gh-pages/dependencies", __FILE__)
require File.expand_path("../lib/gh-pages/version", __FILE__)

Gem::Specification.new do |s|
  s.required_ruby_version = ">= 2.0.0"

  s.name                  = "gh-pages"
  s.version               = GitHubPages::VERSION
  s.summary               = "Track GitHub Pages dependencies."
  s.description           = "Bootstrap the GitHub Pages Bunto environment locally."
  s.authors               = "GitHub, Inc."
  s.email                 = "support@github.com"
  s.homepage              = "https://github.com/bunto/gh-pages"
  s.license               = "MIT"

  all_files               = `git ls-files -z`.split("\x0")
  s.files                 = all_files.grep(%r{^(bin|lib)/|^.rubocop.yml$})
  s.executables           = all_files.grep(%r{^bin/}) { |f| File.basename(f) }

  s.post_install_message = <<-msg
---------------------------------------------------
Thank you for installing gh-pages!
---------------------------------------------------
msg

  GitHubPages::Dependencies.gems.each do |gem, version|
    s.add_dependency(gem, "= #{version}")
  end

  s.add_dependency("mercenary", "~> 0.3")
  s.add_dependency("terminal-table", "~> 1.4")
  s.add_development_dependency("rspec", "~> 3.3")
  s.add_development_dependency("rubocop", "~> 0.35")
  s.add_development_dependency("pry", "~> 0.10")
  s.add_development_dependency("bunto_test_plugin_malicious", "~> 1.0")
end
