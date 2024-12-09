#' ---
#' title: "Week 4 Data Visualization Lab"
#' author: "Saba Heydari Seradj (PID A17002175)"
#' date: "Oct 16, 2024"
#' ---

# Install the package ggplot2
# install.packages("ggplot2")

# Any time I want to use this package I need to load it.
library(ggplot2)

View(cars)

# A quick base R plot (not ggplot)
plot(cars)

# Our first ggplot
# we need data + aesthetics + geoms
ggplot(data=cars) +
  aes(x=speed, y=dist) + 
  geom_point()

p <- ggplot(data=cars) +
  aes(x=speed, y=dist) + 
  geom_point()

# Add a line geom with geom_line() which connects the points
p + geom_line()

# Add a trend line to the data
p+geom_smooth()

p + geom_smooth(method='lm')

# Read in our drug expression data
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)

# Let's make a first plot attempt
g <- ggplot(data=genes) +
  aes(x=Condition1, y=Condition2, col=State) +
  geom_point()
 
g

# Q. Use the nrow() function to find out how many genes are in this dataset. What is your answer? 

nrow(genes)
# there are 5196 genes in the dataset
# Q. Use the colnames() function and the ncol() function on the genes data frame to find out what the column names are (we will need these later) and how many columns there are. How many columns did you find? 
ncol(genes)
colnames(genes)
# Q. Use the table() function on the State column of this data.frame to find out how many ‘up’ regulated genes there are. What is your answer? 
table(genes$State)

# Q. Using your values above and 2 significant figures. What fraction of total genes is up-regulated in this dataset? 
round(table(genes$State)/nrow(genes)*100,2)
# Percentage

# Add some color 
g+ scale_color_manual(values=c('blue','gray','red'))+
  labs(title='Gene Expression changes upon drug treatment',x='Control(no drug',y='Treatment')+
  theme_bw()
