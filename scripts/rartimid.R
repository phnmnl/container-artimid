#!/usr/bin/env Rscript

suppressPackageStartupMessages(library(optparse))

options_list<-list(
  make_option(c("--input","-i"),help="Input for general information"),
  make_option(c("--spectra","-s"),help="Input spectra (simid ouput) and output corrected for natural isotopes"),
  make_option(c("--output","-o"),help="ouput full path name, directories and files will be created here"),
  make_option(c("--cdfdir","-z"),help="directory containing .CDFs")
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

if("spectra" %in% names(opt)) rumidcor(infile=opt$input, dadir=opt$spectra)
if("output" %in% names(opt)) metan(infile=opt$input, cdfdir=opt$cdfdir, fiout=opt$output)

#docker run -it -v $PWD:/data artimid -i /data/sw620 -s /data/files/SW620/ 
#docker run -it -v $PWD:/data artimid -i /data/sw620 -z /data/SW620/ -o /data/out.csv

