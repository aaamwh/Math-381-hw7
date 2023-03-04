install.packages("BBmisc")
install.packages("wordcloud")
library(BBmisc)
data <- read.csv("data.csv",header=TRUE)

myfun <- function(x) {return(x)}
d<-normalize(data,method="range",margin=2)
d
#original distance matrix
distanceM <- as.matrix(dist((apply(d,
                                   MARGIN=c(1,2),myfun)),
                            method="minkowski",p=2))
distanceM
#model
model1 <- cmdscale(distanceM,k=1,eig=TRUE)
model2 <- cmdscale(distanceM,k=2,eig=TRUE)
model3 <- cmdscale(distanceM,k=3,eig=TRUE)
model1$GOF
model2$GOF
model3$GOF
library(wordcloud)
s <- rep(x = 0, times = 16)
#plot 1d and 2d graph
textplot(model1$points[,1],s,
         gsub("(ˆ[ˆ\\s]+\\s{1})","",
              data$City,perl=TRUE),
         xlim=c(-1.5,1.5),cex=0.6)
textplot(model2$points[,1],model2$points[,2],
         gsub("(ˆ[ˆ\\s]+\\s{1})","",
              data$City,perl=TRUE),
         xlim=c(-1.5,1.5),cex=0.6)
s2 <- 1:16
#plot eigen value
plot(s2, model2[2]$eig)
#model distance matrix
distanceM1 <- as.matrix(dist((apply(model1$points, MARGIN=c(1,2),myfun)), method="minkowski",p=2))
distanceM2 <- as.matrix(dist((apply(model2$points, MARGIN=c(1,2),myfun)), method="minkowski",p=2))
distanceM3 <- as.matrix(dist((apply(model3$points, MARGIN=c(1,2),myfun)), method="minkowski",p=2))
#model1 comparison
sum(abs(distanceM1-distanceM))
sum((distanceM1-distanceM)*(distanceM1-distanceM))
max(abs(distanceM1-distanceM))
#model2 comparison
sum(abs(distanceM2-distanceM))
sum((distanceM2-distanceM)*(distanceM2-distanceM))
max(abs(distanceM2-distanceM))
#model3 comparison
sum(abs(distanceM3-distanceM))
sum((distanceM3-distanceM)*(distanceM3-distanceM))
max(abs(distanceM3-distanceM))
plot(distanceM,distanceM1, xlab = "", ylab = "",xlim = c(0,2.2), ylim = c(0,2.2), xaxs = "i", yaxs = "i")
abline(a=0, b=1)
plot(distanceM,distanceM2, xlab = "", ylab = "",xlim = c(0,2.2), ylim = c(0,2.2), xaxs = "i", yaxs = "i")
plot(distanceM,distanceM3, xlab = "", ylab = "",xlim = c(0,2.2), ylim = c(0,2.2), xaxs = "i", yaxs = "i")
#correlation of the graph
cor(model2$points[,1],data$Murder)
cor(model2$points[,1],data$Rape)
cor(model2$points[,1],data$Robbery)
cor(model2$points[,1],data$Assault)
cor(model2$points[,1],data$Burglary)
cor(model2$points[,1],data$Larceny)
cor(model2$points[,1],data$Auto)
cor(model2$points[,2],data$Murder)
cor(model2$points[,2],data$Rape)
cor(model2$points[,2],data$Robbery)
cor(model2$points[,2],data$Assault)
cor(model2$points[,2],data$Burglary)
cor(model2$points[,2],data$Larceny)
cor(model2$points[,2],data$Auto)
rowSums(data)