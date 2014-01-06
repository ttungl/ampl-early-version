# AMPL model file for the General Cars Problem (WV-IMP Problem 5 Page 104-105)
# The LP is
#	min z = 400(2xt1 + xc1) + 600(2xt2 + xc2) + 150(st1 + sc1 + st2 + sc2)	(total cost)
#	s.t.	st1 = 100 + xt1 - 400						(month 1 truck inventory)
#		sc1 = 200 + xc1 - 800						(month 1 car inventory)
#		st2 = st1 + xt2 - 300						(month 2 truck inventory)
#		sc2 = sc1 + xc2 - 300						(month 2 car inventory)
#		2xt1 + xc1 <= 1500						(month 1 max steel)
#		2xt2 + xc2 <= 1500						(month 2 max steel)
#		xt1  + xc1 <= 1000						(month 1 max vehicles)
#		xt2  + xc2 <= 1000						(month 2 max vehicles)
#		10xt1 + 20xc1 >= 16(xt1 + xc1)					(month 1 min mpg)
#		10xt2 + 20Xc2 >= 16(xt2 + xc2)					(month 2 min mpg)
#		all vars >= 0							(non-negativity)

param n_v;				# number of vehicles; 2 here, truck-1, car-2
param m;	 			# number of months; 2 here
param start_inv   {1..n_v};		# starting inventory for car, truck
param demand      {1..n_v, 1..m};	# demand for each vehicle in each month
param steel_usage {1..n_v};		# tons of steel in car, truck
param cost_steel  {1..m};		# cost of steel in month 1, month 2
param cost_inv;				# inventory cost (assumed same for all vehicles in all months)
param max_steel   {1..m};		# maximum steel usage per month
param max_vehicles{1..m};		# maximum # vehicles per month
param mpg_vehicle {1..n_v}; 		# mpg per vehicle
param min_mpg;				# minimum mpg (assumed same for all months)


var x {1..n_v,1..m} >= 0;		# production
var s {1..n_v,0..m} >= 0;		# inventory, s[*,0] = starting inventories of all vehicles

minimize Total_Cost:  sum {v in 1..n_v, j in 1..m} (cost_steel[j]*steel_usage[v]*x[v,j] + cost_inv*s[v,j]);

subject to Inv_Balance  {v in 1..n_v, j in 1..m}: s[v,j] = s[v,j-1] + x[v,j] - demand[v,j];
subject to Starting_Inv {v in 1..n_v}: s[v,0] = start_inv[v];

subject to Max_Steel_Usage    	{j in 1..m}: sum {v in 1..n_v} steel_usage[v]*x[v,j] <= max_steel[j];
subject to Max_Vehicles_Month 	{j in 1..m}: sum {v in 1..n_v} x[v,j] <= max_vehicles[j];
subject to Minimum_mpg 		{j in 1..m}: sum {v in 1..n_v} (mpg_vehicle[v]*x[v,j])  >= min_mpg*(sum {v in 1..n_v} x[v,j]);
