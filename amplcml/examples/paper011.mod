# model: cost optimization Wireless NoC
# Tung Thanh Le 
# CACS - UL Lafayette
# email: ttungl@gmail.com
# Date: 12/20/13
# Modified: 01/02/14
# File name: paper011.mod
#
#----- Description -----
# minimize Cost_Chip: sum {i in 1..n} Cost[i]*X[i];
# subject to long_links: sum {T_sd in T_traffic, p in P_sd} (alpha * (prod {l[i] in p} X[n])) <= Wn;
# subject to short_links: sum {T_sd in T_traffic, p[n] in P_sd, e[k] in p[n]} (alpha * (prod {l[n] in p[n]} X[n])) <= We;
# subject to traffic_demands: sum {p[n] in P_sd} ( alpha * (multi {l[n] in p} X[n])) >= T_sd;
# subject to long_links_condition: 0 <= X[n] <= 1;
#

# parameters
param n;
param m;
set N := {1..n}; # number of wireless routers
set M := {1..m}; # number of paths from S-D.
set K := {1..k}; # number of variables.
set INF;

param information{N, INF};

param traffic_demand {N, M}; # traffic demand for each wireless router in each path of S-D.

param bandwidth_allocation {N, M}; # bandwidth allocation for each wireless router in each path of S-D.

# variables
var X {i in N} >=0;
var alpha {i in N} >0;

# formula
minimize Cost_Chip: sum {i in N} Cost[i]*X[i];
	# constraints
	subject to long_links {i in N, j in M}:  alpha[i]*(prod{k in K} )  




	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


