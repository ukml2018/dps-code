{% docs tbl_LO %}
Location describes a place where something can be found, a destination of information or a bounded area, such as a country or state. Types of Location include Address and Geographic Area.
{% enddocs %}

{% docs tbl_LO_LO_ID %}
The unique identifier of the Location.
{% enddocs %}

{% docs tbl_LO_PPN_DT %}
The date on which the instance of the entity was last updated.
{% enddocs %}

{% docs tbl_LO_PPN_TM %}
The time on which the instance of the entity was last updated.
{% enddocs %}

{% docs tbl_LO_SRC_STM_ID %}
The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_LO_UNQ_ID_IN_SRC_STM %}
The unique identifier of the Location in the Source System.
{% enddocs %}

{% docs tbl_LO_LO_TP_ID %}
The unique identifier of the Location Type.
{% enddocs %}

{% docs tbl_LO_PRN_LO_ID %}
The unique identifier of the Location.
{% enddocs %}

{% docs tbl_LO_LO_NM %}
The primary name assigned to the Location. This name is used in reports and documents referring to the Location.
{% enddocs %}

{% docs tbl_LO_EFF_DT %}
The date on which the Location first became relevant to the Financial Institution.
{% enddocs %}

{% docs tbl_LO_END_DT %}
The date on which the Location ceased to be relevant to the Financial Institution.
{% enddocs %}

{% docs tbl_LO_DSC %}
Provides a textual explanation or free form comments about the Location.
{% enddocs %}

{% docs tbl_SA_IP %}
SA Involved Party: Involved Party identifies any Individual, group of Individuals, Organization, Organization Unit or Employment Position about which the Financial Institution wishes to keep information; for example, Involved Party #124 (John Smith), Involved Party #432 (Financial Institution Xyz), Involved Party #453 (Financial Institution Xyz's Marketing Department), Involved Party #681 (Foreign Exchange Trader). 
 
Subtypes or Involved Party are - Individual, Organization, Organization Unit, Customer (Role), Social Media Persona, and Employement Position 
 
Individual - An Individual is any person about whom the Financial Institution wishes to store information. For example, 'Personal Customer', 'Employee'. 
Organization - Organization identifies an Involved Party, usually consisting of a number of individuals or groups bound by common purposes and activities, that may stand alone in an operational or legal context. 
Organization Unit - Organization Unit is an Involved Party that is a component or subdivision of an Organization established for the purpose of identifying discrete functional responsibilities; for example, the Organization #66 (Bank Xyz) can contain several Organization Units such as Subdivision A, Branch B, Committee C, Division D, or less formal groupings such as Project P, or Team T. 
Social Media Persona - A Social Media Persona is an online profile about which an organization may wish to store or process information. A Social Media Persona may exist independently of any real-world Individual or Organization. An Individual or Organization may also have many different Social Media Personas. Social Media Personas can be linked to other Involved parties through the Involved Party / Involved Party Rltnp associative entity. 
Employment Position (currently not included in this SA file) - Employment Position identifies an Involved Party that is a post defined and established within an Organization to facilitate the allocation and assignment of the Organization's work. Job functions, responsibilities and authorities are defined and associated with an Employment Position and are carried out by the Individual(s) who occupy or fill the Employment Position. An Employment Position has its own independent existence and is distinctly different from the Employee who may occupy or fill it. During its existence, an Employment Position may be assigned to different Organization Units; for example, Employment Position #1234 is assigned to the Main Branch and is currently filled by Cathy Smith; the Financial Institution authorized creation of 400 Employment Positions, all called Senior Teller, and numbered consecutively ST001 through ST400. Three hundred of these Employment Positions have been filled from the ranks of existing employees, and one hundred remain vacant and available at this time. 
 
Customer (role of Involved Party)- A Customer is a role played by an Involved Party that is considered to be receiving services or products from the Financial Institution or one of its Organization Units, or who is a potential recipient of such services or products.
{% enddocs %}

{% docs tbl_SA_IP_IP_ID %}
Involved Party Id: The unique identifier assigned to an Involved Party.
{% enddocs %}

{% docs tbl_SA_IP_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_IP_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_IP_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL.
{% enddocs %}

{% docs tbl_SA_IP_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL.
{% enddocs %}

{% docs tbl_SA_IP_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_IP_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field.
{% enddocs %}

{% docs tbl_SA_IP_IP_TY_ID %}
Involved Party Type Id: The unique identifier of the Involved Party Type. 
Involved Party Type classifies Involved Parties according to their inherent characteristics and structure; for example, Individual, Organization or Organization Unit. 
Domain: 
Individual 
Organization 
Organization Unit 
Employment Position 
Social Media Persona
{% enddocs %}

{% docs tbl_SA_IP_END_DT %}
End Date: The date on which the Involved Party ceased to be relevant to the Financial Institution.
{% enddocs %}

{% docs tbl_SA_IP_EFFV_DT %}
Effective Date: The date on which the Involved Party first became relevant to the Financial Institution.
{% enddocs %}

{% docs tbl_SA_IP_DESC %}
Description: Provides a textual explanation or free form comments about the Involved Party.
{% enddocs %}

{% docs tbl_SA_IP_IP_LC_STS_TY_ID %}
Involved Party Life Cycle Status Type Id: The unique identifier of the Involved Party Life Cycle Status Type. 
Involved Party Life Cycle Status Type classifies Involved Parties according to the life cycle states through which they may pass over time. 
Domain:
Suspended 
Former 
Current
{% enddocs %}

{% docs tbl_SA_IP_IP_LC_STS_DT %}
Involved Party Life Cycle Status Date: The date on which the Involved Party entered the current Customer Life Cycle Status.
{% enddocs %}

{% docs tbl_SA_IP_PRMY_RL_TY_ID %}
Primary Relationship Type Id: The unique identifier of the Primary Relationship Type holding between the Financial Institution and the Involved Party.
{% enddocs %}

{% docs tbl_SA_IP_FNC_LGL_STS_ID %}
Financial Legal Status Id: The unique identifier of the Financial Legal Status Type. 
Financial Legal Status distinguishes between Involved Parties according to whether they are undergoing proceedings that affect their financial standing. 
Domain:
Legally Unrestricted 
Insolvent 
In Liquidation 
In Receivership 
Bankrupt
{% enddocs %}

{% docs tbl_SA_IP_FNC_LGL_STS_EFFV_DT %}
Financial Legal Status Effective Date: The date on which the Involved Party entered the current Financial legal Status.
{% enddocs %}

{% docs tbl_SA_IP_IP_CRR_ID %}
Involved Party Credit Risk Rating Id: The unique identifierx for the Involved Party Credit Risk Rating. 
Involved Party Credit Risk Rating identifies a Credit Rating Value which can be assigned to an Involved Party in respect of their credit worthiness.
{% enddocs %}

{% docs tbl_SA_IP_IP_CRR_DT %}
Involved Party Credit Risk Rating Date: The date on which the Involved Party Credit Risk Rating was assigned.
{% enddocs %}

{% docs tbl_SA_IP_PDFT_CGY_ID %}
Probability Of Default Category Id: The unique identifier of the Probability Of Default Category that applies to the Involved Party. 
robability Of Default Category classifies instances of Involved Party, Arrangement and Portfolio according to the probability that the target instance will default within a one year period. This is usually calculated at least annually by the Financial Institution. The bands given below are representative and will usually be customized by the Financial Institution. 
Domain:
Probability Of Default 0% 
Probability Of Default 0% < PD <= 1% 
Probability Of Default 1% < PD <= 2% 
Probability Of Default 2% < PD <= 3% ......
{% enddocs %}

{% docs tbl_SA_IP_PDFT_CGY_EFFV_DT %}
Probability Of Default Category Effective Date: The date on which the Involved Party assumed its current Probability Of Default Category.
{% enddocs %}

{% docs tbl_SA_IP_IP_NM %}
Involved Party Name: Involved Party Name: specifies the primary current name, (normally the legal name for the Involved Party),as used by the Financial Institution. This field may contain a concatenation of name components found on the subtype entities. 
Other names, including common names, former names, etc. are stored in Involved Party Alternative Name.
{% enddocs %}

{% docs tbl_SA_IP_IP_SKL_TY_ID %}
Involved Party Skill Type Id: The unique identifier of the Involved Party Skill Type.
{% enddocs %}

{% docs tbl_SA_IP_FI_FLG %}
Financial Institution Flag: Indicates whether the Involved Party is the Financial Institution, or one of the Institution's organization units, or neither.
{% enddocs %}

{% docs tbl_SA_IP_FI_INVEST_FLG %}
Financial Institution Investor Flag: Indicates whether the Involved Party holds stock or shares in the Financial Institution.
{% enddocs %}

{% docs tbl_SA_IP_ADVRTS_FLG %}
Advertising Flag: Indicates whether the Involved Party has specifically instructed the financial institution not to mail advertising material to them.
{% enddocs %}

{% docs tbl_SA_IP_SUS_MONTR_STS_ID %}
Suspect Monitor Status Id: The unique identifier of the Suspect Monitor Status. 
Suspect Monitor Status classifies whether or not an Involved Party is suspected of activities, such as fraud or bad debts, that necessitate the Financial Institution to monitor that Involved Party more closely.
{% enddocs %}

{% docs tbl_SA_IP_SUS_MONTR_STS_DT %}
Suspect Monitor Status Date: The date on which the Involved Party entered its current Suspect Monitor Status.
{% enddocs %}

{% docs tbl_SA_IP_PRVS_RFUS_FLG %}
Previous Refusal Flag: Indicates if the Involved Party has been refused an Arrangement by the Financial Institution in the past. For example, a rejected loan application or insurance policy.
{% enddocs %}

{% docs tbl_SA_IP_IDV_LC_STS_TY_ID %}
Individual Life Cycle Status Type Id: The unique identifier of the Individual Life Cycle Status Type. 
Individual Life Cycle Status Type classifies Individuals according to whether or not they are living or if their status is unknown, for general or legal purposes. 
Domain:
 Deceased Individual 
 Living Individual 
 Missing Individual
{% enddocs %}

{% docs tbl_SA_IP_RELG_ID %}
Religion Id: The unique identifier of the Religion.
{% enddocs %}

{% docs tbl_SA_IP_GNDR_ID %}
Gender Id: The unique identifier of the Gender of the Individual.
{% enddocs %}

{% docs tbl_SA_IP_DOB %}
Birth Date: Specifies the date on which the individual was born.
{% enddocs %}

{% docs tbl_SA_IP_DTH_DT %}
Death Date: The date on which the Individual died or was declared deceased. This attribute can be null.
{% enddocs %}

{% docs tbl_SA_IP_DTH_NOTIF_DT %}
Death Notification Date: The date upon which the death of the Individual was notified to the Financial Institution.
{% enddocs %}

{% docs tbl_SA_IP_LANG_ID %}
Language Id: The unique identifier of the Language.
{% enddocs %}

{% docs tbl_SA_IP_IDV_MRTL_STS_TY_ID %}
Individual Marital Status Type Id: The unique identifier of the Individual Marital Status Type.
{% enddocs %}

{% docs tbl_SA_IP_IDV_MRTL_STS_DT %}
Individual Marital Status Date: The date upon which the Individual changed their marital status.
{% enddocs %}

{% docs tbl_SA_IP_IDV_AGE_SEG_ID %}
Individual Age Segment Id: The unique identifier of the Individual Age Segment.
{% enddocs %}

{% docs tbl_SA_IP_IDV_AGE_SEG_DT %}
Individual Age Segment Date: The date on which the Individual was assigned to an Individual Age Segment.
{% enddocs %}

{% docs tbl_SA_IP_IDV_RACE_ID %}
Individual Race Id: The unique identifier of the Individual Race.
{% enddocs %}

{% docs tbl_SA_IP_IDV_ETHNIC_TY_ID %}
Individual Ethnic Type Id: The unique identifier of the Individual Ethnic Type.
{% enddocs %}

{% docs tbl_SA_IP_SECTG_ID %}
Socio-Economic Category Id: The unique identifier of the Socio-Economic Category. 
Socio-Economic Category classifies Individuals by identifying the socio-economic category to which they belong, based on their income and social standing. Typical criteria used in determining membership of a specific Category are Income, Occupation, Employment Position, Housing Tenure. For example, Socio-Economic Category Class A might include Individuals whose income is in excess of $ 200 000, in Occupations such as Business Owner, Employment Positions of Director and Managing Director, with an Asset base in excess of $ 1 000 000. The Segments will vary in characteristic from country to country and from region to region.
{% enddocs %}

{% docs tbl_SA_IP_SECTG_DT %}
Socio-Economic Category Date: The date on which the current Socio-Economic Category was assigned to the Individual.
{% enddocs %}

{% docs tbl_SA_IP_IDV_INCM_SEG_ID %}
Individual Income Segment Id: The unique identifier of the Individual Income Segment.
{% enddocs %}

{% docs tbl_SA_IP_IDV_IND_CL_ID %}
Individual Industry Classification Id: Classification of the Individual according to Industry criteria. 
Individual Industry Classification identifies a Classification that categorizes Individuals based on Standard Industrial Codes (SICs). 
Domain: 
Not Provided - See country SIC Codes and populate
{% enddocs %}

{% docs tbl_SA_IP_IDV_IND_CL_DT %}
Individual Industry Classification Date: The date on which the current Industry Classification was assigned to the Individual.
{% enddocs %}

{% docs tbl_SA_IP_HSNG_TNRE_TY_ID %}
Housing Tenure Type Id: The unique identifier of the Housing Tenure Type. 
Housing Tenure Type classifies whether an Individual owns, is buying, or is leasing his or her place of residence. 
 
Domain: 
 Owned With Mortgage 
 Owned Without Mortgage 
 Rented From Private 
 Rented Free Or From Government
{% enddocs %}

{% docs tbl_SA_IP_HSNG_TNRE_DT %}
Housing Tenure Date: The date on which Housing Tenure commenced.
{% enddocs %}

{% docs tbl_SA_IP_CNTNTY_OF_ADDR_SEG_ID %}
Continuity Of Address Segment Id: The unique identifier of the Continuity Of Address Segment.
{% enddocs %}

{% docs tbl_SA_IP_CNTNTY_OF_ADDR_SEG_DT %}
Continuity Of Address Segment Date: The date on which the current Continuity Of Address Segment was assigned to the Individual.
{% enddocs %}

{% docs tbl_SA_IP_CERT_TY_ID %}
Certification Type Id: The unique identifier of the Certification Type. 
Certification Type classifies Individual Skill Certifications according to the type of official accreditation awarded. 
 
Domain: 
Postgraduate Degree 
Formal Examination 
Undergraduate Degree 
Public Course 
Industry Certification 
Internal Training
{% enddocs %}

{% docs tbl_SA_IP_CERT_DT %}
Certification Date: The date upon which an Individual attained their Certification.
{% enddocs %}

{% docs tbl_SA_IP_IDV_OCPN_TY_ID %}
Individual Occupation Type Id: The unique identifier of the Individual Occupation Type. 
Individual Occupation Type classifies Individuals based on the type of activities representative of their occupation work or business. 
 
Domain: 
 Bank Clerk 
 Barperson 
 Chef/Baker 
 Civil Servant 
 Clergy Worker 
 Construction Worker 
 Entertainer 
 Factory Worker 
 Fisherman 
 Laboratory Worker 
 Mechanic 
 Medical Professional 
 Police Officer 
 Prison Officer 
 Army Officer 
 Post Office Worker 
 Secretary 
 Typist 
 Receptionist 
 Shop Assistant 
 Teacher 
 Lecturer 
 Tradesperson 
 Vehicle Driver 
 Waiter or Waitress
{% enddocs %}

{% docs tbl_SA_IP_IDV_OCPN_DT %}
Individual Occupation Date: The date on which the Individual commenced their current occupation.
{% enddocs %}

{% docs tbl_SA_IP_IDV_EMPMNT_STS_TY_ID %}
Individual Employment Status Type Id: The unique identifier of the Individual Employment Status Type. 
Individual Employment Status Type classifies Individuals according to the manner by which he or she earns a living. 
 
Domain: 
 Working Individual 
 -- Self Employed 
 -- Working For Wages Or Salary 
 -- Working Without Pay 
 Not Employed Individual
{% enddocs %}

{% docs tbl_SA_IP_IDV_EMPMNT_STS_DT %}
Individual Employment Status Date: The date on which the Individual changed their Employment Status
{% enddocs %}

{% docs tbl_SA_IP_IDV_EMPMNT_TM_COMIT_ID %}
Individual Employment Time Commitment Id: Classification of the Individual according to their Individual Employment Time Commitment. 
Individual Employment Time Commitment classifies Individuals according to the manner in which he or she earns a living. 
 
Domain: 
 Employed Full Time 
 Employed Part Time 
 Job Sharing 
 Non Labor Force
{% enddocs %}

{% docs tbl_SA_IP_IDV_EMPMNT_TM_COMIT_DT %}
Individual Employment Time Commitment Date: The date on which the Individual took up their Employment Time Commitment.
{% enddocs %}

{% docs tbl_SA_IP_FTHR_ID %}
Father Id: The unique identifier of the Father of an Individual.
{% enddocs %}

{% docs tbl_SA_IP_SPS_ID %}
Spouse Id: The unique identifier of the Spouse of an Individual.
{% enddocs %}

{% docs tbl_SA_IP_MTHR_ID %}
Mother Id: The unique identifier of the Mother of an Individual.
{% enddocs %}

{% docs tbl_SA_IP_CNTRY_OF_BRTH_ID %}
Country Of Birth Id: The unique identifier of the Country Of Birth.
{% enddocs %}

{% docs tbl_SA_IP_CNTRY_OF_CTZNSHP_ID %}
Country Of Citizenship Id: The unique identifier of the Country Of Citizenship.
{% enddocs %}

{% docs tbl_SA_IP_HH_ID %}
Household Id: The identifier of the Household of which the Individual is a member.
{% enddocs %}

{% docs tbl_SA_IP_HEAD_OF_HH_FLG %}
Head Of Household Flag: Indicates whether the Individual is the head of a Household (Y) (and hence has certain legal and financial obligations to other members of the household), or not (N).
{% enddocs %}

{% docs tbl_SA_IP_CTZNSHP_DT %}
Citizenship Date: The date upon which an Individual attained citizenship in the country to which they had emigrated.
{% enddocs %}

{% docs tbl_SA_IP_CNTRY_OF_RES_ID %}
Country of Residence Id: The unique identifier of the Country of Residence.
{% enddocs %}

{% docs tbl_SA_IP_CNTRY_OF_RES_DT %}
Country of Residence Date: The date on which the current Country Of Residence was assigned to the Individual.
{% enddocs %}

{% docs tbl_SA_IP_NM_INTL %}
Name Initial: That part of an individual's name that is comprised of the letter(s) of an Individual's Name(s); for example, the Name Initial 
for Involved Party # 432542 (Mary E Smythe) is 'E.' .
{% enddocs %}

{% docs tbl_SA_IP_SALU %}
Salutation: That part of a name by which an Individual is addressed in a polite, business like, and somewhat formal context. It is often possible to derive the gender of an addressee from a Salutation. Some feminine Salutations reflect the marital status of the addressee to whom they apply; Examples of Salutations are : 'Mrs.', 'Mister', 'Ms.', 'Miss', 'Herr', 'Fr', 'Madame'.
{% enddocs %}

{% docs tbl_SA_IP_NM_QUALIF %}
Name Qualification: That part of an individual's name that exists to 
show that he or she has earned or possesses academic or professional certification or has reached a certain status or position in their 
profession; for example, PhD (Doctor of Philosophy), Chief Executive Officer (CEO), Vice President.
{% enddocs %}

{% docs tbl_SA_IP_GVN_NM %}
Given Name: That part of an individuals name that is chosen and assigned at his or her birth, usually by the individual's parent(s); for example, 'John', 'Jurgen', 'Helga' or 'Jane'.
{% enddocs %}

{% docs tbl_SA_IP_MID_NM %}
Middle Name: That part of an individual's name that typically follows sequentially the Given Name and precedes the Surname; for example, the 
Middle Name of Involved Party #392837 (Edmund Fitzgerald Smythe) is 'Fitzgerald'.
{% enddocs %}

{% docs tbl_SA_IP_SURNM %}
Surname1: That part of an individual's name which belongs to the family the Individual is a part of; for example, 'Smith', 'Mueller'.
{% enddocs %}

{% docs tbl_SA_IP_SURNM2 %}
Surname2: That part of an individual's name which belongs to the family the Individual is a part of; for example, 'Smith', 'Mueller'.
{% enddocs %}

{% docs tbl_SA_IP_MAID_NM %}
Maiden Name: That part of an Involved Party Name that is an 
Individual's Surname as it existed prior to any change of Surname resulting from any marriage. In many countries, legal and/or social and 
cultural conventions dictate or suggest that one spouse assume the Surname of the other spouse upon their marriage. Maiden Name is the Name Component that reflects the Surname as it existed before any change was made to it in deference to marriage law or custom.
{% enddocs %}

{% docs tbl_SA_IP_SFX %}
Suffix: That part of a name which is added at the end in order to explicitly identify the named Individual. A Suffix is often used when 
two or more Involved Parties have names comprised of Involved Party Name components that, excepting Suffix, are the same; for example, 'Junior', 'Senior', 'II', 'III'.
{% enddocs %}

{% docs tbl_SA_IP_FL_NM %}
Full Name: Derived field concatenated from Given Name + Surname1 + Surname2.
{% enddocs %}

{% docs tbl_SA_IP_PRMY_IDFN_TY_ID %}
Primary Identification Type Id: The unique identifier of the Identification Document Type identifying the type of information held in the Identification Number field. 
dentification Document Type distinguishes between Identification Documents according to the nature of the document. 
 
Domain: 
 Involved Party Identification 
 -- Passport 
 -- Driver License 
 -- Birth Certificate 
 -- National Identity Card 
 -- Employee Identity Card 
 -- Business Card 
 -- Facial Image (photo) 
 -- Fingerprint 
 -- Recorded Voice Sample 
 Resource Item Identification 
 -- Certificate Of Authenticity
{% enddocs %}

{% docs tbl_SA_IP_PRMY_IDFN_NBR_TXT %}
Primary Identification Number Text: Externally-designated Identification Number, of type as defined by Identification Type Id.
{% enddocs %}

{% docs tbl_SA_IP_CRMNL_CNVCT_FLG %}
Criminal Convictions Flag: Identifies whether it is known that the individual has been convicted of a crime in a court of law.
{% enddocs %}

{% docs tbl_SA_IP_ORG_LC_STS_TY_ID %}
Organization Life Cycle Status Type Id: The unique identifier of the Organization Life Cycle Status Type. 
Organization Life Cycle Status Type classifies Organizations according to the life cycle states through which they may pass over time. 
 
Domain: 
 Active Organization 
 Closed Organization 
 Formed Organization 
 Inactive Organization 
 Suspended Organization
{% enddocs %}

{% docs tbl_SA_IP_ORG_LC_STS_DT %}
Organization Life Cycle Status Date: The date on which the Organization Life Cycle Status was assigned to the Organization.
{% enddocs %}

{% docs tbl_SA_IP_CNTRL_BNK_IND_CL_ID %}
Central Bank Industry Classification Id: The unique identifier of the Central Bank Industry Classification. 
Industry Classification identifies a Classification that categorizes Involved Parties based on what the Involved Parties produce, trade in, or manufacture; for example, Financial Services or Computer Services. 
 
There is no domain list for this entity as the set of Industry Classifications must be customized for each Financial Institution in accordance with the decisions taken by the Financial Institution on which SICs (Standard Industrial Classification) are chosen for use.
{% enddocs %}

{% docs tbl_SA_IP_CNTRL_BNK_IND_CL_DT %}
Central Bank Industry Classification Date: The date on which the Central Bank Industry Classification was assigned to the Organization.
{% enddocs %}

{% docs tbl_SA_IP_INTN_RPTNG_IND_CL_ID %}
Internal Reporting Industry Classification Id: The unique identifier of the Internal Reporting Industry Classification. 
Industry Classification identifies a Classification that categorizes Involved Parties based on what the Involved Parties produce, trade in, or manufacture; for example, Financial Services or Computer Services. 
 
There is no domain list for this entity as the set of Industry Classifications must be customized for each Financial Institution in accordance with the decisions taken by the Financial Institution on which SICs (Standard Industrial Classification) are chosen for use.
{% enddocs %}

{% docs tbl_SA_IP_INTN_RPTNG_IND_CL_DT %}
Internal Reporting Industry Classification Date: The date on which the Internal Reporting Industry Classification was assigned to the Organization.
{% enddocs %}

{% docs tbl_SA_IP_ORG_ECNMC_INTNT_ID %}
Organization Economic Intent Id: The unique identifier of the Organization Economic Intent. 
Organization Economic Intent distinguishes between Organizations according to their intention regarding financial gain. The declaration and recording of this intention can affect an organization's tax susceptibility and liability under the laws of some geographical regions. 
 
Domain: 
For-Profit Organization 
Not-For-Profit Organization
{% enddocs %}

{% docs tbl_SA_IP_ORG_ECNMC_INTNT_DT %}
Organization Economic Intent Date: The date on which the Organization Economic Intent Type was assigned to the Organization.
{% enddocs %}

{% docs tbl_SA_IP_ORG_LGL_STRC_TY_ID %}
Organization Legal Structure Type Id: The unique identifier of the Organization Legal Structure Type. 
Organization Legal Structure classifies Organizations based on their legal form or structure. For example, Public Organization, Partnership, Sole Proprietorship. 
 
Domain: 
 Corporation 
 Partnership 
 Sole Proprietorship 
 Trust 
 Syndicate 
 Joint Venture 
 Cooperative 
 Limited Company 
 Public Limited Company 
 Credit Union
{% enddocs %}

{% docs tbl_SA_IP_ORG_LGL_STRC_DT %}
Organization Legal Structure Date: The date on which the Organization Legal Structure Type was assigned to the Organization.
{% enddocs %}

{% docs tbl_SA_IP_ORG_NBR_OF_EMP_SEG_ID %}
Organization Number Of Employees Segment Id: The unique identifier of the Organization Number of Employees Segment.
{% enddocs %}

{% docs tbl_SA_IP_ORG_NBR_OF_EMP_SEG_DT %}
Organization Number Of Employees Segment Date: The date on which the Organization Number Of Employees Segment was assigned to the Organization.
{% enddocs %}

{% docs tbl_SA_IP_ORG_PRPS_ID %}
Organization Purpose Id: The unique identifier of the Organization Purpose Type. 
Organization Purpose distinguishes between Organizations according to their purpose or format; for example, Association and Public Service. 
 
Domain: 
 Public Sector 
 -- Public Service 
 -- Government 
 -- Utility 
 Private 
 -- Association 
 -- Business 
 -- Education Institution 
 -- Religious Institution 
 Association 
 -- Banking Association 
 -- Card Association
{% enddocs %}

{% docs tbl_SA_IP_ORG_PRPS_DT %}
Organization Purpose Date: The date on which the Organization Purpose Type was assigned to the Organization.
{% enddocs %}

{% docs tbl_SA_IP_ORG_REV_SEG_ID %}
Organization Revenue Segment Id: The unique identifier of the Organization Revenue Segment. 
Organization Revenue Segment that is a grouping of Organizations according to the income received by the Organization.
{% enddocs %}

{% docs tbl_SA_IP_ORG_REV_SEG_DT %}
Organization Revenue Segment Date: The date on which the Organization Revenue Segment was assigned to the Organization.
{% enddocs %}

{% docs tbl_SA_IP_INCORPTN_GEO_ID %}
Incorporation Geographic Area Id: The unique identifier of the Incorporation Geographic Area.
{% enddocs %}

{% docs tbl_SA_IP_INCORPTN_GEO_DT %}
Incorporation Geographic Area Date: The date on which the Incorporation Geographic Area was assigned to the Organization.
{% enddocs %}

{% docs tbl_SA_IP_ESTB_DT %}
Establish Date: Specifies the date on which the Organization was 
formally established.
{% enddocs %}

{% docs tbl_SA_IP_ORG_LGLTY_END_DT %}
Organization Legality End Date: Specifies the date on which the Organization will cease to legally exist. The Organization must apply to continue the Organization before that date is reached. Also known as the Proxy End Date.
{% enddocs %}

{% docs tbl_SA_IP_DSSLVD_DT %}
Dissolved Date: Specifies the date on which the Organization was formally dissolved.
{% enddocs %}

{% docs tbl_SA_IP_PRMY_CMRCL_NM %}
Primary Commercial Name: The primary commercial name of an Organization, by which it is most commonly recognized.
{% enddocs %}

{% docs tbl_SA_IP_RGSTRD_BSNS_NM %}
Registered Business Name: The name under which the Organization has been registered in order to conduct business.
{% enddocs %}

{% docs tbl_SA_IP_ORG_CD %}
Organization Code: An internal code or business identifier used within the Financial Institution to identify the Organization (usu. a subsidiary or partner) e.g. for accounting purposes.
{% enddocs %}

{% docs tbl_SA_IP_ORG_OPERTL_AREA_TY_ID %}
Organization Operational Area Type Id: The unique identifier of the Organization Operational Area Type. 
Organization Operational Area Type classifies Organizations according to whether the Organization is national or multinational.
{% enddocs %}

{% docs tbl_SA_IP_ORG_OPERTL_AREA_TY_DT %}
Organization Operational Area Type Date: The date on which the Organization Operational Area Type was assigned to the Organization.
{% enddocs %}

{% docs tbl_SA_IP_OU_LC_STS_TY_ID %}
Organization Unit Life Cycle Status Type Id: The unique identifier of the Organization Unit Life Cycle Status Type. 
Organization Unit Life Cycle Status Type classifies Organization Units according to the life cycle states through which they may pass over time; for example, Proposed Organization Unit, Closed Organization Unit. 
 
Domain: 
 Active Organization Unit, 
 Closed Organization Unit, 
 Pending Closure Org Unit, 
 Proposed Organization Unit, 
 Suspended Organization Unit
{% enddocs %}

{% docs tbl_SA_IP_OU_LC_STS_DT %}
Organization Unit Life Cycle Status Date: The date on which the Organization Unit entered the current Life Cycle Status.
{% enddocs %}

{% docs tbl_SA_IP_OWNG_ORG_ID %}
Owning Organization Id: The unique identifier of the Organization to which the Organization Unit belongs.
{% enddocs %}

{% docs tbl_SA_IP_MGR_EMP_ID %}
Manager Employee Id: The unique identifier assigned to the Employee with responsibility for management of the Organization Unit.
{% enddocs %}

{% docs tbl_SA_IP_OU_AUTH_DSGNTN_TY_ID %}
Organization Unit Authority Designation Type Id: The unique identifier of the Organization Unit Authority Designation Type. 
Organization Unit Authority Designation Type classifies Organization Units based on the scope or sphere of their authority or responsibility. Generally their proximity to the business activity is considered; for example, the Regional Headquarters has responsibility for sales production in a seven state area and exercises authority over all Branches and Local Offices in the same geographical area, the Local Office is held accountable for managing customer relationships within its local community. 
 
Domain: 
 Corporate Headquarters 
 Regional Headquarters 
 Representative Office 
 Local Office 
 Branch
{% enddocs %}

{% docs tbl_SA_IP_OU_AUTH_DSGNTN_DT %}
Organization Unit Authority Designation Date: The date on which the Organization Unit was classified as having the current scope of authority or responsibility.
{% enddocs %}

{% docs tbl_SA_IP_OU_FNCTN_TY_ID %}
Organization Unit Function Type Id: The unique identifier of the Organization Unit Function Type. 
Organization Unit Function Type classifies Organization Units based on the general nature of the activities they are responsible for performing. 
 
Domain: 
 Accounting Organization Unit 
 Administrative Organization Unit 
 Marketing Organization Unit 
 Operations Organization Unit 
 Personnel Organization Unit 
 Product Service Organization Unit 
 -- Trust Organization Unit 
 -- Commercial Organization Unit 
 -- Wholesale Organization Unit 
 -- Corporate Finance Organization Unit 
 -- Trading And Sales Organization Unit 
 -- Retail Banking Organization Unit 
 -- Retail Brokerage Organization Unit 
 -- Commercial Banking Organization Unit 
 -- Payment And Settlement Organization Unit 
 -- Agency Services Organization Unit 
 -- Asset Management Organization Unit 
 -- Investment Banking Unit 
 -- Other Financial Line Of Business 
 -- Federal Home Loan Banking Unit 
 
 
 Contact Center Organization Unit
{% enddocs %}

{% docs tbl_SA_IP_OU_FNCTN_DT %}
Organization Unit Function Date: The date on which the current function type was assigned to the Organization Unit.
{% enddocs %}

{% docs tbl_SA_IP_LOB_ID %}
Line Of Business Id: The unique identifier of the Line of Business. 
Line Of Business groups the Financial Institution's organizational units based on the main products and services which are managed and serviced by the organization unit. 
 
Domain: 
 Corporate Finance 
 Trading And Sales 
 Retail Banking 
 Commercial Banking 
 Payment And Settlement 
 Agency Services 
 Asset Management 
 Retail Brokerage 
 
Details of activities performed by each of the Business groups is as follows:- 
 
Corporate Finance:- Mergers and acquisitions, underwriting, privatizations, 
securitization, research, debt (government, high yield), equity, 
syndications, IPO, secondary private placements 
 
Trading & 
Sales:- Fixed income, equity, foreign exchanges, commodities, credit, 
funding, own position securities, lending and repos, brokerage, 
debt, prime brokerage 
 
Retail Banking:- Retail lending and deposits, banking services, trust and estates,Private lending and deposits, banking services, trust and 
Retail Banking estates, investment advice,Merchant/commercial/corporate cards, private labels and retail 
 
Commercial Banking:- Project finance, real estate, export finance, trade finance,factoring, leasing, lending, guarantees, bills of exchange 
 
Payment and Settlement:- Payments and collections, funds transfer, clearing and settlement 
 
Agency Services:- Escrow, depository receipts, securities lending (customers) corporate actions,Issuer and paying agents 
 
Asset Management:- Discretionary Fund Management, Non-Discretionary Fund Management
{% enddocs %}

{% docs tbl_SA_IP_LOB_DT %}
Line Of Business Date: The date on which the Organization Unit took on the service of the current Line Of Business.
{% enddocs %}

{% docs tbl_SA_IP_OU_STRC_TY_ID %}
Organization Unit Structure Type Id: The unique identifier of the Organization Unit Structure Type. 
Organization Unit Structure Type classifies Organization Units according to the hierarchical level or relative position within the organization. 
 
Domain: 
 Group 
 Division 
 Department 
 Section 
 Team
{% enddocs %}

{% docs tbl_SA_IP_OU_STRC_DT %}
Organization Unit Structure Date: The date on which the current Organization Unit Structure Type was assigned to the Organization Unit.
{% enddocs %}

{% docs tbl_SA_IP_BRNCH_NBR %}
Branch Number: An identifier advertised to Customers to enable easy identification of the Organization Unit. For example the Zurich Branch of the Bank is known by the code 11-22-33.
{% enddocs %}

{% docs tbl_SA_IP_OU_CD %}
Organization Unit Code: An internal code or business identifier used within the Financial Institution to identify the Organization Unit e.g. for accounting purposes.
{% enddocs %}

{% docs tbl_SA_IP_OU_GEOG_ID %}
Organization Unit Geography Id: The unique identifier of the Organization Unit Geography.
{% enddocs %}

{% docs tbl_SA_IP_OU_GEOG_DT %}
Organization Unit Geography Date: The date on which the current Organization Unit Geography was assigned to the Organization Unit.
{% enddocs %}

{% docs tbl_SA_IP_SCL_MEDA_PSNA_NM %}
Social Media Persona Name: The online name used by the Social Media Persona. This may be a pseudonym such as a nickname or alias.
{% enddocs %}

{% docs tbl_SA_IP_SCL_MEDA_PSNA_EFFV_DT %}
Social Media Persona Effective Date: Specifies the date on which the Social Media Persona originated.
{% enddocs %}

{% docs tbl_SA_IP_SCL_MEDA_PSNA_RELBTY_RTNG_ID %}
Social Media Persona Reliability Rating Id: The unique identifier of the Social Media Persona Reliability Rating. 
Reliability Rating classifies information recorded in the Warehouse according to the precision and accuracy of the methods and data employed to derive the resultant value. 
 
Domain: 
 Estimated Value 
 Actual Value 
 Verified Customer Supplied Information 
 Unverified Customer Supplied Information 
 Supplied By Third Party 
 Derived From Statistics 
 Estimated As Complete Value
{% enddocs %}

{% docs tbl_SA_IP_SCL_MEDA_PSNA_PRMY_EMAIL_ADDR_ID %}
Social Media Persona Primary E-mail Address Id: The unique identifier of the E-Mail Address that is included in the Social Media Persona.
{% enddocs %}

{% docs tbl_SA_IP_CUST_LC_STS_TY_ID %}
Customer Life Cycle Status Type Id: The unique identifier of the Customer Life Cycle Status Type. 
Customer Life Cycle Status Type classifies a Customer according to the life cycle states through which it may pass over time; for example, 'Active Customer Relationship', 'Declined Customer Relationship'. 
 
Domain: 
 Prospective Customer 
 Potential Customer 
 Declined Customer 
 Rejected Customer 
 Active Customer 
 Former Customer 
 Dormant Customer
{% enddocs %}

{% docs tbl_SA_IP_CUST_LC_STS_DT %}
Customer Life Cycle Status Date: The date upon which the Customer was assigned a particular Life Cycle Status.
{% enddocs %}

{% docs tbl_SA_IP_CUST_MSEG_ID %}
Customer Market Segment Id: The unique identifier of the Customer Market Segment. 
Customer Market Segment is a dimension that groups customers based on specific shared characteristics; in this case their industry category or individual characteristics. For example; all Individuals living in Manhattan who are aged between 20 and 30, all Organizations with greater than 1,000 employees
{% enddocs %}

{% docs tbl_SA_IP_CUST_MSEG_DT %}
Customer Market Segment Date: The date on which a Customer was assigned to a particular Market Segment
{% enddocs %}

{% docs tbl_SA_IP_CUST_RL_AGE_SEG_ID %}
Customer Relationship Age Segment Id: The unique identifier of the Customer Relationship Age Segment. 
Customer Relationship Age Segment is a Segment which classifies customers based on the continuous time from the start date of the first active arrangement in which the customer participated.
{% enddocs %}

{% docs tbl_SA_IP_CUST_RL_AGE_SEG_DT %}
Customer Relationship Age Segment Date: The date the Customer was assigned to a particular Customer Relationship Age Segment.
{% enddocs %}

{% docs tbl_SA_IP_CUST_PROFT_SEG_ID %}
Customer Profitability Segment Id: The unique identifier of the Customer Profitability Segment. 
Customer Profitability Segment is a grouping of Involved Parties according to their expected effect on the net income for the Financial Institution.
{% enddocs %}

{% docs tbl_SA_IP_CUST_PROFT_SEG_DT %}
Customer Profitability Segment Date: The date on which the Customer was assigned to a Customer Profitability Segment.
{% enddocs %}

{% docs tbl_SA_IP_SATSF_RTNG_ID %}
Satisfaction Rating Id: The unique identifier of the Customer's Satisfaction Rating with the Financial Institution. 
Satisfaction Rating identifies the level of Satisfaction with the Financial Institution.
{% enddocs %}

{% docs tbl_SA_IP_SATSF_RTNG_DT %}
Satisfaction Rating Date: The date on which the Satisfaction Rating was assigned to the Customer.
{% enddocs %}

{% docs tbl_SA_IP_RTN_RTNG_ID %}
Retention Rating Id: The unique identifier of the Retention Rating. 
Identifies a Rating Value that represents an evaluation of the probability that the Financial Institution will retain a particular relationship over time. 
 
Domain: 
 Certain To Stay 
 Probably Will Stay 
 Neutral 
 Probably Will Leave
{% enddocs %}

{% docs tbl_SA_IP_RTN_RTNG_DT %}
Retention Rating Date: The date the Customer was assigned to a particular Retention Rating Code.
{% enddocs %}

{% docs tbl_SA_IP_PRMY_BRNCH_NBR %}
Primary Branch Number: Derived value of the Branch Number of the Organization Unit referenced by the Primary Branch Id.
{% enddocs %}

{% docs tbl_SA_IP_PRMY_BRNCH_DT %}
Primary Branch Date: The date on which the Primary Branch was assigned to the Customer.
{% enddocs %}

{% docs tbl_SA_IP_PRMY_PRD_AR_ID %}
Primary Product Arrangement Id: The Product Arrangement of primary interest between the Financial Institution and the Customer.
{% enddocs %}

{% docs tbl_SA_IP_END_CUST_DT %}
End Customer Date: The date upon which the Customer ceased to be relevant.
{% enddocs %}

{% docs tbl_SA_IP_GEO_ID %}
Geographic Area Id: The unique identifier of the Geographic Area containing the Customer's primary residence or place of business.
{% enddocs %}

{% docs tbl_SA_IP_EFFV_CUST_DT %}
Effective Customer Date: The date upon on which this Customer was first recorded on CIDB.
{% enddocs %}

{% docs tbl_SA_IP_INTRNT_BNK_FLG %}
Internet Banking Flag: Indicates whether the Customer avails of Internet Banking access facilities provided by the Financial Institution.
{% enddocs %}

{% docs tbl_SA_IP_PH_BNK_FLG %}
Telephone Banking Flag: Indicates whether the Customer avails of Telephone Banking access facilities provided by the Financial Institution.
{% enddocs %}

{% docs tbl_SA_IP_SPCL_TRMS_FLG %}
Special Terms Flag: Indicates if the Financial Institution has granted favorable terms or imposed punitive terms on Arrangements with the Customer in the past or at present.
{% enddocs %}

{% docs tbl_SA_IP_CR_RSK_SCOR %}
Credit Risk Score: The credit score for the Customer, which is derived as a numeric score from several different measures used to assess a Customer's risk rating.
{% enddocs %}

{% docs tbl_SA_IP_PROF %}
SA Involved Party Profile: Individual Profile stores financial and non-financial information about an Individual, recording things like; Annual Salary, Financial Assets, Liabilities, Net Worth, Number of Dependents, Preferred Communication Form e.g. IP Prefers to be contact via speech etc. 
 
The information is considered to be valid between the given Effective and End Dates, which may cover a past, present or future time period. 
 
Organization Profile tracks financial and non-financial information about an organization that is of interest to the Financial Institution. The type of information recorded could include: Fixed Assets, Short term Creditors, Total Borrowing, Number of Employees, Annual Pre-Tax Profit, Share Prices etc.
{% enddocs %}

{% docs tbl_SA_IP_PROF_EFFV_DT %}
Effective Date: The date from which the profile information is considered to be valid.
{% enddocs %}

{% docs tbl_SA_IP_PROF_DNMNTN_CUR_ID %}
Denomination Currency Id: The identifier of the Currency in which the monetary amounts are expressed.
{% enddocs %}

{% docs tbl_SA_IP_PROF_IP_ID %}
Involved Party Id: The unique identifier for the relevant Involved Party (Individual or Organization.)
{% enddocs %}

{% docs tbl_SA_IP_PROF_END_DT %}
End Date: The date on which the profile information ceases to be valid.
{% enddocs %}

{% docs tbl_SA_IP_PROF_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_IP_PROF_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_IP_PROF_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_IP_PROF_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_IP_PROF_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_IP_PROF_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_IP_PROF_ORGNL_CUR_ID %}
Original Currency Id: The unique identifier of the Original Currency.
{% enddocs %}

{% docs tbl_SA_IP_PROF_XCHG_RTE_TO_ORGNL_CUR %}
Exchange Rate To Original Currency: The exchange rate used for translation out of a working currency back into an original currency.
{% enddocs %}

{% docs tbl_SA_IP_PROF_PRFRD_CMM_FORM_ID %}
Preferred Communication Form Id: The unique identifier of the Preferred Communication Form e.g. an IP who prefers to be contacted in written form.
{% enddocs %}

{% docs tbl_SA_IP_PROF_PRMY_SRC_OF_INCM_TY_ID %}
Primary Source Of Income Type Id: The unique identifier of the Source Of Income Type. 
Customer Relationship Valuation Type classifies instances of Customer according to their source of income. The source of income can have a direct bearing on the customers investment strategy, spending habits and reliability. 
 
Domain:
 Salary 
 Contract 
 Pension 
 Equities 
 Trust Fund
{% enddocs %}

{% docs tbl_SA_IP_PROF_NBR_OF_DPNDT_CHLD %}
Number Of Dependent Children: The number of children who are dependant on the Individual for support.
{% enddocs %}

{% docs tbl_SA_IP_PROF_NBR_OF_DEPND %}
Number Of Dependants: The number of people who are dependant on the Individual for support, including the count of dependent children.
{% enddocs %}

{% docs tbl_SA_IP_PROF_MTHLY_HSNG_COST %}
Monthly Housing Cost: The monthly cost of housing for the Individual.
{% enddocs %}

{% docs tbl_SA_IP_PROF_HSNG_INS_COST_AMT %}
Housing Insurance Cost Amount: The amount of insurance that an Individual pays in relation to their residential property. For example, this may include property insurance and mortgage insurance.
{% enddocs %}

{% docs tbl_SA_IP_PROF_YRS_AT_CRNT_ADDR %}
Years At Current Address: The number of years the Individual has been resident at the current address.
{% enddocs %}

{% docs tbl_SA_IP_PROF_HO_ASSOC_FEE %}
Homeowners Association Fee: The amount of any homeowners' association fees that an Individual is liable to pay in relation to their property. For example, the owner of an apartment pays a monthly fee for the maintenance of common facilities such as elevators, gardens and lighting in common areas.
{% enddocs %}

{% docs tbl_SA_IP_PROF_IDV_ANNL_SLRY %}
Individual Annual Salary: The annual salary of the Individual.
{% enddocs %}

{% docs tbl_SA_IP_PROF_IDV_OTHR_ANNL_INCM %}
Individual Other Annual Income: An Individual's secondary income. This may come from a second employment position, or dividends from holdings in stocks and shares, trusts etc.
{% enddocs %}

{% docs tbl_SA_IP_PROF_IDV_NET_WRTH %}
Individual Net Worth: An Individual's assets minus liabilities.
{% enddocs %}

{% docs tbl_SA_IP_PROF_IDV_AGE %}
Individual Age: The age of the Individual.
{% enddocs %}

{% docs tbl_SA_IP_PROF_IDV_OTHR_NFNC_ASSET %}
Individual Other Non-Financial Assets: The assets of an Individual which are considered to be non-financial.
{% enddocs %}

{% docs tbl_SA_IP_PROF_IDV_REAL_PRPRTY_ASSET %}
Individual Real Property Assets: The value of parcels of land and all physical property related to it, that belong to the Individual.
{% enddocs %}

{% docs tbl_SA_IP_PROF_IDV_FNC_ASSET %}
Individual Financial Assets: The amount of Financial Assets recorded for an Individual.
{% enddocs %}

{% docs tbl_SA_IP_PROF_IDV_LIBLTY %}
Individual Liabilities: An Individual's debts.
{% enddocs %}

{% docs tbl_SA_IP_PROF_NO_OF_MEMB %}
No Of Members: Where applicable, the number of members of the Organization e.g. clubs, voluntary organizations.
{% enddocs %}

{% docs tbl_SA_IP_PROF_NO_OF_EMP %}
No Of Employees: The number of employees working for the Organization.
{% enddocs %}

{% docs tbl_SA_IP_PROF_FXD_ASSET %}
Fixed Assets: The Organization's fixed assets are those that are not convertible into cash within 1 year (or business operating period) and include furniture, buildings and machinery.
{% enddocs %}

{% docs tbl_SA_IP_PROF_CRNT_ASSET %}
Current Assets: The value of assets for the Organization which are already in the form of, or are readily convertible into cash, usually within 1 year.
{% enddocs %}

{% docs tbl_SA_IP_PROF_SHRT_TERM_CRDTR %}
Short-Term Creditors: The number of Involved Parties to which the Organization owes money on a short term basis (usually less than a year).
{% enddocs %}

{% docs tbl_SA_IP_PROF_TOT_BRRW %}
Total Borrowing: The total value amount of Loan Arrangements with this and other Financial Institutions.
{% enddocs %}

{% docs tbl_SA_IP_PROF_CAP_AND_RSRVS %}
Capital and Reserves: The amount of Capital and Reserves recorded for an Organization.
{% enddocs %}

{% docs tbl_SA_IP_PROF_ANNL_PRE_TAX_PROFT %}
Annual Pre-Tax Profit: The annual pre-tax profit for an Organization, before the deduction of Corporation and other taxes
{% enddocs %}

{% docs tbl_SA_IP_PROF_ANNL_SALE_REV %}
Annual Sales Revenue: The annual income generated from sales of Products and Services by the Organization, before the subtraction of the costs of delivering the Products and Services.
{% enddocs %}

{% docs tbl_SA_IP_PROF_CSH_FLW %}
Cash Flow: The cash available to the Organization from its business operations and investments. A positive cash flow indicates that income is sufficient to cover related expenses.
{% enddocs %}

{% docs tbl_SA_IP_PROF_THREE_YR_AVG_ANNL_GRS_INCM %}
Three Year Average Annual Gross Income: The annual gross income of the Organization, averaged out over a running three-year period.
{% enddocs %}

{% docs tbl_SA_IP_PROF_VAL_ADD_PROFT %}
Value Added Profit: Identifies the net income (profit) adjusted by the cost of the regulatory capital required to support the business. Also known as Shareholder Value.
{% enddocs %}

{% docs tbl_SA_IP_PROF_TOT_EQTY %}
Total Equity: The total corporate stock of the Organization.
{% enddocs %}

{% docs tbl_SA_IP_PROF_ROE %}
Return On Equity: The return on equity for an Organization is determined by dividing its net income by its total equity.
{% enddocs %}

{% docs tbl_SA_IP_PROF_EPS %}
Earnings Per Share: Earnings per share for the Organization is calculated as the net income of the shares divided by the number of outstanding shares of common stock.
{% enddocs %}

{% docs tbl_SA_IP_PROF_AVG_SHR_PRC %}
Average Share Price: The average share price of the Organization for the period under analysis.
{% enddocs %}

{% docs tbl_SA_IP_PROF_SHR_PRC_HI %}
Share Price High: The highest price attained by shares of the Organization for the period under analysis.
{% enddocs %}

{% docs tbl_SA_IP_PROF_SHR_PRC_LOW %}
Share Price Low: The lowest price reached by shares of the Organization during the period under analysis.
{% enddocs %}

{% docs tbl_SA_IP_PROF_PE_RAT %}
Price/Earnings Ratio: The price/earnings ratio of the Organization for the period under analysis, calculated by dividing the current share price by the Earnings Per Share.
{% enddocs %}

{% docs tbl_SA_IP_PROF_ERN_TO_FXD_COST_RAT %}
Earnings To Fixed Costs Ratio: Identifies the number of times total income exceeds fixed costs. This gives an indication of the viability of the business to cover costs with profits.
{% enddocs %}

{% docs tbl_SA_IP_PROF_ASSET_TRNVR_RAT %}
Asset Turnover Ratio: The ratio of the Organization's assets which are turnover on a periodic basis.
{% enddocs %}

{% docs tbl_SA_IP_PROF_DEBT_TO_EQTY_RAT %}
Debt To Equity Ratio: The percentage of the Organization that is financed by Creditors.
{% enddocs %}

{% docs tbl_SA_IP_PROF_COST_TO_INCM_RAT %}
Cost To Income Ratio: Identifies the ratio of total non-interest costs over total income. This gives an indication of the sustainability of profit through the business cycle.
{% enddocs %}

{% docs tbl_SA_IP_PROF_NON_II_RAT %}
Non Interest Income Ratio: Identifies the non-interest income over the total operating expense. This gives an indication of the strength of fees as an income source.
{% enddocs %}

{% docs tbl_SA_IP_PROF_STAFF_COST_RAT %}
Staff Cost Ratio: Identifies the ratio of total staff costs over non-interest costs. This gives an indication of the proportionate cost of human resources.
{% enddocs %}

{% docs tbl_SA_IP_PROF_COST_TO_ASSET_RAT %}
Cost To Asset Ratio: Identifies the ratio of total non-interest costs over total assets. This gives an indication of the cost of infrastructure required to support the servicing of assets.
{% enddocs %}

{% docs tbl_SA_IP_PROF_CRNT_RAT %}
Current Ratio: Identifies the ratio of short-term assets to short-term liabilities, thereby giving an indication of the liquidity of the Organization.
{% enddocs %}

{% docs tbl_SA_IP_PROF_RCPTL_AMT %}
Regulatory Capital Amount: The amount of capital of the Organization as determined by regulatory accounting principles.
{% enddocs %}

{% docs tbl_SA_IP_PROF_DSCRT_CAP_AMT %}
Discretionary Capital Amount: The amount of capital of the Organization in excess of the Regulatory Capital Amount, as determined by the Organization's own accounting principles.
{% enddocs %}

{% docs tbl_SA_IP_PROF_NET_WRKNG_CAP %}
Net Working Capital: Identifies the available capital, once all liabilities have been accounted for.
{% enddocs %}

{% docs tbl_SA_IP_PROF_LLP %}
Loan Loss Provision: Identifies an amount of funds allocated by the Organization to establish a reserve for expected credit (loan) losses. This gives an indication of how well the Organization has provided for losses.
{% enddocs %}

{% docs tbl_SA_IP_PROF_CAP_GEAR %}
Capital Gearing: The relationship between the Organization's capital Funds and Liabilities
{% enddocs %}

{% docs tbl_SA_IP_PROF_CAPTL_PCT %}
Capitalization Percentage: The proportion of the total worth of the Organization that the owners' investment represents.
{% enddocs %}

{% docs tbl_SA_IP_PROF_ROI %}
Return On Investment: The total profits during the Measurement Period, expressed as a percentage of the amount invested by the Financial Institution.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES %}
SA Involved Party Postal Addresses: Involved Party / Postal Address Relationship is an associative entity between Involved Party and Address. The Involved Party Address entity relates a specific Involved Party to a particular Address and defines the purpose for this association. For example, a customer's residential address, or an organization's registered address. 
 
Historical instances are maintained.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_IP_ID %}
Involved Party Id: The unique identifier assigned to an Involved Party.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_IP_TO_PSTL_ADDR_RL_TY_ID %}
Involved Party / Postal Address Rltnp Type Id: The unique identifier of the Involved Party / Postal Address Relationship Type. 
 
