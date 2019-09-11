#Read File In
data.EndToBeginning = read.csv("dataEndToBeginning.csv", h=T)

#Attach data / create variables
attach(data.EndToBeginning)
etbET = Elapsed.Time
etbIS = Instance.Size.n

plot(etbIS, etbET, pch = 16, cex = 1.3, col = "black", main = "Elapsed Time plotted against Instance Size 'n'", xlab = "Instance Size 'n'", ylab = "Elapsed Time (sec)")

###LINEAR MODEL
##lm(etbET ~ etbIS)
##abline(lm(etbET ~ etbIS))
###BEST FIT CURVE

##lines(etbIS, etbET, lwd=2, col = "red")

fit2 <- lm(etbET~poly(etbIS,2,raw=TRUE))

xx <- seq(1,26, length=78)
lines(xx, predict(fit2, data.frame(x=xx)), col="green")

scatter.smooth(x=1:length(etbIS), y=etbET, span=2/3, degree=2)

loessModel <- loess(formula = fit2, span = 1)
smoothed <- predict(loessModel) 
lines(smoothed, x=etbIS)


##### POWER SET ########
data.PowerSet = read.csv("dataPowerSet.csv", h=T)

attach(data.PowerSet)
psET = Elapsed.Time
psIS = Instance.Size.n

plot(psIS, psET, pch = 16, cex = 1.3, col = "black", main = "Elapsed Time plotted against Instance Size 'n'", xlab = "Instance Size 'n'", ylab = "Elapsed Time (sec)")

###BEST FIT CURVE

psmodel2 <- lm(psET ~ psIS + I(psIS^2))
summary(psmodel2)

psmodel3 <- lm(psET ~ psIS + I(psIS^2) + I(psIS^3))
summary(psmodel3)
#lines(smooth.spline(psIS, predict(psmodel2)), col="green", lwd=3)
psFit <- lm(psET~psIS)
lines(psIS, psET, lwd=2, col = "red")
#psm2 <- lm(psET~poly(psIS, 2, raw = TRUE))
#psm3 <- lm (psET~psIS + I(psIS^2))
#summary(psm2)
#summary(psm3)
#lines(psIS, predict(psm2), col = "blue")




##### ----- End ----- #####



#points(psIS, psET, pch = 16, cex = 1.3, col = "red")
#points(etbIS, etbET, pch = 16, cex = 1.3, col = "blue")



##plot(Elapsed.Time~Instance.Size..n.,col="red")
plot(Instance.Size..n., Elapsed.Time, pch = 16, cex = 1.3, col = "blue", main = "Elapsed Time plotted against Instance Size 'n'", xlab = "Instance Size 'n'", ylab = "Elapsed Time (sec)")
plot(Instance.Size..n., Elapsed.Time, pch = 16, cex = 1.3, col = "red",  main = "Elapsed Time plotted against Instance Size 'n'", xlab = "Instance Size 'n'", ylab = "Elapsed Time (sec)")
points()
