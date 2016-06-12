rus <- read.csv("russian.csv", sep = ";")
geo <- read.csv("georgian.csv", sep = ";")
colnames(geo) <- c("know", "age")

rus$nation <- as.factor("rus")

geo <- select(geo, age, know)
geo$nation <- as.factor("geo")
## Combining datasets
uni <- rbind(rus, geo)
## filtering under 18 years old
uni <- uni[which(uni$age >= 18),]

cut_points <- c(25,40,55)
uni$age_gr <- cut2(uni$age, cuts = cut_points)
uni$age_gr <- revalue(uni$age_gr, c("[ 18, 25)" = "18-24", "[ 25, 40)" = "25-39", "[ 40, 55)" = "40-54", "[ 55,102]" = ">55"))
uni$know <- factor(uni$know, labels = c("много знаю", "знаю немного", "знаю мало", "ничего не знаю", "затруд.ответить"))

ch <- hPlot(y = "всего", x = "ответ", data = uni_tab, type = "column", group = "nation")
ch$yAxis(title = list(text = iconv(ytext, from = "cp1251", to = "UTF-8")))
ch$xAxis(categories = uni_tab$ответ)
ch$title(text = iconv(tit, from = "cp1251", to = "UTF-8"))
ch

