data_path <- "https://github.com/sk-sahu/learn-R/raw/master/website/data/airway_count_matrix.txt"

# Read data
read_count <- read.table(data_path, header = T, row.names = 1)

# normalize
total_reads <- sum(read_count$SRR1039508)
total_reads_per_million <- total_reads/1000000
fpkm <- (read_count$SRR1039508)/total_reads_per_million

# plot distribution
hist(log(fpkm))

# Get summary of data
summary(read_count)

# get correlation
read_count_cor <- cor(read_count)
install.packages("corrplot")
library(corrplot)
corrplot(read_count_cor)
