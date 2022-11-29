# EDM

## Introduction

## Usage

### Build

```
docker build -t edm:latest .
```

### Run

```
docker run --rm \
    -v $PWD/sample-data:/data \
    edm:latest \
    data/inputs/data_exampleED.xlsx /data/outputs
```