# Analysis of modularity and chart with each network as a matrix
# Importing the datasets --------------------------------------------------

GPI<-read.table(header=T, (here::here("Scripts", "txt-csv", "GPI_matrix.txt")))
GIS<-read.table(header=T, (here::here("Scripts", "txt-csv","GIS_matrix.txt")))
GIG<-read.table(header=T, (here::here("Scripts", "txt-csv","GIG_matrix.txt")))
HPS<-read.table(header=T, (here::here("Scripts", "txt-csv","HPS_matrix.txt")))

# Calculating the modularities for each network ---------------------------

mod_GPI <- bipartite::computeModules(web=GPI, steps=1E5, deep=T, method = "DormannStrauss")
mod_GIS <- bipartite::computeModules(web=GIS, steps=1E5, deep=T, method = "DormannStrauss")
mod_GIG <- bipartite::computeModules(web=GIG, steps=1E5, deep=T, method = "DormannStrauss")
mod_HPS <- bipartite::computeModules(web=HPS, steps=1E5, deep=T, method = "DormannStrauss")

# Building and exporting the chart with the four networks as matrixes and their modules ---------------

file_name= paste("Fig_modules-networks.png", sep="")
png(filename= file_name, res= 300, height= 25, width=30, unit="cm")
par(mfrow=c(2,2))
bipartite::plotModuleWeb(mod_GPI,displayAlabels = T, rank = T, labsize=0.6)
bipartite::plotModuleWeb(mod_GIS,displayAlabels = T, rank = T, labsize=0.6)
bipartite::plotModuleWeb(mod_GIG,displayAlabels = T, rank = T, labsize=0.6)
bipartite::plotModuleWeb(mod_HPS,displayAlabels = T, rank = T, labsize=0.6)
dev.off()
