### -------------------- Lab 3 --------------------
### This lab is designed to prepare you for PS3

## Create a vector of the number of points the Seahawks scored in the
## first (at least) 5 games
## Hint: google "Seahawks scores", or check the football database:
## http://www.footballdb.com/teams/nfl/seattle-seahawks/results
## here 'Final' displays scores
## Use an appropriate variable name for the scores
## 
## Hint: feel free to invent if you cannot figure this out
seahawks_points <- c(10, 13, 24, 27, 34)
seahawks_points

## Create a vector of the number of points the opponent
## scored against Seahawks in the first 5 games
## use an appropriate variable name
opponent_points <- c(24, 21, 30, 23, 40)
opponent_points

## Combine your two vectors into a dataframe
scores <- data.frame(seahawks_points, opponent_points)

## Create a new column "diff" that is the difference in points
## (in favor of Hawks)
scores$diff <- seahawks_points - opponent_points

## Create a new column "won" which is TRUE if the Seahawks won,
## ie if Seahawks scored more than the opponent scored against them
scores$won <- scores$diff > 0

## Create a vector of the opponents name (such as "Denver Broncos")
opponents <- c("Chiefs", "49ers", "Panthers", "Rams", "Raiders")

## Add the vector of opponents into the data frame
scores$opponents <- opponents
View(scores)

## Compute the average score of Seahawks
seahawks_avg <- mean(scores$seahawks_points)
seahawks_avg

## Compute how many games did Seahawks won
## (use the 'won' variable to compute it)
wins <- scores[scores$won == TRUE, ]
num_wins <- nrow(wins)
num_wins

## What was the largest difference in scores (in favor of Seahawks)?
largest_win <- max(scores$diff)
largest_win

## How many different opponents did Seahawks have in these games?
## Hint: use `unique()` and `length()`
unique_opponents <- unique(scores$opponents)
num_opponents <- length(unique_opponents)

## Print the variable names in your data frame
names(scores)

## Write a loop over all variables in your data frame
## print the variable name inside the loop
for (name in names(scores)) {
  print(name)
}

## Write a loop over all variables in your data frame
## print the variable name inside the loop,
## and true/false, depending if the variable is numeric
## check out 'is.numeric()'
for(name in names(scores)) {
  is_num <- is.numeric(scores[, name])
  cat(name, is_num, "\n")
}

## Write a loop over all variables in your data frame
## print the variable name inside the loop,
## and the average value of the variable
## if the variable is numeric
for(name in names(scores)) {
  is_num <- is.numeric(scores[, name])
  if (is_num) {
    avg <- mean(scores[, name])
  } else {
    avg <- "N/A"
  }
  cat(name, avg, "\n")
}

##
## HR data
## You are working in HR for a large firm with 100 employees.
## You are analyzing their salaries.

## Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee
## 100")
## Hint: use 'paste()` or `str_c`
employee_num <- c(1:100)
employee_name <- c("Employee")
name <- paste(employee_name, employee_num)
name

## Create a random vector of their 2021 salaries.
## Hint: you may use the runif function to create uniform random numbers,
## e.g. 'runif(100, 60, 120)' creates 100 random numbers between 60 and 120
salaries_21 <- runif(100, 60, 120)
salaries_21

## Create a random vector of 2022 salaries that are typically
## higher than the 2014 salaires (use runif again).
## For instance, if you create random numbers between 65 and 130, then 2022
## salaries tend to be larger than 2021 salaries.
salaries_22 <- runif(100, 65, 130)
salaries_22

## Create a data.frame 'salaries' by combining the vectors you just made
salaries <- data.frame(name, salaries_21, salaries_22)
View(salaries)

## Create a column 'raise' that stores the size of the
## raise between 2021 and 2022
salaries$raise <- salaries_22 - salaries_21

## Retrieve values from your data frame to answer the following questions:
##
## What was the 2021 salary of employee 57
employee_57 <- salaries[salaries$name == "Employee 57", "salaries_21"]

## Now round the answer down to two digits after comma
## check out 'round()' function
round(employee_57, 2)

## How many employees got a raise?
nrow(salaries[salaries$raise > 0, ])

## What was the value of the highest raise?
## Round the number to two digits!
max_raise <- max(salaries$raise)
max_raise_rounded = round(max_raise, 2)

## What was the name of the employee who recieved the highest raise?
salaries[salaries$raise == max_raise, "name"]

## What was the average salary increase?
## Round the number!
avg_increase <- mean(salaries[salaries$raise > 0, "raise"])
rounded_avg <- round(avg_increase, 2)
rounded_avg

## For people who did not get a raise, how much money did they lose?
## Round the number!
losses <- salaries[salaries$raise <= 0, "raise"]
rounded_losses <- round(losses, 2)
rounded_losses