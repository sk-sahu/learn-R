library(rmarkdown)

# create a docs dir
dir.create("../docs", showWarnings = FALSE)

# where all output will be after render
dir.create("outputs", showWarnings = FALSE)

# get all the .Rmd files in current folder
rmd_files <- list.files(pattern = ".Rmd")

# render all .Rmd file
for (f in rmd_files) {
  rmarkdown::render(f, output_dir = "../docs/")
}