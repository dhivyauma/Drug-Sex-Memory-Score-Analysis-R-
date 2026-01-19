# Drug × Sex Memory Score Analysis (R)

An R-based analysis workflow that imports experimental memory-score data, summarizes results by group, visualizes group means with standard errors, and runs a two-factor (drug × sex) ANOVA with assumption checks and post-hoc comparisons.

## What this project does
- Loads memory-score data from an online CSV source
- Computes grouped summary statistics (mean, standard error, sample size)
- Produces a bar chart of mean memory scores by drug and sex with error bars
- Fits a factorial ANOVA model:
  - Outcome: `mem_score`
  - Factors: `drug`, `sex`
  - Interaction: `drug * sex`
- Checks common ANOVA assumptions:
  - Normality assessment (Shapiro-Wilk test, Q-Q plot)
  - Homogeneity of variance (Levene’s test)
- Runs Tukey HSD post-hoc comparisons for:
  - `drug`
  - `sex`
- Includes an additional script section demonstrating:
  - Combining two categorical variables into a single factor for boxplots
  - A basic two-sample power analysis using `power.t.test`

## Data sources
- Memory-score dataset is loaded directly from:
  https://www.gribblelab.org/2812/data/mem_data.csv
- A second dataset is optionally loaded from a local file path (user-provided):
  `~/Downloads/data.csv`

## Key outputs
- Printed summary table of group means, SE, and n
- Grouped bar plot with error bars (mean ± SE)
- ANOVA table with main effects and interaction
- Shapiro-Wilk normality test result and Q-Q plot
- Levene’s test result
- Tukey HSD post-hoc comparison tables
- Estimated per-group sample size from power analysis

## Requirements
R packages used:
- `tidyverse` (data import, wrangling)
- `ggplot2` (plotting; also included in tidyverse)
- `car` (Levene’s test)

Install packages if needed:
```r
install.packages(c("tidyverse", "car"))
