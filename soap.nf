process soap {
    label 'medmem'
	container 'library://edwardbirdlab/comptrans/soapdenovo_trans:1.0.4'
    publishDir "${params.project_name}/soap", mode: 'copy', overwrite: false

    input:
        tuple file(concat_norm_1_fq), file(concat_norm_2_fq)
    output:
	    tuple val(sample), path("concat_1.fq.gz"), path("concat_2.fq.gz"), emit: soap_as


    script:

    """
    echo "maxReadLen=600" >>config.txt
    echo "[LIB]" >>config.txt
    echo "rd_len_cutof="200 >>config.txt
    echo "avg_ins="300 >>config.txt
    echo "reverse_seq="O >>config.txt
    echo "asm_flags="1 >>config.txt
    echo "map_len="32 >>config.txt
    echo "q1="${concat_norm_1_fq} >>config.txt
    echo "q2="${concat_norm_2_fq} >>config.txt
    SOAPdenovo-Trans-127mer all -s config.txt -K 23 -o output -p 16
    """
}

/* At some point add in option for clipping of 3' and 5'. */
/* Add in function for determining core number */