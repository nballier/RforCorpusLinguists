##RforCorpusLinguists

#Two introductory sessions to R for Corpus Linguists

#To be presented at Diderot (ODG) on April 1st

#1er avril 2019: R pour les linguistes de corpus (1) Cette séance expliquera comment transformer RStudio en concordancier, et comment des scripts ou des bibliothèques (ou "packages") développées en R donnent accès à des fonctionnalités plus avancées.

#To be presented at Diderot (ODG) on April 8th

#8 avril 2018 : R pour les linguistes de corpus (2) Cette séance présentera quelques fonctionnalités du package {quanteda}, qui permet notamment des mesures automatiques de la complexité lexicale (les "métriques").




# Simple R presentation : https://paulalisson.github.io/IntroStats1.html#/



#1. using R a as concordancer: data compilation (Gries 2009)
# choose a file interactively
file.choose() 
# also possible: library(tcltk); tk_choose.files()
choose.files() #  Windows 
unique(c("in", "a", "bed", "in", "the", "room", "is", "the")) # get types
table(c("in", "a", "bed", "in", "the", "room", "is", "the")) # get type frequencies


txt <- c("This is a first example sentence.", "And this is a second example sentence.")
grep("second", txt) # or
grep("second", txt, value=TRUE, ignore.case=FALSE)


source("http://www.linguistics.ucsb.edu/faculty/stgries/exact_matches.r")
qwe <- exact.matches("e", txt)
qwe

# a sorted frequency list of an unannotated corpus
rm(list=ls(all=TRUE))
text.file <- scan(file.choose(), what=character(), sep="\n") # <corp_gpl_short.txt>
text.file <- tolower(text.file) # change to lower case
words.list <- strsplit(text.file, "\\W+", perl=TRUE) # split up at 1+ non-word characters
words.vector <- unlist(words.list) # unlist to get a tabulatable vector
freq.list <- table(words.vector) # tabulate the vector
sorted.freq.list <- sort(freq.list, decreasing=TRUE) # create sorted version of table
sorted.table <- paste(names(sorted.freq.list), sorted.freq.list, sep="\t") # paste the names/words together with the numbers (separated by a tab stop)
cat("WORD\tFREQ", sorted.table, file="freqlist-1.csv", sep="\n") # output the table: label with relevant name



# 2.  OCR with R : {teseract} and {tabulizer} ------------- 
https://ropensci.org/technotes/2018/12/14/pdftools-20/
install.packages("tesseract")
library(tesseract)
https://ropensci.org/technotes/2018/11/06/tesseract-40/


library("tabulizer")
f <- system.file("examples", "data.pdf", package = "tabulizer")
# extract table from first page of example PDF
tab <- extract_tables(f, pages = 1)
head(tab[[1]])
# https://github.com/ropensci/tabulizer
# from https://github.com/tabulapdf/tabula

library("tabulizer")
f <- system.file("examples", "data.pdf", package = "tabulizer")

# extract table from first page of example PDF
tab <- extract_tables(f, pages = 1)
head(tab[[1]])

# extract tables to CSVs
extract_tables(f, output = "csv")
str(extract_tables(f, pages = 2, guess = TRUE, output = "data.frame"))
extract_tables()). 

extract_areas(f)  # select 


# read texts with tuturial https://github.com/quanteda/readtext/
# install {devtools}
# install {readtext}


# save the $text variable as a series of texts


# More elaborate functions with https://rdrr.io/cran/quanteda/man/ntoken.html
