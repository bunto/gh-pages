$LOAD_PATH.unshift(File.dirname(__FILE__))
require "bunto"

# Top-level namespace for all GitHub Pages-related concerns.
module GitHubPages
  autoload :Configuration, "gh-pages/configuration"
  autoload :Dependencies,  "gh-pages/dependencies"
  autoload :VERSION,       "gh-pages/version"

  def self.versions
    Dependencies.versions
  end
end

Bunto::Hooks.register :site, :after_reset do |site|
  GitHubPages::Configuration.set(site)
end
