class Icemon < Formula
  desc "Icecream GUI Monitor"
  homepage "https://github.com/icecc/icemon"
  url "https://github.com/icecc/icemon/archive/v3.2.0.tar.gz"
  sha256 "b7ed29c3638c93fbc974d56c85afbf0bfeca6c37ed0522af57415a072839b448"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "icecream"
  depends_on "lzo"
  depends_on "qt"

  # Fix icemon not seeing any hosts
  # https://github.com/icecc/icemon/pull/47
  patch :DATA

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "#{bin}/icemon", "--version"
  end
end

__END__
diff --git a/src/icecreammonitor.cc b/src/icecreammonitor.cc
index 5d24339..74dac74 100644
--- a/src/icecreammonitor.cc
+++ b/src/icecreammonitor.cc
@@ -96,6 +96,7 @@ void IcecreamMonitor::checkScheduler(bool deleteit)
 void IcecreamMonitor::registerNotify(int fd, QSocketNotifier::Type type, const char *slot)
 {
     if (m_fd_notify) {
+        m_fd_notify->setEnabled(false);
         m_fd_notify->disconnect(this);
         m_fd_notify->deleteLater();
     }

