#install packages
install.packages("tidyverse", "dplyr", "ggplot2")
library("tidyverse")
library("dplyr")
library("ggplot2")

#Loading data
data(iris)
#the structure of the data
head(iris)
summary(iris)
str(iris)

#Give a name to the data
iris_df <- iris

#For example, we keep only those with Petal.Length over 1.3
iris_df_new <- filter(iris_df, Petal.Length > 1.3)

results <- iris_df_new %>%
  group_by(Species) %>%
  summarise(
    mean_x = mean(Petal.Length),n = n())


#Now to create a box plot of Petal.Length stratified by species
box <- ggplot(data=iris_df_new, aes(x=Species, y=Petal.Length))

box + 
  geom_boxplot(aes(fill=Species)) +
  ylab("Petal Length") +
  ggtitle("Iris Boxplot by species") +
  stat_summary(fun.y=mean, geom="point", shape=5, size=4) + ylim(0,8)

#save the plot
ggsave("plot1.png", plot = last_plot(), width = 6, height = 4, path="C:/Users/majbai/Desktop/Intermediate R/Iris_Analysis/Assignment 1 figures")

#save the data
write.csv(iris_df_new, "C:/Users/majbai/Desktop/Intermediate R/Iris_Analysis/Assignment 1 data/assignment1data.csv", row.names = FALSE)

#save the results
write.csv(results, "C:/Users/majbai/Desktop/Intermediate R/Iris_Analysis/Assignment 1 results/assignment1results.csv", row.names = FALSE)
