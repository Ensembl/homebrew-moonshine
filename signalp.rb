class Signalp < Formula

  desc "Predicts the presence and location of signal peptide cleavage sites in amino acid sequences"
  homepage "http://www.cbs.dtu.dk/cgi-bin/nph-sw_request?signalp"
  odie 'No ENSEMBL_MOONSHINE_ARCHIVE environment variable found' if ENV['ENSEMBL_MOONSHINE_ARCHIVE'].nil?
  url 'file://'+ENV['ENSEMBL_MOONSHINE_ARCHIVE']+"/signalp-4.1e.tar.gz"
  sha256 "9cb6543e7f154f1a40ec33efad12b783c5ae0677ee5e0294f718073a4c2d83d6"
  version "4.1e"

  def install 
    inreplace 'signalp', "$ENV{SIGNALP} = '/usr/cbs/bio/src/signalp-4.1';", "$ENV{SIGNALP} = '#{prefix}';"
    bin.install 'signalp'
    man1.install 'signalp.1'
    Dir.entries('syn').select {|f| File.join('syn',f) and !(f =='.' || f == '..') }.each { |d| chmod 0755, File.join('syn', d) }
    prefix.install 'syn'
    doc.install 'signalp-4.1.readme'
    bin.install Dir['bin/*']
    lib.install Dir['lib/*']
  end

  test do
    system "true"
  end
end
