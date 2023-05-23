process rnaspades {
    label 'medmem'
	container 'library://edwardbirdlab/comptrans/rnaspades:3.15.5'
    publishDir "${params.project_name}/rnaspades", mode: 'copy', overwrite: false

    input:
        tuple file(concat_norm_1_fq), file(concat_norm_2_fq)
    output:
	    tuple val(sample), path("concat_1.fq.gz"), path("concat_2.fq.gz"), emit: spades_as


    script:

    """
    /SPAdes-3.14.1-Darwin/bin/rnaspades.py --pe1-1 ${concat_norm_1_fq} --pe1-2 ${concat_norm_2_fq} -o spades_concat
    """
}

/* At some point add in option for clipping of 3' and 5'. */
/* Add in function for determining core number */