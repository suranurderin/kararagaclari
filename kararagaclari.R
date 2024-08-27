library(readxl)
library(xlsx)

#KARAR AGACLARİ

library(RWeka)

veri=read.table(file.choose(),header = T,sep = ";")
str(veri)

veri$fiyat=as.factor(veri$fiyat)
veri$kalite=as.factor(veri$kalite)
veri$marka=as.factor(veri$marka)
veri$satildi_mi=as.factor(veri$satildi_mi)

str(veri)
summary(veri)
attributes(veri)
head(veri)
show(veri)

mveri <- J48(satildi_mi ~ ., data = veri)
mveri

summary(mveri)
plot(mveri)

ongoru = predict(mveri)
ongoru

attach(veri)
data.frame(data=satildi_mi, Ongoru=ongoru)[1:14,]
str(veri)

yeniveri=data.frame(fiyat="Yüksek", kalite="Yüksek", marka="A", satildi_mi="Evet")
yeniveri

predict(mveri, yeniveri)

yeniveri2=data.frame(fiyat="Düşük", kalite="Yüksek", marka="A", satildi_mi="Evet")
yeniveri2

predict(mveri, yeniveri2)

yeniveri3=data.frame(fiyat="Düşük", kalite="Yüksek", marka="A", satildi_mi="Hayır")
yeniveri2

predict(mveri, yeniveri3)
