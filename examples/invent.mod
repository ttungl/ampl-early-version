# invent

#----- definition -----
param n;
param Demand {i in 1..n};
param Cost {i in 1..n};
param Store_Cost;
param Price;

#----- vars -----
var x {j in 1..n} >=0;
var s {j in 0..n} >=0;

#----- formula -----
minimize Net_cost: sum {k in 1..n} Cost[k]*x[k] + Store_Cost*(sum{j in 0..n-1} s[j]) - Price*s[n];
	subject to inventory_balance {i in 1..n}: s[i]=x[i] + s[i-1]-Demand[i];
	subject to set_initial_inventory: s[0] = 0;

