process norm {
    label 'norm'
	container 'library://edwardbirdlab/comptrans/trinity:1.0'
    publishDir "${params.project_name}/norm", mode: 'copy', overwrite: false

    input:
        tuple file(fastq_1), file(fastq_2)
    output:
	    tuple path("concat_norm_1.fq.gz"), path("concat_norm_2.fq.gz"), emit: norm_fq


    script:

    """
    /usr/local/bin/util/insilico_read_normalization.pl --seqType fq \
           --JM 100G --max_cov 50 --left ${fastq_1} --right ${fastq_2} \
           --pairs_together --CPU 10
    mv concat_1.fq.gz.normalized_K25_maxC50_minC0_maxCV10000.fq concat_norm_1.fq
    mv concat_2.fq.gz.normalized_K25_maxC50_minC0_maxCV10000.fq concat_norm_2.fq
    gzip concat_norm_1.fq
    gzip concat_norm_2.fq
    """
}

/* At some point add in option for clipping of 3' and 5'. */
/* Add in function for determining core number */