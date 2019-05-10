#' Get Field Info in SAS File
#' 
#' The NCDB data comes with a .sas file that helps SAS users. Here \code{getFields()} parses that 
#' .sas file to create a tibble with information about field start and stop postions and factor levels.
#' This tibble is then the input into \code{pickFields()}.  

#'@param year  year of NCDB data files (only 2016 supported)

#'@return  
#' Tibble with short names (\code{nms}, which contain lower case letters if shortened), 
#' medium-sized names (\code{names}, all caps, default in .sas file), long names [\code{labs}, which get mapped to 
#' column object attributes in the output of \code{mkNCDB()}], and a list column \code{Levs} where factor rows contain tibbles  
#' whose n column holds factor numbers and val column holds string labels to which they map.

#'@note   The 2013 sas file needed manual editing to remove foreign characters at lines
#'548, 660-662, and  698.  Use library(tools); showNonASCIIfile() to nonascii of 2016 file.
#'Fixed versions are in the \file{extdata} folder.
#'Inspired by a function of the same name in \pkg{SEERaBomb}.

#'@examples
#' \dontrun{
#' library(NCDBR) 
#' getFields() }
#'@export
#'@name getFields

getFields<-function(year=2016){
  # year=2016
  # year=2013
  if (year==2016) {
  sas=readLines(system.file("extdata", "NCDB_PUF_Labels_2016fixed.sas", package = "NCDBR")) 
  top=8  
  } else {
  sas=readLines(system.file("extdata", "NCDB_PUF_Labels_2013fixed.sas", package = "NCDBR"))
  top=20  
  }
  # sas=readLines(system.file("extdata", "NCDB_PUF_Labels_2013.sas", package = "NCDBR")) #to see rows causing probs
  nS=sas[top] #n in a String
  nS=stringi::stri_extract_last_regex(nS, "[0-9]+")
  # (nS=stringi::stri_extract_first_regex(nS, "[0-9]+\\;$"))
  (n=as.numeric(nS))
  # sas=sas[-c(1:21)]
  (k=max(grep(nS,sas))) #you must manually remove ~5 invalid locales from the .sas file
  if (year==2016) sa=sas[11:k] else sa=sas[22:k] 
  # sa=sas[1:k]
  type=rep("integer",length(sa))
  type[grep("$",sa,fixed=T)]="string"
  sa=sub("$","",sa,fixed=T)
  sa=sub(";","",sa,fixed=T)
  sa=sub("  "," ",sa,fixed=T)
  sa=sub("  "," ",sa,fixed=T)
  L=strsplit(sa,split=" ")
  names=sapply(L,function(x) x[1]) #long but not super long
  nums=sapply(L,function(x) x[2])
  nL=strsplit(nums,split="-")
  n1=as.numeric(sapply(nL,function(x) x[1]))
  n2=as.numeric(sapply(nL,function(x) x[2]))
  lens=n2-n1+1
  sum(lens)
  # now get labels of columns
  (kStrt=min(grep("LABEL",sas)))
  (kEnd=min(grep("RUN;",sas)))
  (labs=sas[(kStrt+1):(kEnd-1)]) #labels are super long names
  L=strsplit(labs,split="=",fixed=T)
  labs=sapply(L,function(x) x[2])
  labs=gsub("'","",labs)
  labs=gsub(";","",labs)
  
  # next lets get the levels of factors
  (ks=grep("COMMENT PUF Data Item Name",sas))
  strt=ks+2
  (kEnd=grep("RUN",sas)[3])
  # (kEnd=grep("PROC FREQ",sas))
  if (year==2013) ends=c(ks[-1]-1,kEnd-1) else  ends=c(ks[-1]-1,kEnd-2)
  cbind(ks,strt,ends)
  # clean up some stuff in advance
  N=length(strt)
  sas[strt[1]:ends[N]] 
  sas[strt[1]:ends[N]]=gsub("' ","",sas[strt[1]:ends[N]],fixed=T)
  sas[strt[1]:ends[N]]=gsub("'","",sas[strt[1]:ends[N]],fixed=T)
  sas[strt[1]:ends[N]]=gsub("; ","",sas[strt[1]:ends[N]],fixed=T)
  sas[strt[1]:ends[N]]=gsub(";","",sas[strt[1]:ends[N]],fixed=T)
  sas[strt[1]:ends[N]]=gsub("/","_",sas[strt[1]:ends[N]],fixed=T)
  sas[strt[1]:ends[N]]
  
  
  
  fnms=sas[ks]
  fnms=gsub("COMMENT PUF Data Item Name","",fnms)
  # fnms=gsub("; ","",fnms,fixed=T)
  fnms=gsub(";","",fnms,fixed=T) # one before start still needs cleaning
  fnms=gsub("s","",fnms)
  fnms=gsub(":","",fnms,fixed=T)
  fnms=gsub(",","",fnms,fixed=T)
  fnms=gsub("RXHOSP","RX_HOSP",fnms,fixed=T)
  fnms=gsub("2010 ","2010",fnms,fixed=T)
  fnms=gsub("TREATMENT STATUS","TREATMENT_STATUS",fnms,fixed=T)
  fnms=sub(" ","",fnms) #at this point remaining spaces imply two factors with same levels
  (k=which(grepl(" ",fnms))) # locations of doublets
  L=strsplit(fnms[k],split=" ")
  firsts=sapply(L, function(x) x[1])
  secs=sapply(L, function(x) x[2])
  fnms[k]=firsts
  if (year==2013){
  (fnmS=c(fnms[1:k[1]],secs[1],fnms[(k[1]+1):k[2]],secs[2],fnms[k[2]+1],secs[3],
          fnms[k[3]+1],secs[4],fnms[(k[4]+1):k[5]],secs[5],fnms[(k[5]+1):length(fnms)]))
  } else
  (fnmS=c(fnms[1:k[1]],secs[1],fnms[(k[1]+1):k[2]],secs[2],fnms[k[2]+1],secs[3],
          fnms[k[3]+1],secs[4],fnms[(k[4]+1):k[5]],secs[5],fnms[(k[5]+1):k[6]],
          fnms[k[6]+1],secs[7],fnms[(k[7]+1):k[8]],secs[8],fnms[(k[8]+1):k[9]],
          fnms[k[9]+1],secs[10],fnms[(k[10]+1):k[11]],secs[11],fnms[(k[11]+1):length(fnms)]))
  
  fnmS[k+0:(length(k)-1)]
  setdiff(fnmS,names) #all there, check
  #now get the factor level strings and place into lists
  
  levs=vector(mode="list",length=length(strt))
  names(levs)=fnms
  # end=0
  options(warn=-1)
  for (i in 1:N){
    str=strt[i]
    end=ends[i]
    if(fnms[i]=="RX_SUMM_SURGICAL_MARGINS") end=end-12  #12 line comment needs to be deleted
    if(fnms[i]=="TNM_EDITION_NUMBER") end=str+5  #12 line comment needs to be deleted
    l=strsplit(sas[str:end],split="=")
    # levs[[i]]=data.frame(n=sapply(l,function(x) as.numeric(x[1])),val=sapply(l,function(x) x[2]))
    levs[[i]]=tibble::tibble(n=sapply(l,function(x) as.numeric(x[1])),val=sapply(l,function(x) x[2]))
    levs[[i]]=levs[[i]][stats::complete.cases(levs[[i]]),]  
  }
  options(warn=0)
  levs
  for (i in 1:length(k)) levs[[secs[i]]]=levs[[firsts[i]]]
  levs=levs[fnmS] # reorder to place in order of the SAS file
  # levs[["RX_SUMM_SURGICAL_MARGINS"]]
  # levs[["TNM_EDITION_NUMBER"]]
  # levs$RACE%>%print(n=100)
  # levs$RAD_BOOST_RX_MODALITY%>%print(n=100)
  
  
  # head(sort(sapply(levs,function(x) dim(x)[1])),20) #find and zap out useless mappings
  levs[fnmS%in%c("DIAGNOSTIC_CONFIRMATION", #nothing there so don't make an 0x2 tibble
                       "YEAR_OF_DIAGNOSIS",   #one level = unknown, so don't make a 1x2 tibble
                       "AGE",   #we don't want to set this to a factor, so zap it
                       "DX_LASTCONTACT_DEATH_MONTHS")]=NA  #one level = unknown, so don't make a 1x2 tibble
  levNms=names(levs) #ones to map
  Levs=vector(mode="list",length=length(names)) #big full length Levs
  names(Levs)=names
  for (i in names) {
    Levs[[i]]=NA
    if (i%in%levNms) Levs[[i]]=levs[[i]]
  }
  Levs
  #nms are short, for use as model variables in R, and match those in SEERaBomb where possible  
  nms=gsub("PUF_CASE_ID","casenum",names,fixed=T) 
  nms=gsub("PUF_FACILITY_ID","facID",nms,fixed=T) 
  nms=gsub("FACILITY_TYPE_CD","fac",nms,fixed=T) 
  nms=gsub("FACILITY_LOCATION_CD","facLoc",nms,fixed=T) 
  nms=gsub("^AGE","agedx",nms)
  nms=gsub("SEX","sex",nms,fixed=T)
  nms=gsub("RACE","race",nms,fixed=T)
  nms=gsub("INSURANCE_STATUS","ins",nms,fixed=T)
  nms=gsub("MED_INC_QUAR_00","inc00",nms,fixed=T)
  nms=gsub("NO_HSD_QUAR_00","educ00",nms,fixed=T)
  nms=gsub("UR_CD_03","urban03",nms,fixed=T)
  nms=gsub("MED_INC_QUAR_12","inc",nms,fixed=T)
  nms=gsub("NO_HSD_QUAR_12","educ",nms,fixed=T)
  nms=gsub("UR_CD_13","urban",nms,fixed=T)
  nms=gsub("CROWFLY","crow",nms,fixed=T)
  # nms=gsub("CDCC_TOTAL","charlson",nms,fixed=T)
  nms=gsub("CDCC_TOTAL_BEST","charlson",nms,fixed=T)
  nms=gsub("SEQUENCE_NUMBER","seqnum",nms,fixed=T)
  nms=gsub("CLASS_OF_CASE","CoC",nms,fixed=T)
  nms=gsub("YEAR_OF_DIAGNOSIS","yrdx",nms,fixed=T)
  nms=gsub("PRIMARY_SITE","icdo3",nms,fixed=T)
  nms=gsub("HISTOLOGY","histo3",nms,fixed=T)
  nms=gsub("BEHAVIOR","behav",nms,fixed=T)
  nms=gsub("GRADE","grade",nms,fixed=T)
  nms=gsub("TUMOR_SIZE_SUMMARY","sizeSum",nms,fixed=T)
  nms=gsub("TUMOR_SIZE","size",nms,fixed=T)
  nms=gsub("REGIONAL_NODES_POSITIVE","ndPos",nms,fixed=T) #want negative
  nms=gsub("TNM_CLIN_T","tnmCt",nms,fixed=T)
  nms=gsub("TNM_CLIN_N","tnmCn",nms,fixed=T)
  nms=gsub("TNM_CLIN_M","tnmCm",nms,fixed=T)
  nms=gsub("TNM_CLIN_STAGE_GROUP","stageC",nms,fixed=T)
  nms=gsub("TNM_PATH_T","tnmPt",nms,fixed=T)
  nms=gsub("TNM_PATH_N","tnmPn",nms,fixed=T)
  nms=gsub("TNM_PATH_M","tnmPm",nms,fixed=T)
  nms=gsub("TNM_PATH_STAGE_GROUP","stageP",nms,fixed=T)
  nms=gsub("DX_RX_STARTED_DAYS","d2t",nms,fixed=T)
  nms=gsub("DX_SURG_STARTED_DAYS","d2surg",nms,fixed=T)
  nms=gsub("DX_RAD_STARTED_DAYS","d2r",nms,fixed=T)
  nms=gsub("RX_SUMM_RADIATION","radiatn",nms,fixed=T)
  nms=gsub("DX_SYSTEMIC_STARTED_DAYS","d2sys",nms,fixed=T)
  nms=gsub("DX_CHEMO_STARTED_DAYS","d2c",nms,fixed=T)
  nms=gsub("RX_SUMM_CHEMO","chemo",nms,fixed=T)
  nms=gsub("DX_HORMONE_STARTED_DAYS","d2h",nms,fixed=T)
  nms=gsub("RX_SUMM_HORMONE","hormo",nms,fixed=T)
  nms=gsub("DX_IMMUNO_STARTED_DAYS","d2i",nms,fixed=T)
  nms=gsub("RX_SUMM_IMMUNOTHERAPY","immuno",nms,fixed=T)
  nms=gsub("RX_SUMM_TRNSPLNT_ENDO","hct",nms,fixed=T)
  nms=gsub("DX_OTHER_STARTED_DAYS","d2o",nms,fixed=T)
  nms=gsub("RX_SUMM_OTHER","other",nms,fixed=T)
  nms=gsub("PUF_30_DAY_MORT_CD","mort30",nms,fixed=T)
  nms=gsub("DX_LASTCONTACT_DEATH_MONTHS","surv",nms,fixed=T)
  nms=gsub("PUF_VITAL_STATUS","alive",nms,fixed=T)
  # data.frame(start=n1,width=lens,names,nms,type,labs,stringsAsFactors=F)
  tibble::tibble(start=n1,width=lens,names,nms,type,labs,Levs)
}

