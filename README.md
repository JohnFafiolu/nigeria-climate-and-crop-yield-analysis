# The Impact of Climate Factors on Crop Yield in Nigeria (1990–2024)

## 1. Project Overview

This research investigates the relationship between climate factors, specifically rainfall and temperature, and crop yield in Nigeria.

The study focuses on two major crops: maize and cassava. Using annual data covering 1990–2024, the analysis applies statistical and econometric techniques to examine the behaviour of crop yields, investigate the influence of climate variables, and generate future yield forecasts.

The project demonstrates the application of time-series analysis, econometric modelling, statistical testing and forecasting using R.

## 2. Research Objectives

The study aims to:

- Examine the trend and distribution of maize and cassava yields, rainfall and temperature in Nigeria.
- Investigate the relationship between rainfall, temperature and crop yields.
- Examine the stationarity properties of the variables and test for cointegration.
- Estimate ARDL models for maize and cassava yields.
- Investigate Granger causality between climate variables and crop yields.
- Forecast maize and cassava yields for 2025–2030.

## 3. Research Questions

1. What are the trends and distributional characteristics of maize and cassava yields, rainfall and temperature in Nigeria?
2. What relationship exists between rainfall, temperature and maize and cassava yields?
3. Are the variables stationary, and is there evidence of a long-run relationship among them?
4. Do rainfall and temperature Granger-cause changes in maize and cassava yields?
5. What are the projected maize and cassava yields for 2025–2030?

## 4. Dataset Description

The analysis uses annual observations covering 1990–2024.

The dataset contains five variables:

| Variable | Description | Unit |
|---|---|---|
| Year | Observation year | Year |
| Cassava Yield | Annual cassava yield | kg/ha |
| Maize Yield | Annual maize yield | kg/ha |
| Temperature | Annual temperature | °C |
| Total Precipitation | Annual total precipitation | mm |

**Data Sources:** FAOSTAT and NASA POWER
## 5. Methodology

The study employed time-series statistical and econometric techniques using R.

The analytical procedures included:

### 5.1 Data Preparation
- Imported and organised the annual dataset.
- Renamed variables for easier analysis.
- Applied natural logarithmic transformations to the study variables.

### 5.2 Descriptive Statistics
- Summary statistics
- Standard deviation
- Jarque-Bera normality test

### 5.3 Stationarity Test
The Augmented Dickey-Fuller (ADF) test was used to examine the stationarity properties of the logarithmically transformed variables at levels and first differences.

### 5.4 ARDL Modelling and Bounds Testing
The Autoregressive Distributed Lag (ARDL) approach was applied separately to maize and cassava yields.

Automatic lag selection using the Akaike Information Criterion (AIC) was used to identify the preferred model specifications. The ARDL bounds test was subsequently conducted to investigate the existence of long-run relationships.

### 5.5 Model Diagnostics
The following diagnostic tests were conducted:

- Breusch-Godfrey test for serial correlation.
- Breusch-Pagan test for heteroskedasticity.

### 5.6 Granger Causality Test
Granger causality tests were conducted using first-differenced logarithmic variables to investigate the predictive relationships between rainfall, temperature and crop yields.

### 5.7 Model Evaluation and Forecasting
Model performance was evaluated using:

- Root Mean Squared Error (RMSE)
- Mean Absolute Error (MAE)
- Mean Absolute Percentage Error (MAPE)

Future maize and cassava yields were forecast for 2025–2030 using projected rainfall and temperature values.

## 6. Key Findings

The reported analysis produced the following findings:

- All four variables were reported as non-stationary at levels but stationary after first differencing.
- The ARDL bounds tests did not establish cointegration for either maize or cassava.
- Lagged crop yields were statistically significant in both short-run models.
- Rainfall and temperature coefficients were not statistically significant in either crop model.
- The Breusch-Godfrey tests indicated no evidence of serial correlation in either model.
- The Breusch-Pagan test indicated heteroskedasticity in the maize model, but not in the cassava model.
- The Granger causality tests did not establish predictive causality from rainfall or temperature to either crop yield.

## 7. Forecasting Results

The study generated annual crop yield forecasts for 2025–2030.

| Year | Maize Yield (kg/ha) | Cassava Yield (kg/ha) |
|---|---:|---:|
| 2025 | 1,996.97 | 5,817.70 |
| 2026 | 1,970.13 | 5,798.45 |
| 2027 | 1,948.14 | 5,782.19 |
| 2028 | 1,930.09 | 5,768.45 |
| 2029 | 1,915.23 | 5,756.84 |
| 2030 | 1,903.00 | 5,747.02 |

These are model-generated projections, not observed crop yields.

## 8. Tools and Technologies

- R
- RStudio
- R packages: readr, dplyr, tseries, urca, ARDL, lmtest, strucchange, Metrics, forecast and ggplot2
- Time-series econometrics
- Statistical hypothesis testing

## 9. Project Structure

The repository is organised to separate the research documentation, dataset, analysis scripts and outputs.

```text
nigeria-climate-and-crop-yield-analysis/
│
├── README.md
├── Ibrahim Project.Rproj
│
├── data/
│   ├── raw/
│   └── processed/
│
├── R/
│   ├── 01_data_preparation.R
│   ├── 02_descriptive_statistics.R
│   ├── 03_stationarity_tests.R
│   ├── 04_ardl_modelling.R
│   ├── 05_model_diagnostics.R
│   ├── 06_granger_causality.R
│   └── 07_forecasting.R
│
└── outputs/
    ├── figures/
    └── tables/
