class Tmhmm < Formula

  desc "Prediction of transmembrane helices in proteins"
  homepage "http://www.cbs.dtu.dk/cgi-bin/nph-sw_request?tmhmm"
  odie 'No HOMEBREW_ENSEMBL_MOONSHINE_ARCHIVE environment variable found' if ENV['HOMEBREW_ENSEMBL_MOONSHINE_ARCHIVE'].nil?
  url 'file://'+ENV['HOMEBREW_ENSEMBL_MOONSHINE_ARCHIVE']+"/tmhmm-2.0c.tar.gz"
  sha256 "09b1f01e7262f6f531714ed77dbfd7fe6227635f0f22ec136650946197ef88fb"
  version "2.0c"

  def install 
    bin.install Dir['bin/*']
    lib.install Dir['lib/*']
    doc.install 'TMHMM2.0.html'
  end

  test do
    system "true"
  end
end
