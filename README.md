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
    /data/input/input.xlsx /data/output
```