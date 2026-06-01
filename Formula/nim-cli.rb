class NimCli < Formula
  desc "Declarative dotfiles management tool with Terraform-inspired plan/apply workflow"
  homepage "https://github.com/wasilak/nim"
  version "0.18.0"
  license "GPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/wasilak/nim/archive/refs/tags/v0.17.0.tar.gz"
      sha256 "cb9163a0e8481c858ac88097a6c547bef47b9ff67e57a584deae9830021c6e73"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.18.0/nim-darwin-arm64.zip"
      sha256 "95933cd880ee722f7fc6f88364f7b830746049681141867821c5df3606a8855d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wasilak/nim/releases/download/v0.18.0/nim-linux-amd64.zip"
      sha256 "6a1c8d5cc1fff7684fe19de6aabbb966d42586e4e9a17a8c85ee086731bb2fd7"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.18.0/nim-linux-arm64.zip"
      sha256 "d451294e0f74de1944550159d60ce0f53cc012a78c9e713ddd94ef97d5a58e31"
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
