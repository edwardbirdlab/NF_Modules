process quast {
    label 'lowmem'
    container 'library://edwardbird/bara/quast:5.0.2'
    publishDir "${params.project_name}/Assembly/quast_genome", mode: 'copy', overwrite: false

    input:
        file(fasta)
    output:
        path("./quast_qc"), emit: quast_results

    script:

    """
    quast.py -o quast_qc ${fasta} --threads ${params.thread_max}
    """
}