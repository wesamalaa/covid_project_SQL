select * from PortfolioProject..covid_Deth
order by 3,4

--select * from PortfolioProject..covid_vactnation
--order by 3,4


--Data we will use
select location,Date,total_cases,new_cases,total_deaths,population from PortfolioProject..covid_Deth
order by 1,2

--looking at total cases vs total death


---------------------------------------------------------------------------------------------
--looking at total cases vs total death
--showing the liklyhood of dying if you contract covid in your country
SELECT
    location,
    Date,
    CAST(total_cases AS numeric) AS numeric_total_cases,
    CAST(total_deaths AS numeric) AS numeric_total_deaths,
    (CAST(total_deaths AS numeric) / CAST(total_cases AS numeric)) * 100 AS DeathPercentage
from PortfolioProject..covid_Deth
where location like '%states%'
ORDER BY 1, 2
-----------------------------------------------------------------------------------------------
--total cases vs population 
SELECT
    location,
    Date,
    CAST(population AS numeric) AS population,
    CAST(total_cases AS numeric) AS total_cases,
    (CAST(total_cases AS numeric) / CAST(population AS numeric)) * 100 AS DeathPercentage
from PortfolioProject..covid_Deth
where location  ='Egypt'
ORDER BY 1, 2
--------------------------------------------------------------------------------------------
--loking to heghest infection rate compared to population
SELECT
    location,
    CAST(population AS numeric) AS population,
  max(  CAST(total_cases AS numeric)) AS HieghestInfectionCount,
 max(CAST(total_cases AS numeric) / CAST(population AS numeric)) * 100 AS PercentagePopulationInfacted
from PortfolioProject..covid_Deth
where location  ='Egypt'
ORDER BY 1, 2

--showing countries with heighest deth count per population

SELECT
    location,MAX(total_deaths) as TotalDeath
FROM PortfolioProject..covid_Deth
where continent is not null
group by location
order by TotalDeath desc

SELECT
    *
FROM PortfolioProject..covid_Deth
where continent is not null
order by 3,4
--break things down by content
SELECT
    continent,MAX(Cast(total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..covid_Deth
where continent is not null
group by continent
order by TotalDeathCount desc

SELECT
    location,MAX(Cast(total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..covid_Deth
where continent is not null
group by location
order by TotalDeathCount desc




