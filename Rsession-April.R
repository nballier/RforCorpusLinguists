##RforCorpusLinguists

#Two introductory sessions to R for Corpus Linguists

#To be presented at Diderot (ODG) on April 1st

#1er avril 2019: R pour les linguistes de corpus (1) Cette séance expliquera comment transformer RStudio en concordancier, et comment des scripts ou des bibliothèques (ou "packages") développées en R donnent accès à des fonctionnalités plus avancées.

#To be presented at Diderot (ODG) on April 8th

#8 avril 2018 : R pour les linguistes de corpus (2) Cette séance présentera quelques fonctionnalités du package {quanteda}, qui permet notamment des mesures automatiques de la complexité lexicale (les "métriques").




# Simple R presentation : https://paulalisson.github.io/IntroStats1.html#/


## R: prise en main élémentaire--------

# pour telecharger plusieurs packages a la fois  

# creer un objet qui est la liste des packges a installer

pkgs <- c("dplyr", "ggplot2", "stringr", "ggmap", "ggrepel",
          "devtools", "viridis", "plotly", "jsonlite", "lazyeval",
          "knitr", "readr")

?c # le point d'interrogation permet de connaitre la fonction
c(1,7:9)
# [1] 1 7 8 9
c(1,7,9)
# [1] 1 7 9
numbers <- c(1:9)

test <- c(1:5, 10.5, "next")


class(pkgs)
class(numbers)

pkgs <- c("dplyr", "ggplot2", "stringr", "ggmap", "ggrepel",
          "devtools", "viridis", "plotly", "jsonlite", "lazyeval",
          "knitr", "readr")


pkgs2 <- c("VGAM", "EnvStats", "languageR", "car", "ez", "lattice", "nlme", "ade4", "MultinomialCI", "effects","DT")



# installer la liste des packages d'un seul coup
install.packages(pkgs2,
                 repos = "https://cloud.r-project.org",
                 type = "binary",
                 dependencies = TRUE,
                 quiet = TRUE)


install.packages('languageR')
library(languageR)

library()

# explorer les vignettes
browseVignettes("languageR")

browseVignettes("car")
install.packages("tm")
library(tm)
browseVignettes("tm")



install.packages("koRpus")
library(koRpus)
browseVignettes("koRpus")

# exploring a package----------------

# exploring a list of functions
ls(package:languageR)


#exploring the package
help("languageR")


# exploring the datasets 
data(package="languageR")
data(alice)


# Delete evth
rm(list = ls())

# exploring an object 
class(alice)
head(alice)
head(alice,15)
class(lexdec)
head(lexdec)
summary(lexdec)
lexdec <- lexdec
str(lexdec)


subjects <- lexdec$Subject
RT <-  lexdec[,2]
boxplot(lexdec$RT)
#visualise 
boxplot(lexdec$RT)
str(lexdec)


boxplot(lexdec$Trial)

[r,c]
boxplot(lexdec[,3])

# create an object with only the frequencies ( 10, 15 & 16) as columns 
frequencies <- 
?c
str(frequencies)


# observe the data
summary(lexdec$Sex)
table(lexdec$Sex)

# extract the female subjects
female <- lexdec[lexdec$Sex=="F",]
summary(female)
summary(female$Sex)

# extract the male subjects
male <- lexdec[lexdec$Sex=="M",]
male$Sex <- factor(male$Sex)
summary(male$Sex)

# extract the English Native subjects
summary(lexdec$NativeLanguage)
English.subjects <- lexdec[lexdec$NativeLanguage=="English",]
str(English.subjects)
summary(English.subjects$NativeLanguage) # Other est en m�moire
# met à jour le nombre de niveaux de valeurs 
English.subjects$NativeLanguage <- factor(English.subjects$NativeLanguage)
summary(English.subjects$NativeLanguage)




getwd() #Look at directory

# desclares the desktop as the working dierctory
setwd("C:/Users/utilisateur/Desktop")

dir() #See what is in directory

