
# Importing datasets for each network - 2 lists per factor inverting the nodes columns--------

# Factor 1 - Parasitoids per interaction of galling species and host plant species
dados1.1 = read.csv(header=T, sep=";", here::here("Scripts","txt-csv", "rede_int.csv"))
dados1.2 = read.csv(header=T, sep=";", here::here("Scripts","txt-csv","rede_int2.csv"))
str(dados1.1)
str(dados1.2)

# Factor 2 - Parasitoids per gall species
dados2.1 = read.csv(header=T, sep=";", here::here("Scripts","txt-csv","gal_list.csv"))
dados2.2 = read.csv(header=T, sep=";", here::here("Scripts","txt-csv","gal_list2.csv"))
str(dados2.1)
str(dados2.2)

#Fator 3 - Parasitoids per gall genus
dados3.1 = read.csv(header=T, sep=";", here::here("Scripts","txt-csv","gen_list.csv"))
dados3.2 = read.csv(header=T, sep=";", here::here("Scripts","txt-csv","gen_list2.csv"))
str(dados3.1)
str(dados3.2)

#Fator 4 - Parasitoids per host plant species
dados4.1 = read.csv(header=T, sep=";", here::here("Scripts","txt-csv","plan_list.csv"))
dados4.2 = read.csv(header=T, sep=";", here::here("Scripts","txt-csv","plan_list2.csv"))
str(dados4.1)
str(dados4.2)



# Calculando netcarto para cada dupla -------------------------------------

#Fator 1
m1.1 <-rnetcarto::netcarto(dados1.1, bipartite = T)
m1.1

m1.2 <-rnetcarto::netcarto(dados1.2, bipartite = T)
m1.2

#Fator 2
m2.1 <-rnetcarto::netcarto(dados2.1, bipartite = T)
m2.1

m2.2 <-rnetcarto::netcarto(dados2.2, bipartite = T)
m2.2

#Fator 3
m3.1 <-rnetcarto::netcarto(dados3.1, bipartite = T)
m3.1

m3.2 <-rnetcarto::netcarto(dados3.2, bipartite = T)
m3.2

#Fator 4 
m4.1 <-rnetcarto::netcarto(dados4.2, bipartite = T)
m4.1
# Não pode ser calculada a função dos nós das plantas por serem apenas 2
#m4.2 <-rnetcarto::netcarto(dados4.1, bipartite = T)

#Exporting the tables from each netcarto analysis
write.table(m1.1[[1]],file= "paras-per-GIP.txt", sep="\t", dec=",")
write.table(m2.1[[1]],file= "paras-per-GIS.txt", sep="\t", dec=",")
write.table(m3.1[[1]],file= "paras-per-GIG.txt", sep="\t", dec=",")
write.table(m4.1[[1]],file= "paras-per-HPS.txt", sep="\t", dec=",")

write.table(m1.2[[1]],file= "nodes-of-GIP.txt", sep="\t", dec=",")
write.table(m2.2[[1]],file= "nodes-of-GIS.txt", sep="\t", dec=",")
write.table(m3.2[[1]],file= "nodes-of-GIP.txt", sep="\t", dec=",")


#Juntando os plots dos fatores parasit.
file_name= paste("Fig_netcarto-parasitoids.png", sep="")
png(filename= file_name, res= 300, height= 25, width=30, unit="cm")
par(mfrow=c(2,2))
plot(tab1.1[,4],tab1.1[,3], main="GIP",xlab="Among module connectivity c", ylab= "Within module degree z")
abline(v=0.62, col="red")
plot(tab2.1[,4],tab2.1[,3], main="GIS", xlab="Among module connectivity c", ylab= "Within module degree z")
abline(v=0.63, col="red")
plot(tab3.1[,4],tab3.1[,3], main="GIG", xlab="Among module connectivity c", ylab= "Within module degree z")
abline(v=0.64, h=2.6, col="red")
plot(tab4.1[,4],tab4.1[,3], main="HPS", xlab="Among module connectivity c", ylab= "Within module degree z")
abline(h=2.5, col="red")
dev.off()

#Juntando os plots dos fatores
file_name= paste("Fig_netcarto-factors.png", sep="")
png(filename= file_name, res= 300, height= 25, width=30, unit="cm")
par(mfrow=c(2,2))
plot(tab1.2[,4],tab1.2[,3], main="GIP", xlab="Among module connectivity c", ylab= "Within module degree z")
abline(v=0.625, col="red")
plot(tab2.2[,4],tab2.2[,3], main="GIS", xlab="Among module connectivity c", ylab= "Within module degree z")
plot(tab3.2[,4],tab3.2[,3], main="GIG", xlab="Among module connectivity c", ylab= "Within module degree z")
dev.off()