Involved Party / Postal Address Relationship Type classifies the relationships between Involved Parties and Postal Addresses. For example, the address of the home of the Involved Party, their workplace, or a premises owned by them. 
 
Domain:
 Legal Address 
 Mailing Address 
 Registered Office 
 Residential Address 
 Business Address 
 Care Of Address
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_EFFV_DT %}
Effective Date: The date from which an instance of the entity is valid.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_RNK %}
Rank: A sequence number to identify different occurrences of the same Relationship Type with the same Involved Party on the same Effective Date.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_END_DT %}
End Date: The Calendar date after which an instance of the entity is no longer valid.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_IP_SRC_SYS_CD %}
Involved Party Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_IP_SRC_SYS_UNQ_KEY_TXT %}
Involved Party Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_DESC %}
Description: A textual explanation or free form comments about the Relationship.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_CNTNTY_OF_ADDR_SEG_ID %}
Continuity Of Address Segment Id: The unique identifier of the Continuity Of Address Segment. 
 
Continuity of Address Segment is a derived classification used to segment individuals according to how long they have resided at their current or previous addresses. For example; One Year or Less, Between 1 and 3 years, Between 3 and 6 Years, 6 Years or More. 
 
Design Note: 
The granularity of the time units chosen is a customization issue.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_CNTCT_TXT %}
Contact Text: Supporting text to identify the contact point for the Involved Party.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_SOLCT_FLG %}
Solicitable Flag: A flag indicating whether the Involved Party has expressed that they would not like to receive any marketing material, brochures, etc. to the given Location.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_ADDR_NM %}
Address Name: The name of a building or organization which appears in an address e.g. Rose Cottage, Bramble Way or General Post Office, Dublin 2
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_BOX_NBR %}
Box Number: An address component that represents a mail receptacle located at a public Post Office or other postal service provider.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_UNT_NBR %}
Unit Number: An address component that represents the numeric portion or alphanumeric label that identifies a unit within a building, for example, 14, as in Apartment 14, 15 Bath Road.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_BLDG_NBR %}
Building Number: An address component that represents the numeric portion or alphanumeric label that identifies a building on a street, for example, 2 , as in 2 Main Street, 14B, as in 14B Oxford Street.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_STE_NBR %}
Street Number: An address component that represents the numeric value assigned to the street, for example, 5 as in 5th Avenue.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_STE_NM %}
Street Name: The label assigned to a street. 
 
May include concatenations of components such as, Street Number (5 as in 5th Avenue), Name (Main as in Main Street), Street Type (Avenue, Drive, Court, Lane), Direction (North as in North High Street), and Suffix (Lower as in 14 Baggot St. Lower).
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_STE_TY %}
Street Type: An address component that represents the type of street, for example, Avenue, Drive, Court, Lane.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_STE_DRCTN %}
Street Direction: An address component that represents one or more compass points that are used to distinguish an address, for example, High Street SE or High Street NW.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_STE_SFX %}
Street Suffix: An address component that represents the suffix assigned to the street: for example, Lower as in 14 Baggot St. Lr.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_PSTCD_AREA_ID %}
Postcode Area Id: The unique identifier of the Postcode Area.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_DSTRCT %}
District: Free-form text indicating the area (district, suburb, townland, etc.) in which the Postal Address is located.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_CITY_ID %}
City Id: The unique identifier of the City.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_ST_ID %}
State Id: The unique identifier of the State.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_CNTY_ID %}
County Id: The unique identifier of the County.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_CNTRY_ID %}
Country Id: The unique identifier of the Country.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_RT_ID %}
Route Id: The unique identifier of the Route.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_CENSUS_AREA_ID %}
Census Area Id: The unique identifier of the Census Area.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_BLDG_TY_ID %}
Building Type Id: The unique identifier of the Building Type located at the Postal Address.
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_LONGD %}
Longitude: The Longitude (in degrees, in decimal form) of the Postal Address. Values can range from -180 (west) to 180 (east).
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_LATD %}
Latitude: The Latitude (in degrees, in decimal form) of the Postal Address. Values can range from -90 (south) to 90 (north).
{% enddocs %}

{% docs tbl_SA_IP_PSTL_ADDRESSES_PSTL_BARCDE %}
Postal Barcode: A multi-digit code used by postal companies to encode components of the address. 
this is not the same as the Post code Area or Zip code...
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR %}
SA Involved Party Electronic Address: Involved Party Electronic Address is an entity relating a specific Involved party to an Electronic Address. 
Electronic Address can be a Telephonic Address, E-Mail Address, Web Address, Electronic Address Domain, or Internet Protocol Address (IP Address) 
 
 
This entity combines the Associative entities and the corresponding entity attributes. 
 
The Involved Party / Telephonic Address Relationship is an associative entity relating a specific Involved Party to a particular Telephonic Address and defines the purpose for this association. For example, a customer's home phone number or an organization's business fax number. 
Telephonic Address is an Electronic Address - identifying the location of a telephone, fax, telex, pager or other telephonic device that can be used to communicate spoken or digital text information; for example, +44-181-9977666. 
Telephonic Address - can be used to hold numbers of different granularities e.g. Country Codes, Area Codes, full telephone numbers. 
In the case of mobile telephone technology, IMSI Number represents International Mobile Subscriber Identity numbers, which may be unassigned, or assigned to a SIM Card. 
 
Involved Party / E-Mail Address Relationship - is an associative entity relating a specific Involved Party to a particular E-Mail (electronic mail) Address and defines the purpose for this association. For example, a customer's personal e-mail address or an organization's helpline e-mail address. 
E-Mail Address - is an Electronic Address which identifies a logical address which can be used to send and receive correspondence over a computer network; for 
example,'jsmith@jonesinc.com'. 
 
Electronic Address Domain - provides a segmentation of e-mail addresses into the common parts of the address which represents a service or network provider. For example in the address 'j_doe@webaddress.com' the Electronic Address Domain is 'webaddress.com'. 
 
Involved Party / Web Address Relationship - is an associative entity relating a specific Involved Party to a particular Web (World Wide Web) Address and defines the purpose for this association. For example, a customer's personal web page or an organization's product ordering web site. 
Web Address - represents an Electronic Address which identifies an address of a logical page of information which can be accessed via the World Wide Web; for example, http://jonesinc.co.uk. 
 
 
Historical instances are maintained.
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_IP_ID %}
Involved Party Id: The unique identifier assigned to an Involved Party.
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_IP_TO_ELTRN_ADDR_RL_TY_ID %}
Involved Party / Electronic Address Rltnp Type Id: The unique identifier of the Relationship Classification. 
Involved Party / Telephonic Address Relationship Type classifies the relationships between Involved Parties and Telephonic Addresses. For example, the home telephone number of the Involved Party, a work fax number, or a pager. 
 
Domain: 
 Home Phone Number 
 Home Fax Number 
 Business Phone Number 
 Business Fax Number 
 Mobile Number 
 Pager Number 
 
Involved Party / E-Mail Address Relationship Type classifies the relationships between Involved Parties and E-Mail Addresses. 
 
Domain: 
 Business E-Mail Address 
 Personal E-Mail Address 
 Help Desk E-Mail Address 
 Order Receipt E-Mail Address 
 
Involved Party / Web Address Relationship Type classifies the relationships between Involved Parties and Web Addresses. 
 
Domain: 
 Individual has Personal Web Page at Web Address 
 Organization has Business Web Site at Web Address 
 Organization has Product Ordering Facility at Web Address 
 Financial Institution offers Banking Channel at Web Address
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_EFFV_DT %}
Effective Date: The date from which an instance of the entity is valid.
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_RNK %}
Rank: A sequence number to identify different occurrences of the same Relationship Type with the same Involved Party on the same Effective Date.
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_END_DT %}
End Date: The Calendar date after which an instance of the entity is no longer valid.
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_IP_SRC_SYS_CD %}
Involved Party Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_IP_SRC_SYS_UNQ_KEY_TXT %}
Involved Party Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_ELTRN_ADDR_TY_ID %}
Electronic Address Type Id: The unique identifier of the Electronic Address Type. 
Electronic Address Type distinguishes between Electronic Addresses according to the nature and application of the Electronic Address. 
 
