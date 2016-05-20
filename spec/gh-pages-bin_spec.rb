require "spec_helper"

describe(GitHubPages) do
  it "lists the dependency versions" do
    output = `gh-pages versions`
    expect(output).to include("Gem")
    expect(output).to include("Version")
    GitHubPages::Dependencies.gems.each do |name, version|
      expect(output).to include("| #{name}")
      expect(output).to include("| #{version}")
    end
  end

  it "outputs the branch" do
    expect(`./bin/gh-pages branch`).to eql("gem 'gh-pages', :branch => 'master', :git => 'git://github.com/bunto/gh-pages'\n")
  end

  it "detects the CNAME when running health check" do
    File.write("CNAME", "foo.invalid")
    expect(`./bin/gh-pages health-check`).to include("Checking domain foo.invalid...")
    File.delete("CNAME")
  end
end
