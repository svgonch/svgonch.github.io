library(rCharts)
library(reshape)

year = c('2005','2006','2007','2009','2010','2011','2012','2013','2014','2015','2016')
geo = c(38,44,46,62,57,50,41,33,19,11,10)
ukr = c(13,27,23,41,13,20,15,11,30,37,48)
df <- data.frame(Год = year, Грузия = geo, Украина = ukr)
df_m <- melt(df, id.vars = "Год")

df_m$variable <- iconv(df_m$variable, from = "cp1251", to = "UTF-8")
y_lab <- iconv("данные в %", to = "UTF-8")

pl <- hPlot(value~Год, data = df_m, group = "variable", type = "line")
       pl$plotOptions(line = list(dataLabels = list(enabled = TRUE, style = list(fontSize = '12px'))))
       pl$yAxis(title = list(text = iconv(y_lab, to = "UTF-8")))
       pl$xAxis(categories = df_m$Год)
       pl
