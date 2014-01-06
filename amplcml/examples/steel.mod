### File: steel-simple.mod
##var x1 >=1000, <= 6000;
##var x2 >=2000, <= 4000;
##maximize profit: 25*x1 + 30*x2;
##subject to time: (1/200)*x1 + (1/140)*x2 <= 40;
### here: 'profit' and 'time'
### are arbitrarily chosen names

### File: steel.mod

param n :=2;
param a {j in 1..n};
param b;
param c {j in 1..n};
param u {j in 1..n}; # Upper bound on production
param l {j in 1..n}; # Lower bound on production
var x {j in 1..n} <= u[j], >= l[j];
maximize profit: sum {j in 1..n} c[j] * x[j];
subject to time: sum {j in 1..n} (1/a[j]) * x[j] <= b;

## here: 'param' and 'var' are reserved keywords; 'profit' and 'time'
## are arbitrarily chosen names.
#----------



