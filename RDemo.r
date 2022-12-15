firstName <- "Daniel"
lastName <- "Kruze"

printDemo <- function() {
  demoMess <<- "is a good R programmer!"
  y <- paste(firstName, lastName, demoMess)
  print(y)
}

scopeDemo <- function() {
  names <- list("Darnell Kreuz", "Dognel Cruise", "Dendyll Groose")
  y <- ""
  for (x in names) {
    y <- paste(x, "also", demoMess)
    print(y)
  }
}

lineDemo <- function() {
  pdf(file = "linePlot.pdf")
  x <- 1:20
  y <- log(x)
  plot(x, y, type="l", col="red")
  dev.off()
}

pieDemo <- function() {
  pdf(file = "piePlot.pdf")
  x <- 12
  labels <- c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12")
  pie(rep(1,x), label=labels, main="Funny Wheel", col=rainbow(x))
  dev.off()
}

barDemo <- function() {
  pdf(file = "barPlot.pdf")
  x <- c("Gunk", "Slunk", "Bunk", "Trunk")
  y <- c(3, 9, 27, 1)
  colors <- c("red", "yellow", "blue", "black")
  barplot(y, names.arg = x, width = c(2,3,4,1), col=colors)
  dev.off()
}

demo1wrapper <- function() {
  printDemo()
  scopeDemo()
}

demo2wrapper <- function() {
  lineDemo()
  pieDemo()
  barDemo()
}

demo3wrapper <- function() {
  data("iris")
  boxplot(Sepal.Length~Species,
        data=iris,
        main='Sepal Length by Flower Species',
        xlab='Species',
        ylab='Sepal Length',
        col="pink",
        border='black')
  data("iris")
  summary(iris)
}

cat(paste("Please select the demo you'd like to see:", "1) Basic Functions", "2) Graphic Functions", "3) Statistical Analysis", "", sep="\n"))
userInput <- readLines("stdin", 1)
userInput <- as.integer(userInput)
if (userInput == 1) {
  demo1wrapper()
} else if (userInput == 2) {
  demo2wrapper()
} else {
  demo3wrapper()
}