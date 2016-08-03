class Phobius < Formula

  desc "A combined transmembrane topology and signal peptide predictor"
  homepage "http://phobius.sbc.su.se/"
  odie 'No ENSEMBL_MOONSHINE_ARCHIVE environment variable found' if ENV['ENSEMBL_MOONSHINE_ARCHIVE'].nil?
  url 'file://'+ENV['ENSEMBL_MOONSHINE_ARCHIVE']+"/phobius-1.01.tar.gz"
  sha256 "8d15e043318afbc9915616abc67f47b3aa50256d3329f31bbc9b8f44a81e65bd"
  version "1.01"

  def install 
    cd 'tmpCG3gh3/phobius' do
      inreplace 'phobious.pl', '/usr/bin/perl', '/usr/bin/env perl'
      prefix.install Dir['*']
    end
  end

  test do
    system "true"
  end
end
