class NimCli < Formula
  desc "Declarative dotfiles management tool with Terraform-inspired plan/apply workflow"
  homepage "https://github.com/wasilak/nim"
  version "v0.14.0"
  license "GPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/wasilak/nim/releases/download/v0.14.0/nim-darwin-amd64.zip"
      sha256 "d88398c0aaa7652e829e58a883ca83ecd0959042966edc1add38bac7bb6faad9"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.14.0/nim-darwin-arm64.zip"
      sha256 "36e72c85dd35a6a400f264ff531787936d19b677a034d4ef2f92ee6308c19b72"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wasilak/nim/releases/download/v0.14.0/nim-linux-amd64.zip"
      sha256 "848700e64e6f8206b755ee04560c5bbd32977065d31464dbfba25ebfea09ce8e"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.14.0/nim-linux-arm64.zip"
      sha256 "b378522cd399977e3563a2d792537965a0dc67b6f5cf75e605b69e2ba8dd4cb0"
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
