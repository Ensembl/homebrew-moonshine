class Phrap < Formula

  desc "phrap/cross_match/swat are software to align DNA sequences and generate assemblies from shotgun DNA sequences"
  homepage "http://www.phrap.org/phredphrapconsed.html#block_phrap"
  odie 'No ENSEMBL_MOONSHINE_ARCHIVE environment variable found' if ENV['ENSEMBL_MOONSHINE_ARCHIVE'].nil?
  url 'file://'+ENV['ENSEMBL_MOONSHINE_ARCHIVE']+"/phrap-1.090518.tgz"
  sha256 "81f50c4410e8604cdefcc34ef6dc7b037be3bb45b94c439611a5590c1cf83665"
  version "1.090518"

  depends_on "ensembl/ensembl/repeatmasker" => :recommended

  def install
    system "make"
    doc.install('phrap.doc')
    doc.install('general.doc')
    doc.install('swat.doc')
    share.install('vector.seq')
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
    bin.install('cluster')
    bin.install('loco')
    bin.install('calf_merge')
   end

  def post_install
    if build.with?("repeatmasker")
      (Formula["ensembl/ensembl/repeatmasker"].opt_libexec/"cross_match_config.txt").write <<-EOS.undent

        env
        #{Formula["ensembl/ensembl/repeatmasker"].opt_libexec}
        #{HOMEBREW_PREFIX}/bin/trf
        1
        #{HOMEBREW_PREFIX}/bin
        Y
        2
        #{HOMEBREW_PREFIX}/bin
        N
        4
        #{HOMEBREW_PREFIX}/bin
        N
        5
        EOS
      system "cd #{Formula['ensembl/ensembl/repeatmasker'].opt_libexec} && ./configure <cross_match_config.txt"
    end
  end

  def caveats; <<-EOS.undent
    Unless you used --without-repeatmasker RepeatMasker has
    been configured to use cross_match as default search engine.
    You may reconfigure RepeatMasker by running
      cd #{Formula['ensembl/ensembl/repeatmasker'].opt_libexec} && ./configure
    EOS
  end

  test do
    system "cross_match", "vector.seq"
  end
end
