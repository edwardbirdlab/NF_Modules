process busco {
    label 'lowmem'
    container 'library://edwardbird/bara/busco:5.2.2'
    publishDir "${params.project_name}/Assembly/busco", mode: 'copy', overwrite: false

    input:
        file(fasta)
    output:
        path("./busco_qc"), emit: busco_results

    script:

    """
    busco -i ${fasta} -o busco_qc -m genome
    """
}