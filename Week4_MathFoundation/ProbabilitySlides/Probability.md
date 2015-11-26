Probability
========================================================
author: Dustin Johnson
date: 


========================================================

<STYLE TYPE="text/css">
<!--
.centeralign {text-align:center}
-->
</STYLE>

<br><br><br><br>
<P CLASS="centeralign">
"Probability theory is nothing but common sense reduced to calculation." 
<br> ~ Pierre Laplace, 1812
</P>

Sample Spaces
========================================================

The sample space is an exhaustive set of all possible outcomes of an event. For instance,

1. I flip a coin: <br> $S_{coin} \in \{H, T\}$, where $S$ is the sample set
2. I roll a die: <br> $S_{die} \in \{1, 2, 3, 4, 5, 6\}$
3. Dharu writes his Math exam <br> $S_{dharu} \in \{pass, fail\}$

Each element within the set is considered an event. Notice that each event or outcome is mututally exclusive - you can't have one AND the other.

Funamentals
========================================================

Probability is all about assigning numbers to a set of mutually exclusive possibilities. These probabilities must follow the following properties:

1. A probability must be nonnegative (>0).
2. The sum of probabilities across all events in the entire sample space must equate 1.
3. When events are mutually exclusive, the probability of either one or the other occuring is the sum of their respective probabilities. 

$$X = \textrm{Dharu passes his exam}$$
$$p(X = pass) = 0.2 \implies p(X^{c} = fail) = 0.8$$ 
$$\therefore p(X = pass) + p(X = fail) = 0.2 + 0.8 = 1$$.

Distributions & Random Variables
========================================================

A probability distribution is a list of all possible outcomes and their corresponding probabilities. You can think of it in terms of a table or a histogram.

A random variable is a variable whos value is subject to randomness or chance, hence they can be described through the use of random variables. They can be denoted as follows:

$$Y \sim N(\mu,\sigma^2)$$<br>
$$X \sim Bin(k,n,p)$$

Parameters
========================================================

All models and distributions within mathematics have parameters. Parameters are essentially the "control knobs" that dictate how the model behaves or how the distribution simulates data generation.

What are the parameters here? How many are there?

$$ f(x | \sigma, \mu) = \frac{1}{\sigma \sqrt{2\pi}} e^{-\frac{(x-\mu)^2}{2\sigma^2}} $$

$$ 
f_{\mathbf x}(x_1,\ldots,x_k | \boldsymbol\Sigma, \boldsymbol\mu) =\frac{1}{\sqrt{(2\pi)^{k}|\boldsymbol\Sigma|}}\exp\left(-\frac{1}{2}({\mathbf x}-{\boldsymbol\mu})^\mathrm{T}{\boldsymbol\Sigma}^{-1}({\mathbf x}-{\boldsymbol\mu})\right)
$$

Probability Mass Functions (PMF)
========================================================

PMFs are discrete probability distributions, thereby having a countable set of events. 

Let's say I flip a coin. What's the probability I get a head?

$$X = \textrm{I get a head}$$
$$p(X = head) = 0.5, \textrm{  otherwise}$$
$$p(X = tail) = 0.5$$

What happens when I flip a coin 100 times? How about an infinite number of times?

<font size=5>

```r
set.seed(123)
sequenceOfCoinTosses <- sample(c(-1,1), 1000, replace = TRUE)
plot(cumsum(sequenceOfCoinTosses)/
		 	seq_along(sequenceOfCoinTosses), type = 'l')
hist(sequenceOfCoinTosses/seq_along(sequenceOfCoinTosses), 
		 breaks = 1000, xlim = c(-0.01,0.01), main = "Cum Mean of tosses")
```
</font>

Probability Density Functions (PDF)
========================================================

PDFs are continuous density functions - imagine slicing up the space as above infinitely small. I'm sure you've all been exposed to the Gaussian (Normal) distribution!


```r
# try bumping up the sumber of samples
gauss_sample <- rnorm(1000, mean = 0, sd = 1)
hist(gauss_sample, probability = TRUE)
```

You will notice that despite it being a continuous distribution, the computer can only comprehend discrete values! So, theoretically, we deal with continuity, but in reality we must discretise.


Central Limit Theorum (PDF)
========================================================

The central limit theorem states that the means of iid samples will be approximately normal even though the underlying observations do not follow a normal distribution. 

$$
\sqrt{n}\bigg(\bigg(\frac{1}{n}\sum_{i=1}^n X_i\bigg) - \mu\bigg)\ \xrightarrow{d}\ N(0,\;\sigma^2)
$$

<font size=5>

```r
s = 10000  # Number of simulations
n = 40    # Number of samples
lambda = 0.2

Means = NULL
for (i in 1 : s) Means = c(Means, mean(rexp(n,5)))
Means = as.data.frame(Means)

p1 <- ggplot(Means, aes(x = Means)) + 
	geom_histogram(fill = "blue", binwidth=0.01, colour = "black", aes(y = ..density..)) + 
	geom_density(colour="blue", size=1) +
	xlab("Means of Test Dist. Samples") + 
	ylab("Density of Means")
```
</font>

Expectations and Variance
========================================================

We can perform simple operations, as expectations and variances are closed under linear operations of random variables. Let's learn exactly what The Expectation and variance acutaly means before delving into an example.

$$
\operatorname{E}(X) = \mu = \sum_{i=1}^\infty x_i\, p_i =  \int_{-\infty}^\infty x f(x)\, \mathrm{d}x
$$
$$
\operatorname{Var}(X) =\sigma^2 = \operatorname{Var}(X) = \sum_{i=1}^n p_i\cdot(x_i - \mu)^2 = \int (x-\mu)^2 \, f(x) \, dx
$$

Expected outcome of a six-sided die:
$$
\operatorname{E}[X] = 1\cdot\frac16 + 2\cdot\frac16 + 3\cdot\frac16 + 4\cdot\frac16 + 5\cdot\frac16 + 6\cdot\frac16 = 3.5
$$


Expectations and Variance
========================================================

<br>
$$
X \sim N(0,1) \textrm{   &   } Y \sim N(4, 4) 
$$
<br>
$$
Z = X + 3Y
$$

Find the Expectation and Variance of Z.


