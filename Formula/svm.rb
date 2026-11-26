class Svm < Formula
  desc "Linux virtual machines for AI agents"
  homepage "https://github.com/swiftvm-app/cli"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/swiftvm-app/cli/releases/download/v0.2.1/svm-macos-arm64.tar.gz"
      sha256 "6f26e5de5d306c25a775e9f8d2337a73f39f64e4ebdf945ce9b16a42badf8dc4"
    end
    on_intel do
      url "https://github.com/swiftvm-app/cli/releases/download/v0.2.1/svm-macos-x86_64.tar.gz"
      sha256 "a4f900e40090a9694e545f2516cb2302ac7e38e946bd721b7deac884715b79b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/swiftvm-app/cli/releases/download/v0.2.1/svm-linux-arm64.tar.gz"
      sha256 "38011b180a2282af462288a8814cde79aa0158e42f7d25b0760815cc9ee09d90"
    end
    on_intel do
      url "https://github.com/swiftvm-app/cli/releases/download/v0.2.1/svm-linux-x86_64.tar.gz"
      sha256 "a52b604058a592fd19fbc1fd29ef90c2148ea6320dc42c440ab23afb26d330d7"
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
