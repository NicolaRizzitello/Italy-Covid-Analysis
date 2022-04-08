use covid;

--UPDATE DATASET
UPDATE popFasciaVacc 
SET 
    fascia_anagrafica = REPLACE(fascia_anagrafica, '43800', '12-19');

UPDATE popFasciaVacc 
SET 
    fascia_anagrafica = REPLACE(fascia_anagrafica, '44870', '05-11');
--Merging two datasets 
select *
from popolazione as p
join covidIta as c on p.codice_regione = c.codice_regione


 select denominazione_regione, data, totale_casi, nuovi_positivi, deceduti, popolazione 
 from ItaliaCovid
 order by 1,2;
 
 -- Looking at total cases vs total deaths
 -- Show Letality rate daily in your region
set arithabort,ansi_warnings off
go
select denominazione_regione, deceduti,nuovi_positivi,data,
(deceduti-lag(deceduti, 1) over (order by denominazione_regione, data)) as DecedutiGiornalieri,
((deceduti-lag(deceduti, 1) over (order by denominazione_regione, data))/nuovi_positivi)*100 as LetalityRate
from ItaliaCovid
where denominazione_regione = 'Sicilia'
;

--Looking total cases vs Population
--Show what percentage of population got Covid

select denominazione_regione, data, totale_casi, popolazione, (totale_casi/popolazione)*100 as PercentualeInfetti
from ItaliaCovid
order by 1,2;

--Looking at Regions with highest infection rate compared to population
select denominazione_regione, max(totale_casi) as highestInfectionCount, popolazione, max((totale_casi/popolazione))*100 as PercentualeInfetti
from ItaliaCovid
group by denominazione_regione, popolazione
order by PercentualeInfetti desc;

--Showing Regions with highest Death count per Population
select denominazione_regione, max(deceduti) as TotalDeaths, popolazione, (max(deceduti)/popolazione)*100 RaterespectPopulation
from ItaliaCovid
group by denominazione_regione, popolazione
order by RaterespectPopulation desc;

-- Global Numbers
select sum(max_deceduti) as somma_deceduti,sum(max_pos) as sum_pos,(sum(max_deceduti)/sum(max_pos))*100 as PercentualeDeceduti
from 
(
select  denominazione_regione, sum(nuovi_positivi) as max_pos, max(deceduti) as max_deceduti
from ItaliaCovid
group by denominazione_regione
) as PercentualeDeceduti; 


--Positivity rate per region daily
select denominazione_regione, data, totale_positivi, nuovi_positivi,tamponi,tamponi-lag(tamponi, 1) over (order by denominazione_regione, data) as TamponiGiornalieri,
		(nuovi_positivi)/(tamponi-lag(tamponi, 1) over (order by denominazione_regione, data))*100 as TassoPositività
from covidIta;


--Showing deaths daily by date and regions
select codice_regione,denominazione_regione, data,deceduti,  deceduti-lag(deceduti, 1) over (order by denominazione_regione, data) as differenza_deceduti
from ItaliaCovid;

--Showing total somministration vaccin per region with resepct population
select pv.nome_area, sum(prima_dose) as tot_p_dose,sum(seconda_dose) as tot_s_dose, sum(dose_addizionale_booster) as tot_booster, 
		sum(prima_dose + seconda_dose + dose_addizionale_booster) totale_somministrazioni, popolazione,
		(sum(prima_dose)/popolazione)*100 as PercentVaccinationFirst, (sum(seconda_dose)/popolazione)*100 as PercentVaccinationSecond, 
		(sum(dose_addizionale_booster)/popolazione)*100 as PercentVaccinationBooster
from popFasciaVacc cv
join PopVacc pv on cv.nome_area = pv.nome_area 
group by pv.nome_area, popolazione
order by 7 desc;

--Showing total somministration vaccin per age-class
select pv.nome_area,fascia_anagrafica, 
		(sum(prima_dose)/PopFascia)*100 as PercentVaccinationFirst, (sum(seconda_dose)/PopFascia)*100 as PercentVaccinationSecond, 
		(sum(dose_addizionale_booster)/PopFascia)*100 as PercentVaccinationBooster
from popFasciaVacc cv
join PopVacc pv on cv.nome_area = pv.nome_area 
group by pv.nome_area, fascia_anagrafica,PopFascia
order by 1,2;

















































