# Galaxy_ChIP-Seq

**This repo contains a `.yml` file and a `Dockerfile`.**

- `.yml`: This file have all the required tools, which would be downloaded from [Galaxy Project](github.com/galaxyproject/)
- `Dockerfile`: This docker file will install the `ChIP-Seq` flavoured galaxy on your computer.

# Tools included for data analysis:

1. `FASTQC` : to check the quality of `fastq` file.
2. `Trimmomatic` : to trip the adaptors and also to remove reads wit hlow quality.
3. `bowtie2` : to align the samples to reference genome.
4. `samtools` : to convert `sam` files to `bam` format and also to sort & index `bam` files. 
5. `Picard tools` : to mark the duplicated reads.
