# [Italy Covid Data Analysis](https://github.com/NicolaRizzitello/Nicola_Portfolio/blob/main/CoviditaliaAnalysis.sql)
This is a project about data covid in Italy per regions, where I did an exploratory analysis with SQL. 

**Language** 

![alt text](https://user-images.githubusercontent.com/103247709/162441186-e4c62bdf-d526-4d6c-ac48-81735ff247ce.png)
## About Datasets
### ItaliaCovid
This dataset is composed by 16111 rows and 33 columns. This dataset is a merge between [covidIta](https://github.com/pcm-dpc/COVID-19) and [Popolazione](http://dati.istat.it/Index.aspx?QueryId=18460). 
The chosen period for the analysis goes from the beginning of the pandemic up to 04/04/2022. To know more about the columns of dataset check [here](https://github.com/pcm-dpc/COVID-19/blob/master/dati-andamento-covid19-italia.md).
### PopFasciaVacc
This dataset is composed by 209977 rows and 16 columns. This dataset is a merge between [covidItaVacc](https://github.com/italia/covid19-opendata-vaccini/blob/master/dati/somministrazioni-vaccini-summary-latest.csv) and [platea](https://github.com/italia/covid19-opendata-vaccini/blob/master/dati/platea.csv). 
The chosen period for the analysis goes from the beginning of the vaccination period to 04/04/2022. To know more about the columns of dataset check [here](https://github.com/italia/covid19-opendata-vaccini).
### Summary of the analysis
* Looking at total cases vs total deaths. Letality rate in your region daily.
* Looking total cases vs Population. Show what percentage of population got Covid.
* Looking at Regions with highest infection rate compared to population
* Showing Regions with highest Death count per Population
* Global Numbers
* Positivity rate per region daily
* Showing total somministration vaccin per region with resepct population
* Showing total somministration vaccin per age-class by region
