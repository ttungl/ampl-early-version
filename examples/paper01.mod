# model: cost optimization Wireless NoC
# Tung Thanh Le 
# CACS - UL Lafayette
# email: ttungl@gmail.com
# Date: 12/20/13

#----- Description -----
# minimize Cost_Chip: sum {n in 1..N} Cost[n]*X[n];
# subject to long_links: sum {T_sd in T_traffic, p in P_sd} (alpha * (prod {l[n] in p} X[n])) <= Wn;
# subject to short_links: sum {T_sd in T_traffic, p[n] in P_sd, e[k] in p[n]} (alpha * (prod {l[n] in p} X[n])) <= We;
# subject to traffic_demands: sum {p[n] in P_sd} ( alpha * (multi {l[n] in p} X[n])) >= T_sd;
# subject to long_links_condition: 0 <= X[n] <= 1;

# -- parameters
#param n;
param N;


# -- variables
var X {j in 1..N} >=0, <=1;
var alpha {j in 0..N} >=0;

# -- formula
minimize Cost_Chip: sum {n in 1..N} Cost[n]*X[n];
	subject to long_links: sum {T_sd in T_traffic, p[n] in P_sd} (alpha * (prod {l[n] in p} X[n])) <= Wn;
	subject to short_links: sum {T_sd in T_traffic, p[n] in P_sd, e[k] in p[n]} (alpha * (prod {l[n] in p[n]} X[n])) <= We;
	subject to traffic_demands: sum {p[n] in P_sd} ( alpha * (prod {l[n] in p[n]} X[n])) >= T_sd;
    