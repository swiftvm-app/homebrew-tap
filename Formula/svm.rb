class Svm < Formula
  desc "Linux virtual machines for AI agents"
  homepage "https://github.com/swiftvm-app/cli"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/swiftvm-app/cli/releases/download/v0.2.0/svm-macos-arm64.tar.gz"
      sha256 "997b4d61886c11a9dba2290faf2f459926dabe8951381817bd51767cce3ba701"
    end
    on_intel do
      url "https://github.com/swiftvm-app/cli/releases/download/v0.2.0/svm-macos-x86_64.tar.gz"
      sha256 "e4338e7ea1c79c07734cce9a94b8c1ec2bb62022af82f5482d5b870b7c594c9e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/swiftvm-app/cli/releases/download/v0.2.0/svm-linux-arm64.tar.gz"
      sha256 "a851e99231019a2b550279a25c8e7c00030dad4ea7426ccef6631ac340f6708f"
    end
    on_intel do
      url "https://github.com/swiftvm-app/cli/releases/download/v0.2.0/svm-linux-x86_64.tar.gz"
      sha256 "a1c3bf902a7eed51031453c33651092a058475c78c7f49a49b3ec46a6b9e1029"
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
