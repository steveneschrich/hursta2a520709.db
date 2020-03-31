
#I use the instructions located (here)[https://bioconductor.org/packages/release/bioc/vignettes/AnnotationForge/inst/doc/SQLForge.pdf]

library(RSQLite)
library(AnnotationForge)
library(tidyr)
library(dplyr)
library(readr)

# The hursta_annotation_latest file has the full data from Eric Welsh on annotation of the chip.

hursta_annotation<-read_tsv(file="hursta_annotation_latest.txt")

#Filter out empty GeneID with "---"
read_tsv(file="hursta_annotation_latest.txt") %>%
  	filter(`GeneID` != "---")  %>%
 	separate(`GeneID`, into="GeneMap", extra="drop") %>%
  	select(`ProbeID`, `GeneMap`) %>%
	write_tsv(path=sprintf("%s/gene_map.txt",tempdir()), col_names=FALSE)


makeDBPackage("HUMANCHIP_DB",
              affy=FALSE,
	      author = c("Steven Eschrich [aut, cre]"),
	      maintainer = c("Steven Eschrich <Steven.Eschrich@moffitt.org>"),
              prefix="hursta2a520709",
              fileName=sprintf("%s/gene_map.txt",tempdir()),
              baseMapType="eg",
              outputDir=".",
              version="1.0.0",
              manufacturer="Affymetrix",
              chipName="hursta2a520709",
              manufacturerUrl = "http://www.affymetrix.com")


