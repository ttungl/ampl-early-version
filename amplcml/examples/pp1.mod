# model

# parameters
param tsd; 	# num of traffic demand from source nodes
param psd; 	# num of paths from source to destination
param l_n;	# num of long links
param e_m;  # num of short links
param W_n{1..psd};	# bandwidth capacity of long link l_n (non-uniform)
param W_e{1..e_m};	# bandwidth capacity of short link e_m (uniform)
param T_d{1..psd};	# traffic demand from source to destination

param Cost{1..l_n}; # the cost of long links in the network
param alpha{1..tsd, 1..psd};

# variables
var x {1..l_n} >=0;

# formula
minimize Optimal_cost: sum{i in 1..l_n} Cost[i]*x[i]; 

# constraints
	subject to Long_Links {k in 1..psd}: sum{i in 1..l_n, t in 1..tsd} alpha[t,k]*x[i] <= W_n[k];
	subject to Short_Links {j in 1..e_m}: sum{i in 1..l_n, t in 1..tsd, k in 1..psd} alpha[t,k]*x[i] <= W_e[j];
	subject to Traffic_Demands {k in 1..psd}: sum{i in 1..l_n, t in 1..tsd} alpha[t,k]*x[i] >= T_d[k]; 

## end of file	


##############
#subject to Long_Links {k in 1..psd}: sum{t in 1..tsd} alpha[t,k]*(prod{i in 1..l_n}x[i]) <= W_n[k];
#	subject to Short_Links {j in 1..e_m}: sum{t in 1..tsd, k in 1..psd} alpha[t,k]*(prod{i in 1..l_n}x[i]) <= W_e[j];
#	subject to Traffic_Demands {k in 1..psd}: sum{t in 1..tsd} alpha[t,k]*(prod{i in 1..l_n}x[i]) >= T_d[k]; 