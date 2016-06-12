library(shiny)
library(rCharts)

geo_tab <- read.csv("geo_tab.csv", sep = ";", skip = 1, col.names = c("resp", "all", "f18t24", "f25t39", "f40t54", "f55"), stringsAsFactors = FALSE)
rus_tab <- read.csv("rus_tab.csv", sep = ";", skip = 1, col.names = c("resp", "all", "f18t24", "f25t39", "f40t54", "f55"), stringsAsFactors = FALSE)

geo_tab$nation = as.factor("жители Грузии")
rus_tab$nation = as.factor("жители России")

uni_tab <- rbind(geo_tab, rus_tab)
write.csv(uni_tab, "./data/uni_tab.csv", row.names = FALSE)

uni_tab <- read.csv("./data/uni_tab.csv")

##Plot

ytext <- "данные в %"
ytext <- iconv(ytext, from = "cp1251", to = "UTF-8")
uni_tab$resp <- iconv(uni_tab$resp, from = "cp1251", to = "UTF-8")
uni_tab$nation <- iconv(uni_tab$nation, from = "cp1251", to = "UTF-8")

ch <- hPlot(y = "all", x = "resp", data = uni_tab, type = "column", group = "nation")
ch$yAxis(title = list(text = iconv(ytext, from = "cp1251", to = "UTF-8")))
ch$xAxis(categories = uni_tab$resp)
ch