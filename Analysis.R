# Install and load necessary packages
install.packages("ggplot2")
install.packages("dplyr")
install.packages("readr")

library(ggplot2)
library(dplyr)
library(readr)

# Load tax rates and foreign direct investment (FDI) data
data <- read.csv("tax_fdi_data.csv")  # Replace with the actual data file path

# Check the correlation between corporate tax rate and FDI
correlation <- cor(data$Corporate_Tax_Rate, data$FDI, use="complete.obs")
print(paste("Correlation between corporate tax rate and FDI:", correlation))

# Create a linear regression model
model <- lm(FDI ~ Corporate_Tax_Rate, data=data)
summary(model)

# Plot the relationship and regression line
ggplot(data, aes(x=Corporate_Tax_Rate, y=FDI)) +
  geom_point(color="blue") +
  geom_smooth(method="lm", color="red") +
  labs(title="Relationship between Corporate Tax Rate and Foreign Direct Investment",
       x="Corporate Tax Rate (%)",
       y="Foreign Direct Investment (Billion USD)")