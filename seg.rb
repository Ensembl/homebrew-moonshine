class Seg < Formula

  desc "Find low complexity in amino acid seqs"
  odie 'No HOMEBREW_ENSEMBL_MOONSHINE_ARCHIVE environment variable found' if ENV['HOMEBREW_ENSEMBL_MOONSHINE_ARCHIVE'].nil?
  url 'file://'+ENV['HOMEBREW_ENSEMBL_MOONSHINE_ARCHIVE']+"/seg-1.0.0.tar.gz"
  sha256 "87c4bfb3219dafb1b772ea4eaf8e2ca8e36e1f01465aeb0cf700d15f16f19f25"
  version "1.0.0"

  def install 
    inreplace 'seg/makefile', 'cc', 'cc -g'
    #Must do this to re-write the subroutine "double lnperm(sv, tot)" and avoid running over array lengths
    inreplace 'seg/seg.c' do |s|
      s.gsub! 'ans = lnfac[tot];', "int n;\nn = sizeof(lnfac) / sizeof(double);\n if(tot >= n) return 0.0; ans = lnfac[tot];"
      s.gsub! 'ans -= lnfac[sv[i]];', "if(sv[i] >= n) break; \n ans -= lnfac[sv[i]];"
    end
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
