***NCDB 2013 Participant Use File, 2004-2013 Diagnosis Years***
***For July 2015 and January 2016 RFA***;
***Import, Value, and Variable Labels***
***Written in SAS 9.4***;

COMMENT This program will import the flat PUF text file and assign value and variable labels;
*To use this script, modify the line in the SAS syntax that reads LIBNAME library 'Z:\MyData' 
so that the text 'Z:\MyData' instead contains the location in which you want the SAS labels library 
to be saved. Now modify the line that reads INFILE 'Z:\MyData\flatfilename.dat' so that Z:\MyData\ 
instead has the path file where your .dat file is saved, and the text flatfilename has the 
actual name of the .dat file.;


DM 'CLEAR LOG';
DM 'CLEAR OUTPUT';
LIBNAME library 'Z:\MyData';

DATA ncdb_puf;
INFILE 'Z:\MyData\flatfilename.dat' 
TRUNCOVER lrecl=389;
INPUT 
PUF_CASE_ID $ 1-37
PUF_FACILITY_ID $ 38-47
FACILITY_TYPE_CD  48-48
FACILITY_LOCATION_CD  49-49
AGE   50-52
SEX  53-53
RACE  54-55
SPANISH_HISPANIC_ORIGIN  56-56
INSURANCE_STATUS  57-58
MED_INC_QUAR_00  59-59
NO_HSD_QUAR_00  60-60
UR_CD_03  61-61
MED_INC_QUAR_12  62-62
NO_HSD_QUAR_12  63-63
UR_CD_13  64-64
CROWFLY  65-72
CDCC_TOTAL  73-74
SEQUENCE_NUMBER $ 75-76
CLASS_OF_CASE  77-78
YEAR_OF_DIAGNOSIS  79-82
PRIMARY_SITE $ 83-86
LATERALITY  87-87
HISTOLOGY  88-91
BEHAVIOR  92-92
GRADE  93-93
DIAGNOSTIC_CONFIRMATION  94-94
TUMOR_SIZE  95-97
REGIONAL_NODES_POSITIVE  98-99
REGIONAL_NODES_EXAMINED  100-101
DX_STAGING_PROC_DAYS  102-109
RX_SUMM_DXSTG_PROC  110-111
TNM_CLIN_T  $ 112-115
TNM_CLIN_N $ 116-119
TNM_CLIN_M $ 120-123
TNM_CLIN_STAGE_GROUP $ 124-127
TNM_PATH_T $ 128-131
TNM_PATH_N $ 132-135
TNM_PATH_M $ 136-139
TNM_PATH_STAGE_GROUP $ 140-143
TNM_EDITION_NUMBER  144-145
ANALYTIC_STAGE_GROUP  146-146
CS_METS_AT_DX $ 147-148
CS_METS_EVAL $ 149-149
CS_EXTENSION $ 150-152
CS_TUMOR_SIZEEXT_EVAL $ 153-153
CS_METS_DX_BONE  154-154
CS_METS_DX_BRAIN  155-155
CS_METS_DX_LIVER  156-156
CS_METS_DX_LUNG  157-157
LYMPH_VASCULAR_INVASION  158-158
CS_SITESPECIFIC_FACTOR_1  159-161
CS_SITESPECIFIC_FACTOR_2  162-164
CS_SITESPECIFIC_FACTOR_3  165-167
CS_SITESPECIFIC_FACTOR_4  168-170
CS_SITESPECIFIC_FACTOR_5  171-173
CS_SITESPECIFIC_FACTOR_6  174-176
CS_SITESPECIFIC_FACTOR_7  177-179
CS_SITESPECIFIC_FACTOR_8  180-182
CS_SITESPECIFIC_FACTOR_9  183-185
CS_SITESPECIFIC_FACTOR_10  186-188
CS_SITESPECIFIC_FACTOR_11  189-191
CS_SITESPECIFIC_FACTOR_12  192-194
CS_SITESPECIFIC_FACTOR_13  195-197
CS_SITESPECIFIC_FACTOR_14  198-200
CS_SITESPECIFIC_FACTOR_15  201-203
CS_SITESPECIFIC_FACTOR_16  204-206
CS_SITESPECIFIC_FACTOR_17  207-209
CS_SITESPECIFIC_FACTOR_18  210-212
CS_SITESPECIFIC_FACTOR_19  213-215
CS_SITESPECIFIC_FACTOR_20  216-218
CS_SITESPECIFIC_FACTOR_21  219-221
CS_SITESPECIFIC_FACTOR_22  222-224
CS_SITESPECIFIC_FACTOR_23  225-227
CS_SITESPECIFIC_FACTOR_24  228-230
CS_SITESPECIFIC_FACTOR_25  231-233
CS_VERSION_LATEST  234-239
DX_RX_STARTED_DAYS  240-247
DX_SURG_STARTED_DAYS  248-255
DX_DEFSURG_STARTED_DAYS  256-263
RX_SUMM_SURG_PRIM_SITE   264-265
RX_HOSP_SURG_APPR_2010  266-266
RX_SUMM_SURGICAL_MARGINS  267-267
RX_SUMM_SCOPE_REG_LN_SUR  268-268
RX_SUMM_SURG_OTH_REGDIS  269-269
SURG_DISCHARGE_DAYS  270-277
READM_HOSP_30_DAYS  278-278
REASON_FOR_NO_SURGERY  279-279
DX_RAD_STARTED_DAYS  280-287
RX_SUMM_RADIATION  288-288
RAD_LOCATION_OF_RX   289-289
RAD_TREAT_VOL  290-291
RAD_REGIONAL_RX_MODALITY  292-293
RAD_REGIONAL_DOSE_CGY  294-298
RAD_BOOST_RX_MODALITY  299-300
RAD_BOOST_DOSE_CGY  301-305
RAD_NUM_TREAT_VOL  306-308
RX_SUMM_SURGRAD_SEQ  309-309
RAD_ELAPSED_RX_DAYS  310-312
REASON_FOR_NO_RADIATION  313-313
DX_SYSTEMIC_STARTED_DAYS  314-321
DX_CHEMO_STARTED_DAYS  322-329
RX_SUMM_CHEMO  330-331
DX_HORMONE_STARTED_DAYS  332-339
RX_SUMM_HORMONE  340-341
DX_IMMUNO_STARTED_DAYS  342-349
RX_SUMM_IMMUNOTHERAPY   350-351
RX_SUMM_TRNSPLNT_ENDO   352-353
RX_SUMM_SYSTEMIC_SUR_SEQ  354-354
DX_OTHER_STARTED_DAYS  355-362
RX_SUMM_OTHER  363-363
PALLIATIVE_CARE  364-364
RX_SUMM_TREATMENT_STATUS  365-365
PUF_30_DAY_MORT_CD  366-366
PUF_90_DAY_MORT_CD  367-367
DX_LASTCONTACT_DEATH_MONTHS  368-375
PUF_VITAL_STATUS  376-376
RX_HOSP_SURG_PRIM_SITE  377-378
RX_HOSP_CHEMO  379-380
RX_HOSP_IMMUNOTHERAPY  381-382
RX_HOSP_HORMONE  383-384
RX_HOSP_OTHER  385-386
PUF_MULT_SOURCE 387-387
REFERENCE_DATE_FLAG 388-388
RX_SUMM_SCOPE_REG_LN_2012  389-389;

