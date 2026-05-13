class NimCli < Formula
  desc "Declarative dotfiles management tool with Terraform-inspired plan/apply workflow"
  homepage "https://github.com/wasilak/nim"
  version "0.12.0"
  license "GPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/wasilak/nim/archive/refs/tags/v0.13.0.tar.gz"
      sha256 "67a098e050b347b27651da44760186611820673cd03d587e550d976bbc8443cd"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.12.0/nim-darwin-arm64.zip"
      sha256 "44172156732941b6aece5b4a1dc9acb89132d018919bda15cc77855ed0022198"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wasilak/nim/releases/download/v0.12.0/nim-linux-amd64.zip"
      sha256 "be040237f56bc35f5013e93f5c16535212e56fddb2886c0ed6bbb30eb79921d6"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.12.0/nim-linux-arm64.zip"
      sha256 "72ccf777d07a8507532830540f30f6f7318568181ea3d379e1b5b02f793efd44"
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
