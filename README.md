# TB-Predict-Pipeline
Nextflow pipeline for producing variants, mutations and effects of a specified (minos) VCF file

## Run locally with Docker
```
nextflow run . -profile docker --sample <absolute sample path> --reference <absolute reference path> --catalogue <absolute catalogue path> --output_dir <absolute output directory path>
```
Note that the output directory must exist. The python script aims to create the directory, but as nextflow symbolic links to the given path, and works from the `work` folder, the highest level directory of the path is symlinked to the actual path. This makes it impossible to access the actual path from the python script...

## Run with Kubernetes
This does not currently work due to unknown issues with Nextflow and Kubernetes...
```
nextflow run . -profile kubernetes --sample <absolute sample path> --reference <absolute reference path> --catalogue <absolute catalogue path> --output_dir <absolute output directory path>
```
