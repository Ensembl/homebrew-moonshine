class Pmatch < Formula

  desc "Protein aligner based on ssaha. Contact Ensembl for details"
  odie 'No HOMEBREW_ENSEMBL_MOONSHINE_ARCHIVE environment variable found' if ENV['HOMEBREW_ENSEMBL_MOONSHINE_ARCHIVE'].nil?
  url 'file://'+ENV['HOMEBREW_ENSEMBL_MOONSHINE_ARCHIVE']+"/rd-utils-1.0.0.tar.gz"
  sha256 "d855b69dd324650e952e9dffe2b619bbee7c4982f569c84232861eace88a9585"
  version "1.0.0"

  patch :DATA

  def install
    system 'make'
    bin.install 'pmatch'
  end

  test do
    system 'pmatch'
  end
end
__END__
diff --git a/Makefile b/Makefile
index f72b61b..1c0a457 100644
--- a/Makefile
+++ b/Makefile
@@ -2,11 +2,11 @@
 # CVS info: $Id: Makefile,v 1.4 2001/10/26 09:35:02 searle Exp $
 
 # For gcc
-#CC=gcc
-#CFLAGS=-O6 -fomit-frame-pointer -finline-functions
+CC=gcc
+CFLAGS=-O6 -fomit-frame-pointer -finline-functions
 # For Alpha compiler
-CC=cc
-CFLAGS=-fast -O4 -arch ev67
+#CC=cc
+#CFLAGS=-fast -O4 -arch ev67
 
 all: composition seqsample pmatch seqpress
 
@@ -22,7 +22,7 @@ peptide.o: peptide.c peptide.h
 	$(CC) -c $(CFLAGS) peptide.c
 
 composition: composition.c readseq.o
-	$(CC) -g -o $(@) -lm composition.c readseq.o
+	$(CC) -g -o $(@) composition.c readseq.o -lm
 
 dbshatter: dbshatter.c readseq.o
 	$(CC) -g -o $(@) dbshatter.c readseq.o
@@ -31,7 +31,7 @@ seqsample: seqsample.c readseq.o
 	$(CC) -g -o $(@) seqsample.c readseq.o
 
 pmatch: pmatch.c readseq.o peptide.o
-	$(CC) $(CFLAGS) -o $@ `glib-config --cflags` pmatch.c readseq.o peptide.o `glib-config --libs`
+	$(CC) $(CFLAGS) -o $@ `pkg-config glib-2.0 --cflags` pmatch.c readseq.o peptide.o `pkg-config glib-2.0 --libs`
 
 seqpress: seqpress.c readseq.o
 	$(CC) -g -o $(@) seqpress.c readseq.o

