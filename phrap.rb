class Phrap < Formula

  desc "phrap/cross_match/swat are software to align DNA sequences and generate assemblies from shotgun DNA sequences"
  homepage "http://www.phrap.org/phredphrapconsed.html#block_phrap"
  odie 'No HOMEBREW_ENSEMBL_MOONSHINE_ARCHIVE environment variable found' if ENV['HOMEBREW_ENSEMBL_MOONSHINE_ARCHIVE'].nil?
  url 'file://'+ENV['HOMEBREW_ENSEMBL_MOONSHINE_ARCHIVE']+"/phrap-1.090518.tgz"
  sha256 "81f50c4410e8604cdefcc34ef6dc7b037be3bb45b94c439611a5590c1cf83665"
  version "1.090518"

  def install
    system "make"
    File.rename 'cluster', 'pcluster'
    doc.install('phrap.doc')
    doc.install('general.doc')
    doc.install('swat.doc')
    pkgshare.install('vector.seq')
    bin.install('PAM250')
    bin.install('BLOSUM62')
    bin.install('BLOSUM50')
    bin.install('mat50')
    bin.install('mat70')
    bin.install('mb_matrix')
    bin.install('penalty2')
    bin.install('swat')
    bin.install('phrap')
    bin.install('cross_match')
    bin.install('phrapview')
    bin.install('pcluster')
    bin.install('loco')
    bin.install('calf_merge')
   end

  test do
    system "cross_match", "vector.seq"
  end
end
