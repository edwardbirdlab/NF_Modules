process transabyss {
    label 'medmem'
	container 'library://edwardbirdlab/comptrans/transabyss:2.0.1-7'
    publishDir "${params.project_name}/transabyss", mode: 'copy', overwrite: false

    input:
        tuple file(concat_norm_1_fq), file(concat_norm_2_fq)
    output:
	    path("transabyss-final.fa"), emit: abyss_as

    script:

    """
    transabyss --pe ${concat_norm_1_fq} ${concat_norm_2_fq} --kmer 32
    cp transabyss_2.0.1_assembly/transabyss-final.fa .
    """
}