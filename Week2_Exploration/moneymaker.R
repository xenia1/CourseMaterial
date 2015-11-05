# A simple example of the intuition behind PageRank

# Scenario: Alice is friends with Bob and Carol. 
# Bob is friends with Alice, Carol and Dave. 
# Carol is friends with Alice, Bob and Dave. Dave is friends with Alice and Carol

# Question to answer: Who is the most popular person given that popularity is defined
# as the weighted sum of the popularity of the people that call them a friend?

# Define the original none normalized friendship matrix.

nonNalicefv <- c(0,1,1,0)
nonNbobfv<- c(1,0,1,1)
nonNcarolfv<- c(1,1,0,1)
nonNdavefv<- c(1,0,1,0)

# Normalize each person's non-normalized friendship vector
# This takes into account that each person has more than one friend and we want
# each column to sum to one

alicefv <- nonNalicefv/sum(nonNalicefv)
bobfv   <- nonNbobfv/sum(nonNbobfv)
carolfv <- nonNcarolfv/sum(nonNcarolfv) 
davefv  <- nonNdavefv/sum(nonNdavefv)

# Column bind each individual's normalized friendship vectors into the 
# normalized friendship matrix

fm      <- cbind(alicefv, bobfv, carolfv, davefv)

# The function diag() creates a matrix with 1's on the diagonal
# The input into the function corresponds to the number of 1's on the diagonal and
# determines its dimensions. We subtract the identity matrix from r and 

# We need to subtract the identity matrix from the normalized friendship matrix fm
# described above and then we need to augment the matrix with a zero column vector
# We can then row reduce to find the popularity vector and determine who is the most popular

# Define the augmented matrix that we need to solve in order to get r. 

augfm<-cbind((fm-(diag(4))), c(0,0,0,0))

# We now have to row reduce using the pracma packadge function rref(). Make sure you load
# the packadge before you call the function

library("pracma", lib.loc="~/R/win-library/3.0")

# Use the rref() to obtain the weights for the popularity matrix and determine
# the most popular person

rref(augfm)

# Who is the most popular person? Recall: The popularity of a person is the weighted sum of 
# the popularity of the people that call that person a friend. 
# We can see from the output that Carol is the most popular person.
#     alicefv bobfv carolfv  davefv  
#[1,]       1     0       0 -1.5000 0
#[2,]       0     1       0 -1.3125 0
#[3,]       0     0       1 -1.6875 0
#[4,]       0     0       0  0.0000 0
