FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive 

RUN apt-get update && apt-get install -y --no-install-recommends build-essential \
    wget \
    vim \
    r-base-core \
    r-base-dev \
    python3 \
    python3-pip \
    python3-setuptools \
    python3-dev \
    pandoc \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    libomp-dev \
    libnetcdf-dev \
    libudunits2-dev \
    libgdal-dev \
    libproj-dev \
    libncurses5 \
    libncurses5-dev \
    libbz2-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip
RUN pip install pandas numpy ipython argparse reactome2py scikit-learn --upgrade 

COPY rdependency/installPackages.R /opt/installPackages.R
RUN Rscript /opt/installPackages.R
RUN rm /opt/installPackages.R
RUN bash -c 'mkdir -p /app/data/{input,output}'

# COPY <your-application-path> /app/
WORKDIR /app

# RUN python setup.py install
ENTRYPOINT ["/bin/bash"]
# CMD ["<some>", "<command>", "<here>"]