Domain: 
 Telephonic Address 
 E-Mail Address 
 Web Address 
 Electronic Address Domain 
 Internet Protocol Address (IP Address)
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_TLPHNC_DVC_TY_ID %}
Telephonic Device Type Id: The unique identifier of the Telephonic Device Type .
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_GRNULE %}
Granularity: A code to identify the level of the Telephonic Address e.g. 
CY (Country) 
CA (Country + Code) 
N (Country + Code + Number) 
E (Country + Code + Number + Extension) 
U (Unspecified format - content in Full Telephone Number)
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_CNTRY_PH_CD %}
Country Telephone Code: The portion of a telephonic number that identifies a country; for example; the country code for Ireland is 353. Used for International Direct Dialing.
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_PH_CD %}
Telephone Code: The portion of a telephonic number that identifies a region or service within a country e.g. a Geographic Area or a mobile service operator; for example, the Area Telephone Code for New York City is 212.
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_LCL_NBR %}
Local Number: An address component that represents the portion of the telephonic number that identifies each local individual connection to the 
telephone network.
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_EXTNSN %}
Extension: The unique identifier of the Extension number.
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_FL_PH_NBR %}
Full Telephone Number: Holds the concatenation of one or more of the other number fields.
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_EMAIL_USR_ID %}
E-Mail User Id: The User Id of the Individual for E-mail purposes. Their E-mail address.
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_MAXM_MSG_SZ %}
Maximum Message Size: The maximum size (in bytes) of an e-mail accepted by the E-Mail Address. The size includes the body, all headers and attachments.
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_ATTAC_ALWD_FLG %}
Attachments Allowed Flag: Flag indicating whether the e-mail address accepts attachments. 
 
0 - No 
1 - Yes
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_TXT_ONLY_FLG %}
Text Only Flag: Flag indicating whether the e-mail address accepts text only e-mails (otherwise it could accept HTML or other embedded objects). 
 
0 - No (HTML/other objects allowed) 
1 - Yes (text only allowed)
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_ELTRN_ADDR_DM_ID %}
Electronic Address Domain Id: The unique identifier of the Electronic Address Domain. 
 
Electronic Address Domain provides a segmentation of e-mail addresses into the common parts of the address which represents a service or network provider. For example in the address 'j_doe@webaddress.com' the Electronic Address Domain is 'webaddress.com'.
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_WEB_ADDR_TY_ID %}
Web Address Type Id: The unique identifier of the Web Address Type. 
Web Address Type distinguishes between Web Addresses according to the type of the Address. 
 
Domain: 
 Personal Web Address 
 E-Commerce Web Address
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_WEB_ADDR_PRTCL_TY_ID %}
Web Address Protocol Type Id: The unique identifier of the Web Address Protocol Type. 
Indicates the network protocol determined by the protocol portion of the Web Address. 
 
Domain: 
 Hypertext Transfer Protocol (HTTP) 
 File Transfer Protocol (FTP)
{% enddocs %}

{% docs tbl_SA_IP_ELTRN_ADDR_URL %}
Universal Resource Locator: A string in Universal Resource Locator format, containing the Web Address.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_IP_RL %}
SA Arrangement / SA Involved Party Rltnp: Arrangement / Involved Party Relationship identifies the role an Involved Party plays with respect to a specific Arrangement. Each Arrangement must have a relationship to Involved Party; for example, Involved Party John Doe Is Owner Of an Arrangement for a Loan; Involved Party Mary Doe provides the financing in an Arrangement . 
 
Design Note:
Certain Relationships between IPs and ARs are defined more specifically at the Arrangement Subtype Level. These Relationships are not intended to be duplicated in the AR X IP Structure.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_IP_RL_IP_ID %}
Involved Party Id: The unique identifier assigned to an Involved Party.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_IP_RL_AR_TO_IP_RL_TY_ID %}
Arrangement / Involved Party Rltnp Type Id: The unique identifier of the Arrangement / Involved Party Relationship Type. 
Arrangement / Involved Party Relationship Type classifies an Arrangement / Involved Party Relationship according to the role the Involved Party plays in the Arrangement. 
 
Domain:
For General Arrangements:
IP Is Owner In AR 
IP Manages AR 
IP Is Trustee For AR 
IP Is Broker For AR 
IP Is Counterparty To AR 
IP Is Wholesale Counterparty To AR 
IP Has Exposure In AR 
IP Underwrites AR 
IP Is Investor In AR 
IP Is Initiator In AR 
IP Determines Credit Event For AR 
IP Has Walk away Clause For AR 
IP Participates In AR 
IP Is Rabb-ul-mal In AR 
IP Is Mudarib In AR 
IP is Insurance Provider for AR 
IP Is Cosigner Of AR 
AR Has Advanced Funds To IP 
AR Is Provided By IP 
IP Approves AR 
IP Has Assumed Loan AR 
IP Has Obligation To Deliver Under AR 
IP Is Advisor For AR 
IP Is Borrower In AR 
IP Is Customer In AR 
IP Is Data Controller In AR 
IP Is Data Processor In AR 
IP Is Data Subject In AR 
IP Is Guaranteed In AR 
IP Is Informed Of AR 
IP Is Initiator Of AR 
IP Is Intermediary For AR 
IP Is Lender In AR 
IP Is Mortgage Indemnity Provider For AR 
IP Is Primary Beneficiary Of AR 
IP Is Primary Borrower In AR 
IP Is Protection Provider In AR 
IP Is Secondary Borrower In AR 
IP Is Signatory To AR 
IP Provides Consent In AR 
 
 
For Security Arrangements:
IP Is Guarantor in AR 
IP Is Double Default Guarantor In AR 
 
For Insurance Arrangements: 
IP is Primary Policyholder in AR 
IP Pays Premiums for AR 
IP is Insured by AR 
IP is Beneficiary of AR 
IP is Claimant against AR 
 
For Securitization Arrangements:
IP Is Originator Of AR 
IP Is Servicer In AR 
IP Is Credit Enhancement Provider In AR 
IP Is Sponsor In AR 
IP Is Liquidity Provider In AR 
IP Is Reference Entity Of AR 
IP Is Swap Provider In AR 
IP Is Securities Broker/Dealer For AR 
IP Is Qualifying Affiliate In AR 
IP Is Securitization Guarantor In AR
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_IP_RL_AR_ID %}
Arrangement Id: The identifier of an Arrangement (AR) between two or more individuals, organizations or organization units.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_IP_RL_EFFV_DT %}
Effective Date: The date from which an instance of the entity is valid.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_IP_RL_END_DT %}
End Date: The Calendar date after which an instance of the entity is no longer valid.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_IP_RL_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_IP_RL_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_IP_RL_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_IP_RL_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_IP_RL_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_IP_RL_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_IP_RL_AR_SRC_SYS_UNQ_KEY_TXT %}
Arrangement Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_IP_RL_AR_SRC_SYS_CD %}
Arrangement Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_IP_RL_IP_SRC_SYS_CD %}
Involved Party Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_IP_RL_IP_SRC_SYS_UNQ_KEY_TXT %}
Involved Party Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_IP_RL_DESC %}
Description: provides a textual explanation or free form comments about an Arrangement / Involved Party Relationship.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_IP_RL_PCT_AMT %}
Percent Amount: Where the Arrangement / Involved Party Relationship permits of degree, this attribute is used to record that degree in percentage terms (e.g. IDE Bank guarantees 40% of a Line Of Credit).
{% enddocs %}


{% docs tbl_SA_CHNL %}
SA Channel: Channel identifies the different delivery and communications mechanisms through which products and services are made available to a customer and by which the Financial Institution and customers communicate with each other. 
At a leaf level, Channel is a role played by either an Involved Party (e.g. Employee, Organization Unit) or a Resource Item (e.g. an ATM, a Website). At higher levels, Channels are Groups of such Involved Parties and/or Resource Items. 
The lowest granularity of Channel required will be a matter of choice for the Financial Institution. Some may wish to just identify the ATM Network (a Resource Item) as a Channel, whereas others will wish to be able to identify each individual ATM machine (each a Resource Item). A Contact Center (an Organization Unit) may be sufficient granularity as a Channel in some cases - others will require recording of each Contact Center operative (Employees). 
Where a given Involved Party or Resource Item instance is capable of both receiving or distributing services, it may be appropriate to associate that instance with two Channels. For example, a Teller Employment Position may be part of the Teller Receipt Channel for Transactions, but part of the Teller Distribution Channel for Product Campaigns. 
Specific Channels may be utilized where there are accessibility issues e.g. an IP who prefers to be contacted by telephone, in this case the Channel Communication Form of Verbal is utilized. 
 
In OOTB model Channel is a subtype of Group... Channel is now an independent Entity, but uses the Group role name in Involved party / Group relationship 
 
Social Media Channel - subtype of Channel - identifies a type of channel that is used to communicate and share information in an online community. The channel name may also be the name of the Involved Party that administers the channel. For example, Twitter is a channel that is provided by Twitter, Inc. 
Account Access Channel - subtype of channel - identifies the different delivery and communications mechanisms through which account services are made available to a customer and by which the Financial Institution and customers communicate with each other concerning customer accounts.
{% enddocs %}

{% docs tbl_SA_CHNL_CHNL_ID %}
Channel Id: The unique identifier of the Channel.
{% enddocs %}

{% docs tbl_SA_CHNL_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_CHNL_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_CHNL_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_CHNL_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_CHNL_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_CHNL_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_CHNL_END_DT %}
End Date: The Calendar date after which an instance of the entity is no longer valid.
{% enddocs %}

{% docs tbl_SA_CHNL_EFFV_DT %}
Effective Date: The date from which an instance of the entity is valid.
{% enddocs %}

{% docs tbl_SA_CHNL_CHNL_TXT %}
Channel Text: A fixed piece of text describing the Channel (Group).
{% enddocs %}

{% docs tbl_SA_CHNL_CHNL_NM %}
Channel Name: The primary name assigned to the Channel (Group). This name is used in reports and documents.
{% enddocs %}

{% docs tbl_SA_CHNL_CHNL_CD %}
Channel Code: Channel (Group) Code is used where 'meaningful' mnemonic external codes, in each language of the warehouse environment, are assigned to each Channel (Group) occurrence for purposes of identification.
{% enddocs %}

{% docs tbl_SA_CHNL_DESC %}
Description: Description provides a textual explanation or free form comments about the Channel (Group).
{% enddocs %}

{% docs tbl_SA_CHNL_CHNL_TY_ID %}
Channel Type Id: The unique identifier of the Channel Type. 
Channel Type classifies channels according to the method by which the Channel is delivered. 
 
Since a Channel is a role played by Involved Parties or Resource Items, Channel Type deliberately merges several classification values of those two concepts for convenience - in particular, Electronic Delivery Device Type, Employment Position Type, Organization Unit Authority Designation Type and Organization Unit Function Type. If required, the classification values given here can be related to the base classification values via the Classification / Classification Rltnp associative. 
 
Domain: 
 Involved Party Channel 
 -- Employee 
 ---- Teller 
 ---- Manager 
 -- Organization Unit 
 ---- Branch 
 ---- Contact Center 
 ---- Local Office 
 ---- Clearing Center 
 -- Social Media Channel 
 Resource Item Channel 
 -- Personal Computer (e.g. Internet) 
 -- ATM 
 -- Point of Sale Terminal 
 -- Telephonic Device 
 -- Alternative Payment Channel 
 -- Short Messaging Service (SMS) Channel
{% enddocs %}

{% docs tbl_SA_CHNL_CHNL_LC_STS_TY_ID %}
Channel Life Cycle Status Type Id: The unique identifier of the Channel Life Cycle Status Type. 
Channel Life Cycle Status distinguishes between Channels according to the current state of the Channel. 
 
Domain: 
 Active Channel 
 Inactive Channel 
 Terminated Channel
{% enddocs %}

{% docs tbl_SA_CHNL_CHNL_LC_STS_RSN_TY_ID %}
Channel Life Cycle Status Reason Type Id: The unique identifier of the Channel Life Cycle Status Reason Type. 
Channel Life Cycle Status Reason Type classifies a Channel according to the motive for changing the life cycle status of the Channel. 
 
Domain: 
 Channel Acquired 
 Channel Discontinued 
 Channel Withdrawn 
 Channel Out Of Order 
 Channel Reinstated
{% enddocs %}

{% docs tbl_SA_CHNL_CHNL_FNCTN_TY_ID %}
Channel Function Type Id: The unique identifier of the Channel Function Type. 
Channel Function Type classifies channels according to their Business Usage. 
 
Domain: 
 Sales Channel 
 Marketing Channel 
 Distribution Channel 
 Communications Channel
{% enddocs %}

{% docs tbl_SA_CHNL_CHNL_CMM_FORM_ID %}
Channel Communication Form Id: The unique identifier of the Communication Form of Communications that can be transmitted via the Channel. 
 
This attribute is deliberately redundant with respect to the same classification on Communication.
{% enddocs %}

{% docs tbl_SA_CHNL_CHNL_CMM_DRCTN_ID %}
Channel Communication Direction Id: The unique identifier of the Communication Direction of Communications transmitted via the Channel. 
 
This attribute is deliberately redundant with respect to the same classification on Communication.
{% enddocs %}

{% docs tbl_SA_CHNL_CHNL_DLVRY_TMFRM_TY_ID %}
Channel Delivery Timeframe Type Id: The unique identifier of the Channel Delivery Timeframe Type. 
Channel Delivery Time Frame Type classifies channels according to the period of time taken for the channel to deliver a communication to their intended destination, under normal circumstances. 
 
Domain: 
 Instantaneous 
 Less Than 1 Hour 
 Between 1 Hour and 1 Day 
 Between 1 and 3 Days 
 Between 3 and 10 Days 
 Over 10 Days
{% enddocs %}

{% docs tbl_SA_CHNL_CHNL_OWNRSH_TY_ID %}
Channel Ownership Type Id: The classification of the Channel according to its Ownership. 
Channel Ownership Type classifies channels according to their ownership. Channels owned by the Financial Institution will involve more capital expenditure, whereas those owned by other Involved Parties will generally incur a rental or usage charge. 
 
Domain: 
 Financial Institution Owned 
 Partially Financial Institution Owned 
 Third Party Owned
{% enddocs %}

{% docs tbl_SA_CHNL_ADMN_IP_ID %}
Administration Involved Party Id: The unique identifier of the Involved Party with primary responsibility for administration of the Channel. For example, the branch in which a specific ATM is located, the contact center delivering a telesales channel.
{% enddocs %}

{% docs tbl_SA_CHNL_DLVRY_IP_ID %}
Delivery Involved Party Id: Where the Channel can be identified with a single Involved Party that actually delivers the Channel content to the recipient, the unique identifier assigned to that Involved Party. Otherwise, the Involved Party / Channel Rltnp associative should be used.
{% enddocs %}

{% docs tbl_SA_CHNL_RI_CHNL_FLG %}
Resource Item Channel Flag: Indicates whether the Channel is delivered via a Resource Item (1) or an Involved Party (0). and hence whether Delivery Resource Item Id or Delivery Involved Party Id is applicable The flag value should be aligned with the value of Channel Type Id.
{% enddocs %}

{% docs tbl_SA_CHNL_DLVRY_RI_ID %}
Delivery Resource Item Id: Where the Channel can be identified with a single Resource Item that actually delivers the Channel content to the recipient, the unique identifier assigned to that Resource Item. Otherwise, the Resource Item / Channel Rltnp associative should be used.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY %}
SA Campaign Segment Activity:Campaign Segment Activity identifies the processes within a Campaign which are aimed at a particular Segment (a Group). 
A Campaign Segment consists of Campaign Activities 
Campaign Activity details the various steps and activities undertaken, or planned to be undertaken, in order to complete the Campaign successfully.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_CPGN_ID %}
Campaign Id: The unique identifier of a Campaign.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_SEG_ID %}
Segment Id: The unique identifier of a Group representing the Segment targeted by the Activity.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_SCENR_ID %}
Scenario Id: The identifier of the Scenario that applies to the data. 
Scenario classifies values as to the value they represent. 
 
Domain:
 Projection Scenario 
 Stress Scenario 
 Idiosyncratic Liquidity Risk Scenario
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_NBR_OF_SEG_CPGN_CMM %}
Number Of Segment Campaign Communications: The count of Campaign Communications generated by Activities within the Campaign for the given Segment.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_SEG_ACTVTY_LC_STS_TY_ID %}
Segment Activity Life Cycle Status Type Id: The unique identifier of the Event Life Cycle Status Type that applies to the Campaign Segment Activity. 
Event Life Cycle Status Type distinguishes between Events according to their current state within the Event life cycle. 
 
Domain:
 Abandoned Event 
 Cancelled Event 
 Completed Event 
 Event Accepted 
 Event Accepted Partially 
 In Progress Event 
 Pending Event 
 Positive Current Exposure Event 
 Potential Event 
 Received Event 
 Refunded Event 
 Refused Event 
 Rejected Event 
 Returned Event 
 Reversed Event 
 Superseded Event 
 Suspended Event
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_SEG_ACTVTY_LC_STS_RSN_TY_ID %}
Seg Activity Life Cycle Status Reason Type Id: The unique identifier of the Campaign Life Cycle Status Reason Type that applies to the Campaign Segment Activity. 
Campaign Life Cycle Status Reason Type distinguishes between Campaigns according to the motive for changing the life cycle status of the Campaign or associated Activity. 
 
Domain:
 Preparation For New Product 
 Unfavorable Reaction Received 
 Campaign Funding Exhausted 
 Campaign Normal Termination
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_SEG_DLV_AMT_UOM_ID %}
Segment Deliverables Amount Unit Of Measure Id: The unit by which the Segment Deliverables Amount is measured.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_SEG_DLV_AMT %}
Segment Deliverables Amount: The monetary value of Campaign Deliverables targeted or actually delivered by the Campaign for the given Segment.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_MAXM_TRG_NBR %}
Maximum Target Number: The maximum number of targets to be included in the Campaign Segment Activity. A zero or null value indicates the Activity has no upper limit for targets.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_EXPCT_STRT_DT %}
Expected Start Date: The date on which the Campaign is/was expected to commence.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_EXPCT_END_DT %}
Expected End Date: The date on which the Campaign is/was expected to conclude.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_ACTL_STRT_DT %}
Actual Start Date: The date on which the Campaign actually commenced.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_ACTL_END_DT %}
Actual End Date: The date on which the Campaign actually concluded.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_RSLT_END_DT %}
Result End Date: The last date on which results are recorded for the Campaign. Beyond this date, it is considered that the Campaign has no remaining influence on the target's actions.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_CPGN_SEG_ACTVTY_NM %}
Campaign Segment Activity Name: A name to identify the Campaign Segment Activity.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_SEG_COST_AMT %}
Segment Cost Amount: The cost to the Financial Institution of conducting Activities within the Campaign for the given Segment.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_DESC %}
Description: A description of the Campaign Segment Activity e.g. the inclusion criteria for the Campaign Segment (a Group) and the breakdown of offers to be made to that Segment.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_CPGN_SEG_ACTVTY_NBR %}
Campaign Segment Activity Number: A sequence number used, in combination with the unique identifier of the Campaign, to uniquely identify a Campaign Activity.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_CMPNAVY_TY_ID %}
Campaign Activity Type Id: The unique identifier of the Campaign Activity Type. 
Campaign Activity Type classifies the valid set of Campaign Activities allowed by the Financial Institution. 
 
Domain:
 Market Research 
 Launch 
 Advertising 
 Promotion 
 Campaign Management
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_CPGN_LC_STS_RSN_TY_ID %}
Campaign Life Cycle Status Reason Type Id: The unique identifier of the Campaign Life Cycle Status Reason Type that applies to the Campaign Activity. 
Campaign Life Cycle Status Reason Type distinguishes between Campaigns according to the motive for changing the life cycle status of the Campaign or associated Activity. 
 
Domain:
 Preparation For New Product 
 Unfavorable Reaction Received 
 Campaign Funding Exhausted 
 Campaign Normal Termination
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_ACTVTY_LC_STS_TY_ID %}
Activity Life Cycle Status Type Id: The unique identifier of the Event Life Cycle Status Type that applies to the Campaign Activity. 
Event Life Cycle Status Type distinguishes between Events according to their current state within the Event life cycle. 
 
Domain:
 Abandoned Event 
 Cancelled Event 
 Completed Event 
 Event Accepted 
 Event Accepted Partially 
 In Progress Event 
 Pending Event 
 Positive Current Exposure Event 
 Potential Event 
 Received Event 
 Refunded Event 
 Refused Event 
 Rejected Event 
 Returned Event 
 Reversed Event 
 Superseded Event 
 Suspended Event
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_CHNL_ID %}
Channel Id: Where applicable, the unique identifier of the Channel delivering the Campaign Activity.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_NBR_OF_CPGN_CMM %}
Number Of Campaign Communications: The total number of Campaign Communications generated by / planned for this Campaign Activity.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_CPGN_COST_AMT %}
Campaign Cost Amount: The amount of money spent by the Financial Institution from the Effective Date to date on the Campaign Activity.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_TRMN_ACTVTY_FLG %}
Terminate Activity Flag: A flag which indicates whether this Campaign Activity 
terminates the given Campaign.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_CMPNAVY_DESC %}
Campaign Activity Description: Description provides a textual explanation or free form comments about the Campaign Activity.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_ACTVTY_CMPNAVY_NM %}
Campaign Activity Name: A name to identify the Campaign Activity e.g. a meaningful name of a Campaign Offer.
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR %}
SA Arrangement Postal Address: Note- some of the relationship types may have worked better with Geographic Area... so many of these attribute could be empty... 
 
For the purposes of SA Banking, at this time, we are interested in this relationship to know the Postal Address of the Arrangement... although some of the relationship types may only be used with particular Arrangement subtypes. 
 
Arrangement / Location Relationship identifies the roles specific Locations play with respect to specific Arrangements. For example, Arrangement #52367 (A Loan) Is Securitized in Location #7821 (Germany); AR #8362 (An Employment Arrangement) Specifies Employment At Location #25783 (High Street Branch). 
 
Multiple and historical associations can be maintained.
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_AR_ID %}
Arrangement Id: The unique identifier of the Arrangement involved in the relationship.
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_AR_TO_PSTL_ADDR_RL_TY_ID %}
Arrangement / Postal Address Rltnp Type Id: The unique identifier of the Arrangement / Location Rltnp Type. 
 
Arrangement / Location Relationship Type classifies all labels or categories of an instance of Arrangement / Location Rltnp. 
 
Domain:
 AR Specifies Employment At LO 
 AR Is Initiated At LO 
 AR Has Delivery Point Of LO 
 AR Is Valid In LO 
 AR Is Agreed At LO 
 AR Is Subject To Laws Of LO 
 AR Is Securitized At LO 
 AR Is Legally Enforceable In LO
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_EFFV_DT %}
Effective Date: The date from which an instance of the entity is valid.
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_RNK %}
Rank: A number uniquely identifying a specific instance of the given Relationship Type on the given Effective Date between the same subject and object of the associative relationship.
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_END_DT %}
End Date: The Calendar date after which an instance of the entity is no longer valid.
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_AR_SRC_SYS_UNQ_KEY_TXT %}
Arrangement Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_AR_SRC_SYS_CD %}
Arrangement Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_ADDR_NM %}
Address Name: The name of a building or organization which appears in an address e.g. Rose Cottage, Bramble Way or General Post Office, Dublin 2
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_UNT_NBR %}
Unit Number: An address component that represents the numeric portion or alphanumeric label that identifies a unit within a building, for example, 14, as in Apartment 14, 15 Bath Road.
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_BLDG_NBR %}
Building Number: An address component that represents the numeric portion or alphanumeric label that identifies a building on a street, for example, 2 , as in 2 Main Street, 14B, as in 14B Oxford Street.
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_STE_NBR %}
Street Number: An address component that represents the numeric value assigned to the street, for example, 5 as in 5th Avenue.
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_STE_NM %}
Street Name: The label assigned to a street. 
 
May include concatenations of components such as, Street Number (5 as in 5th Avenue), Name (Main as in Main Street), Street Type (Avenue, Drive, Court, Lane), Direction (North as in North High Street), and Suffix (Lower as in 14 Baggot St. Lower).
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_STE_TY %}
Street Type: An address component that represents the type of street, for example, Avenue, Drive, Court, Lane.
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_STE_DRCTN %}
Street Direction: An address component that represents one or more compass points that are used to distinguish an address, for example, High Street SE or High Street NW.
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_STE_SFX %}
Street Suffix: An address component that represents the suffix assigned to the street: for example, Lower as in 14 Baggot St. Lr.
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_PSTCD_AREA_ID %}
Postcode Area Id: The unique identifier of the Postcode Area.
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_DSTRCT %}
District: Free-form text indicating the area (district, suburb, townland, etc.) in which the Postal Address is located.
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_CITY_ID %}
City Id: The unique identifier of the City.
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_ST_ID %}
State Id: The unique identifier of the State.
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_CNTY_ID %}
County Id: The unique identifier of the County.
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_CNTRY_ID %}
Country Id: The unique identifier of the Country.
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_RT_ID %}
Route Id: The unique identifier of the Route.
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_CENSUS_AREA_ID %}
Census Area Id: The unique identifier of the Census Area.
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_BLDG_TY_ID %}
Building Type Id: The unique identifier of the Building Type located at the Postal Address.
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_LONGD %}
Longitude: The Longitude (in degrees, in decimal form) of the Postal Address. Values can range from -180 (west) to 180 (east).
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_LATD %}
Latitude: The Latitude (in degrees, in decimal form) of the Postal Address. Values can range from -90 (south) to 90 (north).
{% enddocs %}

{% docs tbl_SA_AR_PSTL_ADDR_PSTL_BARCDE %}
Postal Barcode: A multi-digit code used by postal companies to encode components of the address. 
this is not the same as the Post code Area or Zip code...
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_AR_RL %}
SA Arrangement / SA Arrangement Rltnp: Arrangement / Arrangement Relationship identifies two Arrangements that are associated, generally through one being an amendment of the other, or one being a parent arrangement used to group several component arrangements together. For example; A Demand Deposit Arrangement is used as a parent arrangement to associate three subsidiary Arrangements - the actual Deposit Account Arrangement, an Overdraft Credit Line, and an Investment Advisory Service; a Visa Card Facility Arrangement is settled by Direct Debit (a Transfer Arrangement) and a Credit Line (Finance Service Arrangement).
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_AR_RL_OBJ_AR_ID %}
Object Arrangement Id: The identifier of an Arrangement between two or more individuals, organizations or organization units.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_AR_RL_SUBJT_AR_ID %}
Subject Arrangement Id: The unique identifier of an Arrangement between two or more individuals, organizations or organization units.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_AR_RL_AR_TO_AR_RL_TY_ID %}
Arrangement / Arrangement Rltnp Type Id: The unique identifier of the Arrangement / Arrangement Relationship Type. 
Arrangement / Arrangement Relationship Type classifies the valid ways in which two Arrangement 's can be associated. 
 
Domain:
 AR Is Amendment Of AR 
 AR Replaces AR 
 AR Provides Security for AR 
 AR Hedges AR 
 AR Supersedes AR 
 AR Originates AR 
 AR Overlaps AR
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_AR_RL_EFFV_DT %}
Effective Date: The date from which an instance of the entity is valid.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_AR_RL_END_DT %}
End Date: The Calendar date after which an instance of the entity is no longer valid.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_AR_RL_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_AR_RL_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_AR_RL_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_AR_RL_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_AR_RL_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_AR_RL_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_AR_RL_SUBJT_AR_SRC_SYS_CD %}
Subject Arrangement Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_AR_RL_SUBJT_AR_SRC_SYS_UNQ_KEY_TXT %}
Subject Arrangement Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_AR_RL_OBJ_AR_SRC_SYS_CD %}
Object Arrangement Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_AR_RL_OBJ_AR_SRC_SYS_UNQ_KEY_TXT %}
Object Arrangement Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_AR_RL_AR_X_AR_RL_LC_STS_TY_ID %}
AR/AR Rltnp Life Cycle Status Type Id: The unique identifier of the Arrangement / Arrangement Relationship Life Cycle Status Type. 
Arrangement / Arrangement Relationship Life Cycle Status Type classifies Arrangement / Arrangement Relationships according to their Life Cycle Status Type. 
 
Domain:
 Proposed 
 Offered 
 Accepted 
 Active 
 Cancelled 
 Terminated
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_AR_RL_RL_LC_STS_DT %}
Relationship Life Cycle Status Date: The date on which the current Life Cycle Status Type was assigned to the Relationship.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_AR_RL_DESC %}
Description: A textual explanation or free form comments about the Relationship.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_AR_RL_PCT_AMT %}
Percentage Amount: Represents the degree of Overlap between two Arrangements. 
 
Example: a bank providing a liquidity facility supporting 100% of the ABCP issued by an ABCP programme and purchasing 20% of the 
outstanding ABCP of that programme could recognise an overlap of 20% (100% 
liquidity facility + 20% CP held - 100% CP issued = 20%).
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_GRP %}
SA Arrangement / SA Group: Arrangement / Group Relationship identifies the relationships Arrangements have in respect to Groups. 
 
A given Arrangement may simultaneously belong to more than one Group. The set of Groups associated with an Arrangement may change over time. 
Arrangement / Group Relation allows storage of these multiple and historical associations.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_GRP_AR_ID %}
Arrangement Id: The unique identifier the Arrangement involved in the relationship.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_GRP_GRP_ID %}
Group Id: The unique identifier of the Group involved in the relationship.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_GRP_EFFV_DT %}
Effective Date: The date from which an instance of the entity is valid.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_GRP_AR_TO_GRP_RL_TY_ID %}
Arrangement / Group Rltnp Type Id: The unique identifier of the Arrangement / Group Rltnp Type 
 
Arrangement / Group Relationship Type identifies the valid set of relationships between Arrangements and Groups. 
 
Domain:
 AR Is Aimed At Group 
 AR Uses Group
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_GRP_END_DT %}
End Date: The Calendar date after which an instance of the entity is no longer valid.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_GRP_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_GRP_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_GRP_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_GRP_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_GRP_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_GRP_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_GRP_AR_SRC_SYS_CD %}
Arrangement Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_GRP_AR_SRC_SYS_UNQ_KEY_TXT %}
Arrangement Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_GRP_GRP_SRC_SYS_CD %}
Group Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_GRP_GRP_SRC_SYS_UNQ_KEY_TXT %}
Group Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_PRD_RL %}
SA Arrangement / SA Product Rltnp: Arrangement / Product Relationship records all relationships between Arrangements and Products. For example, Arrangement #72291 (An Investment Arrangement) Invests In Product #7821 (a Financial Market Instrument);
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_PRD_RL_AR_TO_PRD_RL_TY_ID %}
Arrangement / Product Rltnp Type Id: The unique identifier of the Arrangement / Product Rltnp Type. 
Arrangement / Product Rltnp Type classifies all labels or categories of an instance of the Arrangement / Product Rltnp associative. 
 
