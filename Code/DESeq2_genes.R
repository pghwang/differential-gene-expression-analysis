# Name: Peter Hwang
# Email: hwangp@mit.edu
# Project: Differential Gene Expression Analysis for Cancer Diagnosis
# Date Completed: June 15, 2020

library("BiocParallel")
register(MulticoreParam(4))

# Upload count matrix with patient IDs as columns and genes as rows

tpm <- read.csv(file = "/Users/phwang/Documents/Selection/tpm_PNI.csv", sep = ",", header = TRUE, row.names = NULL)
rownames(tpm) <- make.names(tpm[,1], unique = TRUE)
tpm <- tpm[,-1] # Get rid of old names

# Upload patient information data (i.e., cancer_type, race, PNI, etc.)

coldata <- read.csv(file = "/Users/phwang/Documents/Selection/coldata_PNI.csv", row.names = "filename_edited")

# Run DESeq2

library("DESeq2")
dds_PNI_2 <- DESeqDataSetFromMatrix(countData = tpm,
                                    colData = coldata,
                                    design = ~ Diagnosis.Age + Sex + Race.Category + cancer_type + PNI)

# Get rid of rows that have low number of counts across patients (i.e., fewer than 20 when pooled)

dds_PNI_2 <- dds_PNI_2[ rowSums(counts(dds_PNI_2)) > 20, ]
dds_PNI_2 <- DESeq(dds_PNI_2, parallel = TRUE, minReplicatesForReplace = Inf)
res_PNI <- results(dds_PNI_2, cooksCutoff = FALSE)

# Write output files

res_PNI <- as.data.frame(res_PNI)
filename = "/Users/phwang/Documents/Selection/DESEQ2_PNI.csv"
write.csv(res_PNI, file = filename)