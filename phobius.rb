class Phobius < Formula

  desc "A combined transmembrane topology and signal peptide predictor"
  homepage "http://phobius.sbc.su.se/"
  odie 'No ENSEMBL_MOONSHINE_ARCHIVE environment variable found' if ENV['ENSEMBL_MOONSHINE_ARCHIVE'].nil?
  url 'file://'+ENV['ENSEMBL_MOONSHINE_ARCHIVE']+"/phobius-1.01.tar.gz"
  sha256 "09b1f01e7262f6f531714ed77dbfd7fe6227635f0f22ec136650946197ef88fb"
  version "1.01"

  def install 
    inreplace 'phobious.pl', '/usr/bin/perl', '/usr/bin/env perl'
    prefix.install Dir['*']
  end

  test do
    system "true"
  end
end
