# Unzip the "Project1 folder in your default working directory
# After the Project1 folder has been unzipped, the first few 
# lines will set the new working directory to be the "Project1"
# folder

#Get the current directory
curr_dir <- getwd()

#Set the new working directory
project1_dir <- paste(curr_dir, "/Project1", sep = "")
setwd(project1_dir)

#Check that you are in the correct directory
getwd()

#Read Data into R
stroopdata <- read.csv("stroopdata.csv", header = TRUE)

#Get Basic Summary Statistics
stroopdata_means <- sapply(stroopdata, mean, na.rm=TRUE)
stroopdata_summ <- summary(stroopdata)
stroopdata_stdevs <- sapply(stroopdata, sd, na.rm=TRUE)

#Put each list into a separate named vector and generate densities
congruent_list <- stroopdata$Congruent
incongruent_list <- stroopdata$Incongruent
congruent_density <- density(congruent_list)
incongruent_density <- density(incongruent_list)

#Plot Kernel Density Function for Congruent List
plot(congruent_density, main = "Kernel Density Plot of Congruent Lists")
polygon(congruent_density, col="red", border="blue")

#Plot Kernel Density Function for Incongruent List
plot(incongruent_density, main = "Kernel Density Plot of Incongruent and Incongruent Lists")
polygon(incongruent_density, col="green", border="blue")

#Overlay the two density plots
plot(incongruent_density, main = "Kernel Density Plot of Congruent and Incongruent Lists")
plot(congruent_density, main = "Kernel Density Plot of Congruent and Incongruent Lists")

polygon(congruent_density, col="red", border="blue")
polygon(incongruent_density, col="green", border="blue")

#Conduct One-Tailed T-test
t.test(congruent_list, incongruent_list
       ,alternative = "less")
       
