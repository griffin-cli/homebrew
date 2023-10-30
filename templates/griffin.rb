# This file is automatically generated, do not edit directly.

class Griffin < Formula
  desc "CLI tool for pulling secrets and other config, with version control."
  homepage "https://github.com/griffin-cli/griffin-cli"
  version_scheme 1

  version "$GRIFFIN_VERSION"

  url "$DOWNLOAD_URL_MAC_INTEL"
  sha256 "$SHA256_MAC_INTEL"

  on_macos do
    on_arm do
      url "$DOWNLOAD_URL_MAC_ARM"
      sha256 "$SHA256_MAC_ARM"
    end
  end

  on_linux do
    on_intel do
      url "$DOWNLOAD_URL_LINUX_INTEL"
      sha256 "$SHA256_LINUX_INTEL"
    end
    on_arm do
      url "$DOWNLOAD_URL_LINUX_ARM"
      sha256 "$SHA256_LINUX_ARM"
    end
  end

  def install
    inreplace "bin/griffin", /^CLIENT_HOME=/, "export GRIFFIN_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/griffin"

    bash_completion.install libexec/"autocomplete-scripts/brew/bash" => "griffin"
    zsh_completion.install libexec/"autocomplete-scripts/brew/zsh/_griffin"
  end

  def caveats; <<~EOS
    To use autocomplete run

      $ griffin autocomplete --refresh-cache
  EOS
  end

  test do
    system bin/"griffin", "version"
  end
end