#Write out the dataset
write.csv(lexdec, "lexdec.csv", row.names=FALSE)
?write.csv()



#1. using R a as concordancer: data compilation (Gries 2009)---------
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
CELVAtext <- ### file chose to "CELVA.Sp_286.csv"

output <- NULL
for (i in seq_along(CELVAtext)) {

    # read each file in and split apart into
    # tokens and tags
    x <- read_lines(CELVAtext[i])
    x <- as.character(x)

    # Save results
    fout <- file(file.path("CELVA_raw", basename(lexdiv$document[i])), open = "w")
    writeLines(y, fout)
    close(fout)

    # verbosely let us know the loop is still running
    cat(sprintf("Done with %03d of %03d\n", i, length(CELVA_Sp_286$text)))
}
readtext::readtext("path_to/your_files/*.txt")



# More elaborate functions with https://rdrr.io/cran/quanteda/man/ntoken.html
{quanteda}


# Pourquoi perdre un temps considérable à apprendre R?--------
enjeux SHS
- force de sa communauté d'utilisateurs
- accès à des modélisations statistiques de pointe 
encyclopédie des packages (humanisme/interdisciplinarité 2.0)
- visualiser et diffuser (shiny, Rmarkdown, pandoc > lateX) ses données
http://mapage.noos.fr/admeli/poznan/
http://mapage.noos.fr/admeli/poznan/#15
- proposer la traçabilité de ses résultats (falsifiabilité)
- collaborations 
déplacer sa fracture numérique : de l'interface graphique à la ligne de commandes (le code)
- perl / python (jupytr) http://jupyter.org/
traçabilité -> réplicabilité // falsifiabilité

  
du point de vue du linguiste  
- émergence du data science
(qualitatif et quantitatif et retour)
- la linguistique et son "ticket d'entrée" (Adamczewski)
- travail en interdisciplinarité/intradisciplinarité 
corpus écrits/corpus oral : retarder le divorce avec une interface unique??
(Téramots vs. 100 000 mots/93 000 voyelles)
- des packages  (vs. Python)
- des interfaces (perl,JAVA,python)
http://rpython.r-forge.r-project.org/
library(rPython)   
- du traitement des données numériques aux données textuelles 
- 3RGR
à suivre: http://3rgr.hypotheses.org/