Domain:
 AR Has Underlying PD 
 AR Is Based On PD 
 AR Invests In PD 
 AR Is Credit Enhancement For PD 
 AR Is FM Standard Settlement Instruction For PD 
 PD Hedges Risk For AR 
 PD With Lowest Risk Based AR
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_PRD_RL_EFFV_DT %}
Effective Date: The date from which an instance of the entity is valid.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_PRD_RL_AR_ID %}
Arrangement Id: The unique identifier of the Arrangement involved in the relationship.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_PRD_RL_PRD_ID %}
Product Id: The unique identifier of the Product involved in the relationship.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_PRD_RL_END_DT %}
End Date: The Calendar date after which an instance of the entity is no longer valid.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_PRD_RL_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_PRD_RL_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_PRD_RL_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_PRD_RL_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_PRD_RL_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_PRD_RL_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_PRD_RL_AR_SRC_SYS_CD %}
Arrangement Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_PRD_RL_AR_SRC_SYS_UNQ_KEY_TXT %}
Arrangement Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_PRD_RL_PRD_SRC_SYS_CD %}
Product Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_PRD_RL_PRD_SRC_SYS_UNQ_KEY_TXT %}
Product Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_RI_RL %}
SA Arrangement / SA Resource Item Rltnp: Arrangement / Resource Item Relationship identifies an occurrence of an association between an instance of Arrangement and an instance of Resource Item, and defines the purpose for the association. For example, a specific Chattel covered by an Insurance Arrangement, a building that is the subject of a leasing Arrangement, a house pledged as collateral.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_RI_RL_RI_ID %}
Resource Item Id: The unique identifier of the Resource Item involved in the relationship.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_RI_RL_AR_ID %}
Arrangement Id: The unique identifier of the Arrangement involved in the relationship.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_RI_RL_AR_TO_RI_RL_TY_ID %}
Arrangement / Resource Item Rltnp Type Id: The unique identifier of the Arrangement / Resource Item Rltnp Type. 
Arrangement / Resource Item Relationship Type classifies all labels or categories of an instance of the Arrangement / Resource Item Rltnp associative. 
 
Domain:
 AR Applies To RI 
 RI Provides Access To AR 
 RI Documents AR 
 AR Has Collateral Pledge Of RI 
 RI Provides Cash Flow For AR 
 RI Is Real Asset In AR 
 RI Is Flood Insurance Certificate For Loan AR
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_RI_RL_END_DT %}
End Date: The Calendar date after which an instance of the entity is no longer valid.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_RI_RL_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_RI_RL_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_RI_RL_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_RI_RL_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_RI_RL_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_RI_RL_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_RI_RL_AR_SRC_SYS_UNQ_KEY_TXT %}
Arrangement Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_RI_RL_AR_SRC_SYS_CD %}
Arrangement Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_RI_RL_RI_SRC_SYS_CD %}
Resource Item Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_RI_RL_RI_SRC_SYS_UNQ_KEY_TXT %}
Resource Item Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_AR_TO_SA_RI_RL_EFFV_DT %}
Effective Date: The date from which an instance of the entity is valid.
{% enddocs %}


{% docs tbl_SA_AR %}
SA Arrangement: Arrangement represents an agreement, either potential or actual, involving two or more Involved Parties, that provides and affirms the rules and obligations associated with the sale, exchange or provision of goods and services; for example, Arrangement #123 (a specific Certificate of Deposit agreement between the Financial Institution and John Doe), Arrangement #346 (a specific will agreement between the Financial Institution and John Doe which includes Mary Doe as the beneficiary but not a participant in the agreement). 
 
Subtypes 
Resource Item Arrangement - subtype of Arrangement - Identifies an Arrangement which involves the use, sale, or exchange of Resource Items between Involved Parties. 
A Netting Agreement - subtype of Arrangement, not used at this time in SA Arrangement - is an agreement between two Involved Parties that provides for the calculation of a close-out value and/or the termination or acceleration of present or future mutual payment or delivery obligations or entitlements in connection with one or more financial contracts existing or planned between the Involved Parties. For example, Bank A owes Bank B $15M while Bank B owes Bank A $12M, so the Netting Agreement will agree an obligation of $3M from A to B, being the difference between the outstanding amounts. 
The Netting Agreement may extend across multiple Organizations and/or Organization Units - for example, subsidiaries. The relevant Involved Parties can be recorded on the Arrangement / Involved Party Rltnp associative entity. 
Security Arrangement - subtype of Arrangement - and all of its subtypes are in SA Security Arrangement 
Asset Securitization Arrangement - subtype of Arrangement, not used in SA model - identifies an Arrangement in which one Involved Party (the Originator) transfers a group of its risk assets (e.g. Credit Card Receivables or Mortgages) to another Involved Party, normally a separate legal entity termed a Special Purpose Entity (SPE). The SPE pays for the transferred assets from the proceeds of securities issued by the SPE in the market. The Originator is permitted to remove the capital requirements for the transferred assets from its overall capital requirement. The resulting tranche forms a securitized finance instrument which is then traded. Optionally, the pool of assets created by the arrangement may be referenced. 
Involved Party Arrangement - subtype of Arrangement - and all of its subtypes are in SA Involved Party Arrangement 
Product Arrangement - subtype of Arrangement - is in SA Product Arrangement. SA Product Arrangement includes Product subtypes Deposit Arrangement and Account Arrangement.
{% enddocs %}

{% docs tbl_SA_AR_AR_ID %}
Arrangement Id: The unique identifier of an Arrangement between two or more individuals, organizations or organization units.
{% enddocs %}

{% docs tbl_SA_AR_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_AR_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_AR_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_AR_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_AR_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_AR_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_AR_AR_TY_ID %}
Arrangement Type Id: The Type of the Arrangement, indicating the sub-type table in which more specific information about the Arrangement can be found.. 
Arrangement Type classifies Arrangements according to the nature of the Arrangement. 
 
Domain:
 Security Arrangement 
 Product Arrangement 
 Netting Arrangement 
 Asset Securitization Arrangement 
 Resource Item Arrangement 
 Involved Party Arrangement
{% enddocs %}

{% docs tbl_SA_AR_AR_FREQ_TY_ID %}
Arrangement Frequency Type Id: The classification of the Arrangement according to its Frequency. 
Arrangement Frequency Type classifies Arrangements according to the number of times the Arrangement is expected to be referenced. 
 
Domain:
 One Time Arrangement 
 Standing Arrangement
{% enddocs %}

{% docs tbl_SA_AR_AR_PRPS_TY_ID %}
Arrangement Purpose Type Id: The unique identifier of the classification of the Arrangement according to its Purpose. 
Arrangement Purpose Type classifies Arrangements based on the objective of the Arrangement. For example, Lending for house purchase, Promotional funding, etc.
{% enddocs %}

{% docs tbl_SA_AR_AR_RSN_TY_ID %}
Arrangement Reason Type Id: The unique identifier of the classification of the Arrangement according to the reason for its creation. 
Arrangement Reason Type classifies Arrangements according to the Involved Party's rationale for making the Arrangement. 
 
Domain:
 AR Because Best Arrangement On Offer 
 AR Because Of Competitive Advantage 
 AR Because Of Established Rltnp 
 Arrangement Because Of Convenience 
 Arrangement Because Of Customer Referral 
 Arrangement Because Of Loyalty Reward 
 Arrangement Because Of New Offer 
 Arrangement Because Of Uniqueness 
 Arrangement For No Reason
{% enddocs %}

{% docs tbl_SA_AR_AR_PRMY_PMT_METHD_ID %}
Arrangement Primary Payment Method Id: Where applicable, the unique identifier of the Arrangement Payment Method primarily used to make payments for the Arrangement.
{% enddocs %}

{% docs tbl_SA_AR_AR_FNC_STS_TY_ID %}
Arrangement Financial Status Type Id: The unique identifier of the classification of the Arrangement according to its Financial Status. 
Arrangement Financial Status Type classifies an Arrangement based on its financial position. 
 
Domain:
 In Order Arrangement 
 Approved Out Of Order Arrangement 
 Out Of Order Arrangement 
 Charge Off Arrangement 
 Non Performing Arrangement 
 Write Off Arrangement 
 In Recovery Arrangement 
 In Default Arrangement 
 Performing Arrangement 
 Redeemed 
 Repurchased By Seller 
 
 
NOTE: This classification may need to be synchronized with Finance Service Past Due Aging Segment (which will provide more detail), if both are used.
{% enddocs %}

{% docs tbl_SA_AR_AR_FNC_STS_DT %}
Arrangement Financial Status Date: The date on which the current Financial Status Type was assigned to the Arrangement.
{% enddocs %}

{% docs tbl_SA_AR_AR_LC_STS_DT %}
Arrangement Life Cycle Status Date: The date on which the current Life Cycle Status Type was assigned to the Arrangement.
{% enddocs %}

{% docs tbl_SA_AR_AR_LC_STS_TY_ID %}
Arrangement Life Cycle Status Type Id: The classification of the Arrangement according to its Life Cycle Status.
{% enddocs %}

{% docs tbl_SA_AR_AR_PHASE_ID %}
Arrangement Phase Id: The unique identifier of the Arrangement Phase. 
Arrangement Phase classifies Arrangements according to a segment that defines the business activities that can occur on an Arrangement during that time. 
This is a separate classification to the Life Cycle Status which defines the specific state of existence for an instance of the Arrangement such as active, restructuring, terminated, etc. A Line of Credit Arrangement could have an active life cycle status and also be in a "draw down" phase to recognize the period during which the borrower is allowed to withdraw funds. The same active Line Of Credit Arrangement eventually switches into a "pay down" phase in which the borrower can no longer withdraw funds and must pay back the outstanding principle and interest on the Arrangement. Another example includes Annuities where the Investment Arrangement has an active life cycle status but can be in a "collecting" phase followed by "draw down" phase.
{% enddocs %}

{% docs tbl_SA_AR_AR_PHASE_DT %}
Arrangement Phase Date: The date on which the current Phase was assigned to the Arrangement.
{% enddocs %}

{% docs tbl_SA_AR_PRMY_RESP_CNTR_DT %}
Primary Responsibility Center Date: The date on which the Primary Responsibility Center was assigned to the Arrangement.
{% enddocs %}

{% docs tbl_SA_AR_PRMY_RESP_CNTR_ID %}
Primary Responsibility Center Id: The unique identifier of the Responsibility Center primarily associated with the Arrangement.
{% enddocs %}

{% docs tbl_SA_AR_AR_TRM_TY_ID %}
Arrangement Term Type Id: The unique identifier of the type of the term of the Arrangement - i.e. Fixed Term or Variable Term. If the value indicates Fixed Term, then more information can be found in the Arrangement Fixed Term entity.
{% enddocs %}

{% docs tbl_SA_AR_ORIG_CHNL_ID %}
Originating Channel Id: The unique identifier of the Channel on which the first contact was received that led to the establishment of the Arrangement.
{% enddocs %}

{% docs tbl_SA_AR_DNMNTN_CUR_ID %}
Denomination Currency Id: The unique identifier of the Currency in which the balance of the Arrangement is denominated.
{% enddocs %}

{% docs tbl_SA_AR_NBR_OF_AR_CVRD %}
Number Of Arrangements Covered: The number of Arrangements to which this Arrangement applies.
{% enddocs %}

{% docs tbl_SA_AR_INIT_IP_ID %}
Initiating Involved Party Id: The unique identifier assigned to the Involved Party that first suggested the Arrangement be created.
{% enddocs %}

{% docs tbl_SA_AR_RPRST_OU_ID %}
Representing Organization Unit Id: The Organization Unit which directly represents the Financial Institution in the Arrangement e.g. a department, a branch.
{% enddocs %}

{% docs tbl_SA_AR_ESTMTD_END_DT %}
Estimated End Date: The date on which the Arrangement is due to be completed. This value may be derived from Arrangement Fixed Term.Effective Maturity Date.
{% enddocs %}

{% docs tbl_SA_AR_EFFV_DT %}
Effective Date: The calendar date on which the Arrangement became relevant to the Financial Institution. 
This can be extracted from the appropriate instance of the entity recording 'Accepted Arrangement Financial Status' and its attribute Effective Date.
{% enddocs %}

{% docs tbl_SA_AR_END_DT %}
End Date: The calendar date on which the Arrangement was actually formally completed or closed. This can be extracted from the appropriate instance of the entity recording Completed Arrangement Financial Status and its attribute Effective Date.
{% enddocs %}

{% docs tbl_SA_AR_LST_CUST_ACTVTY_DT %}
Last Customer Activity Date: The most recent date on which any Customer 
initiated activity related to the Arrangement took place.
{% enddocs %}

{% docs tbl_SA_AR_LST_PRCDR_DT %}
Last Procedure Date: Identifies the last date on which Financial Institution's 'Batch' or caretaker processing was undertaken. This date serves as the date at which the last complete (i.e. all charges, interest, etc. paid) batch modification of the Arrangement was made.
{% enddocs %}

{% docs tbl_SA_AR_LST_TRMS_MOD_DT %}
Last Terms Modification Date: The most recent date on which the terms and conditions of the Arrangement were modified.
{% enddocs %}

{% docs tbl_SA_AR_NXT_RVW_DT %}
Next Review Date: The next date on which the terms and conditions of the Arrangement will be reviewed.
{% enddocs %}

{% docs tbl_SA_AR_LST_RVW_DT %}
Last Review Date: The most recent date on which the terms and conditions of the Arrangement were reviewed.
{% enddocs %}

{% docs tbl_SA_AR_RNWL_FLG %}
Renewal Flag: Indicates whether the Financial Institution should (1) or should not (0) renew the Arrangement, usually because of some unfavorable aspect of the current Arrangement or its Customer(s).
{% enddocs %}

{% docs tbl_SA_AR_NXT_RNWL_DT %}
Next Renewal Date: For a recurring Arrangement (e.g. an Insurance Arrangement), the date at which the current terms and conditions expire and new terms and conditions may be established.
{% enddocs %}

{% docs tbl_SA_AR_AR_NM %}
Arrangement Name: The primary name assigned to the Arrangement. This name is used in reports and documents referring to the Arrangement.
{% enddocs %}

{% docs tbl_SA_AR_DESC %}
Description: A textual explanation or free form comments about the Arrangement.
{% enddocs %}

{% docs tbl_SA_AR_RI_AR_TY_ID %}
Resource Item Arrangement Type Id: The unique identifier of the Resource Item Arrangement Type. 
Resource Item Arrangement Type classifies Resource Item Arrangements according to the manner in which the rights to the Resource Item are conveyed from one Involved Party to another.
{% enddocs %}

{% docs tbl_SA_CL %}
SA Classification: SA Classification is the combination of the OOTB Classification Value and OOTB Classification Scheme... it is at the grain of the OOTB Classification Value, or Classificatin ID... not that Classification ID is a VARCHAR(32) rather than the OOTB Integer... 
 
Classification Value identifies a value or qualifier that is a member of a category of data. For example, the Classification Values 'Single', 'Married' and 'Divorced' are all values or qualifiers of the category (or Classification Scheme) 'Individual Marital Status Type'. Similarly, 'Short-term Loan' and 'Long-term Loan' are Classification Values of the Classification Scheme 'Product Type'. The purpose of the Classification Value entity is to provide a means by which the Financial Institution may categorize information in the warehouse. 
Each Classification is identified by a combination of a Classification Scheme and a Classification Value. Each Scheme is itself also stored in the Classification Value Table (since Classification Schemes are themselves Classifications). 
---- ------ ---- 
Design Note:
In general, subtype entities will be collapsed up into the supertype Classification Value, where they have no additional attributes. Hence the real Domain of Classification Value is the aggregation of all the Domains of these subtypes. 
 
Classification Scheme groups instances of Classification (i.e. Classification Values), such as 'Married' or 'Single', into sets. For example, 'Married' (Classification Code #982374) and 'Single' (Classification #400234) each 'have parent scheme of' Individual Marital Status Type (Classification Code #8181).
{% enddocs %}

{% docs tbl_SA_CL_CL_ID %}
Classification Id: The unique identifier of the Classification.
{% enddocs %}

{% docs tbl_SA_CL_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_CL_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_CL_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_CL_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_CL_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_CL_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_CL_EFFV_DT %}
Effective Date: The date from which an instance of the entity is valid.
{% enddocs %}

{% docs tbl_SA_CL_END_DT %}
End Date: The Calendar date after which an instance of the entity is no longer valid.
{% enddocs %}

{% docs tbl_SA_CL_NMRC_CD_FLG %}
Numeric Code Flag: Numeric Code Flag indicates whether only numeric values are to be used for values of this Classification Scheme.
{% enddocs %}

{% docs tbl_SA_CL_CD_LEN %}
Code Length: Identifies the maximum length of the Values of this Scheme. For example, The Classification Scheme 'Individual Marital Status Type' could have a length of '1' - identifying that all Marital Status Values are to be recorded as one character long (i.e. 'S' for Single, 'M' for Married, etc.). The maximum length allowed is the defined length of the Classification Code attribute of Classification.
{% enddocs %}

{% docs tbl_SA_CL_SCHM_CD %}
Scheme Code: The defined mnemonic of the scheme, for example 'MAR' for Marital Status.
{% enddocs %}

{% docs tbl_SA_CL_CL_SCHM_NM %}
Classification Scheme Name: The primary name assigned to the Classification Scheme. This name is used in reports and documents referring to the Classification Scheme.
{% enddocs %}

{% docs tbl_SA_CL_CL_SCHM_LONG_NM %}
Classification Scheme Long Name: The long name for the Classification Scheme.
{% enddocs %}

{% docs tbl_SA_CL_CL_CD %}
Classification Code: Classification Code is used where 'meaningful' mnemonic external codes, in each language of the warehouse environment, are assigned to each Classification occurrence for purposes of identification. 
Where Classificaiton ID's are character the Classification Code may be the same value as the Classification ID
{% enddocs %}

{% docs tbl_SA_CL_CL_SHRT_NM %}
Classification Short Name: The Short Name for the Classification in the default language.
{% enddocs %}

{% docs tbl_SA_CL_CL_NM %}
Classification Name: The primary name assigned to the Classification. This name is used in reports and documents.
{% enddocs %}

{% docs tbl_SA_CL_CL_DESC %}
Classification Description: Description provides a textual explanation or free form comments about the Classification.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV %}
SA Campaign Segment Deliverable: Campaign Segment Activity identifies the processes within a Campaign which are aimed at a particular Segment (a Group). 
A Campaign Segment Has Campaign Deliverables 
Campaign Deliverable defines the required deliverables of the Campaign. Deliverables are defined in terms of a quantifiable target (such as Number of New Accounts resulting from the Campaign) and the required number.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_MSEG_GRP_ID %}
Market Segment Group Id: The unique identifier of the Market Segment Group.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_SCENR_ID %}
Scenario Id: The identifier of the Scenario that applies to the data.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_CPGN_ID %}
Campaign Id: The unique identifier of the Campaign.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_CPGN_DLV_NBR %}
Campaign Deliverable Number: A sequence number to uniquely determine a particular Campaign Deliverable within the set defined by the rest of the primary identifier.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_NBR_OF_SEG_CPGN_CMM %}
Number Of Segment Campaign Communications: The count of Campaign Communications generated by Activities within the Campaign for the given Segment.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_SEG_ACTVTY_LC_STS_TY_ID %}
Segment Activity Life Cycle Status Type Id: The unique identifier of the Event Life Cycle Status Type that applies to the Campaign Segment Activity. 
Event Life Cycle Status Type distinguishes between Events according to their current state within the Event life cycle. 
 
Domain:
 Abandoned Event 
 Cancelled Event 
 Completed Event 
 Event Accepted 
 Event Accepted Partially 
 In Progress Event 
 Pending Event 
 Positive Current Exposure Event 
 Potential Event 
 Received Event 
 Refunded Event 
 Refused Event 
 Rejected Event 
 Returned Event 
 Reversed Event 
 Superseded Event 
 Suspended Event
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_SEG_ACTVTY_LC_STS_RSN_TY_ID %}
Seg Activity Life Cycle Status Reason Type Id: The unique identifier of the Campaign Life Cycle Status Reason Type that applies to the Campaign Segment Activity. 
Campaign Life Cycle Status Reason Type distinguishes between Campaigns according to the motive for changing the life cycle status of the Campaign or associated Activity. 
 
Domain:
 Preparation For New Product 
 Unfavorable Reaction Received 
 Campaign Funding Exhausted 
 Campaign Normal Termination
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_SEG_DLV_AMT_UOM_ID %}
Segment Deliverables Amount Unit Of Measure Id: The unit by which the Segment Deliverables Amount is measured.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_SEG_DLV_AMT %}
Segment Deliverables Amount: The monetary value of Campaign Deliverables targeted or actually delivered by the Campaign for the given Segment.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_MAXM_TRG_NBR %}
Maximum Target Number: The maximum number of targets to be included in the Campaign Segment Activity. A zero or null value indicates the Activity has no upper limit for targets.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_EXPCT_STRT_DT %}
Expected Start Date: The date on which the Campaign is/was expected to commence.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_EXPCT_END_DT %}
Expected End Date: The date on which the Campaign is/was expected to conclude.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_ACTL_STRT_DT %}
Actual Start Date: The date on which the Campaign actually commenced.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_ACTL_END_DT %}
Actual End Date: The date on which the Campaign actually concluded.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_RSLT_END_DT %}
Result End Date: The last date on which results are recorded for the Campaign. Beyond this date, it is considered that the Campaign has no remaining influence on the target's actions.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_CPGN_SEG_ACTVTY_NM %}
Campaign Segment Activity Name: A name to identify the Campaign Segment Activity.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_SEG_COST_AMT %}
Segment Cost Amount: The cost to the Financial Institution of conducting Activities within the Campaign for the given Segment.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_DESC %}
Description: A description of the Campaign Segment Activity e.g. the inclusion criteria for the Campaign Segment (a Group) and the breakdown of offers to be made to that Segment.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_CPGN_DLV_TY_ID %}
Campaign Deliverable Type Id: The unique identifier of the Campaign Deliverable Type. 
Campaign Deliverable Type classifies the set of Campaign Deliverable Types that can be used to classify Campaign Deliverables. 
 
Domain:
 New Arrangements 
 Transferred Business 
 Customer Responses 
 More Funds Loaned
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_DLV_AMT_UOM_ID %}
Deliverable Amount Unit Of Measure Id: The identifier of the Unit Of Measure that designates the unit for the Deliverable Amount.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_DLV_AMT %}
Deliverable Amount: The total number of Campaign Deliverables to be produced.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_EFFV_DT %}
Effective Date: The date from which an instance of the entity is valid.
{% enddocs %}

{% docs tbl_SA_CPGN_SEG_DLV_END_DT %}
End Date: The target date for producing Campaign Deliverables.
{% enddocs %}

{% docs tbl_SA_EV_CMM %}
SA Event Communication: For Banking SA this is the combination of the Supertype Event and its subtype, Communication, and the Communication subtype Campaign Communication and Social Media Post 
 
Event includes communications, accounting and maintenance transactions and posting entries. Bank customers, vendors, employees and other Involved Parties initiate actions through communications with the Financial Institution in order to make requests of and participate in transactions with the Financial Institution. Information about the action, such as when and at what location the action occurred and what if any additional actions are required, is kept. 
Communication - subtype of Event - identifies an occurrence of an exchange of information with, or a request for action from, an Involved Party; for example, Communication #1821 (Announcement sent to Jane Doe to promote cash management account services), Communication #1824 (John Doe's Request dated 12/25/90 regarding the balance on his account #23451), Communication #467 (Receipt of a loan maturity report dated 12/5/91), Communication #89871 (Receipt of a list of international currency exchange rates), Communication #17846 (Receipt of the announcement concerning Company XYZ's stock split for all common stock shareholders of record as of May 1, 1992). 
Campaign Communication - subtype of Communication - is any Communication that is generated as part of a Campaign . 
Social Media Post - subtype of Communication - Identifies a communication by a social media persona whose purpose it is to post a message or information to an online community. For example, a 'tweet' made on the social media platform, Twitter
{% enddocs %}

{% docs tbl_SA_EV_CMM_EV_CMM_ID %}
Event Communication Id: The unique identifier of an Event.
{% enddocs %}

{% docs tbl_SA_EV_CMM_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_EV_CMM_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_EV_CMM_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_EV_CMM_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_EV_CMM_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_EV_CMM_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_EV_CMM_EV_TY_ID %}
Event Type Id: For SA Banking the only Event Type would be - Campaign Event 
 
The unique identifier of the Event Type. 
Event Type distinguishes between Events according to their inherent characteristics. 
 
Domain:
 Arrangement Activity Event 
 Product Activity Event 
 Campaign Event 
 Communication Event 
 Communication Thread Event 
 Insurance Claim 
 Transaction Event 
 Judicial Event 
 Arbitration 
 Civil 
 Criminal
{% enddocs %}

{% docs tbl_SA_EV_CMM_EV_LC_STS_TY_DT %}
Event Life Cycle Status Type Date: The date on which the current Event Life Cycle Status Type was assigned to the Event.
{% enddocs %}

{% docs tbl_SA_EV_CMM_EV_LC_STS_TY_ID %}
Event Life Cycle Status Type Id: The unique identifier of the Event Life Cycle Status Type. 
Event Life Cycle Status Type distinguishes between Events according to their current state within the Event life cycle. 
 
Domain:
 Abandoned Event 
 Cancelled Event 
 Completed Event 
 Event Accepted 
 Event Accepted Partially 
 In Progress Event 
 Pending Event 
 Positive Current Exposure Event 
 Potential Event 
 Received Event 
 Refunded Event 
 Refused Event 
 Rejected Event 
 Returned Event 
 Reversed Event 
 Superseded Event 
 Suspended Event
{% enddocs %}

{% docs tbl_SA_EV_CMM_EV_LC_STS_RSN_TY_ID %}
Event Life Cycle Status Reason Type Id: The unique identifier of the Event Life Cycle Status Reason Type. 
Event Life Cycle Status Reason Type classifies the rationale for the current Event Life Cycle Status of an Event.
{% enddocs %}

{% docs tbl_SA_EV_CMM_EV_ORGNTN_TY_ID %}
Event Origination Type Id: The unique identifier of the Event Origination Type. 
Event Origination Type distinguishes between Events according to whether the event was initiated from within or outside the Financial Institution. 
 
Domain:
 Internally Initiated Event 
 External Initiated Event
{% enddocs %}

{% docs tbl_SA_EV_CMM_PRBLTY_OF_OCCUR_CGY_ID %}
Probability Of Occurrence Category Id: The unique identifier of the Probability Of Occurrence Category, identifying how likely the Event is to occur. 
Probability Of Occurrence Category classifies instances of events according to the likelihood that the event will occur within a given period. The bands given below are representative and will usually be customized by the Financial Institution. 
 
Domain:
 Probability Of Occurrence less than 1% 
 Probability Of Occurrence between 1% and 10% 
 Probability Of Occurrence between 10% and 20% 
 Probability Of Occurrence between 20% and 30% 
 Probability Of Occurrence between 30% and 40% 
 Probability Of Occurrence between 40% and 50% 
 Probability Of Occurrence between 50% and 60% 
 Probability Of Occurrence between 60% and 70% 
 Probability Of Occurrence between 70% and 80% 
 Probability Of Occurrence between 80% and 90% 
 Probability Of Occurrence between 90% and 99% 
 Probability Of Occurrence 100%
{% enddocs %}

{% docs tbl_SA_EV_CMM_EV_SRC_ID %}
Event Source Id: The unique identifier of the Event Source i.e. the entity that initiated the Event. 
Event Source combines potential types of initiators of Events into a single surrogate identifier.
{% enddocs %}

{% docs tbl_SA_EV_CMM_EV_CNTCT_MDM_TY_ID %}
Event Contact Medium Type Id: The unique identifier of the Event Contact Medium Type. 
Event Contact Medium Type distinguishes between Events according to the manner in which they either took place or are preferred to take place. For example, the medium through which a payment transaction takes place is online; Email is the preferred communication medium for Involved Party #297. 
 
*Domain* 
 
 Email Or Online 
 Face-To-Face Medium 
 Fax 
 File Transfer 
 Mail 
 Phone
{% enddocs %}

{% docs tbl_SA_EV_CMM_SUSPCS_FLG %}
Suspicious Flag: Indicates whether or not there is a doubt over the legitimate business intentions of the Event.
{% enddocs %}

{% docs tbl_SA_EV_CMM_PRTY_RTNG_ID %}
Priority Rating Id: The unique identifier of the Priority Rating. 
Priority Rating classifies information recorded in the Warehouse according to the priority or importance of the object of that information. 
 
Domain:
 High Priority 
 Medium Priority 
 Low Priority
{% enddocs %}

{% docs tbl_SA_EV_CMM_AUTHRZTN_CD %}
Authorization Code: Authorization Code is a code which has been received to authorize a requested action. For example, a code issued by a bank to authorize a Debit Card Payment.
{% enddocs %}

{% docs tbl_SA_EV_CMM_AUTHRZTN_DT %}
Authorization Date: Authorization date is a date, and time if known, upon which an action has been authorized. For example, the date upon which a code is issued by a bank to authorize a Debit Card Payment.
{% enddocs %}

{% docs tbl_SA_EV_CMM_EV_PRPS_TY_ID %}
Event Purpose Type Id: The unique identifier of the Event Purpose Type. 
Event Purpose Type distinguishes between Events according to their business objective.
{% enddocs %}

{% docs tbl_SA_EV_CMM_EV_EXCTN_MODE_ID %}
Event Execution Mode Id: The unique identifier of the Event Execution Mode. 
Event Execution Mode classifies Events according to the manner in which they are executed. For example Automated
{% enddocs %}

{% docs tbl_SA_EV_CMM_CMM_TY_ID %}
Communication Type Id: The unique identifier of the Communication Type. 
Communication Type classifies a Communication according to the purpose & nature of the Communication occurring; 
 
Domain:
 Advice 
 Announcement 
 Corporate Action Announcement 
 Entitlement Notice 
 Rate Increase Announcement 
 Authorization 
 Dissemination 
 -- Campaign Communication 
 Negotiation 
 Request 
 -- Credit Limit Change Request 
 -- PIN Change Request 
 -- Information Request 
 -- Data Processing Request 
 Questionnaire 
 Complaint 
 Compliment 
 Cold Call 
 Status Notification 
 -- Name Change Notification 
 -- Overdrawn Notification 
 -- Communication Undelivered Notification 
 Social Media Post
{% enddocs %}

{% docs tbl_SA_EV_CMM_ACTN_CMPLT_FLG %}
Actions Complete Flag: Indicates whether any Activities resulting from the issuing or receipt of the Communication have been completed (1), or whether there are any outstanding Activities (0).
{% enddocs %}

{% docs tbl_SA_EV_CMM_THRD_PRTCPT_STS %}
Thread Participant Status: Identifies the role of the Communication in relation to its Thread (if any). For example: 
 (I) Thread was Initiated by this Communication 
 (C) Thread was Closed by this Communication 
 (P) Communication otherwise Participated in Thread
{% enddocs %}

{% docs tbl_SA_EV_CMM_CMM_PRCSNG_TM %}
Communication Processing Time: The number of hours spent by employees of the Financial Institution in processing the Communication.
{% enddocs %}

{% docs tbl_SA_EV_CMM_CMM_CNTCT_STS_ID %}
Communication Contact Status Id: The unique identifier of the Communication Contact Status. 
Communication Contact Status distinguishes between Communications according to the success of the contact received by the Financial Institution as a result of a communication. 
 
