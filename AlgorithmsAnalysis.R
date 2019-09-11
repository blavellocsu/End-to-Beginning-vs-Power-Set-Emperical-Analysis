setwd("~/Desktop/AlgProj2")


##### End To Beginning ########

#Read File In
data.EndToBeginning = read.csv("dataEndToBeginning.csv", h=T)

#Attach data / create variables
attach(data.EndToBeginning)
etbET = Elapsed.Time  #endToBeginningElapsedTime
etbIS = Instance.Size.n #endToBeginningInstanceSize

x = etbIS
y = etbET

try1 <- plot(x,y,pch=19, main = "Elapsed Time plotted against Instance Size 'n'", 
             xlab = "Instance Size 'n'", ylab = "Elapsed Time (sec)")
fit <- lm(y~poly(x,2,raw=TRUE)) 
lines(x,predict(fit,data.frame(x=x)),col="red",lwd=2)



#############################################################


##### POWER SET ########
data.PowerSet = read.csv("dataPowerSet.csv", h=T)

attach(data.PowerSet)
psET = Elapsed.Time  #powerSetElapsedTime
psIS = Instance.Size.n  #powerSetInstanceSize


###BEST FIT CURVE

x2 = psIS
y2 = psET

try1 <- plot(x2,y2,pch=19,main = "Elapsed Time plotted against Instance Size 'n'", 
             xlab = "Instance Size 'n'", ylab = "Elapsed Time (sec)")
fit <- lm(y2~poly(x2,2^x2,raw=TRUE)) 
lines(x2,predict(fit,data.frame(x2=x2)),col="red",lwd=2)