A chaque package ses problématiques de travail et ses fonctions...
... mais cumulativité des solutions (dépendenaces : s'appuyer sur packages existants))

# R is a real pain------------------
langage contre-intuitif pour les programmeurs
mises à jour de R,
discontinuité des packages
inégalité de la documentation des packages
versions et compatibilités (rJava...)
exemple : scipts avec tm (0.5) et tm (0.6)
#corpus <- tm_map(corpus, tolower)
corpus <- tm_map(corpus, content_transformer(removePunctuation))
                                     

# R et mes amis------------
stackoverflow
github
#install.packages('devtools)
# devtools::install_github()
blogs (https://www.r-bloggers.com/)
manuels / sites (Cédric Gendrot, Christophe Pallier, Stefan Gries, Evert and Baroni)

manuel de biologie:

Beckerman & Petchey 2012 Getting Started with R an introduction for Biologists Oxford : OUP.
http://bookzz.org/dl/2369308/c7bd9b
Excellente couverture de l’interface RStudio, de la logique du script et de l’importation et de la visualisation initiale des données. Ce très court manuel constitue un pas à pas très rassurant pour les premières utilisations. 

Calvin & Dytham 2011 Choosing and Using Statistics The biologists’ guide Wiley Blackwell
http://bookzz.org/dl/1114528/115002
Au départ pensé pour Excel, ce manuel aborde la logique des données, de leur visualisation au choix des tests. Très bonne annexe sur les présuppositions de chacun des tests, et glossaire des notions statistiques.


# Quelques packages pour la linguistique (corpus écrits)----------
install.packages(tm)
install.packages(koRpus)
install.packages(corpora)
library(corpora)
(zipfR) # papers on frequency
library
summary(iris)
data("iris")
summary(iris)
data(mtcars)
summary(mtcars)

## excursus : comparaison avec Antconc pour concordances?
http://www.laurenceanthony.net/software.html
the Ant family

# fonctionnalités des corpus , concordanciers
annotations
requêtes (expressions régulières,jokers/wildcards)
n-gram (clusters)


# PACKAGE: ngramrr------  
ngramrr: A Simple General Purpose N-Gram Tokenizer
Simple General Purpose N-Gram Tokenizer  
install.packages('ngramrr')
library(ngramrr)
# 2 fonctons, documentées sur le github, faites par un journaliste de HK

nirvana <- c("hello hello hello how low", "hello hello hello how low",
             "hello hello hello how low", "hello hello hello",
             "with the lights out", "it's less dangerous", "here we are now", "entertain us",
             "i feel stupid", "and contagious", "here we are now", "entertain us",
             "a mulatto", "an albino", "a mosquito", "my libido", "yeah", "hey yay")
dtm2(nirvana, ngmax = 3, removePunctuation = TRUE)


require(ngramrr)
require(tm)
require(magrittr)

nirvana <- c("hello hello hello how low", "hello hello hello how low",
             "hello hello hello how low", "hello hello hello",
             "with the lights out", "it's less dangerous", "here we are now", "entertain us",
             "i feel stupid", "and contagious", "here we are now", "entertain us",
             "a mulatto", "an albino", "a mosquito", "my libido", "yeah", "hey yay")

ngramrr(nirvana[1], ngmax = 3)

Corpus(VectorSource(nirvana)) %>% TermDocumentMatrix(control = list(tokenize = function(x) ngramrr(x, ngmax =3))) %>% inspect

# Character ngram
Corpus(VectorSource(nirvana)) %>% TermDocumentMatrix(control = list(tokenize = function(x) ngramrr(x, char = TRUE, ngmax =3))) %>% inspect
# dtm2 and tdm2 wrappers
dtm2(nirvana, ngmax = 3, removePunctuation = TRUE)


#A la source : https://github.com/chainsawriot/ngramrr/blob/master/R/dtm2.R
## helper function, convert everything to corpus
conv_corpus <- function(x) {
  if ("character" %in% class(x)) {
    return(Corpus(VectorSource(x)))
  } else if ("Source" %in% class(x)) {
    return(Corpus(x))
  } else if ("Corpus" %in% class(x)) {
    return(x)
  } else {
    stop("x must be character vector, Source or Corpus.")
  }
}

# rem: ngramrr: A fast ngram tokenizer for R so that we don't need to install RWeka just for NGramTokenizer().  
NGramTokenizer()  

# https://kielikompassi.jyu.fi/kookit06/corpus/intro/intro.html

# tau text analysis utilities--------
# conversions ascii, utf8
# français, slovaque, espagnol 
https://cran.r-project.org/web/packages/tau/tau.pdf
install.packages('tau')
library(tau)

# packages corpora: SIGIL
http://www.stefan-evert.de/SIGIL/sigil_R/
corpora > SIGIL 

# packages : koRpus
https://cran.r-project.org/web/packages/koRpus/koRpus.pdf
https://cran.r-project.org/web/packages/koRpus/vignettes/koRpus_vignette.pdf
http://edutechwiki.unige.ch/fr/Tutoriel_koRpus
(Treetagger)
(frequency counts)
(readability measures)
(language detection)


# package corpora > SIGIL
"" some convenience functions and example data sets for statistical inference
from corpus frequency data.
companion package for the SIGIL course (
  Statistical Inference - a Gentle Introduction for
  Linguists and similar creatures
) developed by Marco Baroni and Stefan Evert.

https://cran.r-project.org/web/packages/corpora/corpora.pdf
ToDo:overview of functions and data sets in package...
install.packages('corpora')
library(corpora)
data(BNCbiber)
data(BNCdomains)
data(BNCInChargeOf)
data(BNCcomparison)
class(BNCcomparison)
summary(BNCcomparison)
head(BNCcomparison)