Domain:
 Contact Achieved 
 Contact Failed 
 Contact Pending 
 Contact Rejected 
 Contact Postponed 
 Contact Cancelled 
 Contact Completed
{% enddocs %}

{% docs tbl_SA_EV_CMM_CMM_CNTCT_STS_DT %}
Communication Contact Status Date: The date on which the current Communication Contact Status was assigned to the Communication.
{% enddocs %}

{% docs tbl_SA_EV_CMM_CMM_DRCTN_ID %}
Communication Direction Id: The unique identifier of the Communication Direction. 
Communication Direction distinguishes between Communications according to whether the Financial Institution is receiving or sending the information. 
 
Domain:
 Inwards 
 Outwards 
 Internal
{% enddocs %}

{% docs tbl_SA_EV_CMM_CMM_FORM_ID %}
Communication Form Id: The unique identifier of the Communication Form. 
Identifies the form in which the Communication is communicated. 
 
Domain:
 Verbal Communication 
 Written Communication 
 -- Text 
 -- Braille 
 Visual Communication 
 -- Sign Language 
 -- Photograph 
 -- Video 
 Multimedia Communication
{% enddocs %}

{% docs tbl_SA_EV_CMM_CMM_RSN_TY_ID %}
Communication Reason Type Id: The unique identifier of the Communication Reason Type. 
Communication Reason Type distinguishes between Communications according to the subject addressed or action required. 
 
Domain:
 Communicate Rating 
 Cost 
 Error Rate 
 Financial Market Offering Dclrtn 
 Functionality 
 Marketing Approach 
 Price
{% enddocs %}

{% docs tbl_SA_EV_CMM_CMM_RSPN_TY_ID %}
Communication Response Type Id: The unique identifier of the Communication Response Type. 
Communication Response Type classifies Communications according to the response provoked by each Communication. 
 
Domain:
 Negative Response 
 Neutral Response 
 No Response 
 Positive Response
{% enddocs %}

{% docs tbl_SA_EV_CMM_CHNL_ID %}
Channel Id: The unique identifier of the Channel on which the Communication is carried.
{% enddocs %}

{% docs tbl_SA_EV_CMM_LANG_ID %}
Language Id: The unique identifier assigned to the Language used in the Communication.
{% enddocs %}

{% docs tbl_SA_EV_CMM_PRD_ID %}
Product Id: The unique identifier of a Product.
{% enddocs %}

{% docs tbl_SA_EV_CMM_INIT_IP_ID %}
Initiating Involved Party Id: The unique identifier of the Initiating Involved Party, that is, the Involved Party who initiated the Communication. 
 
In respect of the Financial Market Settlement, this is either ourselves or the Correspondent.
{% enddocs %}

{% docs tbl_SA_EV_CMM_INIT_TM %}
Initiated Time: The time, if known, at which the Communication was initiated.
{% enddocs %}

{% docs tbl_SA_EV_CMM_INIT_DT %}
Initiated Date: The date, if known, upon which the Communication was initiated.
{% enddocs %}

{% docs tbl_SA_EV_CMM_RCPNT_IP_ID %}
Recipient Involved Party Id: The unique identifier of the Involved Party who was the recipient of the Communication. 
 
In respect of the Financial Market Settlement, this is either ourselves or the Correspondent.
{% enddocs %}

{% docs tbl_SA_EV_CMM_RSPN_TM_IN_DYS %}
Response Time In Days: For a response Communication, a derived value representing the number of days elapsed between its Communication Date and the Communication Date of the Communication being responded to. 
 
For an outgoing response Communication, this represents the Financial Institution's response time to the corresponding inward Communication on the same Thread. For incoming response Communications, this represents the elapsed time between the Financial Institution issuing a Communication and getting a reply from an external source.
{% enddocs %}

{% docs tbl_SA_EV_CMM_CMM_DCOST %}
Communication Direct Cost: The direct cost of handling the Communication and its resolution.
{% enddocs %}

{% docs tbl_SA_EV_CMM_CMM_ICOST %}
Communication Indirect Cost: The indirect cost of handling the Communication and its resolution.
{% enddocs %}

{% docs tbl_SA_EV_CMM_CMM_FEE %}
Communication Fee: The fee charged to the Involved Party for handling the communication.
{% enddocs %}

{% docs tbl_SA_EV_CMM_CMM_DT %}
Communication Date: For analysis purposes, a date assigned to the Communication by the Financial Institution. Often a copy of either the Initiated Date or the Received Date.
{% enddocs %}

{% docs tbl_SA_EV_CMM_CMM_EFFV_DT %}
Communication Effective Date: The date on which the contents of the Communication are considered valid.
{% enddocs %}

{% docs tbl_SA_EV_CMM_RECVD_DT %}
Received Date: The date, if known, upon which the Communication was received.
{% enddocs %}

{% docs tbl_SA_EV_CMM_RECVD_TM %}
Received Time: The time, if known, at which the Communication is received.
{% enddocs %}

{% docs tbl_SA_EV_CMM_RSPN_TM %}
Response Time: The time at which a response was sent to the Communication.
{% enddocs %}

{% docs tbl_SA_EV_CMM_RSPN_DT %}
Response Date: The date upon which a response was sent to the Communication.
{% enddocs %}

{% docs tbl_SA_EV_CMM_XPRTN_DT %}
Expiration Date: For continuous Communications, indicates the date after which the Communication should no longer be transmitted to the recipient.
{% enddocs %}

{% docs tbl_SA_EV_CMM_CMM_DELY_RSN_TY_ID %}
Communication Delay Reason Type Id: The unique identifier of the Communication Delay Reason Type.
{% enddocs %}

{% docs tbl_SA_EV_CMM_CMM_THRD_ID %}
Communication Thread Id: The unique identifier of the Communication Thread. 
A Thread identifies a series of sequential Communications on a subject. For example, a Complaint Thread initiated by a Customer or a Product sales Thread initiated by the Financial Institution which continue until the complaint is resolved or the sale is completed.
{% enddocs %}

{% docs tbl_SA_EV_CMM_PREP_TM_FOR_CMM %}
Preparation Time For Communication: The amount of time spent preparing for a communication.
{% enddocs %}

{% docs tbl_SA_EV_CMM_CMM_OHOLD_TM %}
Communication On Hold Time: The amount of time spent in a suspended or on hold mode during communications expressed in the units referenced by Time Unit Of Measure.
{% enddocs %}

{% docs tbl_SA_EV_CMM_CMM_SNTM_TY_ID %}
Communication Sentiment Type Id: The unique identifier of the Communication Sentiment Type. 
Communication Sentiment Type distinguishes between Communications according to the expressed feeling or emotion of the Communication with respect to some topic. 
 
Domain:
 Negative Sentiment 
 Positive Sentiment 
 Neutral Sentiment
{% enddocs %}

{% docs tbl_SA_EV_CMM_EV_CPGN_ID %}
Event Campaign Id: The unique identifier of the Campaign.
{% enddocs %}

{% docs tbl_SA_EV_CMM_CMPNAVY_NBR %}
Campaign Activity Number: A sequence number used, in combination with the unique identifier of the Campaign, to uniquely identify a Campaign Activity.
{% enddocs %}

{% docs tbl_SA_EV_CMM_MSEG_GRP_ID %}
Market Segment Group Id: The unique identifier of the Market Segment Group Id.
{% enddocs %}

{% docs tbl_SA_EV_CMM_CMPNAVY_SCENR_ID %}
Campaign Activity Scenario Id: The unique identifier of the Scenario that applies to the data.
{% enddocs %}

{% docs tbl_SA_EV_CMM_CPGN_CMM_EFFV_DT %}
Campaign Communication Effective Date: The date on which the Campaign Communication is first issued.
{% enddocs %}

{% docs tbl_SA_EV_CMM_CPGN_CMM_END_DT %}
Campaign Communication End Date: The date on which the Campaign Communication expires.
{% enddocs %}

{% docs tbl_SA_EV_CMM_CNTCT_SEL_DT %}
Contact Selection Date: The date on which a targeted Involved Party is added to a Campaign.
{% enddocs %}

{% docs tbl_SA_EV_CMM_RMDR_DT %}
Reminder Date: The date on which a reminder is to be sent if no 
response to this Communication is received.
{% enddocs %}

{% docs tbl_SA_EV_CMM_NXT_STEP_DT %}
Next Step Date: The date on which the Campaign proceeds to the next 
Campaign Communication.
{% enddocs %}

{% docs tbl_SA_EV_CMM_SCL_MEDA_POST_TY_ID %}
Social Media Post Type Id: The unique identifier of the Social Media Post Type. 
Social Media Post Type classifies Social Media Posts according to the nature of the Posting. 
 
Domain:
Blog post 
 -Initial blog post 
 -Blog post reply 
 -Blog repost 
Micro blog post 
 -Initial micro blog post 
 -Micro blog post reply 
 -Micro blog repost
{% enddocs %}

{% docs tbl_SA_EV_CMM_POST_TXT %}
Post Text: The textual message or comment that is included in the Social Media Posting. 
 
Note: Large text posts could be stored as documents.
{% enddocs %}

{% docs tbl_SA_EV_CMM_POST_DT %}
Post Date: The date when the social media post was made.
{% enddocs %}

{% docs tbl_SA_EV_CMM_NBR_OF_CMNT %}
Number Of Comments: The number of times the Social Media Post has been commented on.
{% enddocs %}

{% docs tbl_SA_EV_CMM_NBR_OF_PSTV_RTG %}
Number Of Positive Ratings: The number of positive ratings associated with the posting. For example, this could be the number of times the Social Media Post has been 'liked'.
{% enddocs %}

{% docs tbl_SA_EV_CMM_NBR_OF_NEG_RTG %}
Number Of Negative Ratings: The number of negative ratings associated with the posting. For example, this could be the number of times the Social Media Post has been given a "Thumbs Down".
{% enddocs %}

{% docs tbl_SA_EV_CMM_SCL_MEDA_PSNA_ID %}
Social Media Persona Id: The unique identifier assigned to the Social Media Persona that made the posting.
{% enddocs %}

{% docs tbl_SA_EV_CMM_SCL_MEDA_WEBSITE_ID %}
Social Media Website Id: The unique identifier of the Website where the Social Media Post is posted.
{% enddocs %}

{% docs tbl_SA_EV_CPGN %}
SA Event Campaign: For Banking SA this is the combination of the Supertype Event and its subtypes, Campaign, and the Campaign subtypes Internal Campaign and Product Campaign 
 
Event includes communications, accounting and maintenance transactions and posting entries. Bank customers, vendors, employees and other Involved Parties initiate actions through communications with the Financial Institution in order to make requests of and participate in transactions with the Financial Institution. Information about the action, such as when and at what location the action occurred and what if any additional actions are required, is kept. 
 
Campaign - subtype of Event - identifies a process the Financial Institution undertakes to achieve a specific business defined objective. Examples include an advertising Campaign to promote a Product; an employee security-awareness Campaign; etc. 
Internal Campaign - subtype of Campaign - identifies a Campaign promoting a business objective within the Financial Institution e.g an employee security-awareness campaign or a recovery event in response to a business disruption. *Design Note*: it is recommended that this structure be physically rolled up into the Campaign table. 
Product Campaign - subtype of Campaign - identifies a Campaign which promotes a single Product only. Note that where a Campaign promotes a group of Products, the relationship to the underlying Products is established via the Campaign / Segment Relationship and Product Group Member structures. Design Note: it is recommended that this structure be physically rolled up into the Campaign table.
{% enddocs %}

{% docs tbl_SA_EV_CPGN_EV_CPGN_ID %}
Event Campaign Id: The unique identifier of an Event.
{% enddocs %}

{% docs tbl_SA_EV_CPGN_EV_TY_ID %}
Event Type Id: For SA Banking the only Event Type would be - Campaign Event 
 
The unique identifier of the Event Type. 
Event Type distinguishes between Events according to their inherent characteristics. 
 
Domain:
 Arrangement Activity Event 
 Product Activity Event 
 Campaign Event 
 Communication Event 
 Communication Thread Event 
 Insurance Claim 
 Transaction Event 
 Judicial Event 
 Arbitration 
 Civil 
 Criminal
{% enddocs %}

{% docs tbl_SA_EV_CPGN_EV_LC_STS_TY_ID %}
Event Life Cycle Status Type Id: The unique identifier of the Event Life Cycle Status Type. 
Event Life Cycle Status Type distinguishes between Events according to their current state within the Event life cycle. 
 
Domain:
 Abandoned Event 
 Cancelled Event 
 Completed Event 
 Event Accepted 
 Event Accepted Partially 
 In Progress Event 
 Pending Event 
 Positive Current Exposure Event 
 Potential Event 
 Received Event 
 Refunded Event 
 Refused Event 
 Rejected Event 
 Returned Event 
 Reversed Event 
 Superseded Event 
 Suspended Event
{% enddocs %}

{% docs tbl_SA_EV_CPGN_EV_LC_STS_RSN_TY_ID %}
Event Life Cycle Status Reason Type Id: The unique identifier of the Event Life Cycle Status Reason Type. 
Event Life Cycle Status Reason Type classifies the rationale for the current Event Life Cycle Status of an Event.
{% enddocs %}

{% docs tbl_SA_EV_CPGN_EV_LC_STS_TY_DT %}
Event Life Cycle Status Type Date: The date on which the current Event Life Cycle Status Type was assigned to the Event.
{% enddocs %}

{% docs tbl_SA_EV_CPGN_EV_ORGNTN_TY_ID %}
Event Origination Type Id: The unique identifier of the Event Origination Type. 
Event Origination Type distinguishes between Events according to whether the event was initiated from within or outside the Financial Institution. 
 
Domain:
 Internally Initiated Event 
 External Initiated Event
{% enddocs %}

{% docs tbl_SA_EV_CPGN_EV_SRC_ID %}
Event Source Id: The unique identifier of the Event Source i.e. the entity that initiated the Event. 
Event Source combines potential types of initiators of Events into a single surrogate identifier.
{% enddocs %}

{% docs tbl_SA_EV_CPGN_EV_CNTCT_MDM_TY_ID %}
Event Contact Medium Type Id: The unique identifier of the Event Contact Medium Type. 
Event Contact Medium Type distinguishes between Events according to the manner in which they either took place or are preferred to take place. For example, the medium through which a payment transaction takes place is online; Email is the preferred communication medium for Involved Party #297. 
 
*Domain* 
 
 Email Or Online 
 Face-To-Face Medium 
 Fax 
 File Transfer 
 Mail 
 Phone
{% enddocs %}

{% docs tbl_SA_EV_CPGN_PRTY_RTNG_ID %}
Priority Rating Id: The unique identifier of the Priority Rating. 
Priority Rating classifies information recorded in the Warehouse according to the priority or importance of the object of that information. 
 
Domain:
 High Priority 
 Medium Priority 
 Low Priority
{% enddocs %}

{% docs tbl_SA_EV_CPGN_AUTHRZTN_CD %}
Authorization Code: Authorization Code is a code which has been received to authorize a requested action. For example, a code issued by a bank to authorize a Debit Card Payment.
{% enddocs %}

{% docs tbl_SA_EV_CPGN_AUTHRZTN_DT %}
Authorization Date: Authorization date is a date, and time if known, upon which an action has been authorized. For example, the date upon which a code is issued by a bank to authorize a Debit Card Payment.
{% enddocs %}

{% docs tbl_SA_EV_CPGN_EV_PRPS_TY_ID %}
Event Purpose Type Id: The unique identifier of the Event Purpose Type. 
Event Purpose Type distinguishes between Events according to their business objective.
{% enddocs %}

{% docs tbl_SA_EV_CPGN_EV_EXCTN_MODE_ID %}
Event Execution Mode Id: The unique identifier of the Event Execution Mode. 
Event Execution Mode classifies Events according to the manner in which they are executed. For example Automated
{% enddocs %}

{% docs tbl_SA_EV_CPGN_CPGN_TY_ID %}
Campaign Type Id: The unique identifier of the Campaign Type. 
Campaign Type classifies a Campaign according to the purpose & nature of the Campaign. 
 
Domain:
 External Campaign 
 -- New Product 
 -- Market Expansion 
 -- Customer Winback 
 Internal Campaign 
 -- Security Awareness 
 -- Respect For Fellow Workers 
 -- Health Awareness 
 -- Regulatory Awareness
{% enddocs %}

{% docs tbl_SA_EV_CPGN_CPGN_LC_STS_RSN_TY_ID %}
Campaign Life Cycle Status Reason Type Id: The unique identifier of the Campaign Life Cycle Status Reason Type. 
Campaign Life Cycle Status Reason Type distinguishes between Campaigns according to the motive for changing the life cycle status of the Campaign or associated Activity. 
 
Domain:
 Preparation For New Product 
 Unfavorable Reaction Received 
 Campaign Funding Exhausted 
 Campaign Normal Termination
{% enddocs %}

{% docs tbl_SA_EV_CPGN_CPGN_TRGR_TY_ID %}
Campaign Trigger Type Id: The unique identifier of the Campaign Trigger Type. 
Campaign Trigger Type distinguishes between Campaigns according to the inherent cause of the Campaign. Values within this Classification are not mutually exclusive. 
 
Domain:
 Time Triggered 
 Opportunity Triggered 
 Defined Segment
{% enddocs %}

{% docs tbl_SA_EV_CPGN_EXPCT_STRT_DT %}
Expected Start Date: The date on which the Campaign is/was expected to commence.
{% enddocs %}

{% docs tbl_SA_EV_CPGN_ACTL_STRT_DT %}
Actual Start Date: The date on which the Campaign actually commenced.
{% enddocs %}

{% docs tbl_SA_EV_CPGN_EXPCT_END_DT %}
Expected End Date: The date on which the Campaign is/was expected to conclude.
{% enddocs %}

{% docs tbl_SA_EV_CPGN_DESC %}
Description: Description provides a textual explanation or free form comments about the Campaign.
{% enddocs %}

{% docs tbl_SA_EV_CPGN_ACTL_END_DT %}
Actual End Date: The date on which the Campaign actually concluded.
{% enddocs %}

{% docs tbl_SA_EV_CPGN_CPGN_NM %}
Campaign Name: The primary name assigned to the Campaign. This name is used in reports and documents referring to the Campaign.
{% enddocs %}

{% docs tbl_SA_EV_CPGN_CPGN_CD %}
Campaign Code: A text string assigned to the Campaign.
{% enddocs %}

{% docs tbl_SA_EV_CPGN_PRD_ID %}
Product Id: The unique identifier of a Product.
{% enddocs %}

{% docs tbl_SA_EV_TO_SA_GRP_RL %}
SA Event / SA Group Rltnp: Event / Group Relationship identifies the relationships Events have in respect to Groups. 
 
A given Event may simultaneously belong to more than one Group. The set of Groups associated with an Event may change over time. 
Event / Group Relation allows storage of these multiple and historical associations. 
 
Campaign / Group Relationship - subtype of Event / Group Relationship records details of each association between a Campaign and Group. For example Campaign #23987 (Personal Savings Plan Promotion 1996) targets Group #124 (Self Employed Professionals), Campaign #23988 (Vacation Promotion Summer 1994) promotes Group #10036 (Consumer Foreign Exchange Products & Services). Historical occurrences are maintained.
{% enddocs %}

{% docs tbl_SA_EV_TO_SA_GRP_RL_EV_ID %}
Event Id: The unique identifier of an Event.
{% enddocs %}

{% docs tbl_SA_EV_TO_SA_GRP_RL_GRP_ID %}
Group Id: The unique identifier of the Group.
{% enddocs %}

{% docs tbl_SA_EV_TO_SA_GRP_RL_EV_TO_GRP_RL_TY_ID %}
Event / Group Rltnp Type Id: The unique identifier of the Event / Group Rltnp Type. 
Event / Group Relationship Type classifies possible relationships between Events and Groups. 
 
Domain:
 EV Is Aimed At Group 
 EV Uses Group 
 
Campaign / Group Relationship Type classifies a relationship between a Campaign and a Group in order to identify the business requirement for the relationship; for example in the relationship Campaign #23987 (Personal Savings Plan Promotion 1996) targets Group #124 (Self Employed Professionals), 'targets' is the Campaign / Group Relationship Type. 
 
Domain:
 Targets 
 applies to
{% enddocs %}

{% docs tbl_SA_EV_TO_SA_GRP_RL_EFFV_DT %}
Effective Date: The date from which an instance of the entity is valid.
{% enddocs %}

{% docs tbl_SA_EV_TO_SA_GRP_RL_END_DT %}
End Date: The Calendar date after which an instance of the entity is no longer valid.
{% enddocs %}

{% docs tbl_SA_EV_TO_SA_GRP_RL_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_EV_TO_SA_GRP_RL_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_EV_TO_SA_GRP_RL_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_EV_TO_SA_GRP_RL_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_EV_TO_SA_GRP_RL_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_EV_TO_SA_GRP_RL_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_EV_TO_SA_GRP_RL_EV_SRC_SYS_CD %}
Event Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_EV_TO_SA_GRP_RL_EV_SRC_SYS_UNQ_KEY_TXT %}
Event Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_EV_TO_SA_GRP_RL_GRP_IP_SRC_SYS_CD %}
Group Involved Party Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_EV_TO_SA_GRP_RL_GRP_IP_SRC_SYS_UNQ_KEY_TXT %}
Group Involved Party Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_GRP %}
SA Group: Group identifies a specific grouping of objects that is of interest to the Financial Institution and may itself be composed of other Groups. The grouping can be created for marketing, management, control, and reporting purposes, or for other conceptual or concrete purposes as required. A Group may be a composite grouping made up of parts of various groups, such as a product line or an investment buy list, for the purpose of specifying recommended combinations of members in the composite. For marketing purposes, the Group can be composed of Involved Parties such as customers or prospects that are grouped by any number of criteria such as age, income or location; for example, Group #100 (Over 55), or Group #49 (Single Income Professional). 
 
Note that a Group may group entities which may enter or leave the Group over time, as their characteristics cause them either to match or not to match the criteria defining the Group. Likewise, as more is understood by those who define the Group, they may decide to alter the characteristics which determine the Group's members; for example, the 'Bank XYZ Growth and Income Buy List' will have entries come and go, as their various performances either qualify or disqualify them for inclusion on the list. Likewise, as Bank XYZ gains experience in the quality of their recommendations on that list, they may adjust the characteristics by which they determine what is included in the list and what is not. 
 
Subtypes 
Involved Party Group - subtype of Group - is a grouping of Involved Parties in whom the Financial Institution is interested, based on selection criteria that define membership of the Group. For example; the 'Personal Customer' Group where the criteria is that the Involved Party be an Individual and a Customer of the Bank. 
Customer Market Segment - subtype of Involved Party Group - is a dimension that groups customers based on specific shared characteristics; in this case their industry category or individual characteristics. For example; all Individuals living in Manhattan who are aged between 20 and 30, all Organizations with greater than 1,000 employees 
Blacklist - subtype of Involved Party Group - is an Involved Party Group whose members are Involved Parties who have been designated as being Involved Parties with whom no business (possibly of a particular type) should be done. The designation may be by the Financial Institution itself, or may originate from regulatory or governmental agencies. For example, a credit blacklist, a terrorist blacklist. 
A Responsibility Center - subtype of Involved Party Group - is an Involved Party Group which combines Involved Parties (usually Employees and/or Organization Units) for management and/or accounting purposes. For example, all Organization Units whose profits are recorded in a particular General Ledger account. 
The same Involved Party may be a member of several Responsibility Centers, provided these are for distinct reasons. For example, an Organization Unit may be a member of different Responsibility Centers for Accounting, Profitability and Risk purposes. 
One Responsibility Center may include several other Responsibility Centers. 
Memberships of Responsibility Centers may change over time, and are tracked by the Involved Party / Group Relationship associative. 
Location Group - subtype of Group - identifies all the valid ways in which Locations can be Grouped, given the set of Location Group Types as criteria. For example, If the Location Group Type is 'Inflation Segment', the available Location Groups might be 'Low Inflation', 'Moderate Inflation' and 'High Inflation'. The relationships between Locations and Location Groups is physically achieved using Classification/Classification Relationship. 
Route - subtype of Location Group - is a geographical route deemed important for segmentation purposes, in particular it locates a chain of Postal Addresses. For example, a set of Post Codes in a prosperous Areas 
Organization Unit Geography - subtype of Location Group - is a Location Group defined by an Organization (commonly the Financial Organization itself) that combines Geographic Areas into areas of management for the Organization. For example, the Southern Sales Division. 
Organization Units (e.g. Branches) can then be classified according to the Organization Unit Geography in which they exist. 
Financial Market - subtype of Location Group - Identifies a Group composed of Countries or other locations, which form a financial market. 
Other Group subtypes and IP Subtypes are not being used at this time. 
Product Group - subtype of Group - identifies all the valid ways in which Products can be Grouped, given the set of Product Group Types as criteria. For example, If the Product Group Type is 'Product Line', the available Product Groups might be 'Deposits', 'Loans', 'Instruments', 'Investments'. The relationships between products and product groups is physically achieved using Product/Classification Relationship.
{% enddocs %}

{% docs tbl_SA_GRP_GRP_ID %}
Group Id: The unique identifier of the Group.
{% enddocs %}

{% docs tbl_SA_GRP_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_GRP_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_GRP_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_GRP_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_GRP_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_GRP_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_GRP_GRP_TY_ID %}
Group Type Id: The unique identifier of the Group Type. 
Group Type classifies Groups according to the nature of the Group. 
 
Domain:
 Arrangement Group 
 Communication Group 
 Currency Group 
 Involved Party Group 
 Location Group 
 Product Group 
 Channel 
 Management Group 
 Rating Scale 
 Hierarchy 
 Hierarchy Level
{% enddocs %}

{% docs tbl_SA_GRP_EFFV_DT %}
Effective Date: The date from which an instance of the entity is valid.
{% enddocs %}

{% docs tbl_SA_GRP_END_DT %}
End Date: The Calendar date after which an instance of the entity is no longer valid.
{% enddocs %}

{% docs tbl_SA_GRP_GRP_CD %}
Group Code: Group Code is used where 'meaningful' mnemonic external codes, in each language of the warehouse environment, are assigned to each Group occurrence for purposes of identification.
{% enddocs %}

{% docs tbl_SA_GRP_GRP_NM %}
Group Name: The primary name assigned to the Group. This name is used in reports and documents.
{% enddocs %}

{% docs tbl_SA_GRP_GRP_TXT %}
Group Text: A fixed piece of text describing the Group.
{% enddocs %}

{% docs tbl_SA_GRP_DESC %}
Description: Description provides a textual explanation or free form comments about the Group.
{% enddocs %}

{% docs tbl_SA_GRP_IP_GRP_TY_ID %}
Involved Party Group Type Id: The unique identifier assigned to the Involved Party Group Type. 
Involved Party Group Type classifies the set of Involved Party Groups. 
 
Domain:
 Blacklist 
 Customer Market Segment 
 Household 
 Model Test Group 
 Responsibility Center 
 Continuity Of Address Segment 
 Organization Value Segment
{% enddocs %}

{% docs tbl_SA_GRP_RESP_CNTR_TY_ID %}
Responsibility Center Type Id: The unique identifier assigned to the Responsibility Center Type. 
Responsibility Center Type identifies the authority level at which a Responsibility Center exists. 
 
Domain:
 Branch Responsibility Center (Individuals) 
 Corporate Responsibility Center 
 Central Division Responsibility Center (Large Corporates) 
 Treasury Responsibility Center
{% enddocs %}

{% docs tbl_SA_GRP_LO_GRP_TY_ID %}
Location Group Type Id: The unique identifier of the Location Group Type. 
Location Group Type classifies the valid set of Location Group Types, that is, the reasons for each set of Location Groups. 
 
Domain:
 Route 
 Organization Unit Geography 
 Financial Market
{% enddocs %}

{% docs tbl_SA_GRP_FNC_MRKT_TY_ID %}
Financial Market Type Id: The unique identifier of the Financial Market Type. 
Financial Market Type distinguishes between Financial Markets based on their level of growth and development. 
 
Domain:
 
 Emerging Market 
 Pre-Emerging Market 
 Developed Market 
 Frontier Market
{% enddocs %}

{% docs tbl_SA_GRP_PRD_GRP_TY_ID %}
Product Group Type Id: The unique identifier of the Product Group Type. 
Product Group Type classifies the valid set of Product Group Types, that is, the reasons for each set of Product Groups. 
 
Domain:
Product Risk Management 
Line Of Business 
Product Management 
Balance Sheet Positioning.
{% enddocs %}

{% docs tbl_SA_IP_ALT_IDFN %}
SA Involved Party Alternative Identification: Involved Party Identification identifies an Involved Party that represents one or more numbers or codes by which an Involved Party can be identified. The identification item can be an industry recognized identifier, such as BIC, ABA (American Bank Association), BLZ (Bankleitzahl) or can be an internally generated password for employee use. The Involved Party can have one or more identification items from various sources; for example, Bank XYZ's ABA number is 0560-0422-2, BLZ of the Stadt-Sparkasse Duesseldorf is 356 432 54.
{% enddocs %}

{% docs tbl_SA_IP_ALT_IDFN_EFFV_DT %}
Effective Date: The date from which an instance of the entity is valid.
{% enddocs %}

{% docs tbl_SA_IP_ALT_IDFN_IP_ID %}
Involved Party Id: The unique identifier assigned to an Involved Party.
{% enddocs %}

{% docs tbl_SA_IP_ALT_IDFN_IP_IDFN_TY_ID %}
Involved Party Identification Type Id: The unique identifier of the Involved Party Identification Type. 
nvolved Party Identification Type classifies Involved Party Identifications according to their use, origin or assigning body; for example, Legal Identification, Tax Identification, Social Security Number. 
 
Domain:
 Bank Identifier Code 
 American Bankers Association Code 
 Legal Entity Identifier 
 Global Intermediary Identifier Number 
 Regulator Assigned Identifier
{% enddocs %}

{% docs tbl_SA_IP_ALT_IDFN_END_DT %}
End Date: The Calendar date after which an instance of the entity is no longer valid.
{% enddocs %}

{% docs tbl_SA_IP_ALT_IDFN_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_IP_ALT_IDFN_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_IP_ALT_IDFN_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_IP_ALT_IDFN_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_IP_ALT_IDFN_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_IP_ALT_IDFN_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_IP_ALT_IDFN_IP_SRC_SYS_CD %}
Involved Party Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_IP_ALT_IDFN_IP_SRC_SYS_UNQ_KEY_TXT %}
Involved Party Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_IP_ALT_IDFN_IDFN_NBR_TXT %}
Identification Number Text: The unique identifier used to identify an involved party. 
 
For example, the BIC is a universal method of identifying financial institutions. 
Externally-designated Identification Number, of type as defined by Identification Type Id.
{% enddocs %}


{% docs tbl_SA_IP_TO_SA_EV_RL %}
SA Involved Party / SA Event Rltnp: Involved Party / Event Relationship records all relationships between Involved Parties and Events. For example, Involved Parties that plan Events, Involved Parties that manage or initiate Events and Involved Parties that are affected by Events. 
 
Note that an Event can impact more than one Involved Party. The impact on each Involved Party can be held separately in this structure. Historical instances can be maintained 
 
