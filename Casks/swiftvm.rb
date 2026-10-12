cask "swiftvm" do
  version "1.2.0"
  sha256 "4f86cd26a1051bc29dfb9c52243e3ed0f8f24e2bd1a4102e397885041547566d"

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
