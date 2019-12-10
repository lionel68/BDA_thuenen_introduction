########################
# Data simulation for 
# the BDA practical session
#################################

library(clusterGeneration) # for rcorrmatrix

######### Dataset 1: mixed effect model with varying slope and intercept
# data sims
n <- 200
n_grp <- 10

# generate hierarchical betas
R <- rcorrmatrix(2) # correlation between the effects
var_eff <- c(1, 4) # variance for the effects
beta_m <- c(1, 2) # mean effect levels

beta_grp <- mvrnorm(n=n_grp, mu=beta_m, Sigma = R*var_eff)

# the covariates
dat <- data.frame(rain = runif(n, min = -2, max = 2), grp = sample(letters[1:n_grp], n, replace = TRUE))

# simulate the data
linpred <- beta_grp[dat$grp,1] + beta_grp[dat$grp,2] * dat$rain
dat$height <- rnorm(n, mean = linpred, sd = 1)

# write.table(dat, "file.csv", row.names=FALSE)
######### sim 1 ends


################ dataset 2: varying variances
n <- 100
dat <- data.frame(nutrient = runif(n, -2, 2))

# the sigma 
sd_res <- exp(-1 + 0.01 * dat$nutrient + 0.5 * dat$nutrient ** 2) # using exp to ensure positive standard deviation

# the linpred
linpred <- 1 + 3 * dat$nutrient

# the response
dat$biomass <- rnorm(n, linpred, sd_res)

plot(biomass~nutrient, dat)

# write.table(dat, "file.csv", row.names=FALSE)

########## end sim

################ dataset 3: temporal autocorrelation
n_step <- 100
rho <- 0.5 # the autocorrelation parameter

eps <- rnorm(n_step) # white noise

x <- rnorm(n_step) # generate some values

for(t in 2:n_step) x[t] = rho * x[(t-1)] + eps[t] # add autocorr effects

dat <- data.frame(time = 1:n_step, biomass = x)

################ end sim
