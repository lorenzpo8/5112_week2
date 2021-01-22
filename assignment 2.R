#UNABLE TO RUN PROGRAMS 



library(tidyverse)
library(haven)


read_csv2(IAHR2FL.dta)


#QUESTION 2 

q2_df <- IAHR52FL %>% select (hhid:hv208, hv270)
q2_df

# QUESTION 3
#cols jump from 44 - 201 || error finding columns evident in DF (ex. 107, 106)
# select vs gather

q3_df <- IAHR52FL %>% gather(hhid, hv003, hv107)

# QUESTION 4
# unsure of pattern example:
#   variables we need all follow a pattern like "haX_YZ", where X, Y, and Z
#       are single digits and X can take the value from 0 to 6 (both included)
female_q4 <- IAHR52FL %>% gather(hhid, hv219) 
female_q4
# how to specify hv219 value?
# select vs gather 
female_q41 <- IAHR52FL %>% select(hhid, hv219 == 2)

IAHR52FL %>% gather(hv219)