Communication / Involved Party Relationship - subtype of Involved Party / Event Relationship - records details of each association between a Communication and an Involved Party , for example Organization Unit #202020 'Marketing Dept. UK West Midlands' is responsible for tracking Communication #313123 'New Debit Card Sales Promotion Offer', Individual #121233 is recipient of Communication #898345 'Response To Complaint'. 
 
Campaign / Involved Party Relationship - subtype of Involved Party / Event Relationship -records details of each association between a Campaign and an Involved Party, for example Campaign #23987 (Personal Savings Plan Promotion 1996) is planned by Organization Unit #7776 (Consumer Products Development Unit), Campaign #23988 (Vacation Promotion Summer 1994) is promoted by Organization #10036 (Acme Public Relations Ltd.). Historical occurrences are maintained.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_EV_RL_IP_ID %}
Involved Party Id: The unique identifier assigned to the Involved Party involved in the relationship.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_EV_RL_IP_TO_EV_RL_TY_ID %}
Involved Party / Event Rltnp Type Id: The unique identifier of the Involved Party / Event Rltnp Type. (includes Communication / Involved Party Rltnp Type and Campaign / Involved Party Rltnp Type) 
Involved Party / Event Relationship Type classifies all labels or categories of an instance of the Involved Party / Event Rltnp associative. 
 
Domain:
 
 EV Elects IP 
 EV Has Victim Of IP 
 EV Is Cancelled By IP 
 EV Is Guaranteed By IP 
 EV Is Interpreted By IP 
 EV Is Recorded By IP 
 EV Is Referred To IP 
 EV Is Released By IP 
 EV Is Requested By IP 
 EV Is Settled By IP 
 EV Maintains IP 
 IP Acts As Candidate In EV 
 IP Approves EV 
 IP Arbitrates EV 
 IP Audits EV 
 IP Communicates EV 
 IP Confirms EV 
 IP Counsels EV 
 IP Guarantor Makes Payment EV 
 IP Has Override Authority On EV 
 IP Initiates EV 
 Customer Initiated Credit Transaction 
 Customer Initiated Debit Transaction 
 FI Initiated Credit Transaction 
 FI Initiated Debit Transaction 
 Narrative Only 
 IP Not Present At EV 
 IP Present At EV 
 IP Insures EV 
 IP Is Agent For EV 
 IP Is Agreement Party For EV 
 IP Is Beneficiary In EV 
 IP Is Borrower Of EV 
 IP Is Broker For EV 
 IP Is Buy Side Party For EV 
 IP Is Buyer Of EV 
 IP Is Calculation Agent For EV 
 IP Is Cash Correspondent For EV 
 IP Is Central Counterparty For EV 
 IP Is Central Securities Depository For EV 
 IP Is Clearing Broker For EV 
 IP Is Complainant In EV 
 IP Is Confirmation Party For EV 
 IP Is Core Participant In EV 
 IP Is Court For Judgment EV 
 IP Is Credit Party For EV 
 IP Is Creditor For EV 
 IP Is Custodian Of EV 
 IP Is Data Controller For EV 
 IP Is Data Processor For EV 
 IP Is Data Protection Officer EV 
 IP Is Data Provider For EV 
 IP Is Data Recipient In EV 
 IP Is Data Subject In EV 
 IP Is Dealer For EV 
 IP Is Debit Party For EV 
 IP Is Debtor For EV 
 IP Is Destination Financial Institution For EV 
 IP Is Executing Broker For EV 
 IP Is Final Agent For EV 
 IP Is Final Party For EV 
 IP Is First Agent For EV 
 IP Is Forwarding Agent For EV 
 IP Is Fund Accountant For EV 
 IP Is Fund Management Company For EV 
 IP Is Global Settlement Agent For EV 
 IP Is Held Liable For EV 
 IP Is Held Responsible For EV 
 IP Is Infrastructure For EV 
 IP Is Initiating Party For EV 
 IP Is Interested Agent For EV 
 IP Is Intermediary For EV 
 IP Is Investment Decision Maker For EV 
 IP Is Investment Manager For EV 
 IP Is Investor For EV 
 IP Is Invoicee For EV 
 IP Is Invoicer For EV 
 IP Is Lender Of EV 
 IP Is Local Settlement Agent For EV 
 IP Is Market Maker In EV 
 IP Is Notified Of EV 
 IP Is Origin Financial Institution For EV 
 IP Is Originating Party For EV 
 IP Is Paying Agent For EV 
 IP Is Payment Clearing Agent For EV 
 IP Is Payment Service Provider For EV 
 IP Is Payment Settlement Agent For EV 
 IP Is Post Trade Administrator For EV 
 IP Is Principal For EV 
 IP Is Proxy Agent For EV 
 IP Is Redistributor Agent For EV 
 IP Is Registrar For EV 
 IP Is Regulator For EV 
 IP Is Sell Side Party For EV 
 IP Is Seller Of EV 
 IP Is Settlement Agent For EV 
 IP Is Subject Of Court Judgment EV 
 IP Is System Direct Member For EV 
 IP Is System Indirect Member For EV 
 IP Is System Member For EV 
 IP Is System Transaction Administrator For EV 
 IP Is Target Of EV 
 IP Is Third Party For EV 
 IP Is Trade Instructor For EV 
 IP Is Trader For EV 
 IP Is Trading Party For EV 
 IP Is Transfer Agent For EV 
 IP Litigates EV 
 IP Manages EV 
 IP Organizes EV 
 IP Owns EV 
 IP Participates In EV 
 IDV Is Assessor Of CLM 
 IDV Is Named Driver In CLM 
 IDV Is Witness In CLM 
 IP Is Claimant In CLM 
 IP Is Lawyer/Solicitor In CLM 
 IP Is Repairer In CLM 
 OU Is Insrnc Company Of Claimant In CLM 
 IP Performs EV 
 IP Plans EV 
 IP Reports EV 
 IP Sponsors EV 
 IP Votes On EV 
 IP Is Place Of Transaction For EV 
 IP Is Registration Authority For EV 
 IP Is Subject Of Registration EV 
 IP Is Benefactor Of EV 
 IP IS Intermediary Of EV 
 
Communication / Involved Party Relationship Type classifies a relationship between an Communication and an Involved Party in order to identify the business requirement for the relationship; for example Individual #121233 'Records' Communication #898345 ('Response To Complaint'). 
 
Domain:
 Is Recorded By 
 Is Released By 
 
Campaign / Involved Party Relationship Type classifies a relationship between a Campaign and an Involved Party in order to identify the business purpose of the relationship; for example in the relationship Campaign #23987 (Personal Savings Plan Promotion 1996) is planned by Organization Unit #7776 (Consumer Products Development Unit), 'is planned by' is the Campaign / Involved Party Relation Type. 
 
Domain:
 Is planned by 
 Is managed by 
 Is owned by
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_EV_RL_EFFV_DT %}
Effective Date: The date from which an instance of the entity is valid.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_EV_RL_EV_ID %}
Event Id: The unique identifier of the Event involved in the relationship.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_EV_RL_END_DT %}
End Date: The Calendar date after which an instance of the entity is no longer valid.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_EV_RL_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_EV_RL_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_EV_RL_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_EV_RL_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_EV_RL_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_EV_RL_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_EV_RL_IP_SRC_SYS_CD %}
Involved Party Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_EV_RL_IP_SRC_SYS_UNQ_KEY_TXT %}
Involved Party Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_EV_RL_EV_IP_SRC_SYS_UNQ_KEY_TXT %}
Event Involved Party Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_EV_RL_EV_IP_SRC_SYS_CD %}
Event Involved Party Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_GRP_RL %}
SA Involved Party / SA Group Rltnp: July 19 2019 the Group ID in this entity is populated by either the SA Group.Group ID or the SA Channel.Channel ID 
 
Involved Party / Group Relationship records details of each association between an Involved Party and a Group. For example Involved Party #86756 (Individual 'John Doe') is likely to purchase a product in Group #8131 (Product Group 'Home Loans'). 
 
Involved Party / Channel Relationship indicates the Channels through which communications may be made with, or goods and services delivered to, an Involved Party.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_GRP_RL_EFFV_DT %}
Effective Date: The date from which an instance of the entity is valid.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_GRP_RL_IP_TO_GRP_RL_TY_ID %}
Involved Party / Group Rltnp Type Id: The unique identifier of the Involved Party / Group Relationship Type. 
Involved Party / Group Relationship Type classifies possible relationships between Involved Parties and Groups. 
 
Domain:
 Group Classifies Involved Party 
 Involved Party Is Member Of Group 
 Group Is Analyzed By Involved Party 
 Involved Party Audits Group 
 Involved Party Defines Group 
 Involved Party Has Access To Group 
 Involved Party Manages Group
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_GRP_RL_GRP_ID %}
Group Id: The unique identifier of the Group. or The unique identifier of the Channel.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_GRP_RL_IP_ID %}
Involved Party Id: The unique identifier assigned to an Involved Party.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_GRP_RL_END_DT %}
End Date: The Calendar date after which an instance of the entity is no longer valid.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_GRP_RL_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_GRP_RL_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_GRP_RL_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_GRP_RL_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_GRP_RL_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_GRP_RL_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_GRP_RL_GRP_IP_SRC_SYS_UNQ_KEY_TXT %}
Group Involved Party Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_GRP_RL_GRP_IP_SRC_SYS_CD %}
Group Involved Party Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_GRP_RL_IP_SRC_SYS_CD %}
Involved Party Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_GRP_RL_IP_SRC_SYS_UNQ_KEY_TXT %}
Involved Party Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_GRP_RL_PRFRD_CNTCT_DY %}
Preferred Contact Day: The preferred day of the week for making contact with the Involved Party.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_GRP_RL_SOLCT_FLG %}
Solicitable Flag: A flag indicating whether the Involved Party has expressed that they would not like to receive any marketing material, brochures, etc. on the given Channel.
{% enddocs %}


{% docs tbl_SA_IP_TO_SA_IP_RL %}
SA Involved Party / SA Involved Party Rltnp: Involved Party / Involved Party Relationship identifies all of the instances of relationships between two Involved Parties. The same two Involved Parties may be related in several types of relationships; for example, Involved Party #4632 (Company A) 'Is Customer Of' Involved Party #2392 (Financial Institution Abc) as well as 'Is Supplier For'. Historical occurrences are maintained.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_IP_RL_EFFV_DT %}
Effective Date: The date from which an instance of the entity is valid.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_IP_RL_OBJ_IP_ID %}
Object Involved Party Id: The unique identifier assigned to an Object Involved Party.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_IP_RL_IP_TO_IP_RL_TY_ID %}
Involved Party / Involved Party Rltnp Type Id: The unique identifier of the Involved Party / Involved Party Relationship Type. 
Involved Party / Involved Party Relationship Type classifies Involved Party / Involved Party Relationships according to the specific roles that exist between the two instances of Involved Party involved in the relationship in order to identify the business requirement for the relationship; for example, Involved Party #12224 (John Smith) 'Is Customer Of' Involved Party #992 (Bank A). 
 Involved Party #8394 (Corp X) 'Is Subsidiary Of' Involved Party #432 (Holding Company Y) 
 Involved Party #4321 (Relay Service) Acts on behalf of Involved Party #987 (Mary O'Shea) 
 Involved Party #13232 (John O'Shea) Is Alternative to Involved Party #987 (Mary O'Shea) 
 Involved Party #1 (Financial Institution) Authenticates Involved Party #4321 (Relay Service) 
 
Domain:
IP Acts On Behalf Of IP 
IP Advises IP 
IP Authenticates IP 
IP Avoids Business Relationship With IP 
IP Certifies Use Of Classification By IP 
IP Has Equity Interest In IP 
IP Has Skills Required By IP 
IP Holds Franchise Of IP 
IP Identifies IP 
IP Indirectly Manages IP 
IP Interprets For IP 
IP Is Accountant For IP 
IP Is Accreditation Body For IP 
IP Is Affiliated With IP 
IP Is Agent For IP 
IP Is Alternative To IP 
IP Is Appraiser For IP 
IP Is Authorized Contact for IP 
IP Is Authorized Repairer For IP 
IP Is Authorized To Trade At IP 
IP Is Beneficiary Of A Trust Managed By IP 
IP Is Broker For IP 
 IP Is Prime Broker For IP 
 IP Is Executing Broker For IP 
 IP Is Clearing Broker For IP 
IP Is Certified By IP 
IP Is Chairperson Of IP 
IP Is Child Of IP 
IP Is Competitor Of IP 
IP Is Comprised Of IP 
IP Is Contact For IP 
IP Is Contractor For IP 
IP Is Correspondent For IP 
IP Is Covering Bank For IP 
IP Is Customer Of IP 
IP Is Data Controller For IP 
IP Is Data Processor For IP 
IP Is Data Protection Officer For IP 
IP Is De Facto Spouse Of IP 
IP Is Dependant Of IP 
IP Is Designated Representative Of IP 
IP Is Emergency Contact For IP 
IP Is Employee Of IP 
IP Is Fiduciary For IP 
IP Is Financial Planner For IP 
IP Is General Partner Of IP 
IP Is Guarantor Of IP 
IP Is Guardian Of IP 
IP Is Heir Of IP 
IP Is Holding Company Of IP 
IP Is Information Gatherer For IP 
IP Is Introducer For IP 
IP Is Investment Advisor To IP 
IP Is Lawyer/Solicitor For IP 
IP Is Legislative Institution For IP 
IP Is Limited Partner Of IP 
IP Is Marketing Branch For IP 
IP Is Marketing Representative For IP 
IP Is Marketing Unit For IP 
IP Is Member Of IP 
IP Is Next Of Kin To IP 
IP Is Payment Service Provider For IP 
IP Is Primary Branch For IP 
IP Is Prospective Acquisition Of IP 
IP Is Receiver Of IP 
IP Is Registered Representative For IP 
IP Is Registered With IP 
IP Is Regulator For IP 
IP Is Related To IP 
IP Is Responsible For IP 
IP is Securities Affiliate for IP 
IP Is Selling Point For IP 
IP Is Service Provider For IP 
IP Is Shareholder Of IP 
IP Is Shareholder Service Provider For IP 
IP Is Sponsor Of IP 
IP Is Spouse Of IP 
IP Is Subsidiary Of IP 
IP Issues Assessments For IP 
IP Is Supervisor Of IP 
IP Is Trustee For IP 
IP Is Vendor To IP 
IP Is Wealth Client Of IP 
IP Is Will Executor Of IP 
IP Is Witness In Insurance Claim Against IP 
IP Manages IP 
IP Occupies IP 
IP Owns IP 
IP Provides Information About IP 
IP Supersedes IP 
IP Has Non-Controlling Interest In IP 
IP Approves Participation In ABCP Program As Sale IP 
IP Is Not Affiliated With IP 
IP Subject to Consolidation Supervision/Regulation Of IP 
IP Is Automated Clearing House (ACH) For IP 
IP Is Acquirer For IP 
IP Is Card Acceptor From IP 
IP Is Creditor To IP 
IP Is Customer Of IP 
IP Is Debtor To IP 
IP Is Payment Card Issuer To IP 
IP Is Card Holder Under IP 
IP Is Merchant To IP 
IP Is Represented Online As IP 
IP Is Connected Via Social Media To IP 
IP Is Union Institution To IP
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_IP_RL_SUBJT_IP_ID %}
Subject Involved Party Id: The unique identifier assigned to a Subject Involved Party.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_IP_RL_END_DT %}
End Date: The Calendar date after which an instance of the entity is no longer valid.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_IP_RL_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_IP_RL_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_IP_RL_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_IP_RL_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_IP_RL_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_IP_RL_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_IP_RL_SUBJT_IP_SRC_SYS_CD %}
Subject Involved Party Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_IP_RL_SUBJT_IP_SRC_SYS_UNQ_KEY_TXT %}
Subject Involved Party Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_IP_RL_OBJ_IP_SRC_SYS_CD %}
Object Involved Party Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_IP_RL_OBJ_IP_SRC_SYS_UNQ_KEY_TXT %}
Object Involved Party Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_IP_RL_DESC %}
Description: A textual explanation or free form comments about the Relationship.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_IP_RL_IP_X_IP_RL_LC_STS_RSN_TY_ID %}
IP/IP Rltnp Life Cycle Status Reason Type Id: The unique identifier of the Involved Party / Involved Party Relationship Life Cycle Status Reason Type 
Involved Party / Involved Party Relationship Life Cycle Status Reason Type classifies Involved Party / Involved Party Relationships according to the motive for changing the life cycle status of the Relationship. 
 
Domain:
 Marriage 
 Divorce 
 Adoption
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_IP_RL_RL_LC_STS_DT %}
Relationship Life Cycle Status Date: The date on which the current Life Cycle Status Type was assigned to the Relationship.
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_IP_RL_PCT_AMT %}
Percent Amount: Where the Involved Party / Involved Party Relationship permits of degree, this attribute is used to record that degree in percentage terms (e.g. ACME Enterprises Ltd owns 75% ACME Enterprises (IRE) Ltd).
{% enddocs %}

{% docs tbl_SA_IP_TO_SA_IP_RL_IP_X_IP_RL_LC_STS_TY_ID %}
IP/IP Rltnp Life Cycle Status Type Id: The unique identifier of the Involved Party / Involved Party Relationship Life Cycle Status Type.
{% enddocs %}


{% docs tbl_SA_PRD %}
SA Product: For SA Product only the basic information is being provided, and it is being included in the Arrangement subject area... 
 the detail can be added if and when the information from the financial instituiton is available, and at that time a distince subject area could be created. 
 
Product identifies goods and services that can be offered, sold, or purchased by the Financial Institution, its competitors, and other Involved Parties, or in which the Financial Institution has an interest during the normal course of its business activity; for example, 'Product#220 (Xyz Bank's Private Banking Residential Mortgage Loan)', 'Product #988 (Personal Checking 
Account)', 'Product #440 (Securities Trading Service)'. 
 
subtypes of Product 
Insurance Product - subtype of Product - identifies a Product where one Involved Party, such as an Insurance Company, agrees to provide financial coverage if certain events adversely affect the insured item or the Involved Party; for example, a Whole Life Insurance Product for Individuals or a Property Insurance Product for a house. 
Investment Product - subtype of Product - is a type of Product that offers various alternatives whereby a customer may invest for income, appreciation or other reasons. The Financial Institution may offer its own investment products or act as a broker or financial advisor for products of other Involved Parties. The method in which the Financial Institution manages the funds may not be known to the Customer but will normally affect the return and risk on the investment; for example, the investment may be in stocks, shares, property, mutual funds, insurance bonds, or a combination thereof. 
Service - subytpe of Product - Services delivered to customers, such as financial engineering ( portfolio management, financial planning etc.), estate management etc. These services are taken up by customers via service arrangements, such as financial portfolio management arrangement, financial engineering arrangement etc. 
Card Service - subtype of Service - Identifies a Service which enables the holder of a Financial Transaction Card to perform certain financial transactions; for example, a credit card, a debit card, an ATM card. 
Financial Market Instrument identifies - subtype of Product - a Product which is traded in the Financial Markets. For example Bonds, Derivatives (such as Swaps and Options), Near Cash (Money Market), Repurchase Agreements, Foreign Exchange. 
Some Financial Market Instruments have a face value currency in which they are denominated, such as a U.S. Treasury Bond with a face value currency of U.S. Dollars or a U.S. Dollar Currency Option which species that Dollars may be put or called against another currency. 
Some Financial Market Instruments will have a default Cost Currency, against which they are traded, e.g. a U.S. Equity is traded in U.S. Dollars. However, the same instrument can be traded in other currencies, when traded in overseas markets. The actual cost currency is determined by the Quote Currency Instrument Id on the Instrument Price Quotation associated with this Financial Market Instrument. 
Settlement Currency can be different from the trade Cost Currency when a customer chooses to settle in their local currency; such a Settlement Currency is independent of the Financial Market Instrument.
{% enddocs %}

{% docs tbl_SA_PRD_PRD_ID %}
Product Id: The unique identifier of a Product.
{% enddocs %}

{% docs tbl_SA_PRD_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_PRD_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_PRD_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_PRD_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_PRD_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_PRD_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_PRD_PRD_TY_ID %}
Product Type Id: The unique identifier of the Product Type. 
Product Type classifies a product based upon its inherent characteristics, structure, and the market needs it addresses. 
 
Domain:
 Deposit Product 
 Financial Market Instrument 
 Insurance Product 
 Investment Product 
 Service 
 Tangible Goods Product
{% enddocs %}

{% docs tbl_SA_PRD_PRD_CD %}
Product Code: A code or short name by which a Product can be identified; for example, code '#524' represents a specific Product.
{% enddocs %}

{% docs tbl_SA_PRD_PRD_NM %}
Product Name: The primary name assigned to the Product. This name is used in reports and documents referring to the Product.
{% enddocs %}

{% docs tbl_SA_PRD_END_DT %}
End Date: The date on which the Product ceased to be relevant to the Financial Institution.
{% enddocs %}

{% docs tbl_SA_PRD_EFFV_DT %}
Effective Date: The date on which the Product first became relevant to the Financial Institution.
{% enddocs %}

{% docs tbl_SA_PRD_DESC %}
Description: Provides a textual explanation or free form comments about a Product.
{% enddocs %}

{% docs tbl_SA_PRD_PRD_USBLTY_TY_ID %}
Product Usability Type Id: The unique identifier of the Product Usability Type. 
Product Usability Type classifies Products according to the degree of difficulty involved in customer use and understanding of the Product and hence whether any instruction or training is required in the use of the Product. 
 
Domain:
 No Training Required Product 
 Training Required Product 
 Expert Training Required Product
{% enddocs %}

{% docs tbl_SA_PRD_PRD_ACCSBLTY_TY_ID %}
Product Accessibility Type Id: The unique identifier of the Product Accessibility Type.
{% enddocs %}

{% docs tbl_SA_PRD_PRD_DLVRY_TBND_ID %}
Product Delivery Time Band Id: The unique identifier of the Product Delivery Time Band.
{% enddocs %}

{% docs tbl_SA_PRD_PRD_COST_SEG_ID %}
Product Cost Segment Id: The unique identifier of the Product Cost Segment. 
Product Cost Segment classifies Products according to the level of charge the Customer must pay to obtain access to the Product and/or Arrangements based upon it.
{% enddocs %}

{% docs tbl_SA_PRD_CUST_MSEG_ID %}
Customer Market Segment Id: The unique identifier of the Customer Market Segment at which the Product is targeted. 
Customer Market Segment is a dimension that groups customers based on specific shared characteristics; in this case their industry category or individual characteristics. For example; all Individuals living in Manhattan who are aged between 20 and 30, all Organizations with greater than 1,000 employees
{% enddocs %}

{% docs tbl_SA_PRD_PRD_PMT_VARBLTY_TY_ID %}
Product Payment Variability Type Id: The unique identifier of the Product Payment Variability Type. 
Product Payment Variability Type distinguishes between Products according to whether payments on the use of the Product are constant in value, or may vary. 
 
Domain:
 Variable Payment Product 
 Fixed Payment Product
{% enddocs %}

{% docs tbl_SA_PRD_PRD_LC_STS_TY_ID %}
Product Life Cycle Status Type Id: The unique identifier of the Product Life Cycle Status Type. 
Product Life Cycle Status Type distinguishes between the stages in the life cycle of a Product. 
 
Domain:
 Proposed 
 Initial Feasibility 
 Under development 
 Rejected 
 Approved 
 Submitted For Sign Off 
 Release Pending 
 Announced 
 Available 
 Rollout 
 Temporarily Unavailable 
 No Longer Available 
 Obsolete 
 Launched 
 In Default 
 Suspended 
 Not Active 
 Issued
{% enddocs %}

{% docs tbl_SA_PRD_PRD_LC_STS_TY_DT %}
Product Life Cycle Status Type Date: The date on which the current Product Life Cycle Status Type was assigned to the Product.
{% enddocs %}

{% docs tbl_SA_PRD_PRD_PROFT_SEG_ID %}
Product Profitability Segment Id: The unique identifier of the Product Profitability Segment. 
Product Profitability Segment classifies Products according to level of excess revenue (over development and operating costs) received by the Financial Institution. For example, High Profitability, Medium Profitability, Low Profitability.
{% enddocs %}

{% docs tbl_SA_PRD_PRD_PROFT_SEG_DT %}
Product Profitability Segment Date: The date on which the current Product Profitability Segment was assigned to the Product.
{% enddocs %}

{% docs tbl_SA_PRD_PARNT_PRD_ID %}
Parent Product Id: Include - as natural key - in SA file since Product to Product is currently not included in SA files 
 
The unique identifier of the Product that is the parent of this Product. For example, where this Product identifies a particular tranche of a security, then this attribute references that security.
{% enddocs %}

{% docs tbl_SA_PRD_CUST_AC_RQD_FLG %}
Customer Account Required Flag: Identifies whether or not the use of the Product requires that an Account Arrangement be put in place in order to operate the Product. For example, a Product of Checking Account will require an Account Arrangement, whereas a Product of Traveler's Check will not.
{% enddocs %}

{% docs tbl_SA_PRD_SCR_RQD_FLG %}
Security Required Flag: Indicates whether security must be provided for Arrangements based on the Product in order to offset the risk to the Financial Institution caused by use of the Product.
{% enddocs %}

{% docs tbl_SA_PRD_TAX_ADVTG_FLG %}
Tax Advantage Flag: Indicates whether the Product provides a tax benefit to an Involved Party, or not.
{% enddocs %}

{% docs tbl_SA_PRD_SPCLZD_PRD_FLG %}
Specialized Product Flag: Indicates whether the Product is designed for a specific market segment, or not.
{% enddocs %}

{% docs tbl_SA_PRD_FNC_PRD_FLG %}
Financial Product Flag: Indicates whether the Product is generally regarded as being one offered by members of the financial services industry.
{% enddocs %}

{% docs tbl_SA_PRD_EXOTC_FLG %}
Exotic Flag: Indicates if the Product's terms and conditions are not structured according to the agreed or de facto standard for that class or type of instrument. Exchange traded Products are traded according to a standardized set of terms and conditions, therefore ensuring a liquid primary and secondary market for their trading. Exotic options, for example, are usually Over The Counter (OTC) traded, i.e. not via an exchange, and therefore are dealt directly between the counterparties involved.
{% enddocs %}

{% docs tbl_SA_PRD_RDLY_MKTBL_FLG %}
Readily Marketable Flag: Identifies whether or not the Product is readily marketable of not. A readily marketable product is one that can readily be purchased or sold.
{% enddocs %}

{% docs tbl_SA_PRD_INS_TY_ID %}
Insurance Type Id: The unique identifier of the Insurance Type. 
Insurance Type classifies Insurance Products and Arrangements in terms of the type of risk to be insured. 
 
Domain:
 Life Insurance 
 -- Whole Life Insurance 
 -- Term Life Insurance 
 -- Universal Life Insurance 
 Disability Insurance 
 -- Medical Disability 
 -- Disability Compensation 
 -- Loss Of Income 
 General Insurance Service 
 -- Property Insurance 
 -- Mortgage Insurance 
 -- Private Property Mortgage Insurance 
 -- Commercial Property Mortgage Insurance 
 -- Loan Insurance 
 -- Motor Vehicle Insurance 
 -- Travel Insurance
{% enddocs %}

{% docs tbl_SA_PRD_INVSTM_PRD_TY_ID %}
Investment Product Type Id: The unique identifier of the Investment Product Type. 
Investment Product Type defines the valid set of Investment Products. 
 
Domain:
 Financial Instrument Investment Product - Financial Instrument Investment Product is an Investment Product which uses a Financial Market Instrument as the investment vehicle. 
 Property Investment Product - Property Investment Product is an Investment Product in which the investment vehicle is a Resource Item with a geographical location e.g. buildings, land, real estate.
{% enddocs %}

{% docs tbl_SA_PRD_INVSTM_PRD_USE_ID %}
Investment Product Use Id: The unique identifier of the Investment Product Use. 
Investment Product Use distinguishes between Investment Products based on how the investment funds are intended to be employed, where such intended use will influence the management of the investment. 
 
Domain:
 General Investment 
 Retirement 
 Estate 
 Educational
{% enddocs %}

{% docs tbl_SA_PRD_INVSTM_OBJ_TY_ID %}
Investment Objective Type Id: The unique identifier of the Investment Objective Type. 
Investment Objective Type distinguishes between Investment Products and/or Investment Arrangements based on the primary goal that the Product / Arrangement is intended to satisfy. The objectives of the investment may change over time, depending on the intended use of the funds; for example, funds that are to be used for retirement may at first have an objective of capital appreciation, but as retirement approaches the investment objective may change to safety or liquidity. 
 
Domain:
 Liquidity 
 Tax Shelter 
 Safety 
 Capital Appreciation 
 Income Generating
{% enddocs %}

{% docs tbl_SA_PRD_INVSTM_OWNRSH_TY_ID %}
Investment Ownership Type Id: The unique identifier of the Investment Ownership Type. 
Investment Ownership Type distinguishes between Investment Products and/or Investment Arrangements based on the degree of ownership of the underlying investment fund. 
 
Domain:
 Single Investor Fund 
 Pool Fund
{% enddocs %}

{% docs tbl_SA_PRD_SRVC_TY_ID %}
Service Type Id: The unique identifier of the Service Type 
Services offered to Customers in respect of Financial Market activity, such as Trading, Settlement, Safe Custody, Portfolio Management etc. 
 
Domain:
 
 Card Service 
 Change Service 
 Custodial Service 
 Estate Management Service 
 Finance Service 
 Financial Engineering Service 
 Information Service 
 Investment Service 
 Product Access Service 
 Retirement Planning Service 
 Securitization Service 
 Settlement Service 
 Social Media Service 
 Support Service 
 -- Advisory Support Service 
 -- Maintenance Service 
 -- Processing Service 
 ---- Card Payment Processing Service 
 -- Debt Collection Service 
 Trading Service 
 Transfer Service 
 -- Payment Collection Service 
 -- Payment Service 
 -- Account Transfer Service 
 -- Merchant Service 
 -- Direct Entry 
 Travel Service
{% enddocs %}

{% docs tbl_SA_PRD_OUTSRC_SRVC_FLG %}
Outsourced Service Flag: A flag to determine whether or not the service provided is outsourced (Flag='Y') or not.
{% enddocs %}

{% docs tbl_SA_PRD_CARD_SRVC_TY_ID %}
Card Service Type Id: The unique identifier of the Card Service Type 
Card Service Type distinguishes between Card Services according to the type of card being used in financial transactions. 
 
*Domain* 
 
 Debit Card Service 
 Credit Card Service 
 Prepaid Card Service 
 Stored Value Card Service 
 Charge Card Service 
 Multicard Service
{% enddocs %}

{% docs tbl_SA_PRD_PMT_CUT_OFF_TM %}
Payment Cut-Off Time: Payment Cut-Off Time is a specified time after which any electronic payment will be debited from or credited to an account on the following working day. Payment Cut-Off Time is of particular importance when there is a Payment Due Date, after which late payment penalties are likely to occur. For example, in the United States, Payment Cut-Off Date for Credit Card payments is 5 pm; the Payment Due Date can be specified in several ways, e.g. Post Payment 21st of March, Pay At Bank, 22nd of March and Payment Due (for electronic transfers) 25th of March. These dates are specified on the Credit Card bill and are adjusted for non-working days.
{% enddocs %}

