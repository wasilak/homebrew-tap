class NimCli < Formula
  desc "Declarative dotfiles management tool with Terraform-inspired plan/apply workflow"
  homepage "https://github.com/wasilak/nim"
  version "0.17.0"
  license "GPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/wasilak/nim/archive/refs/tags/v0.17.0.tar.gz"
      sha256 "cb9163a0e8481c858ac88097a6c547bef47b9ff67e57a584deae9830021c6e73"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.17.0/nim-darwin-arm64.zip"
      sha256 "72bfd42da62eeec63836ae7e4bd856dea2e3828e24c09dae215864849ab10bad"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wasilak/nim/releases/download/v0.17.0/nim-linux-amd64.zip"
      sha256 "4a3774705f48a20364172fc46bd643f556deabea32e9ab9b7811eb669ce2c057"
    end
    on_arm do
      url "https://github.com/wasilak/nim/releases/download/v0.17.0/nim-linux-arm64.zip"
      sha256 "99ef9ddb8328a19cf041fdd0cf88613424710f4a27186dc65f22c8967e0adc1c"
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
