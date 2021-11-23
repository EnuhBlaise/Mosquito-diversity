##Load requirements
library(readxl)
datapath = "C:/Users/Blaisonyl/Desktop/Help/David_Research/Data/Data_set_trap_color_and_bait.xlsx"
data <- read_xlsx(datapath)
head(data)
View(data)
library(ggplot2)
plot(data)
geom_histogram(data$species_id)

#fix names 
data_new1 <- data                  
colnames(data_new1) <- gsub(" ", "_", colnames(data_new1))
head(data_new1)                       
data2 = data_new1

#characters to factors
data2[sapply(data2, is.character)] <- lapply(data2[sapply(data2, is.character)], as.factor)
#Plot 
ggplot(data_new1, aes(camp_site)) +
  geom_bar()

ggplot(data_new1, aes(baits_used)) +
  geom_bar()

ggplot(data_new1, aes(sex)) +
  geom_bar(color="blue", fill="blue")    

ggplot(data_new1, aes(species_id)) +
  geom_bar(color="blue", fill="blue")+coord_flip()+order()


require(forcats)
ggplot(data_new1, aes(fct_infreq(species_id))) +
  geom_bar(color="blue", fill="blue")+coord_flip()

library(dlookr)
eda_report(data_new1, output_format = "pdf")

library(DataExplorer)
create_report(data_new1)


