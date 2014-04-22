Split.pl
========

Split text files by line numbers through pipe (for splitting file linus split -l command is useful)

Usage
=====

cat &lt;some text file&gt; | ./split.pl -l &lt;numberof lines per chunk&gt; &lt;filename prefix&gt;

Ex:
===
cat sample_txt.csv | ./split.pl -l 100 sample_txt

the above command generates sample_txt_aa sample_txt_ab etc.. each chunk gets 100 lines.
