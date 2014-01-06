### File: steel-simple.mod
var XB; 
var XC;
maximize profit: 25*XB + 30*XC;
subject to time: (1/200)*XB + (1/140)*XC <= 40;
subject to B_limit: 0<= XB <=6000;
subject to C_limit: 0<= XC <=4000;

### here: 'profit' and 'time'
### are arbitrarily chosen names



#--------
#set PROD;
#param rate {PROD} > 0;
#param avail >=0;
#param profit {PROD};
#param market {PROD} >=0;
#var Make {p in PROD} >=0, <= market[p];
#maximize Total_Profit: sum {p in PROD} profit[p] * Make[p] <= avail;
#subject to Time: sum {p in PROD} (1/rate[p]) * Make[p] <= avail;
 