{% docs tbl_SA_PRD_FMIMT_TY_ID %}
Financial Market Instrument Type Id: The unique identifier of the Financial Market Instrument Type. 
Financial Market Instrument Type defines the valid set of Financial Market Instruments. 
 
Domain:
 Currency Instrument 
 Commodity Instrument 
 Deposit Instrument 
 Market Base Instrument 
 Security Instrument 
 
 
Design Note: As all the Financial Market Subtypes are rolled up, a summary of all subtype domains are given here. 
 
Financial Market Instrument domains: 
 Currency Instrument 
 Foreign Exchange Spot Instrument 
 Foreign Exchange Forward Instrument 
 Commodity Instrument 
 Agricultural Commodity 
 Fine Art Commodity 
 Mineral Commodity 
 Deposit Instrument 
 Demand Deposit 
 Fixed Term Deposit 
 Special Deposit 
 Market Base Instrument 
 Base Rate Instrument 
 Commercial Paper Rate 
 Economic Rate Instrument 
 Eurodollar Time Deposit Rate 
 Federal Fund Rate 
 Interbank Mean Rate IMEAN 
 Interbank Offering Rate 
 Prime Rate 
 Secondary Market Rate 
 Security Instrument 
 Composite Instrument 
 Exchange Traded Fund Instrument 
 Financial Index Instrument 
 Mutual Fund Instrument 
 Unit Instrument 
 Contract Instrument 
 Commodity Receipt 
 Depository Receipt 
 American Depository Receipt 
 International Depository Receipt 
 Global Depository Receipt 
 Derivative Instrument 
 Futures Derivative 
 Commodity Future Derivative 
 Financial Future Derivative 
 Equity Future Derivative 
 Swap Derivative 
 Interest Rate Swap 
 Currency Swap 
 Cross Currency Interest Rate Swap 
 Equity Swap Derivative 
 Foreign Exchange Swap 
 Contract For Differences 
 Option Derivative 
 Cap Option 
 Collars Option 
 Floor Option 
 Bond Option 
 Commodity Option 
 Currency Option 
 Energy Option 
 Equity option 
 Forward Rate Agreement Option 
 Futures Option 
 Bond Futures Option 
 Interest Rate Futures Option 
 Equity Futures Option 
 Index Option 
 Equity Index Option 
 Weather Index Option 
 Swap Option 
 Exotic Option 
 Barrier Derivative 
 Basket Derivative 
 Chooser Derivative 
 Cliquets Derivative 
 Compound Derivative 
 Digital Derivative 
 Double Barrier Derivative 
 Forward Start Derivative 
 Ladder Derivative 
 Lookback Derivative 
 Rainbow Derivative 
 Shout Derivative 
 Spread Derivative 
 Asian Option 
 Interest Rate Derivative 
 Forward Derivative 
 Forward Rate Agreement Derivative 
 Credit Derivative Instrument 
 Credit Default Swap 
 Total Return Swap 
 Quanto Equity Total Return Swap 
 Compo Equity Total Return Swap 
 Basket Default Swap 
 Equity Default Swap 
 Credit Linked Note 
 Warrant Derivative 
 Hybrid Derivative 
 Rights Issue Derivative 
 Coupon Instrument 
 Insurance Policy Contract 
 Power Contract 
 Debt Instrument 
 Promissory Note Instrument 
 Agency Note 
 Corporate Note 
 Treasury Note 
 Bank Note 
 Deposit Note 
 Commercial Paper 
 Bankers Acceptance 
 Bond Instrument 
 Treasury Bond 
 Agency Bond 
 Municipal Bond 
 Corporate Bond 
 Eurobond 
 Bill Instrument 
 Treasury Bill 
 Agency Bill 
 Commercial Bill 
 Bank Bill Of Exchange 
 Trade Bill Of Exchange 
 Accommodation Bill Of Exchange 
 Strip Instrument 
 Repurchase Agreement Instrument 
 Bank Guarantee Instrument 
 Securitized Finance Instrument 
 Asset Backed Security 
 Collateralized Debt Obligation 
 Collateralized Mortgage Obligation 
 Mortgage Backed Security 
 Equity Instrument 
 Common Equity Instrument 
 Preferred Equity Instrument
{% enddocs %}

{% docs tbl_SA_PRD_ISSR_ID %}
Issuer Id: The unique identifier assigned to the Involved Party who is the issuer of the Financial Market Instrument.
{% enddocs %}

{% docs tbl_SA_PRD_PRIV_TO_PUB_TRD_IND %}
Private / Public Traded Indicator: Indicates whether the Financial Market Instrument is traded publicly or privately. 
 
Domain:
 V - Privately Traded 
 B - Publicly Traded
{% enddocs %}

{% docs tbl_SA_PRD_ISS_DT %}
Issue Date: The date upon which the Financial Instrument was issued.
{% enddocs %}


{% docs tbl_SA_RI_ELTRN_ADDR %}
SA Resource Item Electronic Address: For the purposes of SA Banking, at this time, we are interested in this relationship to know the Electronic Address of the Website or Telephone, particularly mobile phone. 
Resource Item Electronic Address is an entity relating a specific Resource Item to an Electronic Address. 
Electronic Address can be a Telephonic Address, E-Mail Address, Web Address, Electronic Address Domain, or Internet Protocol Address (IP Address)
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_RI_ID %}
Resource Item Id: The unique identifier of Resource Item that is owned, managed, used by, or of specific interest to the Financial Institution.
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_RI_TO_ELTRN_ADDR_RL_TY_ID %}
Resource Item / Electronic Address Rltnp Type Id: The unique identifier of the Resource Item / Location Rltnp Type. 
Resource Item / Location Relationship Type classifies the Resource Item / Location Relationship according to the nature of the association, for example Resource Item Is Located at Location. 
 
Domain:
 Resource Item applies to Location 
 Resource Item is domiciled at Location 
 Resource Item identifies Location 
 Resource Item is located at Location 
 Resource Item is manufactured at Location 
 Resource Item provides access to Location
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_EFFV_DT %}
Effective Date: The date from which an instance of the entity is valid.
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_RNK %}
Rank: A number uniquely identifying a specific instance of the given Relationship Type on the given Effective Date between the same subject and object of the associative relationship.
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_END_DT %}
End Date: The Calendar date after which an instance of the entity is no longer valid.
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_RI_SRC_SYS_UNQ_KEY_TXT %}
Resource Item Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_RI_SRC_SYS_CD %}
Resource Item Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_ELTRN_ADDR_TY_ID %}
Electronic Address Type Id: The unique identifier of the Electronic Address Type. 
Electronic Address Type distinguishes between Electronic Addresses according to the nature and application of the Electronic Address. 
 
Domain:
 Telephonic Address 
 E-Mail Address 
 Web Address 
 Electronic Address Domain 
 Internet Protocol Address (IP Address)
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_TLPHNC_DVC_TY_ID %}
Telephonic Device Type Id: The unique identifier of the Telephonic Device Type .
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_GRNULE %}
Granularity: A code to identify the level of the Telephonic Address e.g. 
CY (Country) 
CA (Country + Code) 
N (Country + Code + Number) 
E (Country + Code + Number + Extension) 
U (Unspecified format - content in Full Telephone Number)
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_CNTRY_PH_CD %}
Country Telephone Code: The portion of a telephonic number that identifies a country; for example; the country code for Ireland is 353. Used for International Direct Dialing.
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_PH_CD %}
Telephone Code: The portion of a telephonic number that identifies a region or service within a country e.g. a Geographic Area or a mobile service operator; for example, the Area Telephone Code for New York City is 212.
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_LCL_NBR %}
Local Number: An address component that represents the portion of the telephonic number that identifies each local individual connection to the 
telephone network.
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_EXTNSN %}
Extension: The unique identifier of the Extension number.
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_FL_PH_NBR %}
Full Telephone Number: Holds the concatenation of one or more of the other number fields.
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_EMAIL_USR_ID %}
E-Mail User Id: The User Id of the Individual for E-mail purposes. Their E-mail address.
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_MAXM_MSG_SZ %}
Maximum Message Size: The maximum size (in bytes) of an e-mail accepted by the E-Mail Address. The size includes the body, all headers and attachments.
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_ATTAC_ALWD_FLG %}
Attachments Allowed Flag: Flag indicating whether the e-mail address accepts attachments. 
 
0 - No 
1 - Yes
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_TXT_ONLY_FLG %}
Text Only Flag: Flag indicating whether the e-mail address accepts text only e-mails (otherwise it could accept HTML or other embedded objects). 
 
0 - No (HTML/other objects allowed) 
1 - Yes (text only allowed)
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_ELTRN_ADDR_DM_ID %}
Electronic Address Domain Id: The unique identifier of the Electronic Address Domain. 
 
Electronic Address Domain provides a segmentation of e-mail addresses into the common parts of the address which represents a service or network provider. For example in the address 'j_doe@webaddress.com' the Electronic Address Domain is 'webaddress.com'.
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_WEB_ADDR_TY_ID %}
Web Address Type Id: The unique identifier of the Web Address Type. 
Web Address Type distinguishes between Web Addresses according to the type of the Address. 
 
Domain:
 Personal Web Address 
 E-Commerce Web Address
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_WEB_ADDR_PRTCL_TY_ID %}
Web Address Protocol Type Id: The unique identifier of the Web Address Protocol Type. 
Indicates the network protocol determined by the protocol portion of the Web Address. 
 
Domain:
 Hypertext Transfer Protocol (HTTP) 
 File Transfer Protocol (FTP)
{% enddocs %}

{% docs tbl_SA_RI_ELTRN_ADDR_URL %}
Universal Resource Locator: A string in Universal Resource Locator format, containing the Web Address.
{% enddocs %}


{% docs tbl_SA_RI_PSTL_ADDR %}
SA Resource Item Postal Address: For the purposes of SA Banking, at this time, we are interested in this relationship to know the Postal Address of the Terminal or ATM 
 
This entity combines the Associative entity and the corresponding entity attributes. 
 
Resource Item / Location Relationship identifies all of the instances of relationships between a Resource Item and a Location. A Resource Item may be associated with a Location for many different reasons e.g. a Resource Item is located at a Location, a Resource Item provides access to a Location, etc.
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_RI_ID %}
Resource Item Id: The unique identifier of Resource Item that is owned, managed, used by, or of specific interest to the Financial Institution.
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_RI_TO_PSTL_ADDR_RL_TY_ID %}
Resource Item / Postal Address Rltnp Type Id: The unique identifier of the Resource Item / Location Rltnp Type. 
Resource Item / Location Relationship Type classifies the Resource Item / Location Relationship according to the nature of the association, for example Resource Item Is Located at Location. 
 
Domain:
 Resource Item applies to Location 
 Resource Item is domiciled at Location 
 Resource Item identifies Location 
 Resource Item is located at Location 
 Resource Item is manufactured at Location 
 Resource Item provides access to Location
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_EFFV_DT %}
Effective Date: The date from which an instance of the entity is valid.
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_RNK %}
Rank: A number uniquely identifying a specific instance of the given Relationship Type on the given Effective Date between the same subject and object of the associative relationship.
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_END_DT %}
End Date: The Calendar date after which an instance of the entity is no longer valid.
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_RI_SRC_SYS_UNQ_KEY_TXT %}
Resource Item Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_RI_SRC_SYS_CD %}
Resource Item Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_ADDR_NM %}
Address Name: The name of a building or organization which appears in an address e.g. Rose Cottage, Bramble Way or General Post Office, Dublin 2
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_UNT_NBR %}
Unit Number: An address component that represents the numeric portion or alphanumeric label that identifies a unit within a building, for example, 14, as in Apartment 14, 15 Bath Road.
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_BLDG_NBR %}
Building Number: An address component that represents the numeric portion or alphanumeric label that identifies a building on a street, for example, 2 , as in 2 Main Street, 14B, as in 14B Oxford Street.
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_STE_NBR %}
Street Number: An address component that represents the numeric value assigned to the street, for example, 5 as in 5th Avenue.
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_STE_NM %}
Street Name: The label assigned to a street. 
 
May include concatenations of components such as, Street Number (5 as in 5th Avenue), Name (Main as in Main Street), Street Type (Avenue, Drive, Court, Lane), Direction (North as in North High Street), and Suffix (Lower as in 14 Baggot St. Lower).
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_STE_TY %}
Street Type: An address component that represents the type of street, for example, Avenue, Drive, Court, Lane.
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_STE_DRCTN %}
Street Direction: An address component that represents one or more compass points that are used to distinguish an address, for example, High Street SE or High Street NW.
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_STE_SFX %}
Street Suffix: An address component that represents the suffix assigned to the street: for example, Lower as in 14 Baggot St. Lr.
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_PSTCD_AREA_ID %}
Postcode Area Id: The unique identifier of the Postcode Area.
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_DSTRCT %}
District: Free-form text indicating the area (district, suburb, townland, etc.) in which the Postal Address is located.
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_CITY_ID %}
City Id: The unique identifier of the City.
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_ST_ID %}
State Id: The unique identifier of the State.
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_CNTY_ID %}
County Id: The unique identifier of the County.
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_CNTRY_ID %}
Country Id: The unique identifier of the Country.
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_RT_ID %}
Route Id: The unique identifier of the Route.
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_CENSUS_AREA_ID %}
Census Area Id: The unique identifier of the Census Area.
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_BLDG_TY_ID %}
Building Type Id: The unique identifier of the Building Type located at the Postal Address.
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_LONGD %}
Longitude: The Longitude (in degrees, in decimal form) of the Postal Address. Values can range from -180 (west) to 180 (east).
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_LATD %}
Latitude: The Latitude (in degrees, in decimal form) of the Postal Address. Values can range from -90 (south) to 90 (north).
{% enddocs %}

{% docs tbl_SA_RI_PSTL_ADDR_PSTL_BARCDE %}
Postal Barcode: A multi-digit code used by postal companies to encode components of the address. 
this is not the same as the Post code Area or Zip code...
{% enddocs %}


{% docs tbl_SA_RI_TO_SA_GRP_RL %}
SA Resource Item / SA Group Rltnp: July 19 2019 the Group ID in this entity is populated by either the SA Group.Group ID or the SA Channel.Channel ID 
 
Resource Item / Group Relationship identifies the relationships Resource Items have in respect to Groups. 
 
A given Resource Item may simultaneously belong to more than one Group. The set of Groups associated with a Resource Item may change over time. 
Resource Item / Group Relation allows storage of these multiple and historical associations. 
 
Resource Item / Channel Relationship identifies the relationships between Channels and Resource Items. For example, the ATM Channel may be delivered on a set of individual Electronic Delivery Devices.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_GRP_RL_GRP_ID %}
Group Id: The unique identifier of the Group or Channel.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_GRP_RL_RI_TO_GRP_RL_TY_ID %}
Resource Item / Group Rltnp Type Id: The unique identifier of the Resource Item / Group Rltnp Type. 
 
Resource Item / Group Relationship Type classifies possible relationships between Resource Items and Groups. 
 
Domain:
 Group Is Topic Of Resource Item 
 Group Uses Resource Item 
 CL Underlies RI
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_GRP_RL_EFFV_DT %}
Effective Date: The date from which an instance of the entity is valid.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_GRP_RL_RI_ID %}
Resource Item Id: The unique identifier of Resource Item that is owned, managed, used by, or of specific interest to the Financial Institution.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_GRP_RL_END_DT %}
End Date: The Calendar date after which an instance of the entity is no longer valid.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_GRP_RL_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_GRP_RL_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_GRP_RL_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_GRP_RL_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_GRP_RL_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_GRP_RL_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_GRP_RL_RI_SRC_SYS_CD %}
Resource Item Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_GRP_RL_RI_SRC_SYS_UNQ_KEY_TXT %}
Resource Item Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_GRP_RL_GRP_IP_SRC_SYS_CD %}
Group Involved Party Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_GRP_RL_GRP_IP_SRC_SYS_UNQ_KEY_TXT %}
Group Involved Party Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}


{% docs tbl_SA_RI_TO_SA_IP_RL %}
SA Resource Item / SA Involved Party Rltnp: Resource Item / Involved Party Relationship identifies relationships between Resource Items and Involved Parties, for example; Involved Party #2342 (John Smith) appraises Resource Item #5274 (an antique chair) for its value. or Involved Party #2342 (John Smith) manages the Resource Item #1234 (Webpage for Bank) to keep it current.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_IP_RL_RI_ID %}
Resource Item Id: The unique identifier of Resource Item that is owned, managed, used by, or of specific interest to the Financial Institution.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_IP_RL_IP_ID %}
Involved Party Id: The unique identifier assigned to an Involved Party.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_IP_RL_RI_TO_IP_RL_TY_ID %}
Resource Item / Involved Party Rltnp Type Id: The unique identifier of the Resource Item / Involved Party Relationship Type. 
Resource Item / Involved Party Relation Type classifies the Resource Item / Involved Party Relationship according to the nature of the association, for example Involved Party owns Resource Item, Involved Party acts as custodian of Resource Item, Involved Party creates Resource Item.. 
 
Domain: 
 IP Acts As Custodian Of RI 
 IP Acts As Registering Body RI 
 IP Acts As Stakeholder For RI 
 IP Appraises RI 
 IP Authorizes RI 
 IP Borrows RI 
 IP Creates RI 
 IP Holds RI 
 IP Issues RI 
 IP Leases RI 
 IP Maintains RI 
 IP Manages RI 
 IP Notarizes RI 
 IP Owns RI 
 IP Publishes RI 
 IP Receives RI 
 IP Rents RI 
 IP Reviews RI 
 IP Signs RI 
 IP Sponsors RI 
 IP is Manufacturer Of RI 
 IP Is Holder Of Card RI 
 RI Is Non Owner Occupied By IP 
 RI Is Owner Occupied By IP 
 RI Is Partially Owner Occupied By IP 
 RI Is Second Home Of IP 
 RI Valuation Provided By IP
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_IP_RL_EFFV_DT %}
Effective Date: The date from which an instance of the entity is valid.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_IP_RL_END_DT %}
End Date: The Calendar date after which an instance of the entity is no longer valid.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_IP_RL_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_IP_RL_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_IP_RL_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_IP_RL_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_IP_RL_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_IP_RL_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_IP_RL_RI_SRC_SYS_UNQ_KEY_TXT %}
Resource Item Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_IP_RL_RI_SRC_SYS_CD %}
Resource Item Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_IP_RL_IP_SRC_SYS_UNQ_KEY_TXT %}
Involved Party Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_IP_RL_IP_SRC_SYS_CD %}
Involved Party Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_IP_RL_PCT_AMT %}
Percent Amount: Where the Resource Item / Involved Party Relationship permits of degree, this attribute is used to record that degree in percentage terms (e.g. John Wilson owns 75% of a specified property).
{% enddocs %}


{% docs tbl_SA_RI_TO_SA_RI_RL %}
SA Resource Item / SA Resource Item Rltnp: Resource Item / Resource Item Relationship identifies all of the instances of relationships between two Resource Items. The same two Resource Items may be related in several types of relationships; for example, Resource Item is support for Resource Item, Resource Item is reply to Resource Item, Resource Item identifies Resource Item, etc.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_RI_RL_SUBJT_RI_ID %}
Subject Resource Item Id: The unique identifier assigned to a Subject Resource Item.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_RI_RL_OBJ_RI_ID %}
Object Resource Item Id: The unique identifier assigned to an Object Resource Item.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_RI_RL_RI_TO_RI_RL_TY_ID %}
Resource Item / Resource Item Rltnp Type Id: The unique identifier of the Resource Item / Resource Item Relationship Type. 
Resource Item / Resource Item Relationship Type classifies the Resource Item / Resource Item Relationship according to the nature of the association, for example Resource Item Is Documented By Resource Item. 
 
Domain:
 RI Is Collateral Pool For RI 
 RI Is Documented By RI 
 RI Is Information About RI 
 RI Is Prerequisite Of RI 
 RI Is Substitute Of RI 
 RI Supports RI 
 RI Is Summary Of RI 
 RI Attaches To RI 
 RI Duplicates RI 
 RI Is Amendment To RI 
 RI Is Component Of RI 
 RI Is Continuation Of RI 
 RI Is Reply To RI 
 RI Is Used With RI 
 RI Is Multiple Choice Option For RI 
 RI Supersedes RI 
 RI Identifies RI 
 RI Valuation By Lender Method RI
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_RI_RL_EFFV_DT %}
Effective Date: The date from which an instance of the entity is valid.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_RI_RL_END_DT %}
End Date: The Calendar date after which an instance of the entity is no longer valid.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_RI_RL_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_RI_RL_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_RI_RL_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_RI_RL_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_RI_RL_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_RI_RL_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_RI_RL_SUBJT_RI_SRC_SYS_UNQ_KEY_TXT %}
Subject Resource Item Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_RI_RL_SUBJT_RI_SRC_SYS_CD %}
Subject Resource Item Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_RI_RL_OBJ_RI_SRC_SYS_UNQ_KEY_TXT %}
Object Resource Item Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_RI_TO_SA_RI_RL_OBJ_RI_SRC_SYS_CD %}
Object Resource Item Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}


{% docs tbl_SA_RI %}
SA Resource Item: Identifies an Asset that can be used as a resource. This includes Bank Assets and assets offered as Collateral. 
For SA Banking model, at this time, we are only interested in the Resource Items as they may be used as a Channel, for example an ATM, Web Page or Cell Phone. 
 
Non-Collateralizable Resource Item - subtype of Resource Item - identifies a Resource Item which is not capable of being pledged in order to secure a loan - cannot be used in place of an obligation; for example a web page or economic report. 
Documentation Item - subtype of Non-Collateralizable Resource Item - identifies a Resource Item that denotes a representation of information in a specified medium. A Documentation Item may be a discrete item such as an application form or check. It may have a more complex internal structure, such as a document with chapters. A Documentation Item is concerned with the management of the item rather than its content; for example, a promotional pamphlet, a check. 
A Web Page - subtype of Documntation Item - identifies a block of data available on the Internet through a World Wide Web browser. Commonly, a Web Page is a file, stored on a Website, written in the Hypertext Markup Language (HTML), but can be in any format that the browser can display. A HTML web page will commonly reference images which appear as part of the page when displayed by the browser, and hypertext links referring to other Web Pages and Internet resources. 
A Web Page is accessed through a Web Address containing its Universal Resource Locator (URL). 
The above are the only Non-Collateralizable Resource Item subtypes and types we are interested in, at this time, for the SA Banking model 
 
Below are the only Collateralizable Resource Item subtypes and types we are interested in, at this time, for the SA Banking model 
Collateralizable Resource - subtype of Resource Item - Item identifies a Resource Item which is capable of being pledged in order to secure a loan - can be used in place of an obligation; for example a real property or a purchased asset. 
Chattel identifies Resource Items that are anything owned and tangible, other than real estate. A Chattel is usually movable and would include animals as well as goods. Commonly, Chattel - subtype of Collateralizable Resource - they are recorded in the data warehouse because they are being used as collateral or are insured items. 
Electronic Delivery Device - subtype of Chattel - is a Resource Item which identifies an item that enables the delivery of goods and services by the electronic transmission of data, voice, or image; for example, Automated Teller Machine #400, Personal Computer #31 or Telephone #T555. 
Website - subtype of Electronic Delivery Device - A Website is any computer connected to the Internet running a World-Wide Web Server process. A specific Website can be identified by the hostname part of the Universal Resource Locator. 
The Website allows access to an inter-connected set of Web Pages, usually primarily accessed through an introductory or index page (Home Page). Alternatively, each user with an account at the site may have an individual home page. 
A Terminal - subtype of electronic Delivery Device - is an Electronic Delivery Device, usually equipped with a video display and a keypad or keyboard, through which transactions and other data can be entered and/or displayed. For example, a counter terminal used by a teller to check balances and carry out transactions; an Automated Teller Machine located in the outside wall of the High Street Branch. 
Telephonic Device - subtype of electronic Delivery Device - A communications device which allows the broadcast and receipt of information.
{% enddocs %}

{% docs tbl_SA_RI_RI_ID %}
Resource Item Id: The unique identifier of Resource Item that is owned, managed, used by, or of specific interest to the Financial Institution.
{% enddocs %}

{% docs tbl_SA_RI_SRC_SYS_CD %}
Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}

{% docs tbl_SA_RI_SRC_SYS_UNQ_KEY_TXT %}
Source System Unique Key Text: The unique identifier of the entity in the source system.
{% enddocs %}

{% docs tbl_SA_RI_EFFV_TS %}
Effective Timestamp: The Timestamp that reflects the Start or Effective date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_RI_END_TS %}
End Timestamp: The Timestamp that reflects the Stop or End date and time of the row, populated by ETL
{% enddocs %}

{% docs tbl_SA_RI_TNNT_CD_ID %}
Tenant Code Identifier: This code represents an Identifier for each Tenant - this provides multiple user entities (or tenants) so each operates in isolation, while in fact using shared resources.
{% enddocs %}

{% docs tbl_SA_RI_BTCH_ID %}
Batch Identifier: Batch Identifier is what the batch assets use to time persist data loads - need to partition by this field
{% enddocs %}

{% docs tbl_SA_RI_RI_TY_ID %}
Resource Item Type Id: The unique identifier of the Resource Item Type. 
Resource Item Type classifies Resource Items according to whether or not the Resource Item is capable of being pledged in order to secure a loan (can be used in place of an obligation; for example a real property or a purchased asset). 
 
Domain:
 Collateralizable Resource Item 
 Non Collateralizable Resource Item
{% enddocs %}

{% docs tbl_SA_RI_EFFV_DT %}
Effective Date: The date on which the Resource Item first became relevant to the Financial Institution.
{% enddocs %}

{% docs tbl_SA_RI_END_DT %}
End Date: The date on which the Resource Item ceased to be relevant to the Financial Institution.
{% enddocs %}

{% docs tbl_SA_RI_RI_LC_STS_DT %}
Resource Item Life Cycle Status Date: The date on which the current Resource Item Life Cycle Status Type was assigned to the Resource Item.
{% enddocs %}

{% docs tbl_SA_RI_RI_LC_STS_TY_ID %}
Resource Item Life Cycle Status Type Id: The unique identifier of the Resource Item Life Cycle Status Type. 
Resource Item Life Cycle Status Type distinguishes between Resource Items according to their current stage in the resource acquisition and usage life cycle. 
 
Domain:
 Active Resource Item 
 Approved Resource Item 
 Delivered Resource Item 
 Destroyed Resource Item 
 Expired Resource Item 
 Fully Accessible Resource Item 
 Issued Resource Item 
 Missing Resource Item 
 Obsolete Resource Item 
 On Order Resource Item 
 On Trial Resource Item 
 Received Resource Item 
 Rejected Resource Item 
 Requested Resource Item 
 Suspended Resource Item 
 Terminated Resource Item 
 Under Development Resource Item
{% enddocs %}

{% docs tbl_SA_RI_OWNR_ID %}
Owner Id: The unique identifier assigned to the Involved Party that is the legal owner of the Resource Item.
{% enddocs %}

{% docs tbl_SA_RI_OWNR_DT %}
Owner Date: The date on which the current legal owner was assigned ownership of the Resource Item.
{% enddocs %}

{% docs tbl_SA_RI_HLDR_ID %}
Holder Id: The unique identifier assigned to the Involved Party that is in physical possession of the Resource Item.
{% enddocs %}

{% docs tbl_SA_RI_HLDR_DT %}
Holder Date: The date on which the current holder took possession of the Resource Item.
{% enddocs %}

{% docs tbl_SA_RI_RI_SIGNF_ID %}
Resource Item Significance Id: The unique identifier of the Resource Item Significance. 
Resource Item Significance distinguishes between Resource Items according to the reason why the item is of interest to the Financial Institution, based on its ownership status. 
 
*Domain* 
 
 Custodial 
 Leased 
 Owned 
 Consortium 
 External Party 
 Financial Institution 
 Created 
 Donated 
 Purchased 
 Repossessed 
 Pledged
{% enddocs %}

{% docs tbl_SA_RI_RI_NM %}
Resource Item Name: The primary name assigned to the Resource Item. This name is used in reports and documents referring to the Resource Item.
{% enddocs %}

{% docs tbl_SA_RI_DESC %}
Description: Provides a textual explanation or free form comments about a Resource Item.
{% enddocs %}

{% docs tbl_SA_RI_NON_CLTZL_RI_TY_ID %}
Non Collateralizable Resource Item Type Id: The unique identifier of the Non Collateralizable Resource Item Classification. 
Non Collateralizable Resource Item Type classifies Non Collateralizable Resource Items according to the nature of the Resource Item. 
Domain:
 Documentation Item 
 Reported Information 
 Access Token 
 Scheduler 
 Inventory Control Unit
{% enddocs %}

{% docs tbl_SA_RI_DOC_ITM_TY_ID %}
Documentation Item Type Id: The unique identifier of the Documentation Item Type . 
Documentation Item Type distinguishes between Documentation Items according to the nature of the document of interest. 
 
Domain:
 Contract 
 Customer Arrangement Agreement 
 Employment Contract 
 Supplier Contract 
 Security Arrangement Document 
 Financial Document 
 Question Document 
 Answer Document 
 Legal Document 
 Web Page 
 Credit Report Document 
 Insurance Policy Document 
 Affiliation Document 
 Business Analysis Document 
 Communication Script 
 Call Audio 
 Communication Script Decision Point 
 Collateral Document 
 Correspondence 
 Digital Certificate 
 Establishment Document 
 Form Document 
 Government Registration Document 
 Mandate Document 
 Ownership Document 
 Power Of Attorney 
 Publication 
 Real Property Plan Document 
 Signature Specimen 
 Software 
 Status Document 
 Statutory Declaration 
 Testamentary Document 
 Text Block 
 Transport Document 
 Value Ticket 
 Withholding Certificate
{% enddocs %}

{% docs tbl_SA_RI_LANG_ID %}
Language Id: The unique identifier of the Language in which the Documentation Item is written.
{% enddocs %}

{% docs tbl_SA_RI_WEB_ADDR_ID %}
Web Address Id: The unique identifier of the Web Address identifying the Web Page.
{% enddocs %}

{% docs tbl_SA_RI_WEBSITE_ID %}
Website Id: The unique identifier of the Website hosting the Web Page.
{% enddocs %}

{% docs tbl_SA_RI_WEBSITE_HME_PG_FLG %}
Website Home Page Flag: A flag indicating whether (1) or not (0) the Web Page is the designated main access page of the hosting Website.
{% enddocs %}

{% docs tbl_SA_RI_USR_HME_PG_FLG %}
User Home Page Flag: A flag indicating whether (1) or not (0) the Web Page is the designated main access page of the hosting Website.
{% enddocs %}

{% docs tbl_SA_RI_WEB_PG_FNT_SZ_VAL %}
Web Page Font Size Value: A value indicating the Web Page font size which is important for Accessibility/Disability reasons.
{% enddocs %}

{% docs tbl_SA_RI_CLTZL_RI_TY_ID %}
Collateralizable Resource Item Type Id: The unique identifier of the Collateralizable Resource Item Classification. 
Collateralizable Resource Item Type classifies Collateralizable Resource Items according to the nature of the Resource Item. 
Domain:
 Chattel 
 Real Property 
 Financial Resource Item 
 Intellectual Property 
 Computer System Component
{% enddocs %}

{% docs tbl_SA_RI_CHTL_TY_ID %}
Chattel Type Id: The unique identifier of the Chattel Type. 
Chattel Type distinguishes between Chattels according to their nature or intended use. 
 
