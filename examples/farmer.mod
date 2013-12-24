# Farmer Jones' decision

set Crops;

param Yield		{j in Crops};
param Labor		{j in Crops};
param Price		{j in Crops}; 
param Min_Crop	{j in Crops};
param Max_Acres;
param Max_Hours;

var x {j in Crops} >=0;

maximize total_revenue: sum {j in Crops} Price[j] * Yield[j] * x[j];

subject to land_constraint: sum {j in Crops} x[j] <= Max_Acres;
subject to labor_constraint: sum {j in Crops} Labor[j] * x[j] <= Max_Hours;
subject to min_crop_constraint {j in Crops}: Yield[j] * x[j] >= Min_Crop[j];



