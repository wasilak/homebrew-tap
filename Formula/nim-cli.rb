class NimCli < Formula
  desc "Declarative dotfiles management tool with Terraform-inspired plan/apply workflow"
  homepage "https://github.com/wasilak/nim"
  version "0.15.0"
  license "GPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/wasilak/nim/releases/download/v0.15.0/nim-darwin-amd64.zip"
      sha256 "168d2c28fb92c9e145e94785788b0e3d1c69323caef7bc369e44d2319d239fb4"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.15.0/nim-darwin-arm64.zip"
      sha256 "adbb20a41693d8334f856e442e5b0ddc6af78469b8d4ac7aa651b32696775ed4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wasilak/nim/releases/download/v0.15.0/nim-linux-amd64.zip"
      sha256 "77d162c0813835fa575ee7e62414dd0bdf120c1862be9a676ba5e8fe3b38f70b"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.15.0/nim-linux-arm64.zip"
      sha256 "89dde3fad2effd960368e1b63e793daec72ff781f4d3d149911f88474675d689"
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
