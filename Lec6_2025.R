# creating scatter plot
data("mtcars")
plot(mtcars$wt, mtcars$mpg)

install.packages("ggplot2")
library(ggplot2)
ggplot(mtcars, aes(x=wt, y=mpg))
ggplot(mtcars, aes(x=wt, y=mpg)) +geom_point()
data("pressure")
plot(pressure$temperature, pressure$pressure, type ="l") #type l for line
points(pressure$temperature, pressure$pressure)# to show the points in background
lines(pressure$temperature, pressure$pressure/2, col="red")
points(pressure$temperature, pressure$pressure/2, col="red")
lines(pressure$temperature, pressure$pressure*2, col="blue")
points(pressure$temperature, pressure$pressure*2, col="blue")
ggplot(pressure, aes(x=temperature, y=pressure))
ggplot(pressure, aes(x=temperature, y=pressure)) +geom_line()

