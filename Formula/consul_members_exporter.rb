class ConsulMembersExporter < Formula
  desc "Consul memebrs exporter"
  homepage "https://github.com/wasilak/consul_members_exporter"
  version "0.0.3"

  if OS.mac?
    url "https://github.com/wasilak/consul_members_exporter/archive/refs/tags/0.0.4.tar.gz"
    sha256 "e4c8df272d56119ca21359e83ff9abf90b8530e19aaadfaccec7b39bd5bec9f0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/wasilak/consul_members_exporter/releases/download/0.0.3/consul_members_exporter-darwin-arm64.zip"
    sha256 "dbc00d4f3362b232215b3a0e03b7af6fb5d3ea5ab1bfe96f6b7a7f9ef36ac5c3"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/wasilak/consul_members_exporter/releases/download/0.0.3/consul_members_exporter-linux-amd64.zip"
    sha256 "f40df54bc282c085a0b2944e9911bdeccc3f914f2744cc5c7c10c8a9e97ab1bd"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/wasilak/consul_members_exporter/releases/download/0.0.3/consul_members_exporter-linux-arm64.zip"
    sha256 "e6c986ed048a39f27d6216c5fc6e5c0ca9f4784d9f8ef3070351470e116acbf5"
  end

  # if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
  #   url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.3/elasticsearch-reroute-shards-linux-arm.zip"
  #   sha256 ""
  # end

  def install
    bin.install "consul_members_exporter"
  end

  test do
    system "#{bin}/consul_members_exporter", "--version"
  end
end
