process oases {
    label 'medmem'
    container 'library://edwardbirdlab/comptrans/oases:1.0'
    publishDir "${params.project_name}/oases", mode: 'copy', overwrite: false

    input:
        tuple file(concat_norm_1_fq), file(concat_norm_2_fq)
    output:
        path("transcripts.fa"), emit: oaisis_as

        
    script:

    """
    python /oases/scripts/oases_pipeline.py -m 17 -M 37 -o pairedEnd -d ' -shortPaired  concat_norm_1_fq  concat_norm_2_fq' -p ' -ins_length 300 '
    """
}