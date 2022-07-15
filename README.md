# TB-Predict-Pipeline
Nextflow pipeline for producing variants, mutations and effects of a specified (minos) VCF file

## Run locally with Docker
```
nextflow run . -profile docker --sample <absolute sample path> --reference <absolute reference path> --catalogue <absolute catalogue path> --output_dir <absolute output directory path>
```

## Run with Kubernetes
This does not currently work due to unknown issues with Nextflow and Kubernetes...
```
nextflow run . -profile kubernetes --sample <absolute sample path> --reference <absolute reference path> --catalogue <absolute catalogue path> --output_dir <absolute output directory path>
```
