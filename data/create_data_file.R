#!/usr/bin/Rscript
# This will dowload the humn disese variation file in the current directory and parse it

#download.file("ftp://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/variants/humsavar.txt", "humsavar.txt")

r <- readLines("https://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/variants/humsavar.txt",skipNul = T)

begin <- grep("^____", r, perl = T)
end <- grep("^---", r, perl = T)
end <- end[4]
r_data <- r[(begin+1):(end-2)]

d <- read.table(textConnection(r_data), fill = T, stringsAsFactors = F, sep="", flush = T)

#r <- read.table("https://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/variants/humsavar.txt", header = F, 
#				skip = 49, sep = "", fill = T, stringsAsFactors = F, flush = T, nrows=78710)
d<- d[, -ncol(d)]
write.table(d, "humsavar.tsv", row.names = F, col.names = F, quote = F, sep="\t")
