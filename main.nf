#!/usr/bin/env nextflow

nextflow.enable.dsl=2

process runPrediction {
    input:
        path sample
        path reference
        path catalogue
    output:
        path "variants.csv"
        path "mutations.csv" optional true
        path "effects.csv" optional true
    script:
        """
        gnomon --genome_object $reference --catalogue $catalogue --vcf_file $sample --output_dir . --filetype csv
        """
}

workflow {
    main:
        runPrediction(params.sample, params.reference, params.catalogue)
}