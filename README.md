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
│
├── Ibrahim Project.Rproj
│
├── data/
│   └── raw/
│       └── Corn, Cassava, PPT and rainfall 1990 t0 2024 .csv
│
└── R/
    └── 01_climate_crop_yield_analysis.R
```
## 11. Empirical Results and Findings

### 11.1 Descriptive Statistics

The descriptive analysis examined the distribution and variability of maize yield, cassava yield, temperature and rainfall over the study period.

| Statistic | Maize (kg/ha) | Cassava (kg/ha) | Temperature (°C) | Rainfall (mm) |
|---|---:|---:|---:|---:|
| Mean | 1,611 | 9,487 | 26.28 | 1,276.9 |
| Maximum | 2,233 | 12,216 | 27.51 | 2,030.8 |
| Minimum | 1,118 | 5,780 | 24.93 | 679.4 |
| Standard Deviation | 314.6391 | 2,085.173 | 0.8329 | 379.8791 |
| Jarque-Bera p-value | 0.5098 | 0.1605 | 0.2802 | 0.5120 |

All four variables recorded Jarque-Bera p-values above the 5% significance threshold. Therefore, the null hypothesis of normality was not rejected for any of the variables.

### 11.2 Stationarity Test

The Augmented Dickey-Fuller (ADF) test was used to examine the stationarity properties of the logarithmically transformed variables.

| Variable | ADF Statistic (Level) | p-value | ADF Statistic (First Difference) | p-value | Integration Order |
|---|---:|---:|---:|---:|---|
| Ln(Maize) | -2.4744 | 0.3889 | -3.9596 | 0.02286 | I(1) |
| Ln(Cassava) | -1.5960 | 0.7299 | -4.1878 | 0.0144 | I(1) |
| Ln(Temperature) | -2.2394 | 0.4801 | -4.3873 | 0.0100 | I(1) |
| Ln(Rainfall) | -2.6301 | 0.3284 | -5.0306 | 0.0100 | I(1) |

The results indicate that all four variables were non-stationary at levels but became stationary after first differencing. They were therefore classified as integrated of order one, I(1).

### 11.3 ARDL Bounds Test for Cointegration

The ARDL bounds test was conducted to investigate the existence of long-run relationships between climate variables and crop yields.

| Model | F-Statistic | Lower Bound I(0) | Upper Bound I(1) | Significance Level | Decision |
|---|---:|---:|---:|---:|---|
| Maize | 1.640 | 3.10 | 3.87 | 5% | No Cointegration |
| Cassava | 1.156 | 3.10 | 3.87 | 5% | No Cointegration |

Both F-statistics fell below the lower critical bound. The null hypothesis of no cointegration was therefore not rejected for either crop.

### 11.4 Short-Run ARDL Model Results

The ARDL models were estimated separately for maize and cassava, with optimal lag structures selected using the Akaike Information Criterion (AIC).

| Variable | Maize Coefficient | Maize p-value | Cassava Coefficient | Cassava p-value |
|---|---:|---:|---:|---:|
| Intercept | 0.942 | 0.743 | 5.910 | 0.186 |
| Lagged Yield (-1) | 0.829 | 0.000 | 0.847 | 0.000 |
| Ln(Rainfall) | -0.060 | 0.424 | -0.031 | 0.751 |
| Ln(Temperature) | 0.231 | 0.790 | -1.317 | 0.210 |
| R-squared | 0.8043 | — | 0.7753 | — |
| Adjusted R-squared | 0.7847 | — | 0.7529 | — |
| F-statistic | 41.09 | 0.000 | 34.51 | 0.000 |

The lagged yield coefficients were positive and statistically significant in both models. Rainfall and temperature coefficients were not statistically significant at the 5% level.

The models recorded R-squared values of 80.43% for maize and 77.53% for cassava.

### 11.5 Post-Estimation Diagnostic Tests

Two diagnostic tests were conducted to examine the residual properties of the estimated models.

| Diagnostic Test | Maize p-value | Cassava p-value | Interpretation |
|---|---:|---:|---|
| Breusch-Godfrey | 0.5503 | 0.4416 | No evidence of serial correlation |
| Breusch-Pagan | 0.0236 | 0.1042 | Heteroskedasticity detected in maize only |

The Breusch-Godfrey results indicated no evidence of serial correlation in either model. However, the Breusch-Pagan test detected heteroskedasticity in the maize model, which should be considered when interpreting its standard errors and statistical significance.

### 11.6 Model Evaluation

The estimated models were evaluated using Root Mean Squared Error (RMSE), Mean Absolute Error (MAE) and Mean Absolute Percentage Error (MAPE).

| Metric | Maize Model | Cassava Model |
|---|---:|---:|
| RMSE (kg/ha) | 147.88 | 999.35 |
| MAE (kg/ha) | 117.43 | 726.42 |
| MAPE (%) | 6.91 | 8.16 |

The reported evaluation metrics indicate relatively small percentage errors in the fitted values. However, these metrics were calculated using in-sample predictions and should not be interpreted as independent out-of-sample forecasting accuracy.

### 11.7 Granger Causality Test

The Granger causality test was applied to first-differenced logarithmic variables using one lag.

| Null Hypothesis | F-statistic | p-value | Decision |
|---|---:|---:|---|
| Rainfall does not Granger-cause maize yield | 0.0372 | 0.8484 | Fail to reject H0 |
| Temperature does not Granger-cause maize yield | 0.1380 | 0.7129 | Fail to reject H0 |
| Rainfall does not Granger-cause cassava yield | 0.0167 | 0.8981 | Fail to reject H0 |
| Temperature does not Granger-cause cassava yield | 0.0832 | 0.7750 | Fail to reject H0 |

All p-values exceeded the 5% significance threshold. The analysis therefore found no statistically significant Granger-predictive relationship between the climate variables and either crop yield.

### 11.8 Crop Yield Forecasts (2025–2030)

The study generated six-year projections for maize and cassava yields using forecasted climate variables and estimated autoregressive relationships.

| Year | Maize Yield (kg/ha) | Cassava Yield (kg/ha) |
|---|---:|---:|
| 2025 | 1,996.97 | 5,817.70 |
| 2026 | 1,970.13 | 5,798.45 |
| 2027 | 1,948.14 | 5,782.19 |
| 2028 | 1,930.09 | 5,768.45 |
| 2029 | 1,915.23 | 5,756.84 |
| 2030 | 1,903.00 | 5,747.02 |

The projections indicate a gradual decline in both maize and cassava yields over the forecast horizon. These figures are model-generated estimates and should not be interpreted as observed future outcomes.

## 12. Limitations

- The analysis is based on annual observations covering 1990–2024.
- The bounds tests did not establish long-run cointegration.
- Rainfall and temperature were not statistically significant in the reported short-run models.
- The maize model exhibited evidence of heteroskedasticity.
- The reported RMSE, MAE and MAPE values were calculated from in-sample fitted values.
- Forecast results depend on the estimated model specifications and projected climate variables.
- The analysis does not directly measure other agricultural determinants such as fertilizer use, irrigation, improved seed adoption, mechanisation and soil quality.

## 13. Reproducibility

To reproduce the analysis:

1. Clone or download this repository.
2. Open RStudio.
3. Install the required R packages.
4. Ensure the dataset is available in the `data/raw/` directory.
5. Run `R/01_climate_crop_yield_analysis.R`.
## 14. Conclusion

This study examined the relationship between rainfall, temperature and the yields of maize and cassava in Nigeria using annual time-series data from 1990 to 2024.

The analysis applied descriptive statistics, unit root testing, ARDL modelling, diagnostic testing, Granger causality and forecasting techniques.

The findings showed that lagged crop yields were statistically significant in both estimated models, while rainfall and temperature were not statistically significant at the 5% level. The bounds tests also found no evidence of long-run cointegration.

The study demonstrates the application of statistical and econometric methods in investigating agricultural time-series data and generating crop yield projections.

---
