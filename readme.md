# Statistical workshop on Bayesian Data Analysis @Thuenen Institute for Biodiversity

## Required packages

To make the most of the coding session please come to the workshop with the following packages installed:

* rstanarm (v2.19 or higher)
* bayesplot (v1.7 or higher)
* ggplot2
* MASS

To ensure a smooth start in the coding session check if you can run Stan models from R by running:

```
library(rstanarm)
stan_glm(mpg ~ cyl,family="gaussian",data=mtcars)
```

## Structure of the workshop

* Presentation giving introductory materials to Bayesian Data Analysis
* Code examples on fitting and checking Stan models (using rstanarm)
* Exercices to explore likelihood distributions, model fitting and model checking

## Reading suggestions

* [Statistical Rethinking](https://xcelab.net/rm/statistical-rethinking/) by R. McElreath
* [Ecological Model and Data in R](https://ms.mcmaster.ca/~bolker/emdbook/index.html) by B. Bolker (not a Bayesian book but super useful infos on the details going into model fitting)
* [Bayesian Data Analysis](http://www.stat.columbia.edu/~gelman/book/) by A. Gelman et al.
