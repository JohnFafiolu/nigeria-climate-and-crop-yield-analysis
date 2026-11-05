# ============================================================
# PROJECT: THE IMPACT OF CLIMATE FACTORS ON CROP YIELD IN NIGERIA
# PERIOD: 1990–2024
# CROPS: MAIZE AND CASSAVA
# SOFTWARE: R / RSTUDIO
# ============================================================


# ============================================================
# 1. INSTALLING AND LOADING REQUIRED PACKAGES
# ============================================================

# Run once to install packages if they are not already installed

# install.packages(c(
#   "readr", "dplyr", "tseries", "urca", "ARDL",
#   "lmtest", "strucchange", "Metrics", "forecast", "ggplot2"
# ))

library(readr)
library(dplyr)
library(tseries)
library(urca)
library(ARDL)
library(lmtest)
library(strucchange)
library(Metrics)
library(forecast)
library(ggplot2)


# ============================================================
# 2. DATA IMPORTATION AND PREPARATION
# ============================================================

# Loading the dataset

data <- read_csv(
  "data/raw/Corn, Cassava, PPT and rainfall 1990 t0 2024 .csv"
)

# View dataset

View(data)

# Renaming columns for easier coding

colnames(data) <- c(
  "Year",
  "Cassava",
  "Maize",
  "Temp",
  "Rainfall"
)

# Convert variables to natural logarithms

data <- data %>%
  mutate(
    Ln_Maize = log(Maize),
    Ln_Cassava = log(Cassava),
    Ln_Temp = log(Temp),
    Ln_Rainfall = log(Rainfall)
  )

# Convert to time series object

ts_data <- ts(data, start = 1990, frequency = 1)


# ============================================================
# 3. DESCRIPTIVE STATISTICS
# ============================================================

# Summary statistics

summary(data[, c("Maize", "Cassava", "Temp", "Rainfall")])

# Standard deviations

sd(data$Maize)
sd(data$Cassava)
sd(data$Temp)
sd(data$Rainfall)

# Jarque-Bera normality tests

print("JARQUE-BERA TEST: MAIZE")
jarque.bera.test(data$Maize)

print("JARQUE-BERA TEST: CASSAVA")
jarque.bera.test(data$Cassava)

print("JARQUE-BERA TEST: RAINFALL")
jarque.bera.test(data$Rainfall)

print("JARQUE-BERA TEST: TEMPERATURE")
jarque.bera.test(data$Temp)

# Scaling factor for trend plot

scale_factor <- max(data$Maize) / max(data$Rainfall)


# ============================================================
# 4. STATIONARITY TESTS: AUGMENTED DICKEY-FULLER (ADF)
# ============================================================

# ADF tests at levels

print("ADF TEST AT LEVEL")

adf.test(data$Ln_Maize)
adf.test(data$Ln_Cassava)
adf.test(data$Ln_Temp)
adf.test(data$Ln_Rainfall)

# ADF tests at first differences

print("ADF TEST AT FIRST DIFFERENCE")

adf.test(diff(data$Ln_Maize))
adf.test(diff(data$Ln_Cassava))
adf.test(diff(data$Ln_Temp))
adf.test(diff(data$Ln_Rainfall))


# ============================================================
# 5. ARDL MODEL ESTIMATION AND BOUNDS TESTING
# ============================================================

# MODEL 1: MAIZE

# Automatic lag selection based on AIC

models_maize <- auto_ardl(
  Ln_Maize ~ Ln_Rainfall + Ln_Temp,
  data = data,
  max_order = 4
)

best_maize <- models_maize$best_model

# ARDL bounds test for maize

bounds_maize <- bounds_f_test(best_maize, case = 3)

print("ARDL BOUNDS TEST FOR MAIZE")
print(bounds_maize)


# MODEL 2: CASSAVA

models_cassava <- auto_ardl(
  Ln_Cassava ~ Ln_Rainfall + Ln_Temp,
  data = data,
  max_order = 4
)

best_cassava <- models_cassava$best_model

# ARDL bounds test for cassava

bounds_cassava <- bounds_f_test(best_cassava, case = 3)

print("ARDL BOUNDS TEST FOR CASSAVA")
print(bounds_cassava)


# ============================================================
# 6. SHORT-RUN ARDL COEFFICIENTS
# ============================================================

print("SHORT-RUN ARDL RESULTS: MAIZE")
summary(best_maize)

print("SHORT-RUN ARDL RESULTS: CASSAVA")
summary(best_cassava)


# ============================================================
# 7. POST-ESTIMATION DIAGNOSTICS
# ============================================================

# Breusch-Godfrey test for serial correlation

print("SERIAL CORRELATION TEST")

bgtest(best_maize)
bgtest(best_cassava)

# Breusch-Pagan test for heteroskedasticity

print("HETEROSKEDASTICITY TEST")

bptest(best_maize)
bptest(best_cassava)


# ============================================================
# 8. MODEL EVALUATION
# ============================================================

# Generate in-sample predictions

predicted_maize_ln <- as.numeric(fitted(best_maize))

predicted_cassava_ln <- as.numeric(fitted(best_cassava))

# Match actual observations to fitted values

actual_maize_ln <- tail(
  data$Ln_Maize,
  length(predicted_maize_ln)
)

