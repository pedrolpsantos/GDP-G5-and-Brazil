
#Instalar todos estes packs para limpeza da base e construção do 
#gráfico (install this packages to manipulate the database and create the graphic)

install.packages("tidyverse")
install.packages("ggplot2")
install.packages("janitor")
install.packages("readxl")
install.packages("tvthemes")

#-------------------------------

library(tidyverse)
library(ggplot2)
library(janitor)
library(readxl)
library(tvthemes)

#Data of GDP from World Bank Database

getwd()

gdp_comparison <- read_excel("~/R projects/dados/dados ibmec/GDP Comparison - Brazil and G5.xlsx")

view(gdp_comparison)
  
gdp_g5 <- gdp_comparison %>% janitor::clean_names()
  
View(gdp_g5)
  
gdp_g5 %>% 
  group_by(country) %>% 
  ggplot(aes(x = year, y = gdp_current_us, color = country)) + 
  geom_line() +
  geom_point()+
  theme_update()
  #geom_point(aes(x = Country, y = 'GDP (current US$)'))

            