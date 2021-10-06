# README

This Dockerfile is used to create the `taxastand-dev` image, which is used for building the `taxastand` R package.

This image includes [taxon-tools](https://github.com/camwebb/taxon-tools), a dependency of `taxastand`.

## Requirements

Docker

## Usage

Build the most recent version of the image with:

```
docker build . -t joelnitta/taxastand-dev:latest
```

Launch the container:

```
cd taxastand # Navigate to the folder containing taxastand first
docker run --rm -dt -v ${PWD}:/home/rstudio/taxastand -p 8787:8787 -e DISABLE_AUTH=true joelnitta/taxastand-dev:latest
```

In your browser, navigate to http://localhost:8787/ to access an instance of RStudio with the taxastand R projet loaded.

