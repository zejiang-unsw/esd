## Script to make trend maps of temperature and precipitation statistics:

library(esd)

demo('gridmap',ask=FALSE)
demo('pca2eof',ask=FALSE)

## Temperature
if (!file.exists('data/t2m.nordic.rda')) {
  ss <- select.station(param='t2m',src='ecad',nmin=50,lon=c(0,35),lat=c(57,72))
  t2m <- station(ss)
  t2m <- subset(t2m,it=c(1960,2015))
  nv <- apply(t2m,2,nv)
  t2m <- subset(t2m,is=nv > 18000)
  save(t2m,file='data/t2m.nordic.rda')
} else load('data/t2m.nordic.rda')


Y <- annual(t2m)
gridmap(Y,FUN='trend.coef',colbar=list(col=colscal(20,col='warm'),breaks=seq(0,0.5,by=0.025)))
points(lon(Y),lat(Y),cex=0.25)
attr(Y,'unit') <- 'degree*C/dekade'
figlab(ylab(Y),ypos=0.975)
figlab(paste(range(year(Y)),collapse=' - '),xpos=0.8,ypos=0.975)
dev.copy2pdf(file='nordic.t2m.mean.trend.pdf')

Y <-  annual(anomaly(t2m),FUN='sd')
gridmap(Y,FUN='trend.coef',colbar=list(col=colscal(20,col='t2m'),breaks=seq(-0.25,0.25,by=0.025)))
points(lon(Y),lat(Y),cex=0.25)
attr(Y,'variable') <- 'sigma[T*2*m]'
attr(Y,'unit') <- 'degree*C/dekade'
figlab(ylab(Y),ypos=0.975)
figlab(paste(range(year(Y)),collapse=' - '),xpos=0.8,ypos=0.975)
dev.copy2pdf(file='nordic.t2m.sd.trend.pdf')

## Precipitation
if (!file.exists('data/pre.nordic.rda')) {
  ss <- select.station(param='precip',src='ecad',nmin=50,lon=c(0,35),lat=c(57,72))
  pre <- station(ss)
  pre <- subset(pre,it=c(1960,2015))
  nv <- apply(pre,2,nv)
  pre <- subset(pre,is=nv > 18000)
  save(pre,file='data/pre.nordic.rda') 
} else load('data/pre.nordic.rda')

Y <- annual(pre,FUN='sum')
coredata(Y) <- 100*t(t(coredata(Y))/apply(coredata(Y),2,'mean',na.rm=TRUE))
attr(Y,'unit') <- "'%'"

gridmap(Y,FUN='trend.coef',colbar=list(col=rev(colscal(20,col='t2m')),breaks=seq(-5,5,by=0.5)))
points(lon(Y),lat(Y),cex=0.25)
attr(Y,'unit') <- '"%"/dekade'
figlab(ylab(Y),ypos=0.975)
figlab(paste(range(year(Y)),collapse=' - '),xpos=0.8,ypos=0.975)
dev.copy2pdf(file='nordic.pre.tot.trend.pdf')

Y <- annual(pre,FUN='sum')
#pcafill.test(Y)
Y <- pcafill(Y)
coredata(Y) <- 100*t(t(coredata(Y))/apply(coredata(Y),2,'mean',na.rm=TRUE))
attr(Y,'unit') <- "'%'"
pca.pt <- PCA(Y)
dev.new()
plot(pca2eof(pca.pt))


Y <-  annual(pre,FUN='wetmean')
coredata(Y) <- 100*t(t(coredata(Y))/apply(coredata(Y),2,'mean',na.rm=TRUE))
attr(Y,'unit') <- "'%'"
gridmap(Y,FUN='trend.coef',colbar=list(col=rev(colscal(20,col='t2m')),breaks=seq(-5,5,by=0.5)))
points(lon(Y),lat(Y),cex=0.25)
attr(Y,'unit') <- '"%"/dekade'
figlab(ylab(Y),ypos=0.975)
figlab(paste(range(year(Y)),collapse=' - '),xpos=0.8,ypos=0.975)
dev.copy2pdf(file='nordic.mu.trend.pdf')

Y <-  annual(pre,FUN='wetmean')
#pcafill.test(Y)
Y <- pcafill(Y)
coredata(Y) <- 100*t(t(coredata(Y))/apply(coredata(Y),2,'mean',na.rm=TRUE))
attr(Y,'unit') <- "'%'"
pca.mu <- PCA(Y)
dev.new()
plot(pca2eof(pca.mu))

Y <-  annual(pre,FUN='wetfreq')
coredata(Y) <- 100*t(t(coredata(Y))/apply(coredata(Y),2,'mean',na.rm=TRUE))
attr(Y,'unit') <- "'%'"
gridmap(Y,FUN='trend.coef',colbar=list(col=rev(colscal(20,col='t2m')),breaks=seq(-5,5,by=0.5)))
points(lon(Y),lat(Y),cex=0.25)
attr(Y,'unit') <- '"%"/dekade'
figlab(ylab(Y),ypos=0.975)
figlab(paste(range(year(Y)),collapse=' - '),xpos=0.8,ypos=0.975)
dev.copy2pdf(file='nordic.fw.trend.pdf')

Y <-  annual(pre,FUN='wetfreq')
#pcafill.test(Y)
Y <- pcafill(Y)
coredata(Y) <- 100*t(t(coredata(Y))/apply(coredata(Y),2,'mean',na.rm=TRUE))
attr(Y,'unit') <- "'%'"
pca.fw <- PCA(Y)
dev.new()
plot(pca2eof(pca.fw))
