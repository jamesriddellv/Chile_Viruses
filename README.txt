Chile_Viruses is the project directory for the Sullivan lab's work with a research team in Chile.
Our goal is to identify viruses from metagenomic samples collected off the coast of Chile to be put into a grant proposal.
The deliverables are 1) How many viruses are there? 2) How many vOTUs? 3) How many of these form "novel" clusters outside of what is already in GOV2?

Protocol:
1.  I am first copying all fasta assembly files from the Chilean supercomputer from mathomics1@leftraru3:~/TARA_CHILE/all_fasta/* (done)
2.  I will then process these reads using the viral identification SOP https://www.protocols.io/view/viral-sequence-identification-sop-with-virsorter2-5qpvoyqebg4o/v3?version_warning=no (in progress)
3.  I will cluster the reads to get vOTUs, then cluster the vOTUs with GOV2 viruses  to see which are novel groups.

Notes:
    * It seems only a small portion of assemblies are >5kb, about 0.7%. Tens of thousands out of millions of reads. We still recovered a few thousand viruses from each sample, but it is a very small number compared to how many reads. I am curious how many reads assembled at all.

    * Had to re-run the vOTU clustering step since it timed out, but then upon restarting it skipped the all-v-all blast step and went straight to the ANI clustering. Not sure if it actually finished or not.