LABEL 
PUF_CASE_ID='Case Key'
PUF_FACILITY_ID='Facility Key'
FACILITY_TYPE_CD='Facility Type'
FACILITY_LOCATION_CD='Facility Location'
AGE='Age at Diagnosis'
SEX='Sex'
RACE='Race'
SPANISH_HISPANIC_ORIGIN='Spanish Hispanic Origin'
INSURANCE_STATUS='Primary Payor'
MED_INC_QUAR_00='Median Income Quartiles 2000'
NO_HSD_QUAR_00='Percent No High School Degree Quartiles 2000'
UR_CD_03='Urban/Rural 2003'
MED_INC_QUAR_12='Median Income Quartiles 2008-2012'
NO_HSD_QUAR_12='Percent No High School Degree 2008-2012'
UR_CD_13='Urban/Rural 2013'
CROWFLY='Great Circle Distance'
CDCC_TOTAL='Charlson-Deyo Score'
SEQUENCE_NUMBER='Sequence Number'
CLASS_OF_CASE='Class of Case'
YEAR_OF_DIAGNOSIS='Year of Diagnosis'
PRIMARY_SITE='Primary Site'
LATERALITY='Laterality'
HISTOLOGY='Histology'
BEHAVIOR='Behavior'
GRADE='Grade'
DIAGNOSTIC_CONFIRMATION='Diagnostic Confirmation'
TUMOR_SIZE='Size of Tumor'
REGIONAL_NODES_EXAMINED='Regional Lymph Nodes Examined'
REGIONAL_NODES_POSITIVE='Regional Lymph Nodes Positive'
DX_STAGING_PROC_DAYS='Surgical Dx and Staging Procedure, Days from Dx'
RX_SUMM_DXSTG_PROC='Diagnostic and Staging Procedure'
TNM_CLIN_T='AJCC Clinical T'
TNM_CLIN_N='AJCC Clinical N'
TNM_CLIN_M='AJCC Clinical M'
TNM_CLIN_STAGE_GROUP='AJCC Clinical Stage Group'
TNM_PATH_T='AJCC Pathologic T'
TNM_PATH_N='AJCC Pathologic N'
TNM_PATH_M='AJCC Pathologic M'
TNM_PATH_STAGE_GROUP='AJCC Pathologic Stage Group'
TNM_EDITION_NUMBER='TNM Edition Number'
ANALYTIC_STAGE_GROUP='AJCC Analytic Stage Group'
CS_METS_AT_DX='Collaborative Stage Metastasis at Diagnosis'
CS_METS_EVAL='Collaborative Stage Metastasis Clinical/Pathological Prefix'
CS_EXTENSION='Collaborative Stage Tumor Extension'
CS_TUMOR_SIZEEXT_EVAL='Collaborative Stage Tumor Size Clinical/Pathological Prefix'
CS_METS_DX_BONE='Metastatic Bone Involvement'
CS_METS_DX_BRAIN='Metatstatic Brain Involvement'
CS_METS_DX_LIVER='Metastatic Liver Involvement'
CS_METS_DX_LUNG='Metastatic Lung Involvement'
LYMPH_VASCULAR_INVASION='Lymph Vascular Invasion'
CS_SITESPECIFIC_FACTOR_1='CS Site Specific Factor 1'
CS_SITESPECIFIC_FACTOR_2='CS Site Specific Factor 2'
CS_SITESPECIFIC_FACTOR_3='CS Site Specific Factor 3'
CS_SITESPECIFIC_FACTOR_4='CS Site Specific Factor 4'
CS_SITESPECIFIC_FACTOR_5='CS Site Specific Factor 5'
CS_SITESPECIFIC_FACTOR_6='CS Site Specific Factor 6'
CS_SITESPECIFIC_FACTOR_7='CS Site Specific Factor 7'
CS_SITESPECIFIC_FACTOR_8='CS Site Specific Factor 8'
CS_SITESPECIFIC_FACTOR_9='CS Site Specific Factor 9'
CS_SITESPECIFIC_FACTOR_10='CS Site Specific Factor 10'
CS_SITESPECIFIC_FACTOR_11='CS Site Specific Factor 11'
CS_SITESPECIFIC_FACTOR_12='CS Site Specific Factor 12'
CS_SITESPECIFIC_FACTOR_13='CS Site Specific Factor 13'
CS_SITESPECIFIC_FACTOR_14='CS Site Specific Factor 14'
CS_SITESPECIFIC_FACTOR_15='CS Site Specific Factor 15'
CS_SITESPECIFIC_FACTOR_16='CS Site Specific Factor 16'
CS_SITESPECIFIC_FACTOR_17='CS Site Specific Factor 17'
CS_SITESPECIFIC_FACTOR_18='CS Site Specific Factor 18'
CS_SITESPECIFIC_FACTOR_19='CS Site Specific Factor 19'
CS_SITESPECIFIC_FACTOR_20='CS Site Specific Factor 20'
CS_SITESPECIFIC_FACTOR_21='CS Site Specific Factor 21'
CS_SITESPECIFIC_FACTOR_22='CS Site Specific Factor 22'
CS_SITESPECIFIC_FACTOR_23='CS Site Specific Factor 23'
CS_SITESPECIFIC_FACTOR_24='CS Site Specific Factor 24'
CS_SITESPECIFIC_FACTOR_25='CS Site Specific Factor 25'
CS_VERSION_LATEST='CS Version Number'
DX_RX_STARTED_DAYS='Treatment Started, Days from Diagnosis'
DX_SURG_STARTED_DAYS='First Surgical Procedure, Days from Dx'
DX_DEFSURG_STARTED_DAYS='Definitive Surgical Procedure, Days from Dx'
RX_SUMM_SURG_PRIM_SITE='Surgical Procedure of Primary Site at any CoC Facility'
RX_HOSP_SURG_APPR_2010='Surgical Approach at this Facility'
RX_SUMM_SURGICAL_MARGINS='Surgical Margins Status at any CoC Facility'
RX_SUMM_SCOPE_REG_LN_SUR='Regional Lymph Node Surgery at any CoC Facility'
RX_SUMM_SURG_OTH_REGDIS='Surgery Other Site at any CoC Facility'
SURG_DISCHARGE_DAYS='Surgical Inpatient Stay, Days from Surgery'
READM_HOSP_30_DAYS='Readmission Within 30 Days of Surgical Discharge'
REASON_FOR_NO_SURGERY='Reason For No Surgery'
RX_SUMM_RADIATION='Radiation Therapy at any CoC Facility'
DX_RAD_STARTED_DAYS='Radiation, Days from Dx'
RAD_LOCATION_OF_RX='Location of Radiation Therapy'
RAD_TREAT_VOL='Radiation Treatment Volume'
RAD_REGIONAL_RX_MODALITY='Regional Treatment Modality'
RAD_REGIONAL_DOSE_CGY='Regional Dose'
RAD_BOOST_RX_MODALITY='Boost Treatment Modality'
RAD_BOOST_DOSE_CGY='Boost Dose'
RAD_NUM_TREAT_VOL='Number of Treatments to this Volume'
RX_SUMM_SURGRAD_SEQ='Radiation Surgery Sequence at any CoC Facility'
RAD_ELAPSED_RX_DAYS='Radiation Ended, Days from Start of Radiation'
REASON_FOR_NO_RADIATION='Reason For No Radiation'
DX_SYSTEMIC_STARTED_DAYS='Systemic, Days from Dx'
DX_CHEMO_STARTED_DAYS='Chemotherapy, Days from Dx'
RX_SUMM_CHEMO='Chemotherapy at any CoC Facility'
DX_HORMONE_STARTED_DAYS='Hormone Therapy, Days from Dx'
RX_SUMM_HORMONE='Hormone Therapy at any CoC Facility'
DX_IMMUNO_STARTED_DAYS='Immunotherapy, Days from Dx'
RX_SUMM_IMMUNOTHERAPY='Immunotherapy at any CoC Facility'
RX_SUMM_TRNSPLNT_ENDO='Hematologic Transplant and Endocrine Procedures at any CoC Facility'
RX_SUMM_SYSTEMIC_SUR_SEQ='Systemic/Surgery Sequence'
DX_OTHER_STARTED_DAYS='Other Treatment, Days from Dx'
RX_SUMM_OTHER='Other Treatment at any CoC Facility'
PALLIATIVE_CARE='Palliative Care'
RX_SUMM_TREATMENT_STATUS='Received Treatment or Active Surveillance'
PUF_30_DAY_MORT_CD='30 Day Mortality'
PUF_90_DAY_MORT_CD='90 Day Mortality'
DX_LASTCONTACT_DEATH_MONTHS='Last Contact or Death, Months from Dx'
PUF_VITAL_STATUS='Vital Status'
RX_HOSP_SURG_PRIM_SITE='Surgery of Primary Site at this Facility'
RX_HOSP_CHEMO='Chemotherapy at this Facility'
RX_HOSP_IMMUNOTHERAPY='Immunotherapy at this Facility'
RX_HOSP_HORMONE='Hormone Rx at this Facility'
RX_HOSP_OTHER='Other Rx at this Facility'
PUF_MULT_SOURCE='Patient Treated in > 1 CoC Facility?'
REFERENCE_DATE_FLAG='Reference Date Flag'
RX_SUMM_SCOPE_REG_LN_2012='Regional Lymph Node Surgery at any CoC Facility, Dx Years 2012+';
RUN;


