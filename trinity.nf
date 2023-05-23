process trinity {
    label 'bigmem'
	container 'library://edwardbirdlab/comptrans/trinity:1.0'
    publishDir "${params.project_name}/trinity", mode: 'copy', overwrite: false

    input:
        tuple file(concat_norm_1_fq), file(concat_norm_2_fq)
    output:
	    path("trinity_out_dir.Trinity.fasta"), emit: trinity_as


    script:

    """
    Trinity --seqType fq --max_memory 148G \
         --left ${concat_norm_1_fq}  --right ${concat_norm_2_fq} --CPU 16 --no_normalize_reads
    """
}

/* At some point add in option for clipping of 3' and 5'. */
/* Add in function for determining core number */