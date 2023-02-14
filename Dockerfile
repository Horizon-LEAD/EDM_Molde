FROM r-base:4.1.2

RUN apt-get update \
    && apt install -y python3 \
    && rm -rf /var/lib/apt/lists/*

RUN R -e '\
install.packages( \
    c("argparse", "readxl", "choiceDes")\
)'

COPY src/* /app/

ENTRYPOINT [ "Rscript", "/app/main.R" ]
