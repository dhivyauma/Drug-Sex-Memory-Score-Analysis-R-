```{r}
library(tidyverse)
mem_data <- read_csv(url("https://www.gribblelab.org/2812/data/mem_data.csv"),
                     col_types="nff")
glimpse(mem_data)

library(tidyverse)

summary_stats <- mem_data %>%
  group_by(drug, sex) %>%
  summarize(
    meanmem = mean(mem_score),
    se = sd(mem_score) / sqrt(n()),
    n = n()
  )

print(summary_stats)

library(ggplot2)

# Define colors for each sex
sex_colors <- c("Male" = "blue", "Female" = "red")

# Create the plot
plot <- ggplot(summary_stats, aes(x = drug, y = meanmem, fill = sex)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.8), width = 0.7) +
  geom_errorbar(aes(ymin = meanmem - se, ymax = meanmem + se), position = position_dodge(width = 0.8), width = 0.2) +
  scale_fill_manual(values = sex_colors) +
  labs(
    title = "Mean Memory Scores by Drug and Sex",
    x = "Drug",
    y = "Mean Memory Score"
  ) +
  theme_minimal()

# Display the plot
print(plot)

factorial_anova <- aov(mem_score ~ drug * sex, data = mem_data)

summary(factorial_anova)

shapiro_test <- shapiro.test(mem_data$mem_score)

qqnorm(mem_data$mem_score)
qqline(mem_data$mem_score)

print(shapiro_test)

levene_test <- car::leveneTest(mem_score ~ drug * sex, data = mem_data)

print(levene_test)


drug_comparison <- TukeyHSD(factorial_anova, "drug")
print(drug_comparison)

sex_comparison <- TukeyHSD(factorial_anova, "sex")
print(sex_comparison)

#importing data
library(readr)
data <- read_csv("~/Downloads/data.csv")

# Create a new variable combining age group and autonomy level
data$Sex_Smile <- factor(paste(data$Sex, data$Smile, sep = "-"))

boxplot(Score ~ Sex_Smile, 
        data = data,
        ylab = "Score", 
        xlab = expression(paste(" ")), 
        names = c("Male_Fake", "Male_Real", "Female_Fake", "Female_Real"),
        las = 2)

mean_placebo_male <- 102.4098
mean_high_dose_male <- 105.6627
delta <- mean_high_dose_male - mean_placebo_male

sd_placebo_male <- 2.1862957
sd_high_dose_male <- 1.2909753
sd <- mean(c(sd_placebo_male, sd_high_dose_male))

sig_level <- 0.05

power_analysis <- power.t.test(delta = delta, sd = sd, sig.level = sig_level, power = 0.8, type = "two.sample")

print(power_analysis$n)

```
