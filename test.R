install.packages("xlsx")
library("xlsx")
?read.xlsx
file <- "~/Downloads/BASUDEV  DATA FOR R STUDIO.xlsx"
res <- read.xlsx(file, 1)  # read first sheet
