# Question : There are 2 parallel lines each containing 2 switches in series that are numbered 1,2,3,4
# The probability of closing each switch is given. Find the probability of current flowing through this
# line.

# --------1/------2/--------
# |                       |
# |                       |  
# |                       |
# --------3/------4/--------

# The above is the circuit diagram

p1<-0.2
p2<-0.3
p3<-0.4
p4<-0.5

# The circuit will work only if 1 and 2 are closed or 3 and 4 are closed
# let ^ be intersection and v be union 
# P(current flow) = P((1^2) v (3^4)) = P(1^2) + P(3^4) - P(1^2^3^4)

p <- p1*p2 + p3*p4 - p1*p2*p3*p4
print(p)
