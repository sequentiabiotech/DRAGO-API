# DRAGO-API

The Disease Resistance Analysis and Gene Orthology (DRAGO) is a pipeline to annotate resistance genes.
DRAGO can be launched on any transcriptome or proteome, thus the input can be either DNA or protein 
sequences in FASTA format. It detects LRR, Kinase, NBS and TIR domains from HMM modules created for 
this purpose using HMMER v3 package and it is also able to detect CC and TM domains using COILS 2.2 and 
TMHMM 2.0c programs. As output, DRAGO 2 gives a table with the class of the query sequence and each 
domain found with the corresponding coordinates.

DRAGO is available in PRGdb (http://prgdb.org). PRGdb is an open and updated space about Pathogen Receptor 
Genes (PRGs), in which all information available about these genes is stored, curated and discussed. The 
purpose of our work is creating a worldwide community working on plant resistance genes with a constant 
update on all aspects of this research field and to encourage scientists to be actors of the discussion 
and of the data exchange.

When it is desired to analyze thousands of sequences at a time (e.g. full transcriptome or proteome), the
analysis through the web interface might not be suitable. That is why we created an API to perform DRAGO2
analyses in a programmatic way. How to call the script?

`bash drago-api.sh [drago2/drago3] [sequences.fasta] > output.txt`

It outputs a tab-separated table similar to the one given by the web interface. If you use this tool, 
please cite us:

```
Osuna-Cruz CM, Paytuvi-Gallart A, Di Donato A, Sundesha V, Andolfo G, Aiese Cigliano R, Sanseverino W, Ercolano MR.
PRGdb 3.0: a comprehensive platform for prediction and analysis of plant disease resistance genes.
Nucleic Acids Research 2017. doi: 10.1093/nar/gkx1119

Calle García, J., Guadagno, A., Paytuvi-Gallart, A., Saera-Vila, A., Amoroso, C. G., D'Esposito, D., Andolfo, G., 
Aiese Cigliano, R., Sanseverino, W., & Ercolano, M. R. (2022). PRGdb 4.0: an updated database dedicated to genes 
involved in plant disease resistance process. Nucleic acids research, 50(D1), D1483–D1490. https://doi.org/10.1093/nar/gkab1087
```
