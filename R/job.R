#install.packages("rvest")
#install.packages("magrittr")

library(rvest)
library(magrittr)
url <- "https://www.actionnetwork.com/nba/public-betting"
webpage <- read_html(url)

x <- webpage %>% html_nodes(xpath = '/html/body/div[1]/div/main/div/div[3]/div[1]/div[2]/table')%>%
  html_table()

output <- x[1]

setwd(here("data-raw"))

write.csv(output, paste0(format(Sys.time(), "%d-%b-%Y %H.%M"), ".csv"))
