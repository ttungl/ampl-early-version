# model
# network A and B have 4-core and 2-core, respectively.

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

minimize Optimal_Cost: 
	sum {i in LongLinks} cost[i] * x[i];
	
subject to long_links_const {i in LongLinks}: 
	sum {m in TSD, n in PSD} alpha[m,n] * x[i] <= Wn[i];

subject to short_links_const {i in LongLinks, j in ShortLinks}:
	sum {m in TSD, n in PSD} alpha[m,n] * x[i] <= We[j];

subject to traffic_demands_const {i in LongLinks, k in TrafficDemands}:
	sum {m in TSD, n in PSD} alpha[m,n]*x[i] >= Td[k];
	