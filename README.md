# NCDBR
Makes National Cancer Database (NCDB) R binaries.  To install it use:  
```
devtools::install_github("SophiaJia/NCDBR")
```

To set up NCDB data use in R, place the NCDB ASCII *.dat text file(s) in your ~/data/NCDB folder where ~ is your home directory.  These files are then converted into an R binary file as follows<br>
```
library(NCDBR)   #loads installed package NCDBR into memory 
d=getFields()    #gets wanted fields into a data frame
d=pickFields(d)  #picks a subset of the fields and defines their types
canc=mkNCDB(d)   #makes R binary file ~/data/NCDB/cancDef.Rdata
```

Check the NCDB data installation using 
```
load("~/data/NCDB/cancDef.RData")#loads data.frame canc into memory 
head(canc,3)                     #returns top 3 rows of canc
``` 