Domain:
 Collection 
 Commodity 
 Equipment 
 Audio Visual Equipment 
 Electronic Delivery Device 
 Environmental Control Unit 
 Industry Specific Equipment 
 Kitchen Equipment 
 Maintenance Equipment 
 Office Equipment 
 Radio Frequency Identification Equipment 
 Security Equipment 
 Utility Supply Equipment 
 Furniture And Fittings 
 Stationery And Supplies 
 Vehicle 
 Valuable Object 
 Fine Art
{% enddocs %}

{% docs tbl_SA_RI_ELCDD_TY_ID %}
Electronic Delivery Device Type Id: The unique identifier of the Electronic Delivery Device Type . 
Electronic Delivery Device Type distinguishes between Electronic Delivery Devices according to their nature. 
 
Domain:
 Website 
 Terminal 
 Telephonic Device 
 Personal Computer
{% enddocs %}

{% docs tbl_SA_RI_ELCDD_IDFN_CD %}
Electronic Delivery Device Identification Code: Added for SA Banking 
A device ID (device identification) is a distinctive number associated with a smartphone or similar handheld device. Device IDs are separate from hardware serial numbers
{% enddocs %}

{% docs tbl_SA_RI_HNM %}
Hostname: The label by which the Website can be identified within a Universal Resource Locator (URL).
{% enddocs %}

{% docs tbl_SA_RI_TRML_TY_ID %}
Terminal Type Id: The unique identifier of the Terminal Type. 
Terminal Type distinguishes between Terminals according to their nature. 
 
Domain:
 Teller Terminal 
 Automated Teller Machine ATM 
 Card Reader
{% enddocs %}

{% docs tbl_SA_RI_TRML_LO_TY_ID %}
Terminal Location Type Id: The unique identifier of the Terminal Location Type. 
Terminal Location Type distinguishes between Terminals according to the nature of the physical location in which the Terminal is located. 
 
Domain:
 On Counter 
 Lobby 
 TTW (Through The Wall) 
 Kiosk 
 Third Party Building
{% enddocs %}

{% docs tbl_SA_RI_ON_SITE_FLG %}
On Site Flag: Indicates whether (1) or not (0) the Terminal is physically located at the Branch to which it is assigned, or located elsewhere (off site).
{% enddocs %}

{% docs tbl_SA_RI_TLPHNC_DVC_TY_ID %}
Telephonic Device Type Id: The unique identifier of the Telephonic Device Type .
{% enddocs %}

{% docs tbl_SA_RI_DVC_MNFCTR %}
Device Manufacturer: The manufacturer name of the device.
{% enddocs %}

{% docs tbl_SA_RI_DVC_VERSION %}
Device Version: The version number of the device.
{% enddocs %}

{% docs tbl_SA_RI_DVC_MODL %}
Device Model: The model name of the device.
{% enddocs %}

{% docs tbl_SA_RI_OPER %}
Operator: The Operator provides the communication service under contract. In the case of mobile telephony, an Operator contract links the Mobile Customer, the Mobile Device (typically via the SIM Card) and the Operator together to provide a communications service.
{% enddocs %}


{% docs tbl_FNC_MKT_ORDR %}
Request to buy, sell, borrow, lend or swap an amount of a Financial Market Instrument at a given price.
Details of the order when fulfilled are found in the related Financial Market Transaction and its components.
{% enddocs %}

{% docs tbl_FNC_MKT_ORDR_FNC_MKT_ORDR_ID %}
The unique identifier of the Financial Market Order.
{% enddocs %}

{% docs tbl_FNC_MKT_ORDR_FNC_MKT_IMT_ID %}
The unique identifier of the Financial Market Instrument requested by this Order.
{% enddocs %}

{% docs tbl_FNC_MKT_ORDR_FNC_MKT_ORDR_TP_ID %}
The unique identifier of the Financial Market Order Type. e.g. Stop-Loss Order.
{% enddocs %}

{% docs tbl_FNC_MKT_ORDR_FNC_MKT_ORDR_TXN_TP_ID %}
The unique identifier of the Financial Market Order Transaction Type. e.g. Order to Buy or Sell.
{% enddocs %}

{% docs tbl_FNC_MKT_ORDR_UPR_PRC %}
The upper limit of the price per unit for a traded unit. Once the order is fulfilled, this price will lock in profit or stop loss, dependant upon the combination of order type and order indicator.
{% enddocs %}

{% docs tbl_FNC_MKT_ORDR_ORDR_PRC %}
The Price required for Order to be fulfilled.
This indicates to the trader that the Financial Market Instrument required must be traded at, or better than, the Order Price.
{% enddocs %}

{% docs tbl_FNC_MKT_ORDR_LWR_PRC %}
The lower limit of the price per unit for a traded unit. Once the order is fulfilled, this price will lock in profit or stop loss, dependant upon the combination of order type and order indicator.
{% enddocs %}

{% docs tbl_FNC_MKT_ORDR_ORDR_QTY %}
Quantity of the Financial Market Instrument required.
For example, 20 Oil Futures, 500 shares.
See also Order Value.
{% enddocs %}

{% docs tbl_FNC_MKT_ORDR_ORDR_VAL %}
Where an a mount of Currency is ordered, or where the total value of a Financial Market Instrument is ordered, the Order Value records this value.
For example, a customer orders 2,000 U.S. Dollars worth of share DEF or Euro denominated Eurobonds with face value of 200,000 Euros.
{% enddocs %}

{% docs tbl_FNC_MKT_ORDR_ORDR_END_DT %}
Indicates the close of business date, or date combined with Order End Time, by which the order must be fulfilled. If not fulfilled, the order will lapse.
{% enddocs %}

{% docs tbl_FNC_MKT_ORDR_ORDR_END_TM %}
The Order End Time defines the time by which the order should be filled.
{% enddocs %}

{% docs tbl_FNC_MKT_ORDR_CNCL_DT_TM %}
The Cancel Date time records the date and time when the order was cancelled.
{% enddocs %}

{% docs tbl_FNC_MKT_ORDR_DAY_ORDR_F %}
When 'Yes', the Day Order Flag indicates that the order should be filled by the end of the day of entry; the Order End Date defines the day.
{% enddocs %}

{% docs tbl_FNC_MKT_ORDR_FILL_OR_KILL_F %}
The Fill Or Kill Flag indicates that the Order was to be filled immediately or not at all. Optionally, the Order End Date is used to specify a time limit for the order.
{% enddocs %}

{% docs tbl_FNC_MKT_ORDR_CD_MET_F %}
Where the order is conditional, the Order Met Flag set to 'Yes' means that the conditions have been met.
{% enddocs %}

{% docs tbl_FNC_MKT_ORDR_ORDR_CCY_ID %}
The unique identifier of the Order Currency. This defines the Currency of the order, which may differ from the Currency in which the order is fulfilled, e.g. where a  customer specifies a local cost currency to buy equity in foreign markets.
{% enddocs %}


{% docs tbl_AC_AR %}
Account Arrangement is a  type of Product Arrangement.  Examples of Account Arrangements are : Deposit Arrangements, Loan Arrangements and Credit Card Arrangements.
{% enddocs %}

{% docs tbl_AC_AR_AC_AR_ID %}
The unique identifier of the Account Arrangement.
{% enddocs %}

{% docs tbl_AC_AR_AC_TP_ID %}
The unique identifier of Account Arrangement Type.
{% enddocs %}

{% docs tbl_AC_AR_BAL_AU_ID %}
The unique identifier of the Accounting Unit tracking the balance of the Account Arrangement.
{% enddocs %}

{% docs tbl_AC_AR_RSTRC_DSCL_TP_ID %}
The unique identifier of the Restrict Disclosure Type.
{% enddocs %}

{% docs tbl_AC_AR_LAST_STMT_DT %}
The Calendar Date on which the Customer Arrangement had its last Statement prepared.
{% enddocs %}

{% docs tbl_AC_AR_LAST_TXN_DT %}
The most recent date on which an Arrangement Transaction for the Arrangement occurred, whether initiated by the Customer or the Financial Institution.
{% enddocs %}

{% docs tbl_AC_AR_CRN_FIX_PRD_END_DT %}
The date on which the fixed interest period currently applying to the Arrangement will terminate.
{% enddocs %}

{% docs tbl_AC_AR_INT_ACG_F %}
Indicates whether the interest due on the Account Arrangement is being counted for revenue or not. For example, interest may not be being collected on an overdue loan.
{% enddocs %}

{% docs tbl_AC_AR_AC_NBR %}
The number of the Account as defined by the Financial Institution.
Note that this attribute is redundant since the same information is also available in Arrangement under 'Unique Id in Source System'. It is provided here for visibility and ease of use.
{% enddocs %}


{% docs tbl_AC_AR_INT_CLCN_EFF_DT %}
Date from which interest on the Arrangement was first started to be calculated (e.g. date of first disbursement, first date after introductory grace period).
{% enddocs %}

{% docs tbl_AC_AR_NXT_CMPD_INT_DT %}
The next date on which any compound interest applying to the Account will be applied.
{% enddocs %}

{% docs tbl_AC_AR_EXEC_POLCY_CCNT_F %}
Indicates that the owner of the Account Arrangement has consented to the execution policy specified for this account.
{% enddocs %}

{% docs tbl_AC_AR_NON_MKT_EXEC_CCNT_F %}
Indicates that the owner of the account has consented for execution of transactions outside of an exchange market.
{% enddocs %}

{% docs tbl_AC_AR_EXRNC_WRN_F %}
Indicates that the experience of the owner of the account is suspect in respect of the proposed account activity.
{% enddocs %}

{% docs tbl_AC_AR_AR_INAPT_F %}
Indicates that this arrangement has been reviewed and is considered inappropriate in its existing state.
{% enddocs %}

{% docs tbl_AC_AR_BEST_EXEC_POLCY_F %}
The Best Execution Flag indicates that a Best Execution policy is to be used for this account. The Best Execution Policy will vary from institution to institution, but, generally a policy on best execution is designed to ensure that customers get a good deal. Standards are set in relation to price and other aspects of an order to ensure that firms execute dealing instructions as well as they are able. This is an important consumer protection measure, particularly for customers who do not have access to the same information as market professionals and who therefore find it difficult to judge the quality of price that a firm has obtained.
{% enddocs %}

{% docs tbl_AC_AR_BEST_EXEC_DT %}
The date upon which the Best Execution Flag was set.
{% enddocs %}

{% docs tbl_AC_AR_AML_MOND_DT %}
The date upon which the account was monitored for Money Laundering as an Anti Money Laundering activity.
{% enddocs %}

{% docs tbl_AC_AR_XTRT_F %}
Flag indicating that for this account a statement is printed and sent to the counterparty.
{% enddocs %}

{% docs tbl_AC_AR_ITNL_BNKG_AC_NBR %}
The number of the Account as defined by international standard for identifying bank accounts in all countries under ISO 13616:1997,  ISO 13616-1:2007.[1] 
The official IBAN registrar under ISO 13616-2:2007 is SWIFT.
Also known as IBAN.
The IBAN was originally developed to facilitate payments within the European Union but the format is flexible enough to be applied globally. It consists of a ISO 3166-1 alpha-2 country code, followed by two check digits and up to thirty alphanumeric characters for the domestic bank account number (incorporating routing information), called the BBAN (Basic Bank Account Number). It is up to each country's national banking community to decide on the length of the BBAN for accounts in that country, but its length must be fixed for any given country.
{% enddocs %}


{% docs tbl_AC_AR_SCR_AR_ID %}
The unique identifier of the Security  Arrangement..
{% enddocs %}

{% docs tbl_AC_AR_IVSM_OWN_TP_ID %}
The unique identifier of the Investment Ownership Type of the Arrangement.
{% enddocs %}

{% docs tbl_AC_AR_IVSM_OBJV_TP_ID %}
The unique identifier of the Investment Objective Type.
{% enddocs %}

{% docs tbl_AC_AR_CPTL_PRJ_PYBK_NO_OF_YR %}
For capital investment projects (e.g. property development), identifies the number of years required before the investment is recovered by the future income stream. (This takes into consideration the net present value (NPV) of money).
{% enddocs %}

{% docs tbl_AC_AR_PRVT_X_PBLC_IVSM_IND %}
Indicates whether the Investment is private or public.
Domain:
  V - Private Investment
  B - Public Investment
{% enddocs %}

{% docs tbl_AC_AR_INR_RATE_OF_RET %}
A quantitative method of analyzing capital investment projects (e.g. software development, premises construction) based on calculating the rate of return that equates the value of the cash inflows with the amount of investment (i.e. determining the rate that makes the NPV equal zero.  This Internal Rate of Return is a discounted cash flow (DCF) rate of return that is used to compare alternate projects to determine the best capital investments.
{% enddocs %}

{% docs tbl_AC_AR_IVSM_HRZN_ID %}
The unique identifier of the Measurement Period for the investment horizon. The investment horizon is an expression of the time period, after which the investor requires their assets to be released from investment.
{% enddocs %}

{% docs tbl_AC_AR_FND_SHR_ISSU_TP_ID %}
The unique identifier of the Fund Share Issue Type.
{% enddocs %}

{% docs tbl_AC_AR_PRN_FND_IVSM_ID %}
Where the Investment Arrangement is a sub-fund, the unique identifier of the parent Fund Investment Arrangement.
{% enddocs %}

{% docs tbl_AC_AR_MTL_FND_F %}
Indicates whether or not the Fund is a Mutual Fund.
{% enddocs %}

{% docs tbl_AC_AR_MGN_FND_F %}
Indicates whether the Fund is explicitly managed, or is index linked (e.g. Tracker or Unit Linked Fund).
{% enddocs %}

{% docs tbl_AC_AR_IVSR_RSTN_F %}
When 'N', identifies a fund which has no restrictions on who may invest and when 'Y',
identifies a fund which is closed to new investors; only existing investor can buy new shares.
{% enddocs %}

{% docs tbl_AC_AR_RSK_CTY_ID %}
The unique identifier of the Country where risk is to be assessed.
{% enddocs %}

{% docs tbl_AC_AR_DAY_TRDG_F %}
Flag indicating that the owner of the trading account is using it for day trading, and may be subject to different margin requirements.
{% enddocs %}

{% docs tbl_AC_AR_SUTBL_VERF_BY_ID %}
The unique identifier assigned to an Employee who has verified the suitability of the account owner.
{% enddocs %}

{% docs tbl_AC_AR_SUTBL_VERF_DT %}
Date upon which the suitability of the account owner was verified in respect of the contracted account use.
{% enddocs %}

{% docs tbl_AC_AR_AC_APRV_BY_ID %}
The unique identifier assigned to an Employee who has approved the account for use.
{% enddocs %}

{% docs tbl_AC_AR_AC_APRV_DT %}
Date upon which the account was approved for use.
{% enddocs %}

{% docs tbl_AC_AR_AC_LNG_ID %}
The unique identifier assigned to the Language.
{% enddocs %}

{% docs tbl_AC_AR_CMM_ADR_TP_ID %}
The unique identifier of the Address Type to be used when communicating information about this account. An address of the appropriate type must be specified for communications regarding this account.
{% enddocs %}

{% docs tbl_AC_AR_TRDG_MAND_AHR_TP_ID %}
The unique identifier of the Mandate Authority Type which delegates responsibility, to some degree, for activities regarding the trading account.
{% enddocs %}

{% docs tbl_AC_AR_BNCH_PD_ID %}
The unique identifier of a Product acting as benchmark for this trading account.
{% enddocs %}

{% docs tbl_AC_AR_DFLT_IVSM_PD_ID %}
The unique identifier of a Product used as the default investment product whenever surplus funds are available.
{% enddocs %}

{% docs tbl_AC_AR_SRC_OF_INCM_TP_ID %}
The unique identifier of the Source Of Income Type, which specifies how trading against this account is funded.
{% enddocs %}

{% docs tbl_AC_AR_TRDG_ST_TP_ID %}
The unique identifier of the Trading Status Type
{% enddocs %}

{% docs tbl_AC_AR_INS_POLCY_DOC_ID %}
The unique identifier of the Insurance Policy defining the terms and conditions of the Insurance Arrangement.
{% enddocs %}

{% docs tbl_AC_AR_INS_TP_ID %}
The unique identifier of the Insurance Type.
{% enddocs %}

{% docs tbl_AC_AR_INS_HZD_TP_ID %}
The unique identifier of the Insurance Hazard Type.
{% enddocs %}

{% docs tbl_AC_AR_INS_PD_ID %}
The unique identifier of the Insurance Product.
{% enddocs %}

{% docs tbl_AC_AR_INS_AR_PAYER_TP_ID %}
The unique identifier of the Insurance Arrangement Payer Type.
{% enddocs %}

{% docs tbl_AC_AR_INS_PD_CMPT_NBR %}
The identifier of the Component within the Insurance Product. (If the Component represents the entire Product, then this value should be 0 (zero)).
{% enddocs %}


{% docs tbl_CC_AR %}
Credit Card Arrangement is a type of Finance Service Arrangement. An instance of a Credit Card being  supplied to a Customer.
{% enddocs %}

{% docs tbl_CC_AR_CC_AR_ID %}
The unique identifier of the Credit Card Arrangement.
{% enddocs %}

{% docs tbl_CC_AR_CC_TP_ID %}
The unique identifier of the Credit Card Type that applies to the Arrangement.
{% enddocs %}

{% docs tbl_CC_AR_EXPIRY_DT %}
The date on which the cards currently issued on the Account will no longer be valid.
{% enddocs %}

{% docs tbl_CC_AR_CHP_CARD_F %}
Indicates whether (1) or not (0) the physical card contains an electronic chip.
{% enddocs %}

{% docs tbl_CC_AR_SCD_AC_F %}
For certain card products, a second card (different account) can be offered. If the offer is taken up, this flag is set to 1 for the original card account. 0 otherwise.
{% enddocs %}

{% docs tbl_CC_AR_TFR_BAL_OTSND_F %}
Indicates whether (1) or not (0) there still remains an amount originating from a balance that was transferred from another Credit Card account.
{% enddocs %}

{% docs tbl_CC_AR_NBR_OF_ADL_CARDS %}
A count of how many Individuals hold cards on this Arrangement in addition to the principal card holder. For example, cards issued to a spouse or family members.
{% enddocs %}

{% docs tbl_CC_AR_PHOTO_F %}
Indicates whether the physical Credit Card contains a photograph of the holder or not.
{% enddocs %}

{% docs tbl_CC_AR_INTRDY_PRD_EXPIRY_DT %}
Identifies the final date on which promotional, introductory terms will cease. For example, a new Credit Card customer may transfer up to 2,000 GBP from another card with no interest payments for the first six months, with the Introductory Period Expiry Date determining the date, six months later, when the terms will cease, and interest will be charged on any remaining balance.
{% enddocs %}

{% docs tbl_CC_AR_AR_SRC_SYS_CD %}
Arrangement Source System Code: The unique identifier of the Source System for the entity. The application or system from which the information last used to update the entity instance was populated.
{% enddocs %}


{% docs tbl_TXN %}
Transaction identifies a Business Activity which represents the recording of all levels of business work that change the Financial Institution's financial position or information base; for example, the Transaction #456 'Funds Transfer' is the result of John Doe's 'Request' (Communication #342) for the Financial Institution to transfer $10,000 from his saving account (Arrangement #456123) to his checking account (Arrangement #654980), Transaction #321 is the result of Jane Doe's 'Request' (Communication Type #56342) to purchase 200 IBM shares on April 17, 1992, Transaction #18975 establishes the amount for Business Direction Item #26745 'planned total annual fee based revenue'.  Note in the last example that a Communication is not necessary for a Transaction to be initiated.

The Data Warehouse implementation of Transaction is typically oriented around two principles : 1. The need, from the Warehouse perspective, to be able to allocate the Transaction against one Organization Unit, Arrangement etc. to ensure there is no duplication of reporting; and 2. The expectation that a limited time period of Transactions will be stored (suggestion is for two months). Note that all Transactions, including currently stored and archived, may additionally be summarized in the various Summary entities.

There may be other criteria which will influence the structure of Transaction and its performance and storage characteristics in each individual Financial Institution.
{% enddocs %}

{% docs tbl_TXN_TXN_ID %}
The unique identifier applied to the Transaction. 
{% enddocs %}

{% docs tbl_TXN_TXN_TP_ID %}
The unique identifier of the Transaction Type.
{% enddocs %}

{% docs tbl_TXN_RQS_CNL_ID %}
The unique identifier of the Channel on which the Transaction was requested.
Note that if Request Communication Id is implemented, then this attribute is redundant with respect to Communication.Channel Id.
{% enddocs %}

{% docs tbl_TXN_SETL_CNL_ID %}
The unique identifier of the Channel used to settle the Transaction.
{% enddocs %}

{% docs tbl_TXN_TXN_CCY_ID %}
The unique identifier of the currency in which the transaction was initiated.
{% enddocs %}

{% docs tbl_TXN_CNVR_CCY_ID %}
The unique identifier of the currency into which the transaction is to be converted.
{% enddocs %}

{% docs tbl_TXN_EXG_RATE_TO_CNVR_CCY %}
The exchange rate used for translation from the transaction currency into the converted currency.
{% enddocs %}

{% docs tbl_TXN_MSR_PRD_ID %}
The unique identifier of the Measurement Period within which the Transaction took place. Usually the smallest applicable Measurement Period.
{% enddocs %}

{% docs tbl_TXN_TM_OF_DAY_TBND_ID %}
The unique identifier of the Time Of Day Time Band in which the Transaction occurs.
{% enddocs %}

{% docs tbl_TXN_EXCP_CAUS_ID %}
The unique identifier of the Exception Cause.
{% enddocs %}

{% docs tbl_TXN_EXCP_IMP_ID %}
The unique identifier of the Exception Impact.
{% enddocs %}

{% docs tbl_TXN_OU_ID %}
The unique identifier of the Organization Unit responsible for managing the transaction.
{% enddocs %}

{% docs tbl_TXN_PRIM_AR_ID %}
The unique identifier of the Arrangement that was primarily associated with the Transaction, where applicable. For example, the Account from which a withdrawal was made; the Credit Card Arrangement which will be debited with a purchase amount; the payroll Account from which the monthly payroll is paid.

The Arrangement / Transaction associative allows for multiple Arrangements to be linked to the same Transaction.
{% enddocs %}

{% docs tbl_TXN_RQS_CMM_ID %}
The unique identifier of the Communication that requested the Transaction to take place.
{% enddocs %}

{% docs tbl_TXN_NET_CASH_FLOW_AMT %}
The net cash inflow to, or outflow from, the primary Arrangement affected by the Transaction, resulting from the Transaction.  Note that there may be more than one cash flow involved in the Transaction. If the cash flows are all in the same direction, then this is the total of all the flows. If the flows are in opposing directions, then this is the net value of all the flows.
{% enddocs %}

{% docs tbl_TXN_TXN_TM %}
The time within the Transaction Date on which the Transaction actually occurred.
{% enddocs %}

{% docs tbl_TXN_TXN_DT %}
The date on which the Transaction actually occurred. In many cases, this will be the same as the Transaction Book Date but may differ, for example, where the Transaction takes place on a non-banking day.
For Financial Markets this is the date on which the Trading Transaction was executed i.e. the date on which the price was agreed.
{% enddocs %}

{% docs tbl_TXN_TXN_BOOK_DT %}
The Financial Institution 'Book' date on which the transaction is recorded. This is the date used to determine the Financial Period associated with the Transaction. The Book Date of a check deposit is the date on which the check is accepted.
{% enddocs %}

{% docs tbl_TXN_TXN_VAL_DT %}
The Date on which the Transaction is closed off as completed, from the perspective of the Financial Institution. For example, for check deposits, this will differ from the book date by the time it takes to clear the check; for Trades, this will be the settled date; etc.
For Financial Markets this is the date upon which delivery and payment are due to take place.
On more complex Financial Market Transactions, the Action Date on Financial Component Movement, where the Financial Market Component Movement Type is 'Settlement Amount', will define settlement dates of separate components requiring payment or delivery.
{% enddocs %}

{% docs tbl_TXN_DVC_ID %}
The identifier of the Device used to initiate the Transaction. For example, the ATM identifier, the Teller Position Identifier etc.
This attribute is deliberately redundant with respect to the Short Name of the Channel referenced by Request Channel Id.
{% enddocs %}

{% docs tbl_TXN_SSPCS_EV_GRP_ID %}
The unique identifier of the Suspicious Event Group.
{% enddocs %}

{% docs tbl_TXN_FEE_X_CMSN_AMT %}
The actual amount of the fee or commission.
{% enddocs %}


{% docs tbl_LOAN_AR %}
Loan Arrangement identifies an Arrangement in which the Financial Institution  puts its assets at risk for the benefit of a customer.
{% enddocs %}

{% docs tbl_LOAN_AR_LOAN_AR_ID %}
The unique identifier of the Loan Arrangement.
{% enddocs %}

{% docs tbl_LOAN_AR_EFF_INT_RATE_ID %}
The unique identifier of the Interest Rate.
{% enddocs %}

{% docs tbl_LOAN_AR_INT_RATE_EFF_DT %}
The date on which the current effective interest rate became applicable for the calculation of interest.
{% enddocs %}

{% docs tbl_LOAN_AR_LOAN_ANUL_PRPYMT_PCT_ID %}
The unique identifier of the Interest Rate.
The penalty rate to be applied to the Arrangement in the case of Pre-Payment of the Arrangement against the terms of the Arrangement. For example, a Mortgage Arrangement has a period of two years which specify a low, initial interest rate, after which the rate goes up. If the borrower pays more than the agreed amount during these two years, the borrower will be subject to a higher Pre-Payment Penalty Rate in respect of any excess pre-payment.
{% enddocs %}

{% docs tbl_LOAN_AR_LOAN_NEG_AMRZ_CAP_RATE_ID %}
The unique identifier of the Interest Rate.
The Loan Negative Amortization Cap Rate defines the maximum percentage of interest which the borrower is allowed to underpay. For example, the interest rate on a loan is 4%, with a Loan Negative Amortization Cap Rate of -3%; this means that the borrower need only pay 1% (4% - 3%), if they so choose; if the borrower only pays the permitted 1%, the remaining 3% interest due is added to the principal of the loan.
{% enddocs %}

{% docs tbl_LOAN_AR_PYMT_TOT_NBR %}
The total number of repayments that will be made over the term of the Loan.
{% enddocs %}

{% docs tbl_LOAN_AR_PYMT_RMAN_NBR %}
The number of repayments outstanding to the end of the Loan term.
{% enddocs %}

{% docs tbl_LOAN_AR_BLLN_PYMT_DUE_DT %}
The maturity date on which the final balance of the Loan Arrangement is due.
{% enddocs %}

{% docs tbl_LOAN_AR_DCN_LOAN_F %}
Indicates whether of not the Loan was issued as a Discount i.e. the interest owing has been pre-deducted from the face value of the Loan, but the entire face value is repayable.
{% enddocs %}

{% docs tbl_LOAN_AR_LOAN_TP_ID %}
The unique identifier of the Loan Type.
{% enddocs %}

{% docs tbl_LOAN_AR_LOAN_TO_VAL_RTO %}
Combined Loan To Value (ratio) (CLTV) is the proportion of loans (secured by a property) in relation to its value.
{% enddocs %}

{% docs tbl_LOAN_AR_CMB_LOAN_TO_VAL_RTO %}
Combined Loan To Value (ratio) (CLTV) is the proportion of loans (secured by a property) in relation to its value.
{% enddocs %}

{% docs tbl_LOAN_AR_FRST_PYMT_DT %}
The first date that a payment is expected under the Arrangement. The first payment date of a schedule of payments may be anomalous and will be recorded explicitly.
{% enddocs %}

{% docs tbl_LOAN_AR_INT_ONLY_TERM_END_DT %}
The date that the agreed term of interest only repayments on the Arrangement ends. Repayments may be applied to the Arrangement based solely on interest due for the period, with repayment of principal deferred until a later date or when demanded, or utilizing the remainder of funds above the interest amount due to apply towards the principal repayment. 
{% enddocs %}

{% docs tbl_LOAN_AR_LOAN_PRPYMT_PNY_END_DT %}
The date up to which a loan is subject to prepayment penalties. Loans with an initial low or zero interest rate will cause the borrower to incur penalties for any Prepayments (overpayments) during this initial period. 
{% enddocs %}

{% docs tbl_LOAN_AR_LOAN_SUBS %}
The amount of the loan which is subsidized. For example, a government subsidy to promote the giving of Loans to develop a run-down area.
{% enddocs %}

{% docs tbl_LOAN_AR_LOAN_SUBS_END_DT %}
The date upon which a loan subsidy ends. For example, a government subsidy to promote the giving of Loans to develop a run-down area extends up to the Loan Subsidy End Date.
{% enddocs %}

{% docs tbl_LOAN_AR_NEG_AMRZ_AVL_ID %}
The unique identifier of the Negative Amortization Availability.
{% enddocs %}

{% docs tbl_LOAN_AR_NXT_INT_RSET_DT %}
The scheduled date upon which the setting of the interest rate for the next interest calculation period is planned to occur.
{% enddocs %}

{% docs tbl_LOAN_AR_INDP_CNSLL_RCVD_F %}
Indicates whether the customer in a Loan Arrangement has entered into the arrangement after first receiving advice from a counselor. Such a counselor should not be employed by the creditor or an affiliate of the creditor or be affiliated with the creditor.
{% enddocs %}

{% docs tbl_LOAN_AR_ORIG_CMB_LOAN_TO_VAL_RTO %}
The original Combined Loan To Value (ratio) (CLTV) ratio of the arrangement when first established, which is the proportion of loans (secured by a property) in relation to its value.
{% enddocs %}

{% docs tbl_LOAN_AR_ORIG_INS_CVR_PCT %}
The amount of insurance cover as a percentage of the total loan value at the time of origination. 
{% enddocs %}

{% docs tbl_LOAN_AR_ORIG_LOAN_TO_VAL_RTO %}
The original Loan To Value (LTV) ratio of the arrangement when first established. The loan-to-value (LTV) ratio expresses the amount of a first mortgage lien as a percentage of the total appraised value of real property.
Example:- if a borrower wants $130,000 to purchase a house worth $150,000, the LTV ratio is $130,000/$150,000 or 87%.
Loan to value is one of the key risk factors that lenders assess when qualifying borrowers for a mortgage. The risk of default is always at the forefront of lending decisions, and the likelihood of a lender absorbing a loss in the foreclosure process increases as the amount of equity decreases. Therefore, as the LTV ratio of a loan increases, the qualification guidelines for certain mortgage programs become much more strict. Lenders can require borrowers of high LTV loans to buy mortgage insurance to protect the lender from the buyer default, which increases the costs of the mortgage.
{% enddocs %}

{% docs tbl_LOAN_AR_PTY_PRCH_GOVT_SCM_ID %}
The unique identifier of the Property Purchase Government Scheme.
{% enddocs %}

{% docs tbl_LOAN_AR_PTY_PRCH_GOVT_SCM_NBR %}
The number which uniquely identifies the government assistance program associated with the Mortgage Arrangement. For example, the Home Affordable Modification Program (HAMP) Loan Number.
{% enddocs %}

{% docs tbl_LOAN_AR_AC_AR_ID %}
The unique identifier of the Account Arrangement.
{% enddocs %}w