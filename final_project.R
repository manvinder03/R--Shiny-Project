library(ggplot2)

rm(list = ls())

Dataset <- as.data.frame(read.csv("TB_Burden_Country.csv"))

ggplot(data=Dataset, aes(x=Year, y=Estimated.mortality)) +
  geom_bar(stat="identity", fill="steelblue")+
  theme_minimal()

ggplot(data=Dataset, aes(x=Year, y=Deaths.of.Tuberculosis)) +
  geom_bar(stat="identity", fill="steelblue")+
  theme_minimal()
