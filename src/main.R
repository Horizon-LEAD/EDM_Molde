#' EDM main
#'
#' Rscript <path-to-projcet>/main.R <path-to-excel-file>
#'                                   <path-for-output>
#'
library("argparse")


# CLI argument parsing
parser <- ArgumentParser(description = "EDM processing")
parser$add_argument("fin", type = "character",
                    help = "Excel input file")
parser$add_argument("outdir", type = "character",
                    help = "Output directory")

args <- parser$parse_args()


out_dir <- args$outdir
file_output_asis <- file.path(out_dir, "output.csv")

# find directory of the script and source deps
cli_args <- commandArgs(trailingOnly = FALSE)
script_name <- sub("--file=", "", cli_args[grep("--file=", cli_args)])
script_dirname <- dirname(script_name)

source(file.path(script_dirname, "edm.R"))

design(args$fin, args$outdir)

