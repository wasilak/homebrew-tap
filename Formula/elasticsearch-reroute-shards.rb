class ElasticsearchRerouteShards < Formula
  desc "Elasticsearch shard rebalancing tool"
  homepage "https://github.com/wasilak/elasticsearch-reroute-shards"
  version "0.0.5"

  if OS.mac?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.5/elasticsearch-reroute-shards-darwin-amd64.zip"
    sha256 "e142035a047b787db0c500ef1100a86002b15dcdff20277853e0bc031994ddd2"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.5/elasticsearch-reroute-shards-darwin-arm64.zip"
    sha256 "b2c5f096f20db5e9f031d0af39547fd0654e29daa0ecc47d26a9d24580f47670"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.5/elasticsearch-reroute-shards-linux-amd64.zip"
    sha256 "919f567a604c56e8b435568cad0a3f97526c6c88cc236fa41b2eef1da8f558bc"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.5/elasticsearch-reroute-shards-linux-arm64.zip"
    sha256 "e6cbd0103cc0946aab8a8e5d55f8fe775313ec25345376d01b2dd22a64d34621"
  end

  # if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
  #   url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/0.0.5/elasticsearch-reroute-shards-linux-arm.zip"
  #   sha256 ""
  # end

  def install
    bin.install "elasticsearch-reroute-shards"
  end

  test do
    system "#{bin}/elasticsearch-reroute-shards", "--version"
  end
end