*************************************************************************************************************************
Value Label Library

Values for Collaborative Stage Site Specific Factors 1-25 Vary by Cancer Site
Refer to the Collaborative Stage Website to obtain the Site Specific Factor Values for each cancer site

https://cancerstaging.org/cstage/schema/Pages/version0205.aspx

Values for the diagnostic_confirmation variable are different for solid tumors as compared to 
hematopoietic and lymphoid tumors.  Refer to the data dictionary for the code values.

http://ncdbpuf.facs.org/?q=content/diagnostic-confirmation


*************************************************************************************************************************;
PROC FORMAT LIBRARY=library;
COMMENT PUF Data Item Name: FACILITY_TYPE_CD;
VALUE ffacility
1='Community Cancer Program'
2='Comprehensive Community Cancer Program'
3='Academic/Research Program'
4='Integrated Network Cancer Program'
9='Other specified types of cancer programs';
COMMENT PUF Data Item Name: FACILITY_LOCATION_CD;
VALUE ffac_location
1='New England' 
2='Middle Atlantic' 
3='South Atlantic' 
4='East North Central' 
5='East South Central'
6='West North Central' 
7='West South Central' 
8='Mountain' 
9='Pacific' 
0='Out of US';
COMMENT PUF Data Item Name: AGE; 
VALUE fage
0='< age 1' 
999='Age unknown';
COMMENT PUF Data Item Name: RACE;
VALUE frace 
1='White'
2='Black' 
3='American Indian, Aleutian, or Eskimo' 
4='Chinese'
5='Japanese' 
6='Filipino' 
7='Hawaiian' 
8='Korean' 
10='Vietnamese' 
11='Laotian' 
12='Hmong' 
13='Kampuchean' 
14='Thai' 
15='Asian Indian or Pakistani'
16='Asian Indian'
17='Pakistani'
20='Micronesian, NOS'
21='Chamorran' 
22='Guamanian, NOS' 
25='Polynesian, NOS' 
26='Tahitian' 
27='Samoan'
28='Tongan' 
30='Melanesian, NOS' 
31='Fiji Islander' 
32='New Guinean' 
96='Other Asian, including Asian, NOS and Oriental, NOS'
97='Pacific Islander, NOS' 
98='Other' 
99='Unknown';
COMMENT PUF Data Item Name: SEX;
VALUE fsex 	
1='Male'
2='Female' 
3='Other/Hermaphrodite' 
4='Transsexual' 
9='Not stated in patient record';
COMMENT PUF Data Item Name: INSURANCE_STATUS;
VALUE finsurance	
0='Not Insured' 
1='Private Insurance' 
2='Medicaid'
3='Medicare'
4='Other Government'
9='Insurance Status Unknown';
COMMENT PUF Data Item Name: SPANISH_HISPANIC_ORIGIN;
VALUE fhispanic	
0='Non-Spanish; non-Hispanic' 
1='Mexican/Chicano' 
2='Puerto Rican' 
3='Cuban'
4='South or Central America' 
5='Other specified Spanish/Hispanic origin'
6='Spanish, NOS Hispanic, NOS Latino, NOS' 
7='Spanish surname only'
8='Dominican Republic' 
9='Unknown';
COMMENT PUF Data Item Name: MED_INC_QUAR_00;
VALUE F00Income	
1='< $30,000' 
2='$30,000 - $35,999' 
3='$36,000 - $45,999'
4='$46,000 +' 
.='Not Available';
COMMENT PUF Data Item Name: MED_INC_QUAR_12;
VALUE F12Income
1='<$38,000'
2='$38,000-$47,999'
3='$48,000-$62,999'
4='$63,000 +'
.='Not Available';
COMMENT PUF Data Item Name: NO_HSD_QUAR_00; 
VALUE F00hsd	
1='>=29%' 
2='20-28.9%' 
3='14-19.9%' 
4='< 14%'
.='Not Available';
COMMENT PUF Data Item Name: NO_HSD_QUAR_12;
VALUE F12hsd
1='>=21%'
2='13-20%'
3='7.0-12.9%'
4='<7%'
.='Not Available';
COMMENT PUF Data Item Name: UR_CD_03 UR_CD_13; 
VALUE fur03_cd	
1='Counties in metro areas of 1 million population or more'
2='Counties in metro areas of 250,000 to 1 million population'
3='Counties in metro areas of fewer than 250,000 population'
4='Urban population of 20,000 or more adjacent to a metro area'
5='Urban population of 20,000 or more not adjacent to a metro area'
6='Urban population of 2,500 to 19,999, adjacent to a metro area'
7='Urban population of 2,500 to 19,999, not adjacent to a metro area'
8='Completely rural or less than 2,500 urban population, adjacent to a metro area'
9='Completely rural or less than 2,500 urban population, not adjacent to a metro area'
.='Not Available';
COMMENT PUF Data Item Name: CLASS_OF_CASE;
VALUE fclass
0='Dx at reporting facility, all treatment decisions done elsewhere'
10='Dx and part or all of 1st course treatment or a decision not to treat was at the reporting facility, NOS'
11='Dx in staff physician"s office and part of 1st course treatment at the reporting facility'
12='Dx in a staff physician"s office and all of 1st course treatment at the reporting facility'
13='Dx and part of first course Rx at reporting facility, part of first course treatment elsewhere'
14='Dx at reporting facility and all first course treatment at the reporting facility'
20='Dx elsewhere and all or part of 1st course treatment or a decision not to treat at the reporting facility, NOS'
21='Dx elsewhere and part of 1st course treatment at the reporting facility part of first course treatment elsewhere'
22='Dx elsewhere and all of first course treatment or a decision not to treat at the reporting facility';
COMMENT PUF Data Item Name: YEAR_OF_DIAGNOSIS; 
VALUE fdxyear
9999='Year of diagnosis unknown';
COMMENT PUF Data Item Name: LATERALITY;
VALUE flat 
0='Organ is not considered to be a paired site'
1='Origin of primary is right'
2='Origin of primary is left'
3='Only one side involved, right or left origin not specified'
4='Bilateral involvement'
5='Paired site midline tumor'
9='Paired site, but lateral origin unknown, midline tumor';
COMMENT PUF Data Item Name: BEHAVIOR; 
VALUE fbeh
0='Benign'
1='Borderline'
2='In situ and/or carcinoma in situ'
3='Invasive';
COMMENT PUF Data Item Name: GRADE; 
VALUE fgrade
1='Well differentiated, differentiated, NOS'
2='Moderately differentiated, moderately well differentiated, intermediate differentiation'
3='Poorly differentiated'
4='Undifferentiated, anaplastic'
5='T cell T-precursor'
6='B cell, pre-B, B-precursor'
7='Null cell non T-non B'
8='NK (natural killer) cell'
9='Cell type not determined, not stated or not applicable, unknown primaries, high grade dysplasia';
COMMENT PUF Data Item Name: DIAGNOSTIC_CONFIRMATION;
COMMENT DIAGNOSTIC CONFIRMATION LABELS depend on type of tumor, solid or hematopoietic and lymphoid tumors.
COMMENT  Refer to the data dictionary for the code values. http://ncdbpuf.facs.org/?q=content/diagnostic-confirmation.
COMMENT PUF Data Item Name: TUMOR_SIZE;
VALUE ftumor
0='No mass or tumor found'
989='989 millimeters or larger'
990='Microscopic focus or foci only'
991='< 1 cm'
992='> 1 cm, < 2 cm'
993='> 2 cm, < 3 cm'
994='> 3 cm, < 4 cm'
995='> 4 cm, < 5 cm'
998='Tumor involvement of specified primaries'
999='Unknown, size not stated';
COMMENT PUF Data Item Name: REGIONAL_NODES_EXAMINED; 
VALUE fnodes_examined 
0='No nodes were examined'
90='90 or more nodes were examined'
95='No regional nodes were removed, but aspiration of regional nodes was performed'
96='Regional lymph node removal was documented as a sampling, and the number of nodes is unknown/not stated'
97='Regional lymph node removal was documented as a dissection, and the number of nodes is unknown/not stated'
98='Regional lymph nodes surgically removed but number not documented, not documented as sampling or dissection'
99='Unknown if regional nodes examined, not applicable for this site-histology combination';
COMMENT PUF Data Item Name: REGIONAL_NODES_POSITIVE; 
VALUE fnodes_positive
0='All nodes examined are negative'
90='90 or more nodes are positive'
95='Positive aspiration of lymph node(s) was performed'
97='Positive nodes are documented, but the number is unspecified'
98='No nodes were examined'
99='Unknown whether nodes are positive, not applicable, not stated in patient record';
COMMENT PUF Data Item Name: RX_SUMM_DXSTG_PROC;
VALUE fsdxstg
0='No surgical diagnostic or staging procedure was performed'
1='A biopsy was done to a site other than the primary'
2='A biopsy (incisional, needle, or aspiration) was done to the primary site'
3='A surgical exploration only'
4='A surgical procedure with a bypass was performed, but no biopsy was done'
5='An exploratory procedure was performed, and a biopsy of either the primary site or another site was done'
6='A bypass procedure was performed, and a biopsy of either the primary site or another site was done'
7='A procedure was done, but the type of procedure is unknown '
9='No information of whether a diagnostic or staging procedure was performed';
COMMENT PUF Data Item Name: TNM_EDITION_NUMBER;
VALUE ftnmedit
0='Not staged(cases that have AJCC staging scheme and staging was not done)'
5='Fifth Edition' 
6='Sixth Edition' 
7='Seventh Edition'
88='Not applicable (cases that do not have an AJCC staging scheme)'
99='Staged, but the edition is unknown, Prior to the 5th edition';
**ANALYTIC STAGE GROUP;
value fanalyticstg
0='Stage 0'
1='Stage I'
2='Stage II'
3='Stage III'
4='Stage IV'
5='Occult (lung only)'
8='AJCC Staging not applicable'
9='AJCC Stage group unknown';
***FOR PUF Data Items CS_METS_AT_DX, CS_METS_EVAL, CS_EXTENSION, CS_TUMOR_SIZEEXT_EVAL SEE COLLABORATIVE STAGE MANUAL;
**VALUES FOR CS_METS_DX_BONE CS_METS_DX_BRAIN CS_METS_DX_LIVER CS_METS_DX_LUNG;
Value CSMETSSITE 
0='None' 
1='Yes' 
8='Not Applicable' 
9='Unknown';
**PUF DATA Item: Lymph_vascular_invasion;
Value FLymph 
0='Not present' 
1='Present' 
8='Not applicable' 
9='Unknown';
COMMENT PUF Data Item Name: RX_HOSP_SURG_APPR_2010 ;
value fapproach 
0='No surgical procedure of primary site'
1='Robotic assisted' 
2='Robotic converted to open' 
3='Laparoscopic'
4='Laparoscopic converted to open'
5='Open or approach unspecified'
9='Unknown if surgery performed';
COMMENT PUF Data Item Name: RX_SUMM_SURGICAL_MARGINS;
VALUE fsurgmargin
0='No residual tumor All margins are grossly and microscopically negative' 
1='Residual tumor, NOS  Involvement is indicated, but not otherwise specified'
2='Microscopic residual tumor Cannot be seen by the naked eye'
3='Macroscopic residual tumor, Gross tumor of the primary site which is visible to the naked eye'
7='Margins not evaluable, Cannot be assessed (indeterminate)'
8='No primary site surgery, No surgical procedure of the primary site Diagnosed at autopsy'
9='Unknown or not applicable';
/* Scope of Regional Lymph Node Surgery:
Sentinel Lymph Nodes:  Data on Scope of Regional Lymph Node Surgery have been found to under-report 
Sentinel Lymph Node Biopsy. Revised coding rules and associated instructions were implemented for 
cases diagnosed January 1, 2012 and later, however CoC use of the item “Scope of Regional Lymph Node Surgery” 
is curtailed in all data years contained in this PUF. The item is used only to identify whether or not a 
patient underwent regional lymph node surgery, effectively removing any distinction between the type or extent 
of surgical intervention. For all sites, codes for this item are limited to 0, 1 and 9.
Starting with the January 2016 RFP, an expanded version of the Scope of Regional Lymph Node Surgery Variable,
called 'Scope of Regional Lymph Node Surgery 2012' is available starting with cases diagnosed in 2012 
through the most recent year available in the PUF. For more information and labels for the 
RX_SUMM_SCOPE_REG_LN_2012 item, please refer to the entry in the FORDS manual (NAACCR Item #1292): 
https://www.facs.org/quality-programs/cancer/ncdb/registrymanuals/cocmanuals/fordsmanual.*/
COMMENT PUF Data Item Name: RX_SUMM_SCOPE_REG_LN_SUR;
VALUE FRXSUMM_Scope_Reg_Ln_Surg
0 = 'No regional lymph node surgery'
1 = 'Regional lymph node surgery'
9 = 'Unknown if there was any regional lymph node surgery';
COMMENT PUF Data Item Name: RX_SUMM_SURG_OTH_REGDIS;
VALUE fsurgotherregdis
0='None' 
1='Nonprimary surgical procedure performed'
2='Nonprimary surgical procedure to other regional sites'
3='Nonprimary surgical procedure to distant lymph node(s)' 
4='Nonprimary surgical procedure to distant site'
5='Combination of codes'
9='Unknown';
COMMENT PUF Data Item Name: READM_HOSP_30_DAYS;
VALUE freadmission
0='No surgical procedure of the primary site was performed, or patient not readmitted'
1='Unplanned readmission within 30 days of discharge'
2='Planned readmission within 30 days of discharge'
3='Planned and unplanned readmission within 30 days of discharge'
9='Unknown if surgery recommended/performed, unknown if readmitted within 30 days of discharge';
COMMENT PUF Data Item Name: REASON_FOR_NO_SURGERY;
VALUE freasonnosurg
0='Surgery of the primary site was performed'
1='Surgery not performed because it was not part of the planned first course treatment'
2='Surgery was not recommended/performed, contraindicated due to patient risk factors'
5='Surgery not performed because the patient died prior to planned or recommended surgery'
6='Surgery was recommeded by physician but not performed, No reason was noted in patient record'
7='Surgery was recommended but was refused by the patient, patient"s family member or guardian'
8='Surgery was recommended, but unknown if performed' 
9='Unknown if surgery was recommended or performed, Diagnosed at autopsy or death certificate only';
COMMENT PUF Data Item Name: RX_SUMM_RADIATION;
VALUE fradtype
0='None' 
1='Beam radiation' 
2='Radioactive implants' 
3='Radioisotopes'
4='Combination of beam radiation with radioactive implants or radioisotopes'
5='Radiation therapy, NOS' 
9='Unknown';
COMMENT PUF Data Item Name: RAD_LOCATION_OF_RX;
VALUE fradlocation
0='No radiation therapy administered'
1='All radiation treatment at this facility'
2='Regional treatment at this facility, boost elsewhere'
3='Boost radiation at this facility, regional elsewhere' 
4='All radiation treatment elsewhere'
8='Other' 
9='Unknown';
COMMENT PUF Data Item Name: RAD_TREAT_VOL;
VALUE fradvol
0='No radiation treatment' 
1='Eye/Orbit' 
2='Pituitary' 
3='Brain (NOS)' 
4='Brain (limited)'
5='Head and neck (NOS)' 
6='Head and neck (limited)' 
7='Glottis' 
8='Sinuses'
9='Parotid' 
10='Chest/Lung (NOS)' 
11='Lung (limited)' 
12='Esophagus' 
13='Stomach'
14='Liver' 
15='Pancreas' 
16='Kidney' 
17='Abdomen (NOS)' 
18='Breast' 
19='Breast/Lymph nodes'
20='Chest wall' 
21='Chest wall/Lymph nodes' 
22='Mantle, Mini-mantle' 
23='Lower extended field'
24='Spine' 
25='Skull' 
26='Ribs' 
27='Hip' 
28='Pelvic bones' 
29='Pelvis (NOS)' 
30='Skin'
31='Soft tissue' 
32='Hemibody' 
33='Whole body' 
34='Bladder and pelvis' 
35='Prostate and pelvis'
36='Uterus and cervix' 
37='Shoulder' 
38='Extremity bone, NOS' 
39='Inverted Y' 
40='Spinal cord'
41='Prostate' 
50='Thyroid' 
60='Lymph node region, NOS' 
98='Other' 
99='Unknown';
COMMENT PUF Data Item Name: RAD_REGIONAL_RX_MODALITY;
VALUE fregrxmod
0='No radiation treatment' 
20='External beam, NOS' 
21='Orthovoltage' 
22='Cobalt-60, Cesium-137'
23='Photons (2–5 MV)' 
24='Photons (6–10 MV)' 
25='Photons (11–19 MV)' 
26='Photons (>19 MV)'
27='Photons (mixed energies)' 
28='Electrons' 
29='Photons and electrons mixed'
30='Neutrons, with or without photons/electrons'  
31='IMRT' 
32='Conformal or 3-D therapy'
40='Protons' 
41='Stereotactic radiosurgery, NOS' 
42='Linac radiosurgery' 
43='Gamma Knife'
50='Brachytherapy, NOS' 
51='Brachytherapy, Intracavitary, LDR' 
52='Brachytherapy, Intracavitary, HDR'
53='Brachytherapy, Interstitial, LDR' 
54='Brachytherapy, Interstitial, HDR'
55='Radium' 
60='Radioisotopes, NOS' 
61='Strontium-89' 
62='Strontium-90'
80='Combination modality, specified'
85='Combination modality, NOS' 
98='Other, NOS' 
99='Unknown';
COMMENT PUF Data Item Name: RAD_REGIONAL_DOSE_CGY;
VALUE fradregdose
0='Not administered'
88888='Not applicable'
99999='Unknown';
COMMENT PUF Data Item Name: RAD_BOOST_RX_MODALITY;
VALUE fboostmodality
0='No radiation treatment' 
20='External beam, NOS' 
21='Orthovoltage' 
22='Cobalt-60, Cesium-137'
23='Photons (2–5 MV)' 
24='Photons (6–10 MV)' 
25='Photons (11–19 MV)' 
26='Photons (>19 MV)'
27='Photons (mixed energies)' 
28='Electrons' 
29='Photons and electrons mixed'
30='Neutrons, with or without photons/electrons' 
31='IMRT' 
32='Conformal or 3-D therapy'
40='Protons' 
41='Stereotactic radiosurgery, NOS' 
42='Linac radiosurgery' 
43='Gamma Knife'
50='Brachytherapy, NOS' 
51='Brachytherapy, Intracavitary, LDR' 
52='Brachytherapy, Intracavitary, HDR'
53='Brachytherapy, Interstitial, LDR' 
54='Brachytherapy, Interstitial, HDR' 
55='Radium'
60='Radioisotopes, NOS' 
61='Strontium-89' 
62='Strontium-90' 
98='Other, NOS' 
99='Unknown';
COMMENT PUF Data Item Name: RAD_BOOST_DOSE_CGY;
VALUE fboostdose
0='Not administered' 
88888='Not applicable' 
99999='Unknown';
COMMENT PUF Data Item Name: RAD_NUM_TREAT_VOL;
VALUE fradnumtrt
0='None' 
999='Unknown';
COMMENT PUF Data Item Name: RX_SUMM_SURGRAD_SEQ;
VALUE fsurgradseq
0='No radiation therapy and/or surgical procedures'
2='Radiation therapy before surgery'
3='Radiation therapy after surgery'
4='Radiation therapy both before and after surgery'
5='Intraoperative radiation therapy'
6='Intraoperative radiation therapy with other therapy administered before or after surgery'
9='Sequence unknown';
COMMENT PUF Data Item Name: RAD_ELAPSED_RX_DAYS;
VALUE fradelapsed
000='None, radiation not administered'
999='Missing, incomplete, or unknown radiation or dates';
COMMENT PUF Data Item Name: REASON_FOR_NO_RADIATION;
VALUE freasonnorad
0='Radiation therapy was administered'
1='Radiation was not part of the planned first course treatment'
2='Radiation contraindicated due to other patient risk factors'
5='Patient died prior to planned or recommended therapy'
6='Radiation recommended but not administered, no reason was noted' 
7='Radiation recommended but refused by the patient, patient"s family member or guardian' 
8='Radiation recommended, unknown whether administered'
9='Unknown if recommended or administered';
COMMENT PUF Data Item Names: RX_SUMM_CHEMO, RX_HOSP_CHEMO;
VALUE fchemo
0='None'
1='Chemotherapy administered, type and number of agents not documented'
2='Single-agent chemotherapy'
3='Multiagent chemotherapy'
82='Chemotherapy not recommended/administered, contraindicated due to patient risk factors' 
85='Chemotherapy not administered, patient died prior to planned or recommended therapy'
86='Chemotherapy not administered, was recommended, not administered Reason unknown' 
87='Chemotherapy not administered, recommended, but refused by patient, patient"s family member or guardian'
88='Chemotherapy recommended, unknown if administered'
99='Unknown if recommended or administered';
COMMENT PUF Data Item Name: RX_SUMM_HORMONE RX_HOSP_HORMONE;
VALUE fhormone
0='None'
1='Hormone therapy administered as first course therapy'
82='Not recommended/administered, contraindicated due to patient risk factors' 
85='Hormone therapy not administered, patient died prior to planned or recommended therapy'
86='Recommended but not administered, no reason stated' 
87='Recommended, not administered, refused by patient, patient"s family member or guardian'
88='Hormone therapy recommended, unknown if administered' 
99='Unknown if recommended or administered';
COMMENT PUF Data Item Name: RX_SUMM_IMMUNOTHERAPY RXHOSP_IMMUNOTHERAPY;
VALUE fimmuno
0='None' 
1='Immunotherapy administered as first course therapy'
82='Not recommended/administered, contraindicated due to patient risk factors'
85='Not administered because the patient died prior to planned or recommended therapy'
86='Recommended, not administered, No reason given' 
87='Recommended, not administered, refused by the patient, patient"s family member or guardian'
88='Immunotherapy recommended, unknown if administered' 
99='Unknown';
COMMENT PUF Data Item Name: RX_SUMM_TRNSPLNT_ENDO;
VALUE ftrnsplntendo
0='No transplant procedure or endocrine therapy administered' 
10='Bone marrow transplant procedure administered, type not specified'
11='Bone marrow transplant, autologous' 
12='Bone marrow transplant, allogeneic'
20='Stem cell harvest and infusion' 
30='Endocrine surgery and/or endocrine radiation therapy'
40='Combination of endocrine surgery and/or radiation with a transplant procedure' 
82='Transplant/endocrine surgery/radiation not recommended/administered, contraindicated due to patient risk factors'
85='Transplant/endocrine surgery/radiation not administered,patient died prior to planned or recommended therapy'
86='Recommended Transplant/endocrine/surgery/radiation but not administered no reason given' 
87='Recommended but not administered, treatment refused by patient, patient"s family member or guardian'
88='Hematologic transplant and/or endocrine surgery/radiation recommended, unknown if administered'
99='Unknown if recommended or administered';
COMMENT PUF Data Item Name: RX_SUMM_OTHER RX_HOSP_OTHER;
VALUE fotherrx
0='None'
1='Other' 
2='Other-Experimental'
3='Other-Double Blind'
6='Other-Unproven'
7='Treatment 1, 2 or 3 recommended but refused by patient, patient"s family or guardian'   
8='Recommended unknown if administered'
9='Unknown if recommended or adminstered';
COMMENT PUF Data Item Name: PALLIATIVE_CARE;
VALUE fpalliative
0='None' 
1='Surgery' 
2='Radiation therapy'
3='Chemo, hormone, other systemic drugs' 
4='Pain management therapy with no other palliative care'
5='Any combination of codes 1, 2, and/or 3 without code 4'
6='Any combination of codes 1, 2, and/or 3 with code 4'
7='Palliative care performed or referred, type unknown or other than codes 1-6' 
9='Unknown if palliative care performed or referred';
COMMENT PUF Data Item Name: RX_SUMM_SYSTEMIC_SUR_SEQ;
VALUE fsurgsysseq
0='No systemic therapy and/or no surgery'
2='Systemic therapy before surgery'
3='Systemic therapy after surgery'
4='Systemic therapy before and after surgery'
5='Intraoperative systemic therapy during surgical procedure'
6='Intraoperative systemic therapy with other Rx administered before or after surgery'
9='Sequence unknown';
COMMENT PUF Data Item Name: RX_SUMM_TREATMENT STATUS;
VALUE FRXSTATUS 
0='No Treatment Given' 
1='Treatment Given' 
2='Active Surveillance'
9='Unknown if Treatment Given';
COMMENT PUF Data Item Name: DX_LASTCONTACT_DEATH_MONTHS;
VALUE fmonths
9999='Unknown';
COMMENT PUF Data Item Name: PUF_30_DAY_MORT_CD;
value f30day
0='Patient alive, or died more than 30 days after surgery performed'
1='Patient died 30 or fewer days after surgery performed'
9='Patient alive with fewer than 30 days of follow-up, surgery date missing, or last contact date missing';
COMMENT PUF Data Item Name: PUF_90_DAY_MORT_CD;
value f90day
0='Patient alive, or died more than 90 days after surgery performed'
1='Patient died 90 or fewer days after surgery performed'
9='Patient alive with fewer than 90 days of follow-up, surgery date missing, or last contact date missing';
COMMENT PUF Data Item Name: PUF_VITAL_STATUS;
VALUE fvital
0='Dead' 
1='Alive';
COMMENT PUF Data Item Name PUF_MULT_SOURCE;
VALUE fMultiple
0='Only one facility reported this case to NCDB'
1='Records pertaining to this case submitted to NCDB by more than one facility';
COMMENT PUF Data Item Name REFERENCE_DATE_FLAG;
VALUE frefdateflag
0='Diagnosis date before reference date'
1='Diagnosis date on or after reference date';
RUN; 


