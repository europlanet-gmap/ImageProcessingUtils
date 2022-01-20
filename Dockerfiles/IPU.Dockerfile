ARG BASE_IMAGE=jupyter/base-notebook:lab-3.2.8
FROM $BASE_IMAGE AS base

MAINTAINER "Giacomo Nodjoumi <giacomo.nodjoumi@hyranet.info>"


ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV TZ=Europe/Rome
ENV DEBIAN_FRONTEND='noninteractive'

# Install Python and its tools
USER root
RUN apt update && apt install --no-install-recommends -y 	\
    apt-transport-https        \
    build-essential 				   \
    ca-certificates            \
    curl                       \
    #gnupg2                    \
    git 	                     \
    libgl1-mesa-dev 				   \
    libglib2.0-0 					     \
    locales                    \
    #python3.9-dev 					   \
    python3-tk                 \
    python3.9-distutils        \
    software-properties-common \
    sudo                       \
    tzdata                     \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 --no-cache-dir install 	\
	  setuptools 						        \
    fiona                         \
    geopandas                     \
    git+https://${GITHUB_TOKEN}@github.com/Hyradus/maxrect.git \
    joblib                        \
    numpy 							          \
  	opencv-python					        \
  	#opencv-contrib-python			  \
  	psutil           							\
  	rasterio				           		\
  	scikit-image					        \
  	tqdm							            #\
    #&& rm -rf /var/lib/apt/lists/*

FROM base AS ipu
ADD $PWD/Dockerfiles/IPU /home/jovyan/IPU
RUN chown -R jovyan /home/jovyan/IPU
USER jovyan
WORKDIR /home/jovyan/
ENV JUPYTER_ENABLE_LAB='yes'
