# Differential Gene Expression Analysis (DESeq2)
This project creates a Random Forest machine learning model to determine which genes best predict whether a patient will develop two cancer symptoms: 

    1. Perineural Invasion (PNI)      - Invasion of cancer to the space surrounding a nerve
    2. Lymphovascular Invasion (LVI)  - Invasion of cancer to lymphatics or blood vessels

The user will input two datasets 

    1. TPM Dataset                    - Contains patient TPM counts for each gene
    2. Coldata Dataset                - Contains patient information (i.e. age, diagnosis, sex)

This project will output one file:

    1. DESeq2 Results Dataset         - Contains DESeq2 results for each gene, particularly the P-adjusted values, which will be used to remove the least significant genes before feeding the gene set to the Random Forest and XGBoost models.

## Author

* **Peter Hwang** - [pghwang](https://github.com/pghwang)

## Acknowledgments

* This project has been created for an undergraduate research project under the Broad Institute of MIT and Harvard.
* Special thanks to Jimmy Guo and Hannah Hoffman for the guidance and support!

## References

    Analyzing RNA-seq data with DESeq2: http://bioconductor.org/packages/release/bioc/vignettes/DESeq2/inst/doc/DESeq2.html
