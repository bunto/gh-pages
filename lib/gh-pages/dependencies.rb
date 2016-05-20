module GitHubPages
  # Dependencies is where all the public dependencies for GitHub Pages are defined,
  # and versions locked. Any plugin for Pages must be specified here with a
  # corresponding version to which it shall be locked in the runtime dependencies.
  class Dependencies
    VERSIONS = {
      # Bunto
      "bunto"                    => "1.0.0",
      "bunto-sass-converter"     => "2.0.0",

      # Converters
      "kramdown"                  => "1.10.0",

      # Misc
      "liquid"                    => "3.0.6",
      "rouge"                     => "1.10.1",
      "gh-pages-health-check" => "1.0.0",

      # Plugins
      "bemoji"                    => "3.0.0",
      "bunto-mentions"           => "2.0.0",
      "bunto-redirect-from"      => "5.0.0",
      "bunto-sitemap"            => "3.0.0",
      "bunto-feed"               => "1.0.0",
      "bunto-gist"               => "2.0.0",
      "bunto-paginate"           => "2.0.0",
      "bunto-coffeescript"       => "4.0.0",
      "bunto-seo-tag"            => "5.0.0",
      "bunto-github-metadata"    => "1.0.0",

      # Pin listen because it's broken on 2.1 & that's what we recommend.
      # https://github.com/guard/listen/pull/371
      "listen"                    => "3.0.6"
    }.freeze

    # Bunto and related dependency versions as used by GitHub Pages.
    # For more information see:
    # https://help.github.com/articles/using-bunto-with-pages
    def self.gems
      VERSIONS
    end

    # Versions used by GitHub Pages, including gh-pages gem and ruby version
    # Useful for programmatically querying for the current-running version
    def self.versions
      gems.merge version_report
    end

    def self.version_report
      require "html/pipeline/version"
      require "sass/version"
      require "safe_yaml/version"

      {
        "ruby" => RUBY_VERSION,

        # Gem versions we're curious about
        "gh-pages"  => VERSION.to_s,
        "html-pipeline" => HTML::Pipeline::VERSION,
        "sass"          => Sass.version[:number],
        "safe_yaml"     => SafeYAML::VERSION
      }
    end
  end
end
