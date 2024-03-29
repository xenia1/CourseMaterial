# Simulation Challenge
***

**Here are the steps for submission**

1. Open the existing R project that is connected with your personal Github repo located on the team AQM_Workshop. It should be named `first_last_AQM`. We already created this project in class!
2. Make a new folder within this project and name it `assignment01_First-Code`.
3. Create a new R script, where you will do all your coding for this assignment, and save all your work within the folder above.
4. When your code looks organised and reproduces your answers and output, each chunk will be placed into a Markdown file, where you will answer all your questions and explain all your code. Just follow how I constructed this assignment, and explain each chunk of code as you go along. [EXAMPLE HERE](https://raw.githubusercontent.com/Dustin21/Dustin21.github.io/master/AQM/Week2/MarkdownExample.png). _(save your lengthy explanations for the Markdown report!)_
5. Once finished, you will have the following files in the folder within your project:
	* `.R`: Your R source file
	* `.Rmd`: RMarkdown file
	* `.md`: Markdown file
	* `.html`: HTML file	
6. `Pull`, `Commit`, `Push` your finished assignment with all accompanying files to your `first_last_AQM` repo and double-check everything made it there, so we can all view it, and reproduce your results.

> Please answer all questions in a clean Markdown format, and post your final solutions by **Wednesday**. If you get stuck, try asking your teammates or get some hints from your fellow team member's repos. All extra functions you decide to add must be explained in your Markdown file, so your team members will understand.

***
### Part 1
***

Follow along with the code I provided, and answer the following questions using functions you learned from class. Remember, you can check the help file for the function using `?` then the function name in the console. Functions we learned last class may be `mean()`, `var()`, `sd()`, etc.

#### Question 1
We begin by sampling from a normal distribution and transforming it to a variable called `out`. 

```r
# Random draws from a normal distribution
norm1 <- rnorm(1000, 6, 10)
# Constant
a <- 4
# Transformation
y1 <- a - norm1
```

1. What is the true mean, variance, and standard deviation of our `norm1` object?
2. What is the approximated mean, variance, and standard deviation of our `norm1` object? (HINT: use your functions.)
3. What is `a`?
4. How do we anticipate the mean, variance and standard deviation to change when subtracting `norm1` from `a` (transforming `norm1` into `y1`)? Provide your numbers. (no calculations needed)
5. Examine the mean, variance and standard deviation of `y1`. Does this coincide with your expectations in question 4? Can we expect them to be exact?
6. Examine your objects `norm1` and `y1` using the function `hist()`. What does this function `hist()` do? What do the outputs of the `hist()` tell us?
7. How many samples did we use? What would happen if we used 100?
8. Use R's linear regression function `lm()` to solve for your coefficients. How close do you get to the true coefficients?

#### Question 2
Follow the same questions above with the following R script, replacing `a` with `b`, `norm1` with `norm2`, and so on.

```r
# Sample distribution 2
norm2 <- rnorm(10000, 0, 4)
b <- 3

y2 <- b*norm2
```


#### Question 3
Follow the same questions above with the following R script.

```r
# Sample distribution 3
norm3  <- rnorm(1500, 0, 5)
a <- 4
b <- 3

y3 <- a + b*norm3
```
***
### Part 2
***

Answer the following questions:

```r
# Sample from 2 normal distributions
x1 <- rnorm(100)
x2 <- rnorm(100)

# Construct constants
beta0 <- 0
beta1 <- 2
beta2 <- 8

# Construct equation
z <- beta0 + beta1*x1 + beta2*x2 + rnorm(100)
```

1. What is the _mean_, _var_, and _sd_ of `x1` and `x2`?
2. What is the _mean_, _var_, and _sd_ of `z`?
3. Is this expected? Explain how you could calculate an exact `z` without code. (HINT: calculate it yourself and check your numbers are approximated by question 2.)
4. Use R's linear regression function `lm()` to solve for your coefficients. How close do you get to the true coefficients?


```r
# Build a matrix from above
mat <- cbind(z, x1, x2)
```

4. Make sure this `mat` is a matrix using the function `is.matrix()`. (use `?` for help)
5. What are the dimensions of this matrix (number of rows and columns)? Explain how you solved this. (no code required)
6. Crosscheck your answer above using the function `dim()`.
7. Are your columns of your matrix correct (`z`,`x1`,`x2`)? (The matrix is kind of big... try calling your `mat` object using the function `head()`, but remember to describe what this function does)


```r
# Examine plots
pairs(mat)
```

8. What does this plot tell you about the _mean_, _var_, and _sd_ of our interacting variables `z`, `x1`, `x2`?
9. We made the coefficients `beta0`, `beta1`, `beta2`, so we know their exact values. Does `pairs()` reinforce our knowledge of the coefficients? Why is this so?
10. Explain the equation "_z <- beta0 + beta1*x1 + beta2*x2 + rnorm(100)_" we used above and the purpose of this "simulation".

***
### Part 3
***

Build your own function using random objects (random variables) as above and examine it using the functions you have already learned. As we have seen, `pairs()` lets us better examine data with multi-variables, so don't be afraid to add more. If this section scares you, just experiment with the example in **Part 2**: add more/less samples, make `rnorm()` into `runif()`, or change the values of the coefficients and see what kind of results you get. Don't forget to show your code and explain your process to the rest of your team.

<br>

**Congrats, you've made it to the end!!**
