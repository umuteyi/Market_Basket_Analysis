install.packages("arulesViz")
library("readxl")
library(ggplot2)
library(dplyr)
library(stringr)
library(arules)
library(arulesViz)
library(datasets)
setwd("/Users/umuteyidogan/Desktop")
mdata <- read.csv("//Users/umuteyidogan/Desktop/Market_basket_dataset_B.csv", header = TRUE, sep = ";" )
head(mdata)
transactions <- str_split_fixed(mdata$shrimp.almonds.avocado.vegetables.mix.green.grapes.whole.weat.flour.yams.cottage.cheese.energy.drink.tomato.juice.low.fat.yogurt.green.tea.honey.salad.mineral.water.salmon.antioxydant.juice.frozen.smoothie.spinach.olive.oil, ",", n = Inf)
head(transactions[,1:4])
cat("The biggest basket consists of", ncol(transactions), "products.")
mdata <- read.transactions("Market_basket_dataset_B.csv", format = "basket", sep = ",", skip=1)
cat("Number of baskets:", length(mdata))
cat("Number of unique items:", sum(size(mdata)))
head(itemInfo(mdata))
ItemSetList <- mdata@itemInfo
ItemSetList
inspect(mdata[1:10])
summary(mdata)
itemFrequency(mdata, type = "relative")
itemFrequencyPlot(mdata, topN=10, type="relative", main="Items Frequency", cex.names=0.8) 
head(sort(itemFrequency(mdata), decreasing=FALSE), n=10)

itemFrequencyPlot(mdata,topN=20,type="absolute")
rules <- apriori(mdata, parameter = list(supp = 0.01, conf = 0.25))
options(digits=2)
inspect(rules[1:25])
rules<-sort(rules, by="confidence", decreasing=TRUE)
rules
subset.rules <- which(colSums(is.subset(rules, rules)) > 1) 
length(subset.rules)
## Applications of Apriori Rules.
subset.rules. <- rules[-subset.rules]
subset.matrix <- is.subset(rules, rules)
rules<-apriori(data=mdata, parameter=list(supp=0.001,conf = 0.08), 
               appearance = list(default="lhs",rhs="green tea"),
               control = list(verbose=F))
rules<-sort(rules, decreasing=TRUE,by="confidence")
inspect(rules[1:5])
lhs

rules<-apriori(data=mdata, parameter=list(supp=0.001,conf = 0.08), 
               appearance = list(default="lhs",rhs="mineral water"),
               control = list(verbose=F))
rules<-sort(rules, decreasing=TRUE,by="confidence")
inspect(rules[1:5])
lhs
rules<-apriori(data=mdata, parameter=list(supp=0.001,conf = 0.15, minlen=2), 
               appearance = list(default="rhs",lhs="mineral water"),
               control = list(verbose=F))
rules<-sort(rules, decreasing=TRUE,by="confidence")
inspect(rules[1:5])
plot(rules,method="graph",enginer="interactive",shading=NA)
