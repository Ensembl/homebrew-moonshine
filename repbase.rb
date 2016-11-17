class Repbase < Formula

  desc "Curated set of repeat libraries for RepeatMasker"
  homepage "http://www.girinst.org/repbase/index.html"
  odie 'No ENSEMBL_MOONSHINE_ARCHIVE environment variable found' if ENV['ENSEMBL_MOONSHINE_ARCHIVE'].nil?
  url 'file://'+ENV['ENSEMBL_MOONSHINE_ARCHIVE']+"/repeatmaskerlibraries-20160829.tar.gz"
  sha256 "91d29e03302d4ba553a5236c59e78eeccbc53908922f25ef30b240c4e664abb1"
  version "20160829"

  def install
    libexec.install Dir["./*"]
  end

end
