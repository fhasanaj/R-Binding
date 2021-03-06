source("../R/Api.R")
library(rjson)
library("optparse")

option_list = list( make_option(c("-k", "--key"), action="store", default=NA, type='character',
              help="Rosette API key"), make_option(c("-u", "--url"), action="store", default=NA, type='character',
              help="Rosette API url"))
opt_parser = OptionParser(option_list=option_list)
opt = parse_args(opt_parser)

translated_name_data <- "معمر محمد أبو منيار القذاف"

key <- "name"
value <- translated_name_data
key1 <- "targetLanguage"
value1 <- "eng"

parameters <- list()
parameters[[ key ]] <- value
parameters[[ key1 ]] <- value1
parameters <- toJSON(parameters)

if(is.na(opt$url)){
   result <- api(opt$key, "name-translation", parameters)
} else {
   result <- api(opt$key, "name-translation", parameters, NULL, opt$url)
}
print(result)
