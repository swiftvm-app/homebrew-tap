cask "swiftvm" do
  version "1.4.0"
  sha256 "c8f2ede69c1700398873ab3320e8ab781f3b24582e400c33deaf2235aebdbe99"

  url "https://github.com/swiftvm-app/swiftvm/releases/download/v#{version}/SwiftVM-#{version}.dmg"
  name "SwiftVM"
  desc "Run macOS and Linux virtual machines"
  homepage "https://github.com/swiftvm-app/swiftvm"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64

  app "SwiftVM.app"
  binary "#{appdir}/SwiftVM.app/Contents/Helpers/swiftvm"

  # The virtual machines, in ~/Library/Application Support/SwiftVM, are left alone on purpose.
  zap trash: [
    "~/Library/Caches/SwiftVM",
    "~/Library/Caches/com.swiftvm.app",
    "~/Library/HTTPStorages/com.swiftvm.app",
    "~/Library/Preferences/com.swiftvm.app.plist",
    "~/Library/Saved Application State/com.swiftvm.app.savedState",
  ]
end
