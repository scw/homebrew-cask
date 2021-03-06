cask :v1_1 => 'docker-machine' do
  version 'v0.3.1'
  sha256 'c16bb0603d5ac6441aa0e16e11c905117af2e6ca2018a6712bb0f70cd6d3be59'

  # github.com is the official download host per the vendor homepage
  url "https://github.com/docker/machine/releases/download/#{version}/docker-machine_darwin-amd64"
  appcast 'https://github.com/docker/machine/releases.atom'
  name 'Docker Machine'
  homepage 'https://docs.docker.com/machine'
  license :apache

  container :type => :naked
  binary 'docker-machine_darwin-amd64', :target => 'docker-machine'

  postflight do
    set_permissions "#{staged_path}/docker-machine_darwin-amd64", '0755'
  end

  depends_on :formula => 'docker'
  depends_on :arch => :x86_64
end
