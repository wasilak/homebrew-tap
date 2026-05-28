class ExternalSecretExplain < Formula
  desc "CLI tool for explaining Kubernetes ExternalSecret resources"
  homepage "https://github.com/wasilak/external-secret-explain"
  version "0.1.0"
  license "GPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/wasilak/external-secret-explain/releases/download/v0.1.0/external-secret-explain-macOS-x86_64.tar.gz"
      sha256 "5bb1f84ef175e2c29744eef925aced024001c7240591000e215d7b9f54779a1f"
    end
    on_arm do
      url "https://github.com/wasilak/external-secret-explain/releases/download/v0.1.0/external-secret-explain-macOS-arm64.tar.gz"
      sha256 "254bb2b15bf15d3058d155679c2f4ae3c5f066624980c65629826a3bb49c774f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wasilak/external-secret-explain/releases/download/v0.1.0/external-secret-explain-Linux-musl-x86_64.tar.gz"
      sha256 "1178a7ed1d2f3114451a7878d9312bfa6bb35b8f53a134aa6f329043d54747b0"
    end
    on_arm do
      url "https://github.com/wasilak/external-secret-explain/releases/download/v0.1.0/external-secret-explain-Linux-musl-arm64.tar.gz"
      sha256 "8e5d15606df561813ca2c0671994fc99a6fd670d207ae28e9c095971b5b719fe"
    end
  end

  def install
    bin.install "external-secret-explain"
  end

  test do
    system "#{bin}/external-secret-explain", "--version"
  end
end
