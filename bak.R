  title: "Roll prioritering för högst vinstsannolikhet i Dota2"
author: "Joakim Bäcklund Johan Bothin"
highlighter: highlight.js
output: html_document
knit: slidify::knit2slides
mode: selfcontained
hitheme: tomorrow
widgets: mathjax
framework   : io2012
---
  <style>
  .title-slide {
    background-color: #FFFFFF; /* #EDE0CF; ; #CA9F9D*/
  }
</style>
  
  ```{r, setup, include=FALSE}
knitr::opts_chunk$set(cache=TRUE,echo=FALSE,message=FALSE,comment="")

library(dplyr)
library(ggplot2)
library(ROCR)


load(file="C:\\Users\\jeck\\Downloads\\presentation.rda")
testing <- aggregate(solo_competitive_rank~match_id+side,data=klart, mean)

hehe <- klart[klart$midreal==TRUE,]
hehe2 <- klart[klart$safereal==TRUE,]
hehe3 <- klart[klart$offreal==TRUE,]
hehe4 <- klart[klart$junglereal==TRUE,]
hehe5 <- klart[klart$midreal==FALSE | klart$safereal==FALSE | klart$offreal==FALSE | klart$junglereal==FALSE,]



test_mid <- merge(testing,hehe, by = c("match_id","side"))
testsafe <- merge(testing,hehe2, by = c("match_id","side"))
testoff <- merge(testing,hehe3, by = c("match_id","side"))
testjungle <- merge(testing,hehe4, by = c("match_id","side"))
testunknown <- merge(testing,hehe5, by = c("match_id","side"))

alla <- merge(testing, klart, by = c("match_id", "side"))




test_mid$diff <- (test_mid$solo_competitive_rank.y-test_mid$solo_competitive_rank.x)
testsafe$diff <- (testsafe$solo_competitive_rank.y-testsafe$solo_competitive_rank.x)
testoff$diff <- (testoff$solo_competitive_rank.y-testoff$solo_competitive_rank.x)
testjungle$diff <- (testjungle$solo_competitive_rank.y-testjungle$solo_competitive_rank.x)
testunknown$diff <- (testunknown$solo_competitive_rank.y-testunknown$solo_competitive_rank.x)



#logit <- function(x) {
#model <- model <- glm(win~diff, family=binomial(link='logit'), data=x)
#stargazer(model, apply.coef=exp, t.auto=F, p.auto=F, report = "vct*")
#print(summary(model))
#print("p-Värde:")
#coef(summary(model))[,4]
#print(coef(summary(model))[2,1])
#print(exp(coef(summary(model))[2,1]))
#}

#poss <- list(test_mid,testsafe,testoff,testjungle)
#lapply(poss, logit)

#logit(testoff)


possar <- list(test_mid,testsafe,testoff,testjungle)
pos_list <- c("midspelare","safelanespelare","hardlanespelare","djungelspelare")
# mapply(my_plot, possar, pos_list)



model <- glm(testoff$win~testoff$diff,family=binomial(link='logit'))

p <- predict(model,newdata=subset(testoff,select=c(13)),type='response')
pr <- prediction(p, testoff$win)
prf <- performance(pr, measure = "tpr", x.measure = "fpr")
#plot(prf,col="blue")
#title(main = "ROC kurva för hardlanespelare", xlab="", ylab="")
#abline(0,1)
auc <- performance(pr,"auc")
auc <- unlist(slot(auc, "y.values"))
# adding min and max ROC AUC to the center of the plot
minauc<-min(round(auc, digits = 2))
maxauc<-max(round(auc, digits = 2))
maxauct <- paste(c("AUC  = "),maxauc,sep="")
#plot(prf,col="blue")
#title(main = "ROC kurva för hardlanespelare", xlab="", ylab="")
#abline(0,1)
# legend(0.45,0.45,c(maxauct),border="white",cex=1.3, pt.cex=1,box.col = "white")


fitted.results <- ifelse(p > 0.5,1,0)
misClasificError <- mean(fitted.results != testoff$win)
# print(paste('Accuracy',1-misClasificError))
# 
acc.perf <- performance(pr, measure = "acc")
ind = which.max( slot(acc.perf, "y.values")[[1]] )
acc = slot(acc.perf, "y.values")[[1]][ind]
cutoff = slot(acc.perf, "x.values")[[1]][ind]
print(c(accuracy= acc, cutoff = cutoff))
#plot(acc.perf)

```


INTRO

Dota blabla

----
  
  
  minimap

---
  
  Lanes

---
  
  
  Syfte & Fråge


- Vilka faktorer spelar storst roll gÃ¤llande valet av favoritrestaurang?

- Till exempel hur psverkar , valet av favoritrestaurang.

- lla hamburgerkedjor lika populara?

---
  
  Data


---
  
  Metod

Logistisk Regression

ROC

---
  Resultat 1
```{r, echo=FALSE,fig.width=6,fig.height=6}
ggplot(possar[[1]], aes(x=diff, y=win)) +
  geom_point() + stat_smooth(method="glm", method.args = list(family = binomial(link = "logit")), se=FALSE) +
  ggtitle(paste0("Logistisk regression för ", pos_list[1])) +
  labs(x="MMR-differens mot laget", y="Vinstsannolikhet")  +
  theme(panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"), plot.title =  element_text(size = 35, face = "bold")) +
  theme_bw()
```

---
  Resultat 2


---
  
  Resultat 3

--- 
  
  Resultat 4


---
  
  ROc 
```{r, echo=FALSE,fig.width=6,fig.height=6}

plot(prf,col="blue")
title(main = "ROC kurva för hardlanespelare", xlab="", ylab="")
abline(0,1)
legend(0.45,0.45,c(maxauct),border="white",cex=1.3, pt.cex=1,box.col = "white")
```


---
  Diskussion

--- 
  
  Slutsats

---
  Frågor?
---
  
  
  
  
  