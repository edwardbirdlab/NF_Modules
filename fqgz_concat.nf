process concat {
    label 'lowmem'
	container 'library://edwardbird/bara/trimgalore:0.6.7'
    publishDir "${params.project_name}/concat", mode: 'copy', overwrite: false

    input:
        file(r1)
        file(r2)
    output:
	    tuple path("concat_1.fq.gz"), path("concat_2.fq.gz"), emit: concat_fq


    script:

    """
    cat *_1.fq.gz > concat_1.fq.gz
    cat *_2.fq.gz > concat_2.fq.gz
    """
}

/* At some point add in option for clipping of 3' and 5'. */
/* Add in function for determining core number */