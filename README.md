# container-artimid

Version: 1.0

## Short Description

Corrects mass isotopomer distribution (MID) for natural isotopes abundance, giving artificial MID

## Description

“midcor.R” is an “R”-program that performs a primary analysis of isotopic isomers (isotopomers) distribution obtained by Gas Cromatography coupled with Mass Spectrometry (GCMS). The aim of this analysis is to have a correct distribution of isotopes originated from substrates that are artificially enriched with specific isotopes (usually 13C). To this end the program performs a correction for natural occurring isotopes and also correction for “impurities” of the assay media that give peaks overlapping with the spectra of analyzed labeled metabolites. This program offers two ways of corrections of “impurities” resulted from overlapping the assayed mass isotopomer distribution with peaks produced either by unknown metabolites in the media, or by different fragments produced by the assayed metabolite. 

## Key features

- primary processing of 13C mass isotopomer data obtained with GCMS

## Functionality

- Preprocessing
- Statistical Analysis
- Workflows

## Approaches

- Isotopic Labelling Analysis / 13C
    
## Instrument Data Types

- MS
- GC-MS

## Data Analysis

- correction for H+ loss produced by electron impact, natural occurring isotopes, and peaks overlapping

## Screenshots

- screenshot of input data (format Metabolights), output is the same format with one more column added: corrected mass spectrum

![screenshot](Screenshot.png)

## Tool Authors

- [Vitaly Selivanov (Universitat de Barcelona)](https://github.com/seliv55)

## Container Contributors

- [Pablo Moreno (EMBL-EBI)](https://github.com/pcm32)

## Website

- N/A

## Git Repository

- https://github.com/seliv55/midcor

## Installation  
  
MIDcor is present on all PhenoMeNal Galaxy instances on deployed Cloud Research Environments, under the Fluxomics category in the tool bar to the left of the screen. No installation is needed hence on PhenoMeNal Cloud Research Environments.

For advanced Docker usage:

- Go to the directory where the dockerfile is.
- Create container from dockerfile:

```
docker build -t midcor:0.3 .
```

Alternatively, pull directly from the repo 

```
docker pull container-registry.phenomenal-h2020.eu/phnmnl/midcor
```


## Usage Instructions

On a PhenoMeNal Cloud Research Environment, go to Fluxomics tool category, and then click on midcor, and fill the expected input files, then press Run. Additionally, the tool can be used as part of a workflow with RaMID, Iso2flux and the Escher-Fluxomics tools. On a PhenoMeNal deployed CRE you should find as well a Fluxomics Stationary workflow, which includes MIDcor.

To run MIDcor as a docker image, execute
 
```
docker run -it -v $PWD:/data container-registry.phenomenal-h2020.eu/phnmnl/midcor -i /data/input.csv -o /data/output.csv
```

To run MIDcor as a docker image created locally:

- using an example of monopeak CDF files, execute

```
docker run -it -v $PWD:/data midcor:0.3 -i /data/ramidout.csv -o /data/midcorout.csv 
```
- using an example of multipeaks CDF files, execute
 
```
docker run -it -v $PWD:/data midcor:0.3 -i /data/cdf2midout.csv -o /data/midcormulti.csv 
```
- run test1 using the data that are in the file "ramidout.csv" in https://drive.google.com/drive/folders/0B1lAg6jyw6lvSlphUi1mdlUwUXM
 
```
docker run -it --entrypoint=runTest1.sh midcor:0.3 
```
- run test2 using the data that are in the file "cdf2midout.csv" in https://drive.google.com/drive/folders/0B1lAg6jyw6lvSlphUi1mdlUwUXM
 
```
docker run -it --entrypoint=runTest2.sh midcor:0.3 
```

## Publications

- Selivanov VA, Benito A, Miranda A, Aguilar E, Polat IH, Centelles JJ, Jayaraman A, Lee PW, Marin S, Cascante M. MIDcor, an R-program for deciphering
mass interferences in mass spectra of metabolites enriched in stable isotopes. BMC Bioinformatics. 2017, 18:88. doi: 10.1186/s12859-017-1513-3. PubMed
PMID: 28158972.

