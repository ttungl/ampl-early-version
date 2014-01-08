# model
# network A and B have 4 nodes and 2 nodes, respectively.

set LongLinks;
set ShortLinks;
set TrafficDemands;

set TSD;
set PSD;

param tsd{TSD};
param psd{PSD};

param Wn {LongLinks} >=0;
param We {ShortLinks} >=0;
param Td {TrafficDemands} >=0;

param alpha{TSD, PSD} >=0;

param cost{LongLinks};

var x {LongLinks} >=0;

#Objective 
minimize Optimal_Cost: 
	sum {i in LongLinks} cost[i] * x[i];

#Constraints	
subject to long_links_const {i in LongLinks}: 
	sum {m in TSD, n in PSD} alpha[m,n]*prod{LongLinks}x[i] <= Wn[i];

subject to short_links_const {i in LongLinks, j in ShortLinks}:
	sum {m in TSD, n in PSD} alpha[m,n]*prod{LongLinks}x[i] <= We[j];

subject to traffic_demands_const {i in LongLinks, k in TrafficDemands}:
	sum {m in TSD, n in PSD} alpha[m,n]*prod{LongLinks}x[i] >= Td[k];

	