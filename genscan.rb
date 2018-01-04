class Genscan < Formula

  # When installing you must download the appropriate archive which is 
  # uuencoded and issue the commands (in the HOMEBREW_ENSEMBL_MOONSHINE_ARCHIVE dir):
  # 
  # uudecode uudecode genscanlinux.tar.uue
  # gzip genscanlinux.tar
  # mv genscanlinux.tar.gz genscan-1.0.0.tar.gz

  desc "General-purpose gene identification program"
  homepage "http://genes.mit.edu/gendist.html"
  odie 'No HOMEBREW_ENSEMBL_MOONSHINE_ARCHIVE environment variable found' if ENV['HOMEBREW_ENSEMBL_MOONSHINE_ARCHIVE'].nil?
  url 'file://'+ENV['HOMEBREW_ENSEMBL_MOONSHINE_ARCHIVE']+"/genscan-1.0.0.tar.gz"
  sha256 "b71fc3233555a7928a369885a8ad867f3db2a4e0e38eda223ca8f4654801a687"
  version "1.0.0"

  def install 
    bin.install 'genscan'
    share.install Dir['*.smat']
    doc.install 'README'
  end

  test do
    system "#{bin}/genscan"
  end
end
