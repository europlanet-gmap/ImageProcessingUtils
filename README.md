# ImageProcessingUtils
[![DOI](https://zenodo.org/badge/287286230.svg)](https://zenodo.org/badge/latestdoi/287286230)

Author: g.nodjoumi@jacobs-university.de
This repo contain image processing utilities that i used for prepare images before Deep Learning training

_____________________________________________________________________________

# MIP-SCR - Multi Image Parallel Square Crop Resize
This script do:

- Crop images to 1:1 aspect ratio from the center of the image
- Remove black borders from image
- Resize cell-size of image to user-defined size
- Create tiles if images are above a user-defined limit
- Convert from JP2 format to Geotiff

## Usage
These tools can be used in a conda environment or in docker container.
For Conda environment, just install the required packages, activate the env, otherwise build the container using the provided Dockerfile. In both cases do as follows:
** Command Line Interface **
- Create provided environment or install required packages
- Just execute the script and interactively insert all parameters.
** Jupyter Notebook **
- Create provided environment or install required packages
- Run the notebook and change the config dictionary or just run and pass configs interactively
If using CLI execute the script passing at least --PATH argument

The script will automatically create subfolders containing the results. 
