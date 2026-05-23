class ElasticsearchRerouteShards < Formula
  desc "Elasticsearch shard rebalancing tool"
  homepage "https://github.com/wasilak/elasticsearch-reroute-shards"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/v1.0.1/elasticsearch-reroute-shards-darwin-amd64.zip"
      sha256 "03e33ae4c6d9c1d9a9e147dc4a4d96928ca7a91d3a422481d15a072edf7c53f1"
    end
    on_arm do
      url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/v1.0.1/elasticsearch-reroute-shards-darwin-arm64.zip"
      sha256 "a5c279e27dbe1ef804873eb0b052a8785d2bc2cab00c3ff5512383a960b29b6e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/v1.0.1/elasticsearch-reroute-shards-linux-amd64.zip"
      sha256 "d7b927bd7565dccfb62b0d783f0c6ea915e558a295076e081a01854351825836"
    end
    on_arm do
      url "https://github.com/wasilak/elasticsearch-reroute-shards/releases/download/v1.0.1/elasticsearch-reroute-shards-linux-arm64.zip"
      sha256 "94c9f095b8276019acd0a9577c5e2a514fafaca8e5a964c7d82cb3e611738412"
    end
  end

  def install
    bin.install "elasticsearch-reroute-shards"
  end

  test do
    system "#{bin}/elasticsearch-reroute-shards", "--version"
  end
end
