class Repbase < Formula

  desc "Curated set of repeat libraries for RepeatMasker"
  homepage "http://www.girinst.org/repbase/index.html"
  odie 'No HOMEBREW_ENSEMBL_MOONSHINE_ARCHIVE environment variable found' if ENV['HOMEBREW_ENSEMBL_MOONSHINE_ARCHIVE'].nil?
  version "20170127"
  url 'file://'+ENV['HOMEBREW_ENSEMBL_MOONSHINE_ARCHIVE']+"/repbase-#{version}.tar.gz"
  sha256 "a963f988510408e7dd793e0d78a6d086edff6ce2161dd17197adb32dcd323bc1"

  def install
    libexec.install Dir["./*"]
  end

  def caveats; <<~EOS
    If you just have updated Repbase you would want to run:
      brew postinstall ensembl/ensembl/repeatmasker
    It will update the RepBase libraries in RepeatMasker
    and recreate the blast index for RMBlast
    EOS
  end

end
