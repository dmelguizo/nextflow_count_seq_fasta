#!/usr/bin/env nextflow

process countNumSeq {
 input:
 path fastaFile
 output:
 stdout
 script:
 """
 echo Number of sequences in $fastaFile
 grep '>' $fastaFile | wc -l
 """
}
workflow {
 fastaChannel = Channel.fromPath('data/*.fa')
 outChannel=countNumSeq(fastaChannel)
 outChannel.view()
}
