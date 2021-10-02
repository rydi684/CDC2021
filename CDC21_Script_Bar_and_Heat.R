#Sorry, this script is super messy though, and not proper

library(tidyverse)

cleanedNYFIP <- read.csv("C:/Users/kerrf/Downloads/College Application Items/cleanedNYFIP.csv", header=TRUE)

install.packages("tigris")
install.packages("sf")
install.packages("Rcpp")


new_york <- tigris::counties(state = 'NY', cb = T, class = 'sf')

data <- cleanedNYFIP

chart_src <- new_york %>% 
  left_join(data, by = c("NAME" = "County.Name"))

ggplot(chart_src) + geom_sf(aes(fill = Uninsured.Population), color = "blue") + scale_fill_manual( values = "blue") + scale_discrete_manual(aes(values = "blue")) + scale_colour_manual( values = "blue")
         
#None of that worked...I am moving on to bar graphs          
          
          
cleanedNYFIP <- read.csv("~/UNC/cleanedNYFIP.csv")          

ggplot(data = cleanedNYFIP) + geom_bar(mapping = aes(x = County.Name, y = Uninsured.Population, fill = County.Name), show.legend = FALSE, stat = 'identity') + ggtitle("Number of People In New York Without Health Insurance in 2019 by County ") + theme(axis.text.x = element_text(angle = 90, size = 6, hjust = 1), axis.text.y = element_text(angle = 0, size = 6, hjust = 1), plot.title = element_text(size=12)) + ylab("Number of Uninsured People") + xlab("County Name") + coord_cartesian(ylim = c(0, 10000))       
          
data$Uninsured.Population <- as.numeric(as.character(data$Uninsured.Population))      

ggplot(data = cleanedNYFIP) + geom_bar(mapping = aes(x = County.Name, y = Less.than.High.School, fill = County.Name), show.legend = FALSE, stat = 'identity') + ggtitle("Number of People In New York Who Did Not Complete High School by 2019 for Each County ") + theme(axis.text.x = element_text(angle = 90, size = 6, hjust = 1), axis.text.y = element_text(angle = 0, size = 6, hjust = 1), plot.title = element_text(size=10)) + ylab("Number of People Who Did Not Complete High School") + xlab("County Name") + coord_cartesian(ylim = c(0, 20000))

ggplot(data = cleanedNYFIP) + geom_bar(mapping = aes(x = County.Name, y = High.School.Diploma, fill = County.Name), show.legend = FALSE, stat = 'identity') + ggtitle("Number of People In New York Who Had Obtained a High School Diploma by 2019 for Each County ") + theme(axis.text.x = element_text(angle = 90, size = 6, hjust = 1), axis.text.y = element_text(angle = 0, size = 6, hjust = 1), plot.title = element_text(size = 9)) + ylab("Number of People With a High School Diploma") + xlab("County Name") 

ggplot(data = cleanedNYFIP) + geom_bar(mapping = aes(x = County.Name, y = High.School.Diploma, fill = County.Name), show.legend = FALSE, stat = 'identity') + ggtitle("Number of People In New York Who Had Obtained a High School Diploma by 2019 for Each County ") + theme(axis.text.x = element_text(angle = 90, size = 6, hjust = 1), axis.text.y = element_text(angle = 0, size = 6, hjust = 1), plot.title = element_text(size = 9)) + ylab("Number of People With a High School Diploma") + xlab("County Name") + coord_cartesian(ylim = c(0, 20000))

ggplot(data = cleanedNYFIP) + geom_bar(mapping = aes(x = County.Name, y = College.Grad, fill = County.Name), show.legend = FALSE, stat = 'identity') + ggtitle("Number of People In New York Who Had Graduated College by 2019 for Each County ") + theme(axis.text.x = element_text(angle = 90, size = 6, hjust = 1), axis.text.y = element_text(angle = 0, size = 6, hjust = 1), plot.title = element_text(size = 10)) + ylab("Number of College Graduates") + xlab("County Name") + coord_cartesian(ylim = c(0, 10000))
