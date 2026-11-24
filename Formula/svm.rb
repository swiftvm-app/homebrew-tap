class Svm < Formula
  desc "Linux virtual machines for AI agents"
  homepage "https://github.com/swiftvm-app/cli"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/swiftvm-app/cli/releases/download/v0.1.0/svm-macos-arm64.tar.gz"
      sha256 "0c059b7e3005959fc8e99d3ed1e4ebbf985ef4998c2cc5e64bf6f3b1070f1d0d"
    end
    on_intel do
      url "https://github.com/swiftvm-app/cli/releases/download/v0.1.0/svm-macos-x86_64.tar.gz"
      sha256 "7f3307a2ae96ad59fee43ebd9dbe07bbcbea0468bc66cbb94130588cefd80514"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/swiftvm-app/cli/releases/download/v0.1.0/svm-linux-arm64.tar.gz"
      sha256 "3b791b656178f44b9daa92eac185eb9888ef76f448e78a54033cd40716b9c3e5"
    end
    on_intel do
      url "https://github.com/swiftvm-app/cli/releases/download/v0.1.0/svm-linux-x86_64.tar.gz"
      sha256 "45c293a0e8769d3b5e3885c3cbd9e0ca27a60bfce7d2655745651e8e7793edba"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"svm"
  end

  def caveats
    on_linux do
      <<~TEXT
        Machines need /dev/kvm: add your user to the kvm group, and log in again.
      TEXT
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/svm version")
  end
end
