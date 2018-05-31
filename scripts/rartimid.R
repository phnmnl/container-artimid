#!/usr/bin/env Rscript

suppressPackageStartupMessages(library(optparse))

options_list<-list(
  make_option(c("--input","-i"),help="Input for general information"),
  make_option(c("--spectra","-s"),help="Input spectra (simid ouput) and output corrected for natural isotopes"),
  make_option(c("--output","-o"),help="ouput full path name, directories and files will be created here"),
  make_option(c("--cdfdir","-z"),help="directory containing .CDFs"),
  make_option(c("--files","-f"),help="Corrected files for metabolites (ouput of artimid)"),
  make_option(c("--label","-l"),help="Position of a record with labeling info")
  )

parser = OptionParser(option_list = options_list)
opt<-parse_args(parser,positional_arguments = FALSE)

if(!("input" %in% names(opt)) ) {
  print("no argument given!")
  print_help(parser)
  q(status = 1,save = "no")
}

library("simid")

library(ncdf4)

if("spectra" %in% names(opt)) {rumidcor(infile=opt$input, dadir=opt$spectra)
             print("correction of raw MID finished")}
if("output" %in% names(opt)) {metan(infile=opt$input, cdfdir=opt$cdfdir, fiout=opt$output)
             print("extraction of MID finished")}
if("files" %in% names(opt)) {isoform(isofi=opt$input, dor=opt$files,marca=as.integer(opt$label))
             print(" MID prepared for simulation")}

#docker run -it -v $PWD:/data artimid -i /data/sw620 -s /data/files/SW620/ #correct (rumidcor)
#docker run -it -v $PWD:/data artimid -i /data/sw620 -z /data/SW620/ -o /data/out.csv #extract (metan)
#docker run -it -v $PWD:/data artimid -i /data/toIsodyn -f /data/files/SW620/ -l 3 #stat (isoform)