actual_cassava_ln <- tail(
  data$Ln_Cassava,
  length(predicted_cassava_ln)
)

# Convert logarithmic values back to original values

pred_maize <- exp(predicted_maize_ln)
pred_cassava <- exp(predicted_cassava_ln)

actual_maize <- exp(actual_maize_ln)
actual_cassava <- exp(actual_cassava_ln)

# MAIZE MODEL EVALUATION

maize_rmse <- rmse(actual_maize, pred_maize)

maize_mae <- mae(actual_maize, pred_maize)

maize_mape <- mape(actual_maize, pred_maize) * 100

print("MODEL EVALUATION METRICS: MAIZE")

cat(
  "RMSE:", maize_rmse,
  "\nMAE:", maize_mae,
  "\nMAPE:", maize_mape, "%\n\n"
)

# CASSAVA MODEL EVALUATION

cassava_rmse <- rmse(actual_cassava, pred_cassava)

cassava_mae <- mae(actual_cassava, pred_cassava)

cassava_mape <- mape(actual_cassava, pred_cassava) * 100

print("MODEL EVALUATION METRICS: CASSAVA")

cat(
  "RMSE:", cassava_rmse,
  "\nMAE:", cassava_mae,
  "\nMAPE:", cassava_mape, "%\n"
)


# ============================================================
# 9. GRANGER CAUSALITY TESTS
# ============================================================

# First differences of logarithmic variables

d_maize <- diff(data$Ln_Maize)
d_cassava <- diff(data$Ln_Cassava)

d_rainfall <- diff(data$Ln_Rainfall)
d_temp <- diff(data$Ln_Temp)

# RAINFALL AND MAIZE

print("GRANGER CAUSALITY: RAINFALL AND MAIZE")

grangertest(
  d_maize ~ d_rainfall,
  order = 1
)

# TEMPERATURE AND MAIZE

print("GRANGER CAUSALITY: TEMPERATURE AND MAIZE")

grangertest(
  d_maize ~ d_temp,
  order = 1
)

# RAINFALL AND CASSAVA

print("GRANGER CAUSALITY: RAINFALL AND CASSAVA")

grangertest(
  d_cassava ~ d_rainfall,
  order = 1
)

# TEMPERATURE AND CASSAVA

print("GRANGER CAUSALITY: TEMPERATURE AND CASSAVA")

grangertest(
  d_cassava ~ d_temp,
  order = 1
)


# ============================================================
# 10. RE-ESTIMATION OF ARDL MODELS FOR FORECASTING
# ============================================================

# Re-estimate maize model

models_maize <- auto_ardl(
  Ln_Maize ~ Ln_Rainfall + Ln_Temp,
  data = data,
  max_order = 4
)

best_maize <- models_maize$best_model

# Re-estimate cassava model

models_cassava <- auto_ardl(
  Ln_Cassava ~ Ln_Rainfall + Ln_Temp,
  data = data,
  max_order = 4
)

best_cassava <- models_cassava$best_model


# ============================================================
# 11. EXTRACT MODEL COEFFICIENTS AND FORECAST CLIMATE VARIABLES
# ============================================================

# Extract coefficients

maize_coef <- coef(best_maize)

cassava_coef <- coef(best_cassava)

# Forecast rainfall for six years

rf_future <- forecast(
  auto.arima(data$Ln_Rainfall),
  h = 6
)$mean

# Forecast temperature for six years

temp_future <- forecast(
  auto.arima(data$Ln_Temp),
  h = 6
)$mean


# ============================================================
# 12. FORECAST MAIZE AND CASSAVA YIELDS: 2025–2030
# ============================================================

# Create empty vectors for forecasts

future_maize_ln <- numeric(6)

future_cassava_ln <- numeric(6)

# Last observed logarithmic yields

last_maize_ln <- tail(data$Ln_Maize, 1)

last_cassava_ln <- tail(data$Ln_Cassava, 1)

# Forecast loop

for (i in 1:6) {

  # MAIZE FORECAST

  lagged_m <- if (i == 1) {
    last_maize_ln
  } else {
    future_maize_ln[i - 1]
  }

  future_maize_ln[i] <-
    maize_coef[1] +
    maize_coef[2] * lagged_m +
    maize_coef[3] * rf_future[i] +
    maize_coef[4] * temp_future[i]


  # CASSAVA FORECAST

  lagged_c <- if (i == 1) {
    last_cassava_ln
  } else {
    future_cassava_ln[i - 1]
  }

  future_cassava_ln[i] <-
    cassava_coef[1] +
    cassava_coef[2] * lagged_c +
    cassava_coef[3] * rf_future[i] +
    cassava_coef[4] * temp_future[i]

}


# ============================================================
# 13. FINAL FORECAST TABLE
# ============================================================

forecast_table <- data.frame(
  Year = 2025:2030,

  Forecasted_Maize_Yield_kgha =
    round(exp(future_maize_ln), 2),

  Forecasted_Cassava_Yield_kgha =
    round(exp(future_cassava_ln), 2)
)

print("FINAL CROP YIELD FORECAST: 2025–2030")

print(forecast_table)


# ============================================================
# END OF ANALYSIS
# ============================================================
