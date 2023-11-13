df = read.csv("Desktop/Rscripts/DATA/metabolite.csv", header=T)
head(df)
summary(df)

metabolites_data <- read.csv("Desktop/Rscripts/DATA/metabolite.csv")

alzheimers_patients <- sum(metabolites_data$Label == "Alzheimer")
cat("Number of Alzheimer patients:", alzheimers_patients, "\n")

missing_values_per_column <- colSums(is.na(metabolites_data))
print(missing_values_per_column)

new_data <- metabolites_data[complete.cases(metabolites_data$Dopamine), ]

median_c4_OH_Pro <- median(new_data$c4_OH_Pro, na.rm = TRUE)
new_data$c4_OH_Pro[is.na(new_data$c4_OH_Pro)] <- median_c4_OH_Pro

threshold <- 0.25 * nrow(new_data)
new_data <- new_data[, colSums(is.na(new_data)) <= threshold]

print(new_data)