
library(tidyverse)

file_path <- file.path(dirname(getwd()), "depression_data", "adult-depression-lghc-indicator-24.csv")

# import the data
depression <- read.csv(file_path)


data_1 <- depression %>%
  dplyr::filter(!(Strata %in% c("Total", "Sex")))

# plot the depression level distribution across the different strat over years

ggplot(data_1, aes(fill = Strata.Name, x = Strata, y = Percent)) +
  geom_bar(position = "dodge", stat = "identity") +
  facet_wrap(~Year)

ggplot(depression,
       aes(x = Year, y = Percent, group = Strata.Name,
           color = Strata.Name)) +
  geom_line() + 
  facet_wrap(~Strata)

data_2 <- depression_data %>%
  dplyr::filter(!(Strata %in% c("Total")))


data_3 <- data_2 %>%
  filter(Gender %in% c("Male", "Female"))

  
  
  
shapiro.test(data_1$Frequency)


