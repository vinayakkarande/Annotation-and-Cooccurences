# setup Reuired Libraries
if (!require(shiny)){install.packages("shiny")}
if (!require(udpipe)){install.packages("udpipe")}
if (!require(textrank)){install.packages("textrank")}
if (!require(lattice)){install.packages("lattice")}
if (!require(igraph)){install.packages("igraph")}
if (!require(ggraph)){install.packages("ggraph")}
if (!require(gplot2)){install.packages("gplot2")}
if (!require(wordcloud)){install.packages("wordcloud")}
if (!require(stringr)){install.packages("stringr")}


library(shiny, lib.loc="~/R/win-library/3.4")
library(udpipe, lib.loc="~/R/win-library/3.4")
library(textrank, lib.loc="~/R/win-library/3.4")
library(lattice, lib.loc="~/R/win-library/3.4")
library(igraph, lib.loc="~/R/win-library/3.4")
library(ggraph, lib.loc="~/R/win-library/3.4")
library(ggplot2, lib.loc="~/R/win-library/3.4")
library(wordcloud, lib.loc="~/R/win-library/3.4")
library(stringr, lib.loc="~/R/win-library/3.4")