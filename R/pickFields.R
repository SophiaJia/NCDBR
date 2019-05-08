#'Picks Fields of Focus
#'
#'Takes the output of \code{getField()} and squashes down rows that are not of interest to prepare the 
#'tibble for use as the input to \code{mkNCDB()}.
#'@param d  Tibble produced by \code{getFields()}.
#'@param picks  Short names of fields you wish to keep. 
#'@return  Input dataframe with rows not wanted collapsed to strings. This output feeds into \code{mkNCDB()}.
#'@note  Inspired by a function of the same name in \pkg{SEERaBomb}.
#'@examples
#' library(NCDBR)
#' d=getFields()
#' pickFields(d)
#'@name pickFields
#'@export
#'
#'  
#'  

pickFields<-function(d,picks=c("casenum","facID","fac","facLoc","agedx","sex","race",
                               "ins","inc","educ","urban","crow","charlson","seqnum",
                               "CoC","yrdx","histo3","stage","d2t","radiatn","d2c",
                               "chemo","hct","surv","alive")    )  {
  # library(tidyverse)
  # library(NCDBR)
  # d=getFields()
  # head(d,3)
  nms=NULL #kill check warning that arises 3 line downs
  (nBytesP1=sum(d$width)+1)
  ncols=dim(d)[1] 
  d=d%>%filter(nms%in%picks)
  # rownames(d)<-d$nms
  # d=d[picks,]
  (N=length(picks)) # number of columns in our version of interest  
  # if("surv" %in% d$nms) d["surv","type"]="double"  # do this in mkNCDB
  # if("crow" %in% d$nms) d["crow","type"]="double"
  df=d[1,,drop=F] # assume casenum is always in picks
  for (i in 2:N) {
    # print(i)
    # i=25
    # dim(d)
    if (d$start[i]==(up<-d$start[i-1]+d$width[i-1]) ) 
      df=rbind(df,d[i,]) else {
        df=rbind(df,data.frame(start=up,width=(d$start[i]-up),names=" ",nms=" ",type="string",labs="",Levs=NA)) 
        df=rbind(df,d[i,])
      }
  }
  if ((up<-d$start[i]+d$width[i])<nBytesP1)
    df=rbind(df,data.frame(start=up,width=(nBytesP1-up),names=" ",nms=" ",type="string",labs="",Levs=NA)) 
  df
}
