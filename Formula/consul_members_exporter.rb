class ConsulMembersExporter < Formula
  desc "Consul members exporter"
  homepage "https://github.com/wasilak/consul_members_exporter"
  version "0.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wasilak/consul_members_exporter/archive/refs/tags/0.0.4.tar.gz"
      sha256 "e4c8df272d56119ca21359e83ff9abf90b8530e19aaadfaccec7b39bd5bec9f0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wasilak/consul_members_exporter/releases/download/0.0.3/consul_members_exporter-linux-amd64.zip"
      sha256 "f40df54bc282c085a0b2944e9911bdeccc3f914f2744cc5c7c10c8a9e97ab1bd"
    end
    on_arm do
      url "https://github.com/wasilak/consul_members_exporter/releases/download/0.0.3/consul_members_exporter-linux-arm64.zip"
      sha256 "e6c986ed048a39f27d6216c5fc6e5c0ca9f4784d9f8ef3070351470e116acbf5"
    end
  end

  def install
    bin.install "consul_members_exporter"
  end

  test do
    system "#{bin}/consul_members_exporter", "--version"
  end
end
