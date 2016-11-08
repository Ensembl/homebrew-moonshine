class Repbase < Formula

  desc "Curated set of repeat libraries for RepeatMasker"
  homepage "http://www.girinst.org/repbase/index.html"
  odie 'No ENSEMBL_MOONSHINE_ARCHIVE environment variable found' if ENV['ENSEMBL_MOONSHINE_ARCHIVE'].nil?
  url 'file://'+ENV['ENSEMBL_MOONSHINE_ARCHIVE']+"/repeatmaskerlibraries-20150807.tar.gz"
  sha256 "d03ee3ca07a0c95764be05e9ba8c83203f82cb13e87874a735e80b89447c7919"
  version "20150807"

  def install
    libexec.install Dir["./*"]
  end

end
