
install.packages("DBI")
install.packages("RMySQL")


library(DBI)
library(RMySQL)

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

dbListTables(MyDataBase)
install.packages("ggplot2")
library(dplyr)


DataDB <- dbGetQuery(MyDataBase, "select *  from CountryLanguage")


?dplyr
leng.mex <-  DataDB %>% filter(Language == "Spanish" )

class(leng.mex)

library(ggplot2)

ggplot(leng.mex,aes(x=CountryCode, y = Percentage))+
  geom_col()+coord_flip()
