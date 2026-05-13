class ConsulMembersExporter < Formula
  desc "Consul members exporter"
  homepage "https://github.com/wasilak/consul_members_exporter"
  version "0.0.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/wasilak/consul_members_exporter/releases/download/0.0.4/consul_members_exporter-darwin-amd64.zip"
      sha256 "b498ce5a11c03a9634f305487d468b51d4517407ef33e0d7ea8c5e4598b0fbe6"
    end
    on_arm do
      url "https://github.com/wasilak/consul_members_exporter/releases/download/0.0.4/consul_members_exporter-darwin-arm64.zip"
      sha256 "9c49b9abb804e3e834beeda8c204464575757535d31ce86f5906f01eacee69c5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wasilak/consul_members_exporter/releases/download/0.0.4/consul_members_exporter-linux-amd64.zip"
      sha256 "69e4076ba8653d7b2a66cf0337157162796450680e7b17ec193f193766e99320"
    end
    on_arm do
      url "https://github.com/wasilak/consul_members_exporter/releases/download/0.0.4/consul_members_exporter-linux-arm64.zip"
      sha256 "46604031ba636d274e63f814ca39ff3025c5c2f5e918ef4140e858f1fc90dcb0"
    end
  end

  def install
    bin.install "consul_members_exporter"
  end

  test do
    system "#{bin}/consul_members_exporter", "--version"
  end
end
