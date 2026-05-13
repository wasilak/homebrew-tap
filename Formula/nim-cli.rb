class NimCli < Formula
  desc "Declarative dotfiles management tool with Terraform-inspired plan/apply workflow"
  homepage "https://github.com/wasilak/nim"
  version "0.10.0"
  license "GPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/wasilak/nim/archive/refs/tags/v0.11.0.tar.gz"
      sha256 "ba774348072c6a8ac34008088b5323700a703b914690e67b13108bcecd550e06"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.10.0/nim-darwin-arm64.zip"
      sha256 "d1c797a9d4000623a3ac529d341283b7ee244b0cc5935b7db6b98afd9b749f55"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wasilak/nim/releases/download/v0.10.0/nim-linux-amd64.zip"
      sha256 "305c6ef80a00e52d8d60873c5bd3687e486a7818ae51517fa29e01a79d2f0606"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.10.0/nim-linux-arm64.zip"
      sha256 "685281c3ff65fa55692648e55e2fdb0143bff2502845d66395e8768c0cc5c09b"
    end
  end

  conflicts_with "nim", because: "both install a 'nim' binary"

  def install
    bin.install Dir["nim-*"].first => "nim"
    generate_completions_from_executable(bin/"nim", "completion")
  end

  def caveats
    <<~EOS
      If you previously had the Nim language installed, add an alias so your
      shell resolves this binary correctly:

        echo 'alias nim="#{opt_bin}/nim"' >> ~/.zshrc && source ~/.zshrc

      (Replace ~/.zshrc with ~/.bashrc or ~/.config/fish/config.fish as needed.)
    EOS
  end

  test do
    system "#{bin}/nim", "--version"
  end
end
