FROM r-base:4.1.2

WORKDIR /app

RUN apt-get update \
    && apt install -y python3
RUN rm -rf /var/lib/apt/lists/*

RUN R -e '\
install.packages( \
    c("argparse", "readxl", "choiceDes")\
)'

COPY src/* ./

ENTRYPOINT [ "Rscript", "main.R" ]
