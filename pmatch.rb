class Pmatch < Formula

  desc "Protein aligner based on ssaha"

  # Using a local file system
  #url "file:///nfs/gns/homes/ayates/linuxbrew/private_source/rdutils-1.0.0.tar.gz"
  #Using a Git repo
  url 'git@github.com:Ensembl/rd-utils.git', :using => :git, :revision => 'master'
  #sha256 "3ccabf799b0c04f01fed86e0c00a872cc633a02bbf696bf9df6ebf7f77b8397d"
  version "1.0.0"

  def install
    inreplace 'Makefile', '#CC=g', 'CC=g'
    inreplace 'Makefile', '#CFLAGS=-O6', 'CFLAGS=-O6'
    inreplace 'Makefile', 'CC=cc', ''
    inreplace 'Makefile', 'CFLAGS=-fast', '#CFLAGS=-fast'
    inreplace 'Makefile', "glib-config", "pkg-config glib-2.0"
    system 'make'
    bin.install 'pmatch'
  end

  test do
    system 'pmatch'
  end
end
