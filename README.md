# homebrew-moonshine

Moonshine formulas depend on closed source software or software that is not publically available due to licensing constraints or other reasons. You must download the dependent files yourself and move them to a centralised location where the moonshine formulas will use it to create the installation.

# Moonshine Rules

1. Moonshine formulas code archives should be named as `moonshine-formula-version.ext` e.g. the formula `tcdust.rb` should have an archive called `tcdust-1.0.0.tar.gz`
2. The `homepage` tag should point to where to get the archive from
3. The `desc` tag should say how to get the archive if it is not obvious from the previous URL
4. Moonshine formulas can depend on other moonshine formulas
5. Program installing formulas from outside of moonshine *cannot depend on those held in moonshine*
6. Formulas in [ensembl/homebrew-cask](https://github.com/Ensembl/homebrew-cask) can depend on moonshine formulas (it is assumed they are coordinating an installation of a program)

# The Moonshine Archive

All moonshine formulas expect an environment variable called `ENSEMBL_MOONSHINE_ARCHIVES` be made available where all dependencies are held.
