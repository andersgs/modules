#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
params.publish_dir_mode = 'link'
params.enable_conda = false
params.run_id = "test-run"

include { IVAR_TRIM } from '../../../../software/ivar/trim/main.nf' addParams([:])

workflow test_ivar_trim {
    bed_file = file("${launchDir}/tests/data/bed/test-sc2-artic-v3.bed", checkIfExists: true)
    bam = file("${launchDir}/tests/data/bam/test-sc2-artic-v3.bam", checkIfExists: true)

    def input = []
    input = [ [ id:'test'], 
                file("${launchDir}/tests/data/bam/test-sc2-artic-v3.bam", checkIfExists: true) ]

    main:
      IVAR_TRIM ( input, bed_file )
}