PROC FREQ DATA=ncdb_puf;
TABLES FACILITY_TYPE_CD FACILITY_LOCATION_CD AGE SEX RACE SPANISH_HISPANIC_ORIGIN INSURANCE_STATUS 
MED_INC_QUAR_00  NO_HSD_QUAR_00 UR_CD_03 MED_INC_QUAR_12 NO_HSD_QUAR_12 UR_CD_13  
CROWFLY CDCC_TOTAL SEQUENCE_NUMBER CLASS_OF_CASE 
YEAR_OF_DIAGNOSIS  PRIMARY_SITE LATERALITY HISTOLOGY BEHAVIOR GRADE DIAGNOSTIC_CONFIRMATION 
TUMOR_SIZE REGIONAL_NODES_POSITIVE REGIONAL_NODES_EXAMINED DX_STAGING_PROC_DAYS RX_SUMM_DXSTG_PROC  
TNM_CLIN_T  TNM_CLIN_N TNM_CLIN_M TNM_CLIN_STAGE_GROUP TNM_PATH_T TNM_PATH_N TNM_PATH_M TNM_PATH_STAGE_GROUP 
TNM_EDITION_NUMBER ANALYTIC_STAGE_GROUP 
CS_METS_AT_DX CS_METS_EVAL CS_EXTENSION CS_TUMOR_SIZEEXT_EVAL CS_METS_DX_BONE
CS_METS_DX_BRAIN CS_METS_DX_LIVER CS_METS_DX_LUNG LYMPH_VASCULAR_INVASION
CS_SITESPECIFIC_FACTOR_1-- CS_SITESPECIFIC_FACTOR_25
CS_VERSION_LATEST DX_RX_STARTED_DAYS DX_SURG_STARTED_DAYS DX_DEFSURG_STARTED_DAYS 
RX_SUMM_SURG_PRIM_SITE  RX_HOSP_SURG_PRIM_SITE RX_HOSP_SURG_APPR_2010 
RX_SUMM_SURGICAL_MARGINS RX_SUMM_SCOPE_REG_LN_SUR RX_SUMM_SCOPE_REG_LN_2012
RX_SUMM_SURG_OTH_REGDIS SURG_DISCHARGE_DAYS READM_HOSP_30_DAYS REASON_FOR_NO_SURGERY 
DX_RAD_STARTED_DAYS RX_SUMM_RADIATION RAD_LOCATION_OF_RX  RAD_TREAT_VOL RAD_REGIONAL_RX_MODALITY 
RAD_REGIONAL_DOSE_CGY RAD_BOOST_RX_MODALITY RAD_BOOST_DOSE_CGY  RAD_NUM_TREAT_VOL RX_SUMM_SURGRAD_SEQ  
RAD_ELAPSED_RX_DAYS REASON_FOR_NO_RADIATION DX_SYSTEMIC_STARTED_DAYS DX_CHEMO_STARTED_DAYS 
RX_SUMM_CHEMO RX_HOSP_CHEMO DX_HORMONE_STARTED_DAYS RX_SUMM_HORMONE RX_HOSP_HORMONE 
DX_IMMUNO_STARTED_DAYS RX_SUMM_IMMUNOTHERAPY
RX_SUMM_TRNSPLNT_ENDO RX_SUMM_SYSTEMIC_SUR_SEQ RX_SUMM_TREATMENT_STATUS
DX_OTHER_STARTED_DAYS RX_SUMM_OTHER PALLIATIVE_CARE 
PUF_30_DAY_MORT_CD PUF_90_DAY_MORT_CD DX_LASTCONTACT_DEATH_MONTHS PUF_VITAL_STATUS  
RX_HOSP_SURG_PRIM_SITE  RX_HOSP_CHEMO  RX_HOSP_IMMUNOTHERAPY  RX_HOSP_HORMONE RX_HOSP_OTHER PUF_MULT_SOURCE REFERENCE_DATE_FLAG;
FORMAT FACILITY_TYPE_CD ffacility. FACILITY_LOCATION_CD ffac_location. AGE fage. 
RACE frace. SEX fsex. INSURANCE_STATUS finsurance. SPANISH_HISPANIC_ORIGIN fhispanic.
MED_INC_QUAR_00 f00income.  NO_HSD_QUAR_00 f00hsd. MED_INC_QUAR_12 F12income. NO_HSD_QUAR_12 F12hsd.
UR_CD_03 UR_CD_13 fur03_cd.  CLASS_OF_CASE fclass. YEAR_OF_DIAGNOSIS fdxyear.
LATERALITY flat. BEHAVIOR fbeh. GRADE fgrade.  
TUMOR_SIZE ftumor. REGIONAL_NODES_EXAMINED fnodes_examined. REGIONAL_NODES_POSITIVE fnodes_positive.
RX_SUMM_DXSTG_PROC fsdxstg. TNM_EDITION_NUMBER ftnmedit.
ANALYTIC_STAGE_GROUP fanalyticstg. RX_HOSP_SURG_APPR_2010 fapproach.
RX_SUMM_SURGICAL_MARGINS fsurgmargin.  RX_SUMM_SCOPE_REG_LN_SUR FRXSUMM_Scope_Reg_Ln_Surg.
RX_SUMM_SURG_OTH_REGDIS fsurgotherregdis. READM_HOSP_30_DAYS freadmission. REASON_FOR_NO_SURGERY freasonnosurg.
RAD_ELAPSED_RX_DAYS fradelapsed. RX_SUMM_RADIATION fradtype. RAD_LOCATION_OF_RX fradlocation. RAD_TREAT_VOL fradvol. 
RAD_REGIONAL_RX_MODALITY fregrxmod. RAD_REGIONAL_DOSE_CGY fradregdose. RAD_BOOST_RX_MODALITY fboostmodality.
RAD_BOOST_DOSE_CGY fboostdose. RAD_NUM_TREAT_VOL fradnumtrt.
RX_SUMM_SURGRAD_SEQ fsurgradseq. REASON_FOR_NO_RADIATION freasonnorad. RX_SUMM_CHEMO RX_HOSP_CHEMO fchemo.
RX_SUMM_HORMONE RX_HOSP_HORMONE fhormone. RX_SUMM_IMMUNOTHERAPY RX_HOSP_IMMUNOTHERAPY fimmuno. 
RX_SUMM_TRNSPLNT_ENDO ftrnsplntendo. RX_SUMM_OTHER RX_HOSP_OTHER fotherrx.
PALLIATIVE_CARE fpalliative. RX_SUMM_SYSTEMIC_SUR_SEQ fsurgsysseq.
PUF_VITAL_STATUS fvital. RX_SUMM_TREATMENT_STATUS FRxstatus. CS_METS_DX_BONE
CS_METS_DX_BRAIN CS_METS_DX_LIVER CS_METS_DX_LUNG CSMETSSITE.  LYMPH_VASCULAR_INVASION Flymph.
PUF_30_DAY_MORT_CD f30day. PUF_90_DAY_MORT_CD f90day. PUF_MULT_SOURCE Fmultiple. REFERENCE_DATE_FLAG frefdateflag.;
RUN;

