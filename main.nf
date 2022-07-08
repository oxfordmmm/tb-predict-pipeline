#!/usr/bin/env nextflow

//Pipeline based on Lodestone tb pipeline (https://github.com/Pathogen-Genomics-Cymru/tb-pipeline)
//And SARS-CoV2_worflows (https://github.com/oxfordmmm/SARS-CoV2_workflows)

//Set DSL2 syntax
nextflow.enable.dsl=2

//Define ANSI colours for ease
ANSI_GREEN = "\033[1;32m"
ANSI_RESET = "\033[0m"


//Setup so --help triggers the help message
if (params.help) {
    helpMessage()
    exit(0)
}

def helpMessage() {
log.info """
========================================================================
M Y C O B A C T E R I A L  P R E D I C T I O N  P I P E L I N E
  
Utilises the output of the Lodestone pipeline (namely the minos VCF file) to produce variations, mutations and
drug resistance predictions based on provided a reference genome and a resistance catalogue.
	
Mandatory parameters:
------------------------------------------------------------------------
--sample            Path to the sample minos VCF
--reference         Path to the reference genome's genbank file, or a pickle dump of the corresponding gumpy Genome
--catalogue         Path to the resistance catalogue
--output_dir        Desired output path for all files produced by gnomon
"""
.stripIndent()
}


//Log pre-run info
log.info """
========================================================================
M Y C O B A C T E R I A L  P R E D I C T I O N  P I P E L I N E
Parameters used:
------------------------------------------------------------------------
--sample            ${params.sample}
--reference         ${params.reference}
--catalogue         ${params.catalogue}
--output_dir        ${params.output_dir}

Runtime data:
------------------------------------------------------------------------
Running with profile  ${ANSI_GREEN}${workflow.profile}${ANSI_RESET}
Running as user       ${ANSI_GREEN}${workflow.userName}${ANSI_RESET}
Launch directory      ${ANSI_GREEN}${workflow.launchDir}${ANSI_RESET}
"""
.stripIndent()

//Run gnomon
process runPrediction {
    input:
        path sample
        path reference
        path catalogue
        path outputDir
    output:
        path "$outputDir/gnomon.log"
        path "$outputDir/variants.csv"
        path "$outputDir/mutations.csv" optional true
        path "$outputDir/effects.csv" optional true
    script:
        """
        gnomon --genome_object $reference --catalogue $catalogue --vcf_file $sample --output_dir $outputDir --filetype csv
        """
}

workflow {
    main:
        runPrediction(params.sample, params.reference, params.catalogue, params.output_dir)
}