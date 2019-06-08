FROM rocker/r-base:latest

RUN apt-get update && apt-get install -y --no-install-recommends build-essential \
    vim \
    python3 \
    python3-pip \
    python3-setuptools \
    python3-dev \
    pandoc \
    libssl-dev \
    libcurl4-openssl-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip
RUN pip install pandas numpy ipython argparse --upgrade # <place all your python library needs here>

COPY rdependency/installPackages.R /opt/installPackages.R
RUN Rscript /opt/installPackages.R
RUN rm /opt/installPackages.R

RUN bash -c 'mkdir -p /app/data/{input,output}'

# COPY <your application path> /app/

WORKDIR /app

RUN python3 setup.py install

ENTRYPOINT ["<workflow-service-A>"]
CMD ["<some>", "<command>", "<here>"]
