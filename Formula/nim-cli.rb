class NimCli < Formula
  desc "Declarative dotfiles management tool with Terraform-inspired plan/apply workflow"
  homepage "https://github.com/wasilak/nim"
  version "0.22.0"
  license "GPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/wasilak/nim/releases/download/v0.22.0/nim-darwin-amd64.zip"
      sha256 "8ee58635aa5d511a7e319dc187d2ceae3f6232cb299380bc8466610e8bafc457"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.22.0/nim-darwin-arm64.zip"
      sha256 "9d420cb84436f00a251190df37959f9e32183d5ee6eb5e5b52bef00aa6b2cd59"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wasilak/nim/releases/download/v0.22.0/nim-linux-amd64.zip"
      sha256 "2bbfd2227457e7b0f3fa8d763e26c921084864f6a9e1d3b369ed75d5b5d69d33"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.22.0/nim-linux-arm64.zip"
      sha256 "488de1330f94c77865bb7efe278740059383060c8cbee404570cad2ce339dab6"
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
