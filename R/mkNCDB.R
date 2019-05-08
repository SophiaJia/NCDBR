#'Make NCDB R Binary
#'
#'Uses output of \code{pickFields()} to produce an R binary of the NCDB data.
#'@param df  Tibble returned by pickFields
#'@param ncdbHome  Location of NCDB fixed width format ASCII files.
#'@param outFile  Name of output file, which will placed in \code{ncdbHome}. 
#'@return  Tibble (big data file) saved as canc in \code{outFile}.
#'@note  Inspired by \code{mkSEER()} in \pkg{SEERaBomb}.
#'@examples
#' library(NCDBR)
#' d=getFields()
#' d=pickFields(d)
#' canc=mkNCDB(d)
#'@name mkNCDB
#'@export
#'@import tibble
#'@import stringi
#'@import LaF
#'@import dplyr
#'@import labelled

mkNCDB<-function(df,ncdbHome="~/data/NCDB",outFile="cancDef")  {
  # library(dplyr)
  # library(NCDBR)
  # d=getFields()
  # df=pickFields(d)
  # ncdbHome="~/data/NCDB"
  # outFile="cancDef"
  race=sex=age=casenum=histo3=nms=type=Levs=NULL
  outF=file.path(ncdbHome,paste0(outFile,".RData")) 
  files=dir(pattern="*.txt",path=ncdbHome,full.names=TRUE)
  DFL=vector(mode="list",length(files))
  cancer=sapply(strsplit(sapply(strsplit(files,split=".",fixed=T),function(x) x[1]),split="_"),function(x) x[2])
  names(DFL)=cancer
  # setwd(ncdbHome)
  ii=1
  # df%>%print(n=100)
  df=df%>%mutate(type=ifelse(nms%in%c("crow","surv"),"double",type))
  # require(LaF)
  # require(dplyr)
  for (f in files) {
    print(f)
    laf=LaF::laf_open_fwf(f,column_types=df$type, column_widths=df$width)
    DFL[[ii]]=tbl_df(laf[,which(df$names!=" ")])
    DFL[[ii]]$cancer=cancer[[ii]]
    ii=ii+1
  }
  DFL
  canc=bind_rows(DFL)
  y=df$nms[which(df$nms!=" ")] 
  colnames(canc)[1:length(y)]<-y[1:length(y)]
  canc
  # canc$surv=as.numeric(canc$surv)
  # canc$seqnum=as.numeric(canc$seqnum)
  table(canc$race)
  canc=canc%>%
    # mutate(race=cut(race,labels=c("White","Black","Other"),breaks=c(1,2,3,100), right=F))  %>%
    # mutate(Race=cut(race,labels=c("White","African American","Other","Unknown"),breaks=c(1,2,3,99,100), right=F))  %>%
    mutate(bwo=cut(race,labels=c("white","black","other"),breaks=c(1,2,3,100), right=F))  %>%
    mutate(mf=factor(sex,labels=c("male","female")))
  # mutate(Sex=factor(sex,labels=c("Male","Female")))
  canc
  snms=names(canc)
  x=df%>%filter(nms%in%snms)
  L=as.list(x$labs)
  names(L)=x$nms
  labelled::var_label(canc) <- L
 # canc
#     
  (facts=which(sapply(df$Levs,function(x) class(x)[1])=="tbl_df"))
  fnms=df$nms[facts]
  (fnms=setdiff(fnms,c("alive")))
  (fnmsL=paste0(fnms,"L"))
  (x=df%>%filter(nms%in%fnms)%>%select(nms,Levs))
  L=x$Levs
  names(L)=x$nms
  dcanc=as.data.frame(canc)
  factor(dcanc[,fnms[1]],levels=L[[1]]$n,labels=L[[1]]$val)
  for (i in 1:length(fnms)) canc[,fnmsL[i]]=factor(dcanc[,fnms[i]],levels=L[[i]]$n,labels=L[[i]]$val)
  sum(duplicated(canc$casenum)) # all unique 
  canc=canc%>%select(-casenum) # so remove casenum to save space
  save(canc,file=outF)
  cat("NCDB data has been written to: ",outF,"\n")
  
  # canc%>%filter(histo3==9673) #check 18,252 MCL
  # d=canc%>%filter(!is.na(surv))%>%select(-casenum) # rid of ~10% of cases due to missing survival time
  # head(d)      #drop missing survivals later to see if they correlate with e.g. crow
  # d=d%>%mutate(facLoc=ifelse(facLoc==1,"New England",
  #                            ifelse(facLoc==2,"Mid Altantic",
  #                                   ifelse(facLoc==3,"South Altantic",
  #                                          ifelse(facLoc==4,"East North Central",
  #                                                 ifelse(facLoc==5,"East South Central",
  #                                                        ifelse(facLoc==6,"West North Central",
  #                                                               ifelse(facLoc==7,"West South Central",
  #                                                                      ifelse(facLoc==8,"Mountain",
  #                                                                             ifelse(facLoc==9,"Pacific",NA))))))))))
  # 
  # d$facLoc=factor(d$facLoc,levels=c("New England","Mid Altantic","South Altantic","East North Central","East South Central",
  #                                   "West North Central","West South Central","Mountain","Pacific"))
 invisible(canc)
}
