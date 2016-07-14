class Seg < Formula

  desc "Find low complexity in amino acid seqs"
  odie 'No ENSEMBL_MOONSHINE_ARCHIVE environment variable found' if ENV['ENSEMBL_MOONSHINE_ARCHIVE'].nil?
  url 'file://'+ENV['ENSEMBL_MOONSHINE_ARCHIVE']+"/seg-1.0.0.tar.gz"
  sha256 "87c4bfb3219dafb1b772ea4eaf8e2ca8e36e1f01465aeb0cf700d15f16f19f25"
  version "1.0.0"

  def install 
    cd 'seg' do
      system 'make'
      bin.install 'seg'
    end
    cd 'nseg' do
      system 'make'
      bin.install 'nseg'
      bin.install 'nmerge'
    end
    cd 'pseg' do
      system 'make', 'clean'
      system 'make'
      bin.install 'pseg'
      bin.install 'pmerge'
    end
  end

  test do
    system "#{bin}/seg"
  end
end