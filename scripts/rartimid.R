#!/usr/bin/env Rscript

suppressPackageStartupMessages(library(optparse))

options_list<-list(
  make_option(c("--input","-i"),help="Input for general information"),
  make_option(c("--spectra","-s"),help="Input spectra (ouput of simid) and output corrected for natural isotopes abundance"))

parser = OptionParser(option_list = options_list)
opt<-parse_args(parser,positional_arguments = FALSE)

if(!("input" %in% names(opt)) || !("spectra" %in% names(opt)) ) {
  print("no argument given!")
  print_help(parser)
  q(status = 1,save = "no")
}

library("simid")

rumidcor(infile=opt$input, dadir=opt$spectra)

