USE [GenKFI]
GO
/****** Object:  Table [dbo].[tblCitCrsT]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCitCrsT](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fcurTotApplied1] [money] NOT NULL,
	[fcurTotRefund1] [money] NOT NULL,
	[fcurTotApplied2] [money] NOT NULL,
	[fcurTotRefund2] [money] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblCitCrsT] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPtePtd]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPtePtd](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fstrFein] [varchar](9) NOT NULL,
	[fcurNMNetIncome] [money] NOT NULL,
	[fblnAmend] [tinyint] NOT NULL,
	[fdtmPostMarkDate] [datetime] NOT NULL,
	[fstrName] [varchar](40) NOT NULL,
	[fstrStreet] [varchar](40) NOT NULL,
	[fstrCity] [varchar](20) NOT NULL,
	[fstrState] [varchar](4) NOT NULL,
	[fstrCountry] [varchar](4) NOT NULL,
	[fstrZipCode] [varchar](9) NOT NULL,
	[fblnPte] [tinyint] NOT NULL,
	[fblnScorp] [tinyint] NOT NULL,
	[fblnCit] [tinyint] NOT NULL,
	[fblnFid] [tinyint] NOT NULL,
	[fblnOth] [tinyint] NOT NULL,
	[fstrOthWhy] [varchar](40) NOT NULL,
	[fdtmTaxYrBeg] [datetime] NOT NULL,
	[fdtmTaxYrEnd] [datetime] NOT NULL,
	[fdtmTaxDue] [datetime] NOT NULL,
	[fdtmExtDue] [datetime] NOT NULL,
	[fcurWthPage] [money] NOT NULL,
	[fcurWthAll] [money] NOT NULL,
	[fcurWthOwn] [money] NOT NULL,
	[fcurWthPte] [money] NOT NULL,
	[fcurSubTotal] [money] NOT NULL,
	[fcurPenalty] [money] NOT NULL,
	[fcurInterest] [money] NOT NULL,
	[fcurTotalDue] [money] NOT NULL,
	[fdtmSigned] [datetime] NOT NULL,
	[fstrPhone] [varchar](10) NOT NULL,
	[fstrEmail] [varchar](80) NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblPtePtd] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCit2]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCit2](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fcurTaxable] [money] NOT NULL,
	[fcurIntMuni] [money] NOT NULL,
	[fcurFedSpDed] [money] NOT NULL,
	[fcurNMBase] [money] NOT NULL,
	[fcurNMNOL] [money] NOT NULL,
	[fcurIntUSOblig] [money] NOT NULL,
	[fcurNMSubTotal] [money] NOT NULL,
	[fcurDednForDiv] [money] NOT NULL,
	[fcurNMNetTaxable] [money] NOT NULL,
	[fcurComputedIncTax] [money] NOT NULL,
	[fcurNMPercentage] [decimal](18, 4) NOT NULL,
	[fcurNMIncomeTax] [money] NOT NULL,
	[fcurTotTaxCredits] [money] NOT NULL,
	[fcurNetIncomeTax] [money] NOT NULL,
	[fcurFranchiseTax] [money] NOT NULL,
	[fcurTotIncFranch] [money] NOT NULL,
	[fcurRefundApplied] [money] NOT NULL,
	[fcurSubTotal2] [money] NOT NULL,
	[fblnPaymtQuart] [tinyint] NOT NULL,
	[fblnPaymtTent] [tinyint] NOT NULL,
	[fblnPaymtYear] [tinyint] NOT NULL,
	[fblnPaymtMethFour] [tinyint] NOT NULL,
	[fcurTotalPayments] [money] NOT NULL,
	[fcurTaxWithholdOGP] [money] NOT NULL,
	[fcurNMWithPass] [money] NOT NULL,
	[fcurNMWithTotBen] [money] NOT NULL,
	[fcurTaxDue] [money] NOT NULL,
	[fcurPenalty] [money] NOT NULL,
	[fcurInterest] [money] NOT NULL,
	[fcurTotalDue] [money] NOT NULL,
	[fcurOverPaymt] [money] NOT NULL,
	[fcurOvPaymentNxtYr] [money] NOT NULL,
	[fcurOvPaymentRef] [money] NOT NULL,
	[fcurRefRenewEner] [money] NOT NULL,
	[fcurTotalRefCred] [money] NOT NULL,
	[fcurFilmProduction] [money] NOT NULL,
	[fstrTPEmailAdd] [varchar](80) NOT NULL,
	[fstrPrepCRSID] [varchar](11) NOT NULL,
	[fstrPrepFEIN] [varchar](9) NOT NULL,
	[fstrPrepSSNPTIN] [varchar](9) NOT NULL,
	[fstrPrepPhoneNum] [varchar](10) NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fcurFedNol] [money] NOT NULL,
	[fcurTrfCrd] [money] NOT NULL,
 CONSTRAINT [PK_tblCit2] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[progCodes]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[progCodes](
	[idProgCodes] [int] IDENTITY(1,1) NOT NULL,
	[progCode] [varchar](10) NOT NULL,
	[description] [varchar](255) NULL,
	[removed] [tinyint] NOT NULL,
 CONSTRAINT [PK_progCodes] PRIMARY KEY CLUSTERED 
(
	[idProgCodes] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPteB]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPteB](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fcurBDividends] [money] NOT NULL,
	[fcurBNMDividends] [money] NOT NULL,
	[fcurBInterest] [money] NOT NULL,
	[fcurBNMInterest] [money] NOT NULL,
	[fcurBRents] [money] NOT NULL,
	[fcurBNMRents] [money] NOT NULL,
	[fcurBRoyalties] [money] NOT NULL,
	[fcurBNMRoyalties] [money] NOT NULL,
	[fcurBProfitLoss] [money] NOT NULL,
	[fcurBNMProfitLoss] [money] NOT NULL,
	[fcurBIncome] [money] NOT NULL,
	[fcurBNMIncome] [money] NOT NULL,
	[fcurBOthIncome] [money] NOT NULL,
	[fcurBNMOthIncome] [money] NOT NULL,
	[fcurBNetAllocInc] [money] NOT NULL,
	[fcurBNMNetAllocInc] [money] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblPteB] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[userProgCode]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userProgCode](
	[idUserProgCode] [int] IDENTITY(1,1) NOT NULL,
	[userIDFK] [uniqueidentifier] NOT NULL,
	[progCodeIDFK] [int] NOT NULL,
 CONSTRAINT [PK_userProgCode] PRIMARY KEY CLUSTERED 
(
	[idUserProgCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblScorpA]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblScorpA](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fcurAInventory] [money] NOT NULL,
	[fcurANMInventory] [money] NOT NULL,
	[fcurARealProperty] [money] NOT NULL,
	[fcurANMRealProperty] [money] NOT NULL,
	[fcurAPerProperty] [money] NOT NULL,
	[fcurANMPerProperty] [money] NOT NULL,
	[fcurARentProperty] [money] NOT NULL,
	[fcurANMRentProperty] [money] NOT NULL,
	[fcurATotalProperty] [money] NOT NULL,
	[fcurANMTotalProperty] [money] NOT NULL,
	[fcurAPropertyFactor] [decimal](18, 4) NOT NULL,
	[fcurATotalPayRoll] [money] NOT NULL,
	[fcurANMPayRoll] [money] NOT NULL,
	[fcurAPayRollFactor] [decimal](18, 4) NOT NULL,
	[fcurASales] [money] NOT NULL,
	[fcurANMSales] [money] NOT NULL,
	[fcurASalesFactor] [decimal](18, 4) NOT NULL,
	[fcurATotalFactors] [decimal](18, 4) NOT NULL,
	[fdtmATaxYearEnd] [datetime] NOT NULL,
	[fdtmAElection] [datetime] NOT NULL,
	[fcurAAvgFactor] [decimal](18, 4) NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblScorpA] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[userExpires]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userExpires](
	[idUserExpires] [int] IDENTITY(1,1) NOT NULL,
	[userIDFK] [uniqueidentifier] NOT NULL,
	[expires] [datetime] NOT NULL,
 CONSTRAINT [PK_userExpires] PRIMARY KEY CLUSTERED 
(
	[idUserExpires] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCitC]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCitC](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fcurCNMNetTaxable] [money] NOT NULL,
	[fcurCNMAllocIncome] [money] NOT NULL,
	[fcurCNMApportIncome] [money] NOT NULL,
	[fcurCSubTotal] [money] NOT NULL,
	[fcurCNMPercentage] [decimal](18, 4) NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblCitC] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblAutoJavaComplete]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAutoJavaComplete](
	[IDtblAutoJavaComplete] [int] IDENTITY(1,1) NOT NULL,
	[flngControlOutIDFK] [int] NOT NULL,
	[flngControl1IDFK] [int] NOT NULL,
	[flngControl2IDFK] [int] NOT NULL,
	[fdecConstant] [decimal](18, 4) NOT NULL,
	[flngJavaFuncIDFK] [int] NOT NULL,
	[flngOrder] [int] NOT NULL,
	[fblnOnBlur] [tinyint] NOT NULL,
	[flngName1IDFK] [int] NOT NULL,
	[flngName2IDFK] [int] NOT NULL,
	[fstrFuncName] [varchar](50) NOT NULL,
	[fstrFileType] [varchar](10) NOT NULL,
	[fstrTaxForm] [varchar](30) NOT NULL,
	[flngCtlBlock] [int] NOT NULL,
	[flngOutOrder] [int] NOT NULL,
	[flngC1Order] [int] NOT NULL,
	[flngC2Order] [int] NOT NULL,
	[flngN1Order] [int] NOT NULL,
	[flngN2Order] [int] NOT NULL,
 CONSTRAINT [PK_tblAutoJavaComplete] PRIMARY KEY CLUSTERED 
(
	[IDtblAutoJavaComplete] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCitCR]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCitCR](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fcurCRChildCare] [money] NOT NULL,
	[fcurCRCultProp] [money] NOT NULL,
	[fcurCRBusFac] [money] NOT NULL,
	[fcurCRInterGov] [money] NOT NULL,
	[fcurCRRuralJob] [money] NOT NULL,
	[fcurCRTechJobs] [money] NOT NULL,
	[fcurCRElecCard] [money] NOT NULL,
	[fcurCRJobMentor] [money] NOT NULL,
	[fcurCRLandCons] [money] NOT NULL,
	[fcurCRAffordHouse] [money] NOT NULL,
	[fcurCRBioDiesel] [money] NOT NULL,
	[fcurCRSusBldg] [money] NOT NULL,
	[fcurCRWaterCons] [money] NOT NULL,
	[fcurCRAdvEnergy] [money] NOT NULL,
	[fcurCRGeolPump] [money] NOT NULL,
	[fcurCRAgrBioMass] [money] NOT NULL,
	[fcurCRFilmApplied] [money] NOT NULL,
	[fcurCRFilmApproved] [money] NOT NULL,
	[fcurCRRenewEner] [money] NOT NULL,
	[fcurCRVetEmploy] [money] NOT NULL,
	[fcurCRTotCredit] [money] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblCitCR] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rfrJavaAutoFunctions]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rfrJavaAutoFunctions](
	[IDrfrJavaAutoFunctions] [int] IDENTITY(1,1) NOT NULL,
	[fstrFuncName] [varchar](50) NOT NULL,
	[fstrJavaTemplate] [text] NOT NULL,
	[fstrInput1] [varchar](50) NOT NULL,
	[fstrInput2] [varchar](50) NOT NULL,
	[fstrName1] [varchar](50) NOT NULL,
	[fstrName2] [varchar](50) NOT NULL,
 CONSTRAINT [PK_rfrJavaAutoFunctions] PRIMARY KEY CLUSTERED 
(
	[IDrfrJavaAutoFunctions] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rfrReturnHeaders]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rfrReturnHeaders](
	[idReturnHeaders] [int] IDENTITY(1,1) NOT NULL,
	[fstrFileType] [varchar](10) NOT NULL,
	[fstrTaxProgram] [varchar](3) NOT NULL,
	[flngTaxYear] [int] NOT NULL,
 CONSTRAINT [PK_rfrReturnHeaders] PRIMARY KEY CLUSTERED 
(
	[idReturnHeaders] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCitD]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCitD](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fcurDForDiv] [money] NOT NULL,
	[fcurDDivLess20] [money] NOT NULL,
	[fcurDDivLess80] [money] NOT NULL,
	[fcurDDivMore80] [money] NOT NULL,
	[fcurDTotalNMDedn] [money] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblCitD] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rfrFormatTypes]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rfrFormatTypes](
	[IDrfrFormatTypes] [int] IDENTITY(1,1) NOT NULL,
	[fstrDesc] [varchar](128) NOT NULL,
	[fstrFJSfuncName] [varchar](64) NOT NULL,
	[fstrdoLookupType] [varchar](10) NULL,
 CONSTRAINT [PK_rfrFormatTypes] PRIMARY KEY CLUSTERED 
(
	[IDrfrFormatTypes] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblKeQMast]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblKeQMast](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fstrTitle] [varchar](50) NOT NULL,
	[flngBlock] [int] NOT NULL,
	[fstrUserID] [varchar](256) NOT NULL,
	[fstrStatus] [char](1) NOT NULL,
	[fstrChanged] [char](1) NOT NULL,
	[fstrFormName] [varchar](50) NOT NULL,
	[fstrImagePath] [varchar](300) NOT NULL,
	[fstrTaxProgram] [varchar](3) NOT NULL,
	[flngTaxYear] [int] NOT NULL,
	[fstrFileType] [varchar](10) NOT NULL,
	[fstrDLN] [varchar](30) NOT NULL,
	[fstrTimelyBatch] [char](1) NOT NULL,
	[fdtmPostMarkDate] [datetime] NOT NULL,
	[fdtmWhenFinished] [datetime] NOT NULL,
	[fstrWhoFinished] [varchar](256) NOT NULL,
 CONSTRAINT [PK_tblKeQMast_1] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC,
	[fstrTitle] ASC,
	[flngBlock] ASC,
	[fstrDLN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblScoPtdS]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblScoPtdS](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[flngRepNum] [int] NOT NULL,
	[fstrId] [varchar](9) NOT NULL,
	[fblnFein] [tinyint] NOT NULL,
	[fblnSsn] [tinyint] NOT NULL,
	[fstrName] [varchar](40) NOT NULL,
	[fstrStreet] [varchar](40) NOT NULL,
	[fstrCity] [varchar](20) NOT NULL,
	[fstrState] [varchar](4) NOT NULL,
	[fstrCountry] [varchar](4) NOT NULL,
	[fstrZipCode] [varchar](9) NOT NULL,
	[fblnOutSide] [tinyint] NOT NULL,
	[fcurOwnNet] [money] NOT NULL,
	[fcurOwnWth] [money] NOT NULL,
	[fbln41353] [tinyint] NOT NULL,
	[fblnFilled] [tinyint] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fstrMPDLN] [varchar](300) NOT NULL,
	[fstrTaxForm] [varchar](63) NOT NULL,
	[fstrSource] [varchar](6) NOT NULL,
	[fblnFound] [tinyint] NOT NULL,
 CONSTRAINT [PK_tblScoPtdS] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC,
	[flngRepNum] ASC,
	[fblnFilled] ASC,
	[fstrTaxForm] ASC,
	[fstrMPDLN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCitCRS]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCitCRS](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[flngRepNum] [int] NOT NULL,
	[fstrCrdType] [varchar](4) NOT NULL,
	[fstrApprove] [varchar](20) NOT NULL,
	[fcurApplied] [money] NOT NULL,
	[fcurRefund] [money] NOT NULL,
	[fblnFilled] [tinyint] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fstrMPDLN] [varchar](300) NOT NULL,
	[fstrTaxForm] [varchar](63) NOT NULL,
	[fstrSource] [varchar](6) NOT NULL,
	[fblnFound] [tinyint] NOT NULL,
 CONSTRAINT [PK_tblCitCRS] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC,
	[flngRepNum] ASC,
	[fblnFilled] ASC,
	[fstrMPDLN] ASC,
	[fstrTaxForm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rfrTaxTable]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rfrTaxTable](
	[fstrTaxYear] [float] NULL,
	[fcurLower] [float] NULL,
	[fcurUpper] [float] NULL,
	[fcurSingle] [float] NULL,
	[fcurJoint] [float] NULL,
	[fcurSeperate] [float] NULL,
	[fcurHeadHouse] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblO99]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblO99](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fblnFein] [tinyint] NOT NULL,
	[fblnSsn] [tinyint] NOT NULL,
	[fstrID] [varchar](9) NOT NULL,
	[fcurTotalDue] [money] NOT NULL,
	[fblnAmend] [tinyint] NOT NULL,
	[fdtmPostMarkDate] [datetime] NOT NULL,
	[fstrName] [varchar](40) NOT NULL,
	[fstrStreet] [varchar](40) NOT NULL,
	[fstrCity] [varchar](20) NOT NULL,
	[fstrState] [varchar](4) NOT NULL,
	[fstrCountry] [varchar](4) NOT NULL,
	[fstrZipCode] [varchar](9) NOT NULL,
	[fcurPage] [money] NOT NULL,
	[fcurAllPage] [money] NOT NULL,
	[fdtmSigned] [datetime] NOT NULL,
	[fstrPhone] [varchar](10) NOT NULL,
	[fstrEmail] [varchar](80) NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fblnFound] [tinyint] NOT NULL,
 CONSTRAINT [PK_tblO99] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPtdS]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPtdS](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[flngRepNum] [int] NOT NULL,
	[fstrId] [varchar](9) NOT NULL,
	[fblnFein] [tinyint] NOT NULL,
	[fblnSsn] [tinyint] NOT NULL,
	[fstrName] [varchar](40) NOT NULL,
	[fstrStreet] [varchar](40) NOT NULL,
	[fstrCity] [varchar](20) NOT NULL,
	[fstrState] [varchar](4) NOT NULL,
	[fstrCountry] [varchar](4) NOT NULL,
	[fstrZipCode] [varchar](9) NOT NULL,
	[fblnOutSide] [tinyint] NOT NULL,
	[fcurOwnNet] [money] NOT NULL,
	[fcurOwnWth] [money] NOT NULL,
	[fbln41353] [tinyint] NOT NULL,
	[fblnFilled] [tinyint] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fstrMPDLN] [varchar](300) NOT NULL,
	[fstrTaxForm] [varchar](63) NOT NULL,
	[fstrSource] [varchar](6) NOT NULL,
	[fblnFound] [tinyint] NOT NULL,
 CONSTRAINT [PK_tblPtdS] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC,
	[flngRepNum] ASC,
	[fblnFilled] ASC,
	[fstrTaxForm] ASC,
	[fstrMPDLN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCitB]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCitB](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fcurBDividends] [money] NOT NULL,
	[fcurBNMDividends] [money] NOT NULL,
	[fcurBInterest] [money] NOT NULL,
	[fcurBNMInterest] [money] NOT NULL,
	[fcurBRents] [money] NOT NULL,
	[fcurBNMRents] [money] NOT NULL,
	[fcurBRoyalties] [money] NOT NULL,
	[fcurBNMRoyalties] [money] NOT NULL,
	[fcurBProfitLoss] [money] NOT NULL,
	[fcurBNMProfitLoss] [money] NOT NULL,
	[fcurBIncome] [money] NOT NULL,
	[fcurBNMIncome] [money] NOT NULL,
	[fcurBOthIncome] [money] NOT NULL,
	[fcurBNMOthIncome] [money] NOT NULL,
	[fcurBNetAllocInc] [money] NOT NULL,
	[fcurBNMNetAllocInc] [money] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fcurBGaDividends] [money] NOT NULL,
	[fcurBReDividends] [money] NOT NULL,
	[fcurBGaInterest] [money] NOT NULL,
	[fcurBReInterest] [money] NOT NULL,
	[fcurBGaRents] [money] NOT NULL,
	[fcurBReRents] [money] NOT NULL,
	[fcurBGaRoyalties] [money] NOT NULL,
	[fcurBReRoyalties] [money] NOT NULL,
	[fcurBGaProfitLoss] [money] NOT NULL,
	[fcurBReProfitLoss] [money] NOT NULL,
	[fcurBGaIncome] [money] NOT NULL,
	[fcurBReIncome] [money] NOT NULL,
	[fcurBGaOthIncome] [money] NOT NULL,
	[fcurBReOthIncome] [money] NOT NULL,
 CONSTRAINT [PK_tblCitB] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblKeQueue]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblKeQueue](
	[fstrUserID] [varchar](256) NOT NULL,
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fstrTitle] [varchar](50) NOT NULL,
	[flngBlock] [int] NOT NULL,
	[fstrFormName] [varchar](50) NOT NULL,
	[fstrImagePath] [varchar](300) NOT NULL,
	[fstrStatus] [char](1) NOT NULL,
	[fstrTaxProgram] [varchar](3) NOT NULL,
	[flngTaxYear] [int] NOT NULL,
	[fstrFileType] [varchar](10) NOT NULL,
	[fstrDLN] [varchar](30) NOT NULL,
	[fstrTimelyBatch] [char](1) NOT NULL,
	[fdtmPostMarkDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tblKeQueue_1] PRIMARY KEY CLUSTERED 
(
	[fstrUserID] ASC,
	[fstrBatchID] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC,
	[fstrTitle] ASC,
	[flngBlock] ASC,
	[fstrDLN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblFidCRS]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblFidCRS](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[flngRepNum] [int] NOT NULL,
	[fstrCrdType] [varchar](4) NOT NULL,
	[fstrApprove] [varchar](20) NOT NULL,
	[fcurApplied] [money] NOT NULL,
	[fcurRefund] [money] NOT NULL,
	[fblnFilled] [tinyint] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fstrMPDLN] [varchar](300) NOT NULL,
	[fstrTaxForm] [varchar](63) NOT NULL,
	[fstrSource] [varchar](6) NOT NULL,
	[fblnFound] [tinyint] NOT NULL,
 CONSTRAINT [PK_tblFidCRS] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC,
	[flngRepNum] ASC,
	[fblnFilled] ASC,
	[fstrMPDLN] ASC,
	[fstrTaxForm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblScoPtd]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblScoPtd](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fstrFein] [varchar](9) NOT NULL,
	[fcurNMNetIncome] [money] NOT NULL,
	[fblnAmend] [tinyint] NOT NULL,
	[fdtmPostMarkDate] [datetime] NOT NULL,
	[fstrName] [varchar](40) NOT NULL,
	[fstrStreet] [varchar](40) NOT NULL,
	[fstrCity] [varchar](20) NOT NULL,
	[fstrState] [varchar](4) NOT NULL,
	[fstrCountry] [varchar](4) NOT NULL,
	[fstrZipCode] [varchar](9) NOT NULL,
	[fblnPte] [tinyint] NOT NULL,
	[fblnScorp] [tinyint] NOT NULL,
	[fblnCit] [tinyint] NOT NULL,
	[fblnFid] [tinyint] NOT NULL,
	[fblnOth] [tinyint] NOT NULL,
	[fstrOthWhy] [varchar](40) NOT NULL,
	[fdtmTaxYrBeg] [datetime] NOT NULL,
	[fdtmTaxYrEnd] [datetime] NOT NULL,
	[fdtmTaxDue] [datetime] NOT NULL,
	[fdtmExtDue] [datetime] NOT NULL,
	[fcurWthPage] [money] NOT NULL,
	[fcurWthAll] [money] NOT NULL,
	[fcurWthOwn] [money] NOT NULL,
	[fcurWthPte] [money] NOT NULL,
	[fcurSubTotal] [money] NOT NULL,
	[fcurPenalty] [money] NOT NULL,
	[fcurInterest] [money] NOT NULL,
	[fcurTotalDue] [money] NOT NULL,
	[fdtmSigned] [datetime] NOT NULL,
	[fstrPhone] [varchar](10) NOT NULL,
	[fstrEmail] [varchar](80) NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblScoPtd] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblFid2]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblFid2](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fcurFedNOL] [money] NOT NULL,
	[fcurNonNMMuni] [money] NOT NULL,
	[fcurFedAdd] [money] NOT NULL,
	[fcurNMNOL] [money] NOT NULL,
	[fcurUSBondInt] [money] NOT NULL,
	[fcurNetCapGain] [money] NOT NULL,
	[fcurTotDed] [money] NOT NULL,
	[fcurTotDistAmt] [money] NOT NULL,
	[fstrRouting1Num] [varchar](9) NOT NULL,
	[fstrRoutingNum] [varchar](9) NOT NULL,
	[fstrAccount1Num] [varchar](17) NOT NULL,
	[fstrAccountNum] [varchar](17) NOT NULL,
	[fstrAccountType] [varchar](1) NOT NULL,
	[fblnAcctChk] [tinyint] NOT NULL,
	[fblnAcctSav] [tinyint] NOT NULL,
	[fblnIATFlag] [tinyint] NOT NULL,
	[fblnIATYes] [tinyint] NOT NULL,
	[fblnIATNo] [tinyint] NOT NULL,
	[fstrPhoneNo] [varchar](10) NOT NULL,
	[fstrEmail] [varchar](80) NOT NULL,
	[fstrPrepName] [varchar](50) NOT NULL,
	[fstrPrepEIN] [varchar](9) NOT NULL,
	[fstrPrepCRSID] [varchar](11) NOT NULL,
	[fstrPrepPTIN] [varchar](9) NOT NULL,
	[fstrPrepPhone] [varchar](10) NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblFid2] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblFidDS]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblFidDS](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[flngRepNum] [int] NOT NULL,
	[fstrId] [varchar](9) NOT NULL,
	[fblnFein] [tinyint] NOT NULL,
	[fblnSsn] [tinyint] NOT NULL,
	[fstrName] [varchar](40) NOT NULL,
	[fstrStreet] [varchar](40) NOT NULL,
	[fstrCity] [varchar](20) NOT NULL,
	[fstrState] [varchar](4) NOT NULL,
	[fstrCountry] [varchar](4) NOT NULL,
	[fstrZipCode] [varchar](9) NOT NULL,
	[fblnOutSide] [tinyint] NOT NULL,
	[fcurOwnNet] [money] NOT NULL,
	[fcurOwnWth] [money] NOT NULL,
	[fbln41353] [tinyint] NOT NULL,
	[fblnFilled] [tinyint] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fstrMPDLN] [varchar](300) NOT NULL,
	[fstrTaxForm] [varchar](63) NOT NULL,
	[fstrSource] [varchar](6) NOT NULL,
	[fblnFound] [tinyint] NOT NULL,
 CONSTRAINT [PK_tblFidDS] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC,
	[flngRepNum] ASC,
	[fblnFilled] ASC,
	[fstrTaxForm] ASC,
	[fstrMPDLN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPte]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPte](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fstrFEIN] [varchar](9) NOT NULL,
	[fstrCRSId] [varchar](11) NOT NULL,
	[fstrName] [varchar](40) NOT NULL,
	[fstrStreet] [varchar](40) NOT NULL,
	[fstrCity] [varchar](20) NOT NULL,
	[fstrState] [varchar](4) NOT NULL,
	[fstrCountry] [varchar](4) NOT NULL,
	[fstrZipCode] [varchar](9) NOT NULL,
	[fdtmTaxYrBeg] [datetime] NOT NULL,
	[fdtmTaxYrEnd] [datetime] NOT NULL,
	[fdtmExtDue] [datetime] NOT NULL,
	[fdtmPostMarkDate] [datetime] NOT NULL,
	[fblnAmended] [tinyint] NOT NULL,
	[fstrNAICSCode] [varchar](6) NOT NULL,
	[fstrStateOrg] [varchar](40) NOT NULL,
	[fdtmDateOrg] [datetime] NOT NULL,
	[fdtmDateBeg] [datetime] NOT NULL,
	[fdtmFinalReturn] [datetime] NOT NULL,
	[fcurTaxWithheldOGP] [money] NOT NULL,
	[fcurWithPteNetInc] [money] NOT NULL,
	[fcurRefundOverpmt] [money] NOT NULL,
	[fcurNMWithPass] [money] NOT NULL,
	[fcurWithPdPteOwNet] [money] NOT NULL,
	[fcurOrdinaryIncome] [money] NOT NULL,
	[fcurOtherIncome] [money] NOT NULL,
	[fcurIntMuniBond] [money] NOT NULL,
	[fcurSubTotal] [money] NOT NULL,
	[fcurIntFedBond] [money] NOT NULL,
	[fcurAllowDeduct] [money] NOT NULL,
	[fcurAllocatedIncome] [money] NOT NULL,
	[fcurAppIncome] [money] NOT NULL,
	[fcurNMPercent] [decimal](18, 4) NOT NULL,
	[fcurNMAppIncome] [money] NOT NULL,
	[fcurNMAllocatedInc] [money] NOT NULL,
	[fcurNMNetIncome] [money] NOT NULL,
	[fcurFlmPrd] [money] NOT NULL,
	[fstrPhoneNo] [varchar](10) NOT NULL,
	[fstrTPEmailAdd] [varchar](80) NOT NULL,
	[fstrPrepCRSID] [varchar](11) NOT NULL,
	[fstrPrepFEIN] [varchar](9) NOT NULL,
	[fstrPrepSSNPTIN] [varchar](9) NOT NULL,
	[fstrPrepPhoneNum] [varchar](10) NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblPte] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblO85]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblO85](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fblnFein] [tinyint] NOT NULL,
	[fblnSsn] [tinyint] NOT NULL,
	[fstrID] [varchar](9) NOT NULL,
	[fcurTotalDue] [money] NOT NULL,
	[fblnAmend] [tinyint] NOT NULL,
	[fdtmPostMarkDate] [datetime] NOT NULL,
	[fstrName] [varchar](40) NOT NULL,
	[fstrStreet] [varchar](40) NOT NULL,
	[fstrCity] [varchar](20) NOT NULL,
	[fstrState] [varchar](4) NOT NULL,
	[fstrCountry] [varchar](4) NOT NULL,
	[fstrZipCode] [varchar](9) NOT NULL,
	[fcurPage] [money] NOT NULL,
	[fcurAllPage] [money] NOT NULL,
	[fdtmSigned] [datetime] NOT NULL,
	[fstrPhone] [varchar](10) NOT NULL,
	[fstrEmail] [varchar](80) NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fblnFound] [tinyint] NOT NULL,
 CONSTRAINT [PK_tblO85] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCit]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCit](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fstrFein] [varchar](9) NOT NULL,
	[fstrCrsID] [varchar](11) NOT NULL,
	[fstrName] [varchar](40) NOT NULL,
	[fstrStreet] [varchar](40) NOT NULL,
	[fstrCity] [varchar](20) NOT NULL,
	[fstrState] [varchar](4) NOT NULL,
	[fstrCountry] [varchar](4) NOT NULL,
	[fstrZipCode] [varchar](9) NOT NULL,
	[fdtmTaxYrBeg] [datetime] NOT NULL,
	[fdtmTaxYrEnd] [datetime] NOT NULL,
	[fdtmExtDue] [datetime] NOT NULL,
	[fdtmPostMarkDate] [datetime] NOT NULL,
	[fstrReturnFlag] [varchar](1) NOT NULL,
	[fstrPhoneNo] [varchar](10) NOT NULL,
	[fstrNAICSCode] [varchar](6) NOT NULL,
	[fstrIncomeMethod] [varchar](1) NOT NULL,
	[fstrAccountingMethod] [varchar](1) NOT NULL,
	[fstrFinalReturnType] [varchar](1) NOT NULL,
	[fdtmFinalReturnDate] [datetime] NOT NULL,
	[fstrLegalEntType] [varchar](30) NOT NULL,
	[fblnImmune] [tinyint] NOT NULL,
	[fstrRouting1Num] [varchar](9) NOT NULL,
	[fstrRoutingNum] [varchar](9) NOT NULL,
	[fstrAccount1Num] [varchar](17) NOT NULL,
	[fstrAccountNum] [varchar](17) NOT NULL,
	[fstrAccountType] [varchar](1) NOT NULL,
	[fblnAcctChk] [tinyint] NOT NULL,
	[fblnAcctSav] [tinyint] NOT NULL,
	[fblnIATFlag] [tinyint] NOT NULL,
	[fblnIATYes] [tinyint] NOT NULL,
	[fblnIATNo] [tinyint] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fstrStateOrg] [varchar](40) NOT NULL,
	[fdtmDateOrg] [datetime] NOT NULL,
	[fdtmNMStart] [datetime] NOT NULL,
	[fstrDomicile] [varchar](40) NOT NULL,
 CONSTRAINT [PK_tblCit] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rfrTaxPgm]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rfrTaxPgm](
	[fstrFileType] [varchar](10) NOT NULL,
	[fstrTaxProgram] [varchar](3) NOT NULL,
	[fstrTaxYear] [varchar](50) NOT NULL,
	[fintJobIdDev] [int] NOT NULL,
	[fintJobIdProd] [int] NOT NULL,
	[fstrSQL] [varchar](10) NOT NULL,
	[fstrBatchSource] [varchar](10) NOT NULL,
	[fstrBatchPrefix] [varchar](10) NOT NULL,
	[fstrBatchSuffix] [varchar](10) NOT NULL,
	[fstrBatchType] [varchar](10) NOT NULL,
	[fstrAccountType] [varchar](10) NOT NULL,
	[fdtmFilingPeriod] [datetime] NOT NULL,
	[fdtmDueDate] [datetime] NOT NULL,
	[fstrDocType] [varchar](10) NOT NULL,
	[fintDocVer] [int] NOT NULL,
	[fstrPrimType] [varchar](10) NOT NULL,
	[fstrSecType] [varchar](10) NOT NULL,
	[fbln2Db] [tinyint] NOT NULL,
	[fblnImport] [tinyint] NOT NULL,
	[fblnExtract] [tinyint] NOT NULL,
	[fblnActive] [tinyint] NOT NULL,
	[fblnPtdAddition] [tinyint] NOT NULL,
	[fintCompDev] [int] NOT NULL,
	[fintCompPrd] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPitCRS]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPitCRS](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[flngRepNum] [int] NOT NULL,
	[fstrCrdType] [varchar](4) NOT NULL,
	[fstrApprove] [varchar](20) NOT NULL,
	[fcurApplied] [money] NOT NULL,
	[fcurRefund] [money] NOT NULL,
	[fblnFilled] [tinyint] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fstrMPDLN] [varchar](300) NOT NULL,
	[fstrTaxForm] [varchar](63) NOT NULL,
	[fstrSource] [varchar](6) NOT NULL,
	[fblnFound] [tinyint] NOT NULL,
 CONSTRAINT [PK_tblPitCRS] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC,
	[flngRepNum] ASC,
	[fblnFilled] ASC,
	[fstrMPDLN] ASC,
	[fstrTaxForm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPit]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPit](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fstrPSSN] [varchar](9) NOT NULL,
	[fblnPBlind] [tinyint] NOT NULL,
	[fblnP65] [tinyint] NOT NULL,
	[fstrPResident] [varchar](1) NOT NULL,
	[fdtmPDob] [datetime] NOT NULL,
	[fstrPFirst] [varchar](20) NOT NULL,
	[fstrPMiddle] [varchar](1) NOT NULL,
	[fstrPLast] [varchar](25) NOT NULL,
	[fstrPSuffix] [varchar](4) NOT NULL,
	[fstrSpSSN] [varchar](9) NOT NULL,
	[fblnSpBlind] [tinyint] NOT NULL,
	[fblnSp65] [tinyint] NOT NULL,
	[fstrSpResident] [varchar](1) NOT NULL,
	[fdtmSDob] [datetime] NOT NULL,
	[fstrSFirst] [varchar](20) NOT NULL,
	[fstrSMiddle] [varchar](1) NOT NULL,
	[fstrSLast] [varchar](25) NOT NULL,
	[fstrSSuffix] [varchar](4) NOT NULL,
	[fdtmPostMarkDate] [datetime] NOT NULL,
	[fdtmTaxYrBeg] [datetime] NOT NULL,
	[fdtmTaxYrEnd] [datetime] NOT NULL,
	[fblnAddrChg] [tinyint] NOT NULL,
	[fstrName] [varchar](40) NOT NULL,
	[fstrAddress] [varchar](40) NOT NULL,
	[fstrCity] [varchar](20) NOT NULL,
	[fstrState] [varchar](4) NOT NULL,
	[fstrCountry] [varchar](4) NOT NULL,
	[fstrZipCode] [varchar](9) NOT NULL,
	[fstrCFirst] [varchar](20) NOT NULL,
	[fstrCMiddle] [varchar](1) NOT NULL,
	[fstrCLast] [varchar](25) NOT NULL,
	[fstrCSuffix] [varchar](4) NOT NULL,
	[fstrCSSN] [varchar](9) NOT NULL,
	[fblnPDeceased] [tinyint] NOT NULL,
	[fdtmPDeceased] [datetime] NOT NULL,
	[fblnSpDeceased] [tinyint] NOT NULL,
	[fdtmSpDeceased] [datetime] NOT NULL,
	[fintExemptions] [smallint] NOT NULL,
	[fblnExtension] [tinyint] NOT NULL,
	[fdtmExtension] [datetime] NOT NULL,
	[fintFilingStatus] [tinyint] NOT NULL,
	[fstrHOHDep] [varchar](50) NOT NULL,
	[fcurFedAGI] [money] NOT NULL,
	[fcurItemFedDed] [money] NOT NULL,
	[fcurTotFedAdd] [money] NOT NULL,
	[fcurFedStdItmDed] [money] NOT NULL,
	[fblnItemized] [tinyint] NOT NULL,
	[fcurFedExemption] [money] NOT NULL,
	[fcurNMLowDedn] [money] NOT NULL,
	[fcurFedDedns] [money] NOT NULL,
	[fcurMedicalCare] [money] NOT NULL,
	[fcurMedicalCareExp] [money] NOT NULL,
	[fcurNMTaxInc] [money] NOT NULL,
	[fcurNMIncomeTax] [money] NOT NULL,
	[fstrSchedule] [varchar](1) NOT NULL,
	[fcurLumpsum] [money] NOT NULL,
	[fcurOthStateCred] [money] NOT NULL,
	[fcurNonRefundable] [money] NOT NULL,
	[fcurNetIncomeTax] [money] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fcurFedNol] [money] NOT NULL,
 CONSTRAINT [PK_tblPit] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPit2]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPit2](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fcurNMNetTaxPass] [money] NOT NULL,
	[fcurTotalClaimed] [money] NOT NULL,
	[fcurWorkFamCred] [money] NOT NULL,
	[fcurFedEICredit] [money] NOT NULL,
	[fcurIncTaxWithheld] [money] NOT NULL,
	[fcurIncTaxWithOGP] [money] NOT NULL,
	[fcurIncTaxWithPTE] [money] NOT NULL,
	[fcurEstimatedPymt] [money] NOT NULL,
	[fcurOtherPayments] [money] NOT NULL,
	[fcurPaymtnCredits] [money] NOT NULL,
	[fcurTaxDue] [money] NOT NULL,
	[fcurEstPymtPenalty] [money] NOT NULL,
	[fstrPenaltyCalcMeth] [varchar](1) NOT NULL,
	[fcurPenalty] [money] NOT NULL,
	[fcurInterest] [money] NOT NULL,
	[fcurTotalDue] [money] NOT NULL,
	[fcurOverPayment] [money] NOT NULL,
	[fcurRefundDonations] [money] NOT NULL,
	[fcurAppliedEstTax] [money] NOT NULL,
	[fcurRefundAmount] [money] NOT NULL,
	[fstrRouting1Num] [varchar](9) NOT NULL,
	[fstrRoutingNumber] [varchar](9) NOT NULL,
	[fstrAccount1Num] [varchar](17) NOT NULL,
	[fstrAccountNumber] [varchar](17) NOT NULL,
	[fstrAccountType] [varchar](1) NOT NULL,
	[fblnAcctChk] [tinyint] NOT NULL,
	[fblnAcctSav] [tinyint] NOT NULL,
	[fblnIATFlag] [tinyint] NOT NULL,
	[fblnIATYes] [tinyint] NOT NULL,
	[fblnIATNo] [tinyint] NOT NULL,
	[fstrTPPhone] [varchar](10) NOT NULL,
	[fstrTPEmail] [varchar](80) NOT NULL,
	[fstrPrepCRS] [varchar](11) NOT NULL,
	[fstrPrepPTIN] [varchar](9) NOT NULL,
	[fstrPrepEIN] [varchar](9) NOT NULL,
	[fstrPrepPhone] [varchar](10) NOT NULL,
	[fbln41338Flg] [tinyint] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fcurTrfCrd] [money] NOT NULL,
	[fstrNMPin] [varchar](5) NOT NULL,
 CONSTRAINT [PK_tblPit2] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rfrCRDropDown]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rfrCRDropDown](
	[fstrFileType] [varchar](10) NOT NULL,
	[fstrCrdType] [varchar](4) NOT NULL,
	[fstrCrdName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_rfrCRDropDown] PRIMARY KEY CLUSTERED 
(
	[fstrFileType] ASC,
	[fstrCrdType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblFid]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblFid](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fstrFein] [varchar](9) NOT NULL,
	[fstrEstate] [varchar](40) NOT NULL,
	[fstrName] [varchar](40) NOT NULL,
	[fstrAddress] [varchar](40) NOT NULL,
	[fstrCity] [varchar](20) NOT NULL,
	[fstrState] [varchar](4) NOT NULL,
	[fstrCountry] [varchar](4) NOT NULL,
	[fstrZipCode] [varchar](9) NOT NULL,
	[fdtmPostMarkDate] [datetime] NOT NULL,
	[fdtmEstateCreate] [datetime] NOT NULL,
	[fdtmDistribution] [datetime] NOT NULL,
	[fblnFedAdjust] [tinyint] NOT NULL,
	[fintSpecCalc] [smallint] NOT NULL,
	[fdtmTaxYrBeg] [datetime] NOT NULL,
	[fdtmTaxYrEnd] [datetime] NOT NULL,
	[fblnAmended] [tinyint] NOT NULL,
	[fblnEstate] [tinyint] NOT NULL,
	[fblnSimple] [tinyint] NOT NULL,
	[fblnComplex] [tinyint] NOT NULL,
	[fblnNMResident] [tinyint] NOT NULL,
	[fdtmExtDueDate] [datetime] NOT NULL,
	[fcurFedTaxInc] [money] NOT NULL,
	[fcurFedIncAdd] [money] NOT NULL,
	[fcurFedIncDed] [money] NOT NULL,
	[fcurNMTaxable] [money] NOT NULL,
	[fcurGrossTaxDue] [money] NOT NULL,
	[fcurNMPercent] [decimal](18, 4) NOT NULL,
	[fcurNMIncTax] [money] NOT NULL,
	[fcurLumpSumTax] [money] NOT NULL,
	[fcurTotNMTax] [money] NOT NULL,
	[fcurTaxPdOthState] [money] NOT NULL,
	[fcurCredApplied] [money] NOT NULL,
	[fcurNetNMTax] [money] NOT NULL,
	[fcurTotPymts] [money] NOT NULL,
	[fcurNMWithHold] [money] NOT NULL,
	[fcurNMWithOGP] [money] NOT NULL,
	[fcurNMWithPass] [money] NOT NULL,
	[fcurNMWithTotBen] [money] NOT NULL,
	[fcurPymtWithTot] [money] NOT NULL,
	[fcurTaxDue] [money] NOT NULL,
	[fcurPenalty] [money] NOT NULL,
	[fcurInterest] [money] NOT NULL,
	[fcurTotalDue] [money] NOT NULL,
	[fcurOvpymt] [money] NOT NULL,
	[fcurApplyOvpymt] [money] NOT NULL,
	[fcurRefOvpymt] [money] NOT NULL,
	[fcurRefRenewEner] [money] NOT NULL,
	[fcurTotRefCrd] [money] NOT NULL,
	[fcurRefFilmProd] [money] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fcurFedNol] [money] NOT NULL,
	[fcurTrfCrd] [money] NOT NULL,
 CONSTRAINT [PK_tblFid] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblScorpCR]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblScorpCR](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fcurCRChildCare] [money] NOT NULL,
	[fcurCRCultProp] [money] NOT NULL,
	[fcurCRBusFac] [money] NOT NULL,
	[fcurCRInterGov] [money] NOT NULL,
	[fcurCRRuralJob] [money] NOT NULL,
	[fcurCRTechJobs] [money] NOT NULL,
	[fcurCRElecCard] [money] NOT NULL,
	[fcurCRJobMentor] [money] NOT NULL,
	[fcurCRLandCons] [money] NOT NULL,
	[fcurCRAffordHouse] [money] NOT NULL,
	[fcurCRBioDiesel] [money] NOT NULL,
	[fcurCRSusBldg] [money] NOT NULL,
	[fcurCRAdvEnergy] [money] NOT NULL,
	[fcurCRWaterCons] [money] NOT NULL,
	[fcurCRGeolPump] [money] NOT NULL,
	[fcurCRAgrBioMass] [money] NOT NULL,
	[fcurCRFilmApplied] [money] NOT NULL,
	[fcurCRFilmApproved] [money] NOT NULL,
	[fcurCRRenewEner] [money] NOT NULL,
	[fcurCRVetEmploy] [money] NOT NULL,
	[fcurCRTotalCredit] [money] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblSCorpCR] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblScorpCRS]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblScorpCRS](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[flngRepNum] [int] NOT NULL,
	[fstrCrdType] [varchar](4) NOT NULL,
	[fstrApprove] [varchar](20) NOT NULL,
	[fcurApplied] [money] NOT NULL,
	[fcurRefund] [money] NOT NULL,
	[fblnFilled] [tinyint] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fstrMPDLN] [varchar](300) NOT NULL,
	[fstrTaxForm] [varchar](63) NOT NULL,
	[fstrSource] [varchar](6) NOT NULL,
	[fblnFound] [tinyint] NOT NULL,
 CONSTRAINT [PK_tblScorpCRS] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC,
	[flngRepNum] ASC,
	[fblnFilled] ASC,
	[fstrMPDLN] ASC,
	[fstrTaxForm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblFidCR]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblFidCR](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fcurCRCultProp] [money] NOT NULL,
	[fcurCRBusFac] [money] NOT NULL,
	[fcurCRRuralJob] [money] NOT NULL,
	[fcurCRTechJob] [money] NOT NULL,
	[fcurCRElecCard] [money] NOT NULL,
	[fcurCRJobMentor] [money] NOT NULL,
	[fcurCRLandCons] [money] NOT NULL,
	[fcurCRAffHouse] [money] NOT NULL,
	[fcurCRSolarDev] [money] NOT NULL,
	[fcurCRBioDiesel] [money] NOT NULL,
	[fcurCRSusBldg] [money] NOT NULL,
	[fcurCRAngelInv] [money] NOT NULL,
	[fcurCRRuralHealth] [money] NOT NULL,
	[fcurCRWaterCons] [money] NOT NULL,
	[fcurCRAdvEnergy] [money] NOT NULL,
	[fcurCRGeothermal] [money] NOT NULL,
	[fcurCRAgrBioMass] [money] NOT NULL,
	[fcurCRFilmApplied] [money] NOT NULL,
	[fcurCRFilmApproved] [money] NOT NULL,
	[fcurCRRenewEner] [money] NOT NULL,
	[fcurCRCancer] [money] NOT NULL,
	[fcurCRVetEmploy] [money] NOT NULL,
	[fcurCRTotalCredit] [money] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblFidCR] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblScorpB]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblScorpB](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fcurBDividends] [money] NOT NULL,
	[fcurBNMDividends] [money] NOT NULL,
	[fcurBInterest] [money] NOT NULL,
	[fcurBNMInterest] [money] NOT NULL,
	[fcurBRents] [money] NOT NULL,
	[fcurBNMRents] [money] NOT NULL,
	[fcurBRoyalties] [money] NOT NULL,
	[fcurBNMRoyalties] [money] NOT NULL,
	[fcurBProfitLoss] [money] NOT NULL,
	[fcurBNMProfitLoss] [money] NOT NULL,
	[fcurBIncome] [money] NOT NULL,
	[fcurBNMIncome] [money] NOT NULL,
	[fcurBOthIncome] [money] NOT NULL,
	[fcurBNMOthIncome] [money] NOT NULL,
	[fcurBNetAlloc] [money] NOT NULL,
	[fcurBNMNetAlloc] [money] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblScorpB] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblO99S]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblO99S](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[flngRepNum] [int] NOT NULL,
	[fstrId] [varchar](9) NOT NULL,
	[fblnFein] [tinyint] NOT NULL,
	[fblnSsn] [tinyint] NOT NULL,
	[fstrName] [varchar](40) NOT NULL,
	[fstrStreet] [varchar](40) NOT NULL,
	[fstrCity] [varchar](20) NOT NULL,
	[fstrState] [varchar](4) NOT NULL,
	[fstrCountry] [varchar](4) NOT NULL,
	[fstrZipCode] [varchar](9) NOT NULL,
	[fblnOutSide] [tinyint] NOT NULL,
	[fcurReeNet] [money] NOT NULL,
	[fcurReeWth] [money] NOT NULL,
	[fblnFilled] [tinyint] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fstrMPDLN] [varchar](300) NOT NULL,
	[fstrTaxForm] [varchar](63) NOT NULL,
	[fstrSource] [varchar](6) NOT NULL,
	[fblnFound] [tinyint] NOT NULL,
 CONSTRAINT [PK_tblO99S] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC,
	[flngRepNum] ASC,
	[fblnFilled] ASC,
	[fstrTaxForm] ASC,
	[fstrMPDLN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblFidD]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblFidD](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fstrFein] [varchar](9) NOT NULL,
	[fcurNMNetIncome] [money] NOT NULL,
	[fblnAmend] [tinyint] NOT NULL,
	[fdtmPostMarkDate] [datetime] NOT NULL,
	[fstrName] [varchar](40) NOT NULL,
	[fstrStreet] [varchar](40) NOT NULL,
	[fstrCity] [varchar](20) NOT NULL,
	[fstrState] [varchar](4) NOT NULL,
	[fstrCountry] [varchar](4) NOT NULL,
	[fstrZipCode] [varchar](9) NOT NULL,
	[fblnPte] [tinyint] NOT NULL,
	[fblnScorp] [tinyint] NOT NULL,
	[fblnCit] [tinyint] NOT NULL,
	[fblnFid] [tinyint] NOT NULL,
	[fblnOth] [tinyint] NOT NULL,
	[fstrOthWhy] [varchar](40) NOT NULL,
	[fdtmTaxYrBeg] [datetime] NOT NULL,
	[fdtmTaxYrEnd] [datetime] NOT NULL,
	[fdtmTaxDue] [datetime] NOT NULL,
	[fdtmExtDue] [datetime] NOT NULL,
	[fcurWthPage] [money] NOT NULL,
	[fcurWthAll] [money] NOT NULL,
	[fcurWthOwn] [money] NOT NULL,
	[fcurWthPte] [money] NOT NULL,
	[fcurSubTotal] [money] NOT NULL,
	[fcurPenalty] [money] NOT NULL,
	[fcurInterest] [money] NOT NULL,
	[fcurTotalDue] [money] NOT NULL,
	[fdtmSigned] [datetime] NOT NULL,
	[fstrPhone] [varchar](10) NOT NULL,
	[fstrEmail] [varchar](80) NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblFidD] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblBatchInfo]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblBatchInfo](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[fstrTaxProgram] [varchar](3) NOT NULL,
	[fstrBatchSource] [varchar](10) NOT NULL,
	[fstrBatchType] [varchar](50) NOT NULL,
	[fstrForm] [varchar](50) NOT NULL,
	[fstrDLN] [varchar](30) NOT NULL,
	[fintBatchCount] [int] NOT NULL,
	[fcurBatchAmount] [money] NOT NULL,
	[fintHeaderCount] [int] NOT NULL,
	[fcurHeaderAmount] [money] NOT NULL,
	[fintRejectCount] [int] NOT NULL,
	[fcurRejectAmount] [money] NOT NULL,
	[fstrBatchUploaded] [char](1) NOT NULL,
	[fdtmBatchUploaded] [datetime] NOT NULL,
	[fstrPaymentUploaded] [char](1) NOT NULL,
	[fdtmPaymentUploaded] [datetime] NOT NULL,
	[fdtmBatchCreated] [datetime] NOT NULL,
	[fdtmReceivedDate] [datetime] NOT NULL,
	[fdtmDepositDate] [datetime] NOT NULL,
	[fdtmPostmarkDate] [datetime] NOT NULL,
	[fstrBatchStatus] [char](1) NOT NULL,
	[fstrBatchUser] [varchar](50) NOT NULL,
	[fstrTimelyBatch] [char](1) NOT NULL,
	[fstrImageUploaded] [char](1) NOT NULL,
	[fdtmImageUploaded] [datetime] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fdtmAssigned] [datetime] NOT NULL,
 CONSTRAINT [PK_TblBatchInfo] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fstrTaxProgram] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'E-EDCR,K-KFI' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblBatchInfo', @level2type=N'COLUMN',@level2name=N'fstrBatchSource'
GO
/****** Object:  Table [dbo].[tblPitB2]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPitB2](
	[fstrBatchId] [char](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fstrMPDLN] [varchar](300) NOT NULL,
	[fstrB2Fein] [varchar](9) NOT NULL,
	[fstrB2Crs] [varchar](11) NOT NULL,
	[fstrB2Name] [varchar](40) NOT NULL,
	[fstrB2Street] [varchar](40) NOT NULL,
	[fstrB2City] [varchar](20) NOT NULL,
	[fstrB2State] [varchar](2) NOT NULL,
	[fstrB2Country] [varchar](4) NOT NULL,
	[fstrB2ZipCode] [varchar](9) NOT NULL,
	[fcurB2Property] [money] NOT NULL,
	[fcurB2NMProperty] [money] NOT NULL,
	[fcurB2PropertyFactor] [decimal](4, 3) NOT NULL,
	[fcurB2Payroll] [money] NOT NULL,
	[fcurB2NMPayroll] [money] NOT NULL,
	[fcurB2PayrollFactor] [decimal](4, 3) NOT NULL,
	[fcurB2Sales] [money] NOT NULL,
	[fcurB2NMSales] [money] NOT NULL,
	[fcurB2SalesFactor] [decimal](4, 3) NOT NULL,
	[fcurB2TotalFactor] [decimal](4, 3) NOT NULL,
	[fcurB2AvgFactor] [decimal](4, 3) NOT NULL,
	[fdtmB2ManufDate] [datetime] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fdtmB2Election] [datetime] NOT NULL,
 CONSTRAINT [PK_tblPitB2] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC,
	[fstrMPDLN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblBInfo2]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblBInfo2](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[fstrTaxProgram] [varchar](3) NOT NULL,
	[fstrBatchSource] [varchar](10) NOT NULL,
	[fstrBatchType] [varchar](50) NOT NULL,
	[fstrForm] [varchar](50) NOT NULL,
	[fstrDLN] [varchar](30) NOT NULL,
	[fintBatchCount] [int] NOT NULL,
	[fcurBatchAmount] [money] NOT NULL,
	[fintHeaderCount] [int] NOT NULL,
	[fcurHeaderAmount] [money] NOT NULL,
	[fintRejectCount] [int] NOT NULL,
	[fcurRejectAmount] [money] NOT NULL,
	[fstrBatchUploaded] [char](1) NOT NULL,
	[fdtmBatchUploaded] [datetime] NOT NULL,
	[fstrPaymentUploaded] [char](1) NOT NULL,
	[fdtmPaymentUploaded] [datetime] NOT NULL,
	[fdtmBatchCreated] [datetime] NOT NULL,
	[fdtmReceivedDate] [datetime] NOT NULL,
	[fdtmDepositDate] [datetime] NOT NULL,
	[fdtmPostmarkDate] [datetime] NOT NULL,
	[fstrBatchStatus] [char](1) NOT NULL,
	[fstrBatchUser] [varchar](50) NOT NULL,
	[fstrTimelyBatch] [char](1) NOT NULL,
	[fstrImageUploaded] [char](1) NOT NULL,
	[fdtmImageUploaded] [datetime] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fdtmAssigned] [datetime] NOT NULL,
 CONSTRAINT [PK_TblBInfo2] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fstrTaxProgram] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rfrPitRcLic]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rfrPitRcLic](
	[fstrTaxYear] [float] NULL,
	[fcurLower] [float] NULL,
	[fcurUpper] [float] NULL,
	[fcurExmpt1] [float] NULL,
	[fcurExmpt2] [float] NULL,
	[fcurExmpt3] [float] NULL,
	[fcurExmpt4] [float] NULL,
	[fcurExmpt5] [float] NULL,
	[fcurExmpt6] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCitA]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCitA](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fblnAChgReport] [tinyint] NOT NULL,
	[fdtmAManufacture] [datetime] NOT NULL,
	[fcurANMNetTaxInc] [money] NOT NULL,
	[fcurANetAllocInc] [money] NOT NULL,
	[fcurAApportInc] [money] NOT NULL,
	[fcurANMApportInc] [money] NOT NULL,
	[fcurAInventory] [money] NOT NULL,
	[fcurANMInventory] [money] NOT NULL,
	[fcurARealProperty] [money] NOT NULL,
	[fcurANMRealProperty] [money] NOT NULL,
	[fcurAPerProperty] [money] NOT NULL,
	[fcurANMPerProperty] [money] NOT NULL,
	[fcurARentProperty] [money] NOT NULL,
	[fcurANMRentProperty] [money] NOT NULL,
	[fcurATotalProperty] [money] NOT NULL,
	[fcurANMTotalProperty] [money] NOT NULL,
	[fcurAPropertyFactor] [decimal](18, 4) NOT NULL,
	[fcurATotalPayRoll] [money] NOT NULL,
	[fcurANMPayRoll] [money] NOT NULL,
	[fcurAPayRollFactor] [decimal](18, 4) NOT NULL,
	[fcurASales] [money] NOT NULL,
	[fcurANMSales] [money] NOT NULL,
	[fcurASalesFactor] [decimal](18, 4) NOT NULL,
	[fcurATotalFactors] [decimal](18, 4) NOT NULL,
	[fcurAAvgFactor] [decimal](18, 4) NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fdtmAElection] [datetime] NOT NULL,
 CONSTRAINT [PK_tblCitA] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rfrControls]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rfrControls](
	[IDrfrControls] [int] IDENTITY(1,1) NOT NULL,
	[fstrFileType] [varchar](10) NOT NULL,
	[fstrDocName] [varchar](50) NOT NULL,
	[fstrInputID] [varchar](50) NOT NULL,
	[fstrTaxProgram] [varchar](3) NULL,
	[flngTaxYear] [int] NULL,
	[fstrTaxForm] [varchar](30) NULL,
	[flngOrder] [int] NULL,
	[fstrTable] [varchar](50) NULL,
	[fstrColumn] [varchar](50) NULL,
	[fstrFormat] [varchar](50) NOT NULL,
	[flngDispLength] [int] NULL,
	[flngMaxLength] [int] NULL,
	[fblnHidden] [tinyint] NULL,
	[fblnRequired] [tinyint] NULL,
	[flngVBVarType] [int] NOT NULL,
	[flngBlock] [int] NULL,
	[fblnPostBack] [tinyint] NOT NULL,
	[fblnVertSkip] [tinyint] NULL,
	[fstrLabel] [varchar](50) NULL,
	[fblnActive] [tinyint] NULL,
	[flngCtrlMove] [int] NULL,
	[flngImgMoveX] [int] NULL,
	[flngImgMoveY] [int] NULL,
	[flngMarkerMoveX] [int] NULL,
	[flngMarkerMoveY] [int] NULL,
	[fstrNextCtrl] [varchar](50) NULL,
	[flngFormatIDFK] [int] NULL,
	[fstrTranslate] [varchar](50) NULL,
	[flngClipTop] [int] NULL,
	[flngClipRight] [int] NULL,
	[flngClipBottom] [int] NULL,
	[flngClipLeft] [int] NULL,
	[fstrBlockHeader] [varchar](256) NULL,
	[fstrFormType] [varchar](2) NULL,
	[flngControlHeadersIDFK] [int] NULL,
	[fblnPtdAddition] [tinyint] NOT NULL,
 CONSTRAINT [PK_rfrControls] PRIMARY KEY CLUSTERED 
(
	[IDrfrControls] ASC,
	[fstrFileType] ASC,
	[fstrDocName] ASC,
	[fstrInputID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblFidB]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblFidB](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fcurBGrsDiv] [money] NOT NULL,
	[fcurBDstDiv] [money] NOT NULL,
	[fcurBNetDiv] [money] NOT NULL,
	[fcurBAlcDiv] [money] NOT NULL,
	[fcurBGrsInt] [money] NOT NULL,
	[fcurBDstInt] [money] NOT NULL,
	[fcurBNetInt] [money] NOT NULL,
	[fcurBAlcInt] [money] NOT NULL,
	[fcurBGrsFid] [money] NOT NULL,
	[fcurBDstFid] [money] NOT NULL,
	[fcurBNetFid] [money] NOT NULL,
	[fcurBAlcFid] [money] NOT NULL,
	[fcurBGrsRR] [money] NOT NULL,
	[fcurBDstRR] [money] NOT NULL,
	[fcurBNetRR] [money] NOT NULL,
	[fcurBAlcRR] [money] NOT NULL,
	[fcurBGrsPL] [money] NOT NULL,
	[fcurBDstPL] [money] NOT NULL,
	[fcurBNetPL] [money] NOT NULL,
	[fcurBAlcPL] [money] NOT NULL,
	[fcurBNetFarm] [money] NOT NULL,
	[fcurBAlcFarm] [money] NOT NULL,
	[fcurBGrsOth] [money] NOT NULL,
	[fcurBDstOth] [money] NOT NULL,
	[fcurBNetOth] [money] NOT NULL,
	[fcurBAlcOth] [money] NOT NULL,
	[fcurBGrsTot] [money] NOT NULL,
	[fcurBDstTot] [money] NOT NULL,
	[fcurBNetTot] [money] NOT NULL,
	[fcurBAlcTot] [money] NOT NULL,
	[fcurBAllocPercent] [decimal](18, 4) NOT NULL,
	[fcurBNetExemp] [money] NOT NULL,
	[fcurBAlcExemp] [money] NOT NULL,
	[fcurBNetDist] [money] NOT NULL,
	[fcurBAlcDist] [money] NOT NULL,
	[fcurBNetODed] [money] NOT NULL,
	[fcurBAlcODed] [money] NOT NULL,
	[fcurBNetTTotal] [money] NOT NULL,
	[fcurBAlcTTotal] [money] NOT NULL,
	[fcurBNetTax] [money] NOT NULL,
	[fcurBAlcTax] [money] NOT NULL,
	[fcurBNetLump] [money] NOT NULL,
	[fcurBAlcLump] [money] NOT NULL,
	[fcurBNetTotTax] [money] NOT NULL,
	[fcurBAlcTotTax] [money] NOT NULL,
	[fcurBNMIncPercent] [decimal](18, 4) NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fcurBGrDiv] [money] NOT NULL,
	[fcurBReDiv] [money] NOT NULL,
	[fcurBGrInt] [money] NOT NULL,
	[fcurBReInt] [money] NOT NULL,
	[fcurBGrFid] [money] NOT NULL,
	[fcurBReFid] [money] NOT NULL,
	[fcurBGrRR] [money] NOT NULL,
	[fcurBReRR] [money] NOT NULL,
	[fcurBGrPL] [money] NOT NULL,
	[fcurBRePL] [money] NOT NULL,
	[fcurBGrOth] [money] NOT NULL,
	[fcurBReOth] [money] NOT NULL,
	[fcurBGrTot] [money] NOT NULL,
	[fcurBReTot] [money] NOT NULL,
 CONSTRAINT [PK_tblFidB] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPitD]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPitD](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fcurDOverPayment] [money] NOT NULL,
	[fcurDWildLife] [money] NOT NULL,
	[fcurDVetCemetery] [money] NOT NULL,
	[fcurDNMAbuseEd] [money] NOT NULL,
	[fcurDNMForest] [money] NOT NULL,
	[fcurDGuardMember] [money] NOT NULL,
	[fcurDKidParks] [money] NOT NULL,
	[fcurDAmyotrophic] [money] NOT NULL,
	[fcurDVietnam] [money] NOT NULL,
	[fintDPParty] [smallint] NOT NULL,
	[fintDSpParty] [smallint] NOT NULL,
	[fcurDPartyAmt] [money] NOT NULL,
	[fcurDVetFund] [money] NOT NULL,
	[fcurDLottery] [money] NOT NULL,
	[fcurDHorse] [money] NOT NULL,
	[fcurDTotalContrib] [money] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblPitD] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPtd]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPtd](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fstrFein] [varchar](9) NOT NULL,
	[fcurNMNetIncome] [money] NOT NULL,
	[fblnAmend] [tinyint] NOT NULL,
	[fdtmPostMarkDate] [datetime] NOT NULL,
	[fstrName] [varchar](40) NOT NULL,
	[fstrStreet] [varchar](40) NOT NULL,
	[fstrCity] [varchar](20) NOT NULL,
	[fstrState] [varchar](4) NOT NULL,
	[fstrCountry] [varchar](4) NOT NULL,
	[fstrZipCode] [varchar](9) NOT NULL,
	[fblnPte] [tinyint] NOT NULL,
	[fblnScorp] [tinyint] NOT NULL,
	[fblnCit] [tinyint] NOT NULL,
	[fblnFid] [tinyint] NOT NULL,
	[fblnOth] [tinyint] NOT NULL,
	[fstrOthWhy] [varchar](40) NOT NULL,
	[fdtmTaxYrBeg] [datetime] NOT NULL,
	[fdtmTaxYrEnd] [datetime] NOT NULL,
	[fdtmTaxDue] [datetime] NOT NULL,
	[fdtmExtDue] [datetime] NOT NULL,
	[fcurWthPage] [money] NOT NULL,
	[fcurWthAll] [money] NOT NULL,
	[fcurWthOwn] [money] NOT NULL,
	[fcurWthPte] [money] NOT NULL,
	[fcurSubTotal] [money] NOT NULL,
	[fcurPenalty] [money] NOT NULL,
	[fcurInterest] [money] NOT NULL,
	[fcurTotalDue] [money] NOT NULL,
	[fdtmSigned] [datetime] NOT NULL,
	[fstrPhone] [varchar](10) NOT NULL,
	[fstrEmail] [varchar](80) NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblPtd] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPitRC]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPitRC](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fblnRCPResident] [tinyint] NOT NULL,
	[fblnRCSpResident] [tinyint] NOT NULL,
	[fblnRCPPhyPresent] [tinyint] NOT NULL,
	[fblnRCSpPhyPresent] [tinyint] NOT NULL,
	[fblnRCPOthClaim] [tinyint] NOT NULL,
	[fblnRCSpOthClaim] [tinyint] NOT NULL,
	[fblnRCPInmate] [tinyint] NOT NULL,
	[fblnRCSpInmate] [tinyint] NOT NULL,
	[fintRCExemptions] [smallint] NOT NULL,
	[fintRCNotQualify] [smallint] NOT NULL,
	[fintRCAllowable] [smallint] NOT NULL,
	[fintRCExtraExempt] [smallint] NOT NULL,
	[fintRCTotalExempt] [smallint] NOT NULL,
	[fintRCPExempt65] [smallint] NOT NULL,
	[fintRCSpExempt65] [smallint] NOT NULL,
	[fintRCSubtotal] [smallint] NOT NULL,
	[fintRCMFSExempts] [smallint] NOT NULL,
	[fintRCTotExempts] [smallint] NOT NULL,
	[fcurRCWages] [money] NOT NULL,
	[fcurRCSSBenefits] [money] NOT NULL,
	[fcurRCUnemploy] [money] NOT NULL,
	[fcurRCPublicAssist] [money] NOT NULL,
	[fcurRCNetProfit] [money] NOT NULL,
	[fcurRCCapitalGains] [money] NOT NULL,
	[fcurRCGiftsofCash] [money] NOT NULL,
	[fcurRCOtherIncome] [money] NOT NULL,
	[fcurRCModifiedGross] [money] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblPitRC] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCitPtd]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCitPtd](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fstrFein] [varchar](9) NOT NULL,
	[fcurNMNetIncome] [money] NOT NULL,
	[fblnAmend] [tinyint] NOT NULL,
	[fdtmPostMarkDate] [datetime] NOT NULL,
	[fstrName] [varchar](40) NOT NULL,
	[fstrStreet] [varchar](40) NOT NULL,
	[fstrCity] [varchar](20) NOT NULL,
	[fstrState] [varchar](4) NOT NULL,
	[fstrCountry] [varchar](4) NOT NULL,
	[fstrZipCode] [varchar](9) NOT NULL,
	[fblnPte] [tinyint] NOT NULL,
	[fblnScorp] [tinyint] NOT NULL,
	[fblnCit] [tinyint] NOT NULL,
	[fblnFid] [tinyint] NOT NULL,
	[fblnOth] [tinyint] NOT NULL,
	[fstrOthWhy] [varchar](40) NOT NULL,
	[fdtmTaxYrBeg] [datetime] NOT NULL,
	[fdtmTaxYrEnd] [datetime] NOT NULL,
	[fdtmTaxDue] [datetime] NOT NULL,
	[fdtmExtDue] [datetime] NOT NULL,
	[fcurWthPage] [money] NOT NULL,
	[fcurWthAll] [money] NOT NULL,
	[fcurWthOwn] [money] NOT NULL,
	[fcurWthPte] [money] NOT NULL,
	[fcurSubTotal] [money] NOT NULL,
	[fcurPenalty] [money] NOT NULL,
	[fcurInterest] [money] NOT NULL,
	[fcurTotalDue] [money] NOT NULL,
	[fdtmSigned] [datetime] NOT NULL,
	[fstrPhone] [varchar](10) NOT NULL,
	[fstrEmail] [varchar](80) NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblCitPtd] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCitRPT]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCitRPT](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[flngRepNum] [int] NOT NULL,
	[fstrCorpName] [varchar](45) NOT NULL,
	[fstrCorpFEIN] [varchar](10) NOT NULL,
	[fstrPaymentApplied] [money] NOT NULL,
	[fstr50FranTax] [money] NOT NULL,
	[fblnFilled] [tinyint] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fstrState] [varchar](4) NOT NULL,
	[fstrCountry] [varchar](3) NOT NULL,
	[fcurTrfCrd] [money] NOT NULL,
 CONSTRAINT [PK_tblCitRPT] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC,
	[flngRepNum] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPitRC2]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPitRC2](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fcurRC2ModGross] [money] NOT NULL,
	[fcurRC2TotExemp] [money] NOT NULL,
	[fcurRC2LowRebate] [money] NOT NULL,
	[fcurRC2PropOwn65] [money] NOT NULL,
	[fcurRC2Rent65] [money] NOT NULL,
	[fblnRC2RentGov65] [tinyint] NOT NULL,
	[fcurRC2Multiply65] [money] NOT NULL,
	[fcurRC2Add65] [money] NOT NULL,
	[fcurRC2Find65] [money] NOT NULL,
	[fcurRC2Rebate65] [money] NOT NULL,
	[fblnRC2LACounty] [tinyint] NOT NULL,
	[fblnRC2SFCounty] [tinyint] NOT NULL,
	[fcurRC2PrpOwnLow] [money] NOT NULL,
	[fcurRC2FindLow] [money] NOT NULL,
	[fcurRC2RebateLow] [money] NOT NULL,
	[fcurRC2TotalColG] [money] NOT NULL,
	[fintRC2QualifyDep] [smallint] NOT NULL,
	[fcurRC2FedChildCare] [money] NOT NULL,
	[fcurRC2NMChildCare] [money] NOT NULL,
	[fcurRC2MedicalCare65] [money] NOT NULL,
	[fcurRC2AdoptionChild] [money] NOT NULL,
	[fcurRC2RenewEnergy] [money] NOT NULL,
	[fcurRC2FilmProd] [money] NOT NULL,
	[fcurRC2TotalClaimed] [money] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblPitRC2] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPitB]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPitB](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fdtmBPFrom] [datetime] NOT NULL,
	[fdtmBPTo] [datetime] NOT NULL,
	[fdtmBSpFrom] [datetime] NOT NULL,
	[fdtmBSpTo] [datetime] NOT NULL,
	[fblnBPMilitary] [tinyint] NOT NULL,
	[fblnBSpMilitary] [tinyint] NOT NULL,
	[fcurBWages] [money] NOT NULL,
	[fcurBNMWages] [money] NOT NULL,
	[fblnBCalc110] [tinyint] NOT NULL,
	[fcurBInterest] [money] NOT NULL,
	[fcurBNMInterest] [money] NOT NULL,
	[fcurBPensions] [money] NOT NULL,
	[fcurBNMPensions] [money] NOT NULL,
	[fcurBRents] [money] NOT NULL,
	[fcurBNMRents] [money] NOT NULL,
	[fcurBGains] [money] NOT NULL,
	[fcurBNMGains] [money] NOT NULL,
	[fcurBIncPte] [money] NOT NULL,
	[fcurBNMIncPte] [money] NOT NULL,
	[fcurBOthInc] [money] NOT NULL,
	[fcurBNMOthInc] [money] NOT NULL,
	[fcurBFarm] [money] NOT NULL,
	[fcurBNMFarm] [money] NOT NULL,
	[fcurBSubTotal] [money] NOT NULL,
	[fcurBNMSubTotal] [money] NOT NULL,
	[fcurBFedAdj] [money] NOT NULL,
	[fcurBNMFedAdj] [money] NOT NULL,
	[fcurBTotInc] [money] NOT NULL,
	[fcurBNMTotInc] [money] NOT NULL,
	[fcurBPercent] [decimal](4, 3) NOT NULL,
	[fcurBTaxTable] [money] NOT NULL,
	[fcurBFinalTax] [money] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblPitB] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rfrAddDoc]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rfrAddDoc](
	[fstrFileType] [varchar](10) NOT NULL,
	[fstrDocName] [varchar](10) NULL,
	[fstrValue] [varchar](20) NULL,
	[flngFunction] [int] NULL,
	[fblnActive] [tinyint] NOT NULL,
	[fblnPtdAddition] [tinyint] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPitCrsT]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPitCrsT](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fcurTotApplied1] [money] NOT NULL,
	[fcurTotRefund1] [money] NOT NULL,
	[fcurTotApplied2] [money] NOT NULL,
	[fcurTotRefund2] [money] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblPitCrsT] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[errMsg]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[errMsg](
	[IDerrMsg] [int] IDENTITY(1,1) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fstrWho] [varchar](50) NOT NULL,
	[fstrWhat] [text] NOT NULL,
	[fstrWhere] [varchar](400) NOT NULL,
	[fblnResolved] [tinyint] NOT NULL,
	[fstrResolveMsg] [varchar](400) NOT NULL,
 CONSTRAINT [PK_errMsg] PRIMARY KEY CLUSTERED 
(
	[IDerrMsg] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rfrDocType]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rfrDocType](
	[fstrDocType] [varchar](3) NOT NULL,
	[fstrDocDesc] [varchar](30) NOT NULL,
 CONSTRAINT [PK_rfrDocType] PRIMARY KEY CLUSTERED 
(
	[fstrDocType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCorresp]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCorresp](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fstrDocType] [varchar](3) NOT NULL,
	[fstrDocRefNbr] [varchar](30) NOT NULL,
	[fdtmPostMarkDate] [datetime] NULL,
	[fstrCrsWdtId] [varchar](11) NOT NULL,
	[fstrCitId] [varchar](11) NOT NULL,
	[fstrFein] [varchar](9) NOT NULL,
	[fstrSsn] [varchar](9) NOT NULL,
	[fstrProgramType] [varchar](3) NOT NULL,
	[fstrLocation] [varchar](10) NOT NULL,
	[fstrDLN] [varchar](30) NOT NULL,
	[fstrWho] [varchar](255) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblCorresp] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPteA]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPteA](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fcurAInventory] [money] NOT NULL,
	[fcurANMInventory] [money] NOT NULL,
	[fcurARealProperty] [money] NOT NULL,
	[fcurANMRealProperty] [money] NOT NULL,
	[fcurAPerProperty] [money] NOT NULL,
	[fcurANMPerProperty] [money] NOT NULL,
	[fcurARentProperty] [money] NOT NULL,
	[fcurANMRentProperty] [money] NOT NULL,
	[fcurATotalProperty] [money] NOT NULL,
	[fcurANMTotalProperty] [money] NOT NULL,
	[fcurAPropertyFactor] [decimal](18, 4) NOT NULL,
	[fcurATotalPayRoll] [money] NOT NULL,
	[fcurANMPayRoll] [money] NOT NULL,
	[fcurAPayRollFactor] [decimal](18, 4) NOT NULL,
	[fcurASales] [money] NOT NULL,
	[fcurANMSales] [money] NOT NULL,
	[fcurASalesFactor] [decimal](18, 4) NOT NULL,
	[fcurATotalFactors] [decimal](18, 4) NOT NULL,
	[fdtmATaxYearEnd] [datetime] NOT NULL,
	[fdtmAManufacture] [datetime] NOT NULL,
	[fcurAAvgFactor] [decimal](18, 4) NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblPteA] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblScorp]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblScorp](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fstrFein] [varchar](9) NOT NULL,
	[fstrCrsId] [varchar](11) NOT NULL,
	[fstrName] [varchar](40) NOT NULL,
	[fstrStreet] [varchar](40) NOT NULL,
	[fstrCity] [varchar](20) NOT NULL,
	[fstrState] [varchar](4) NOT NULL,
	[fstrCountry] [varchar](4) NOT NULL,
	[fstrZipCode] [varchar](9) NOT NULL,
	[fdtmTaxYrBeg] [datetime] NOT NULL,
	[fdtmTaxYrEnd] [datetime] NOT NULL,
	[fdtmExtDue] [datetime] NOT NULL,
	[fdtmPostMarkDate] [datetime] NOT NULL,
	[fstrNAICSCode] [varchar](6) NOT NULL,
	[fblnAmended] [tinyint] NOT NULL,
	[fdtmFinalReturn] [datetime] NOT NULL,
	[fblnImmune] [tinyint] NOT NULL,
	[fcurTaxableIncome] [money] NOT NULL,
	[fcurIncomeTax] [money] NOT NULL,
	[fcurNMPercent] [decimal](18, 4) NOT NULL,
	[fcurNMIncomeTax] [money] NOT NULL,
	[fcurNonRefCredits] [money] NOT NULL,
	[fcurNetIncomeTax] [money] NOT NULL,
	[fcurFranchiseTax] [money] NOT NULL,
	[fcurTotalIncome] [money] NOT NULL,
	[fcurRefundsReceived] [money] NOT NULL,
	[fcurSubTotal] [money] NOT NULL,
	[fblnPmtExtension] [tinyint] NOT NULL,
	[fblnPmtEstimated] [tinyint] NOT NULL,
	[fblnPmtPriorYear] [tinyint] NOT NULL,
	[fcurTotalPayment] [money] NOT NULL,
	[fcurTaxWithheldOGP] [money] NOT NULL,
	[fcurNMWithPass] [money] NOT NULL,
	[fcurNMWithTotBen] [money] NOT NULL,
	[fcurRefundCredits] [money] NOT NULL,
	[fcurTaxDue] [money] NOT NULL,
	[fcurPenalty] [money] NOT NULL,
	[fcurInterest] [money] NOT NULL,
	[fcurTotalDue] [money] NOT NULL,
	[fcurOverPayment] [money] NOT NULL,
	[fcurOvPaymtNextYr] [money] NOT NULL,
	[fcurOvPaymtRefund] [money] NOT NULL,
	[fcurRenewEner] [money] NOT NULL,
	[fcurRefundCrd] [money] NOT NULL,
	[fcurFilmProduction] [money] NOT NULL,
	[fstrRouting1Num] [varchar](9) NOT NULL,
	[fstrRoutingNum] [varchar](9) NOT NULL,
	[fstrAccount1Num] [varchar](17) NOT NULL,
	[fstrAccountNum] [varchar](17) NOT NULL,
	[fstrAccountType] [varchar](1) NOT NULL,
	[fblnAcctChk] [tinyint] NOT NULL,
	[fblnAcctSav] [tinyint] NOT NULL,
	[fblnIATFlag] [tinyint] NOT NULL,
	[fblnIATYes] [tinyint] NOT NULL,
	[fblnIATNo] [tinyint] NOT NULL,
	[fstrPhoneNo] [varchar](10) NOT NULL,
	[fstrTPEmailAdd] [varchar](80) NOT NULL,
	[fstrPrepCRSID] [varchar](11) NOT NULL,
	[fstrPrepFEIN] [varchar](9) NOT NULL,
	[fstrPrepSSNPTIN] [varchar](9) NOT NULL,
	[fstrPrepPhoneNum] [varchar](10) NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fcurTrfCrd] [money] NOT NULL,
	[fstrStateOrg] [varchar](40) NOT NULL,
	[fdtmDateOrg] [datetime] NOT NULL,
	[fdtmNMStart] [datetime] NOT NULL,
 CONSTRAINT [PK_tblScorp] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPitS]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPitS](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[flngRepNum] [int] NOT NULL,
	[fstrSDepName] [varchar](50) NOT NULL,
	[fstrSDepSSN] [varchar](9) NOT NULL,
	[fdtmSDepDOB] [datetime] NOT NULL,
	[fblnFilled] [tinyint] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fstrTaxForm] [varchar](63) NOT NULL,
 CONSTRAINT [PK_tblPitS] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC,
	[flngRepNum] ASC,
	[fblnFilled] ASC,
	[fstrTaxForm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblFidCrsT]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblFidCrsT](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fcurTotApplied1] [money] NOT NULL,
	[fcurTotRefund1] [money] NOT NULL,
	[fcurTotApplied2] [money] NOT NULL,
	[fcurTotRefund2] [money] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblFidCrsT] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rfrGkInstall]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rfrGkInstall](
	[rfrGkInstallID] [int] IDENTITY(1,1) NOT NULL,
	[IDrfrControls] [int] NOT NULL,
	[fstrFileType] [varchar](10) NOT NULL,
	[flngCmd] [int] NOT NULL,
	[fstrDocName] [varchar](50) NULL,
	[fstrInputID] [varchar](50) NULL,
	[fstrTaxProgram] [varchar](3) NULL,
	[flngTaxYear] [int] NULL,
	[fstrTaxForm] [varchar](30) NOT NULL,
	[flngOrder] [int] NOT NULL,
	[fstrTable] [varchar](50) NULL,
	[fstrColumn] [varchar](50) NULL,
	[fstrFormat] [varchar](50) NULL,
	[flngDispLength] [int] NULL,
	[flngMaxLength] [int] NULL,
	[fblnHidden] [tinyint] NULL,
	[fblnRequired] [tinyint] NULL,
	[flngVBVarType] [int] NULL,
	[flngBlock] [int] NOT NULL,
	[fblnPostBack] [tinyint] NULL,
	[fblnVertSkip] [tinyint] NULL,
	[fstrLabel] [varchar](50) NULL,
	[fblnActive] [tinyint] NULL,
	[flngCtrlMove] [int] NULL,
	[flngImgMoveX] [int] NULL,
	[flngImgMoveY] [int] NULL,
	[flngMarkerMoveX] [int] NULL,
	[flngMarkerMoveY] [int] NULL,
	[fstrNextCtrl] [varchar](50) NULL,
	[flngFormatIDFK] [int] NULL,
	[fstrTranslate] [varchar](50) NULL,
	[flngClipTop] [int] NULL,
	[flngClipRight] [int] NULL,
	[flngClipBottom] [int] NULL,
	[flngClipLeft] [int] NULL,
	[fstrBlockHeader] [varchar](256) NULL,
	[fstrFormType] [varchar](1) NULL,
	[flngControlHeadersIDFK] [int] NULL,
	[fblnPtdAddition] [tinyint] NULL,
	[fdtmFilingPeriod] [datetime] NULL,
	[fdtmDueDate] [datetime] NULL,
	[fdecConstant] [decimal](18, 4) NULL,
	[flngIdReturnHeaders] [int] NULL,
 CONSTRAINT [PK_rfrGKInstall] PRIMARY KEY CLUSTERED 
(
	[fstrFileType] ASC,
	[flngCmd] ASC,
	[fstrTaxForm] ASC,
	[flngBlock] ASC,
	[flngOrder] ASC,
	[rfrGkInstallID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOgdS]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOgdS](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[flngRepNum] [int] NOT NULL,
	[fstrId] [varchar](9) NOT NULL,
	[fblnFein] [tinyint] NOT NULL,
	[fblnSsn] [tinyint] NOT NULL,
	[fstrName] [varchar](40) NOT NULL,
	[fstrStreet] [varchar](40) NOT NULL,
	[fstrCity] [varchar](20) NOT NULL,
	[fstrState] [varchar](4) NOT NULL,
	[fstrCountry] [varchar](4) NOT NULL,
	[fstrZipCode] [varchar](9) NOT NULL,
	[fblnOutSide] [tinyint] NOT NULL,
	[fcurReeNet] [money] NOT NULL,
	[fcurReeWth] [money] NOT NULL,
	[fblnFilled] [tinyint] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fstrMPDLN] [varchar](300) NOT NULL,
	[fstrTaxForm] [varchar](63) NOT NULL,
	[fstrSource] [varchar](6) NOT NULL,
	[fblnFound] [tinyint] NOT NULL,
 CONSTRAINT [PK_tblOgdS] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC,
	[flngRepNum] ASC,
	[fblnFilled] ASC,
	[fstrTaxForm] ASC,
	[fstrMPDLN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblScorpCrsT]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblScorpCrsT](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fcurTotApplied1] [money] NOT NULL,
	[fcurTotRefund1] [money] NOT NULL,
	[fcurTotApplied2] [money] NOT NULL,
	[fcurTotRefund2] [money] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblScorpCrsT] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblScorp1]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblScorp1](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fcurOrdIncomeLoss] [money] NOT NULL,
	[fcurOthIncomeLoss] [money] NOT NULL,
	[fcurIntIncome] [money] NOT NULL,
	[fcurIncomeSubtotal] [money] NOT NULL,
	[fcurIntUSOblig] [money] NOT NULL,
	[fcurAllowDeducts] [money] NOT NULL,
	[fcurAllocIncome] [money] NOT NULL,
	[fcurApportIncome] [money] NOT NULL,
	[fcurAverNMPercent] [decimal](18, 4) NOT NULL,
	[fcurNMApportIncome] [money] NOT NULL,
	[fcurNMAllocIncome] [money] NOT NULL,
	[fcurNMTaxableIncome] [money] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblScorp1] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblExtError]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblExtError](
	[fstrExtPgm] [varchar](10) NOT NULL,
	[fstrBatchId] [varchar](10) NOT NULL,
	[fintJobId] [int] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fstrFileType] [varchar](10) NOT NULL,
	[fstrTaxProgram] [varchar](3) NOT NULL,
	[fstrTaxYear] [varchar](50) NOT NULL,
	[fstrErrMsg] [varchar](50) NOT NULL,
	[fstrImgPath] [varchar](300) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fblnActive] [tinyint] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPtePtdS]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPtePtdS](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[flngRepNum] [int] NOT NULL,
	[fstrId] [varchar](9) NOT NULL,
	[fblnFein] [tinyint] NOT NULL,
	[fblnSsn] [tinyint] NOT NULL,
	[fstrName] [varchar](40) NOT NULL,
	[fstrStreet] [varchar](40) NOT NULL,
	[fstrCity] [varchar](20) NOT NULL,
	[fstrState] [varchar](4) NOT NULL,
	[fstrCountry] [varchar](4) NOT NULL,
	[fstrZipCode] [varchar](9) NOT NULL,
	[fblnOutSide] [tinyint] NOT NULL,
	[fcurOwnNet] [money] NOT NULL,
	[fcurOwnWth] [money] NOT NULL,
	[fbln41353] [tinyint] NOT NULL,
	[fblnFilled] [tinyint] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fstrMPDLN] [varchar](300) NOT NULL,
	[fstrTaxForm] [varchar](63) NOT NULL,
	[fstrSource] [varchar](6) NOT NULL,
	[fblnFound] [tinyint] NOT NULL,
 CONSTRAINT [PK_tblPtePtdS] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC,
	[flngRepNum] ASC,
	[fblnFilled] ASC,
	[fstrTaxForm] ASC,
	[fstrMPDLN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblFidB2]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblFidB2](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fcurB2Inventory] [money] NOT NULL,
	[fcurB2NMInventory] [money] NOT NULL,
	[fcurB2Real] [money] NOT NULL,
	[fcurB2NMReal] [money] NOT NULL,
	[fcurB2Rented] [money] NOT NULL,
	[fcurB2NMRented] [money] NOT NULL,
	[fcurB2Property] [money] NOT NULL,
	[fcurB2NMProperty] [money] NOT NULL,
	[fcurB2PropertyFactor] [decimal](18, 4) NOT NULL,
	[fcurB2Payroll] [money] NOT NULL,
	[fcurB2NMPayroll] [money] NOT NULL,
	[fcurB2PayrollFactor] [decimal](18, 4) NOT NULL,
	[fcurB2Sales] [money] NOT NULL,
	[fcurB2NMSales] [money] NOT NULL,
	[fcurB2SalesFactor] [decimal](18, 4) NOT NULL,
	[fcurB2TotFactor] [decimal](18, 4) NOT NULL,
	[fcurB2AvgFactor] [decimal](18, 4) NOT NULL,
	[fdtmB2ApportDate] [datetime] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fcurB2Personal] [money] NOT NULL,
	[fcurB2NMPersonal] [money] NOT NULL,
	[fdtmB2Election] [datetime] NOT NULL,
 CONSTRAINT [PK_tblFidB2] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblBatchImage]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblBatchImage](
	[fstrTaxProgram] [varchar](3) NOT NULL,
	[fstrBatchSource] [varchar](10) NULL,
	[fstrBatchID] [varchar](10) NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fdtmScanDate] [datetime] NULL,
	[fstrImageDocID] [varchar](5) NULL,
	[fstrID] [varchar](20) NULL,
	[fstrID2] [varchar](20) NULL,
	[fstrID3] [varchar](20) NULL,
	[fstrDLN] [varchar](30) NULL,
	[fstrFormName] [varchar](50) NULL,
	[fstrDir] [varchar](128) NULL,
	[fstrFile] [varchar](128) NULL,
	[fstrImagePath] [varchar](300) NULL,
	[fstrBatchName] [varchar](80) NULL,
	[flngPosInBatch] [int] NOT NULL,
	[flngImgWnd] [int] NULL,
	[flngCamera] [int] NOT NULL,
	[fstrBarData] [varchar](80) NULL,
	[flngLevelID] [int] NULL,
	[fstrFormCode] [varchar](10) NULL,
	[fstrFormOCR] [varchar](50) NULL,
	[fstrFormIdentified] [varchar](50) NULL,
	[fstrFormConfirmed] [varchar](50) NULL,
	[fstrVendorCode] [varchar](10) NULL,
	[flngImageWidth] [int] NULL,
	[flngImageHeight] [int] NULL,
	[flngImageSize] [int] NULL,
	[flngImageDPI] [int] NULL,
	[fblnImageFolderMissing] [bit] NULL,
	[fblnImageFileMissing] [bit] NULL,
	[fblnImageBlankSizeCheck] [bit] NULL,
	[fblnImageBlankSizeCompare] [bit] NULL,
	[fblnImageBlankMiniCheck] [bit] NULL,
	[fblnImageBlankUserCheck] [bit] NULL,
	[fdtmImageCheckedOut] [datetime] NULL,
	[fdtmImageCheckedIn] [datetime] NULL,
	[fstrStatus] [varchar](50) NULL,
	[fstrWho] [varchar](50) NULL,
	[fdtmWhen] [datetime] NULL,
	[fblnPtdAddition] [tinyint] NOT NULL,
 CONSTRAINT [PK_tblBatchImage] PRIMARY KEY CLUSTERED 
(
	[flngPosInBatch] ASC,
	[fstrBatchID] ASC,
	[flngSequence] ASC,
	[fstrTaxProgram] ASC,
	[flngCamera] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblScorpC]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblScorpC](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fcurCCapital] [money] NOT NULL,
	[fcurCNMCapital] [money] NOT NULL,
	[fcurCPassive] [money] NOT NULL,
	[fcurCNMPassive] [money] NOT NULL,
	[fcurCNetRecognized] [money] NOT NULL,
	[fcurCNMNetRecognized] [money] NOT NULL,
	[fcurCtotal] [money] NOT NULL,
	[fcurCNMtotal] [money] NOT NULL,
	[fcurCNMPerctage] [decimal](18, 4) NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblScorpC] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblO85S]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblO85S](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[flngRepNum] [int] NOT NULL,
	[fstrId] [varchar](9) NOT NULL,
	[fblnFein] [tinyint] NOT NULL,
	[fblnSsn] [tinyint] NOT NULL,
	[fstrName] [varchar](40) NOT NULL,
	[fstrStreet] [varchar](40) NOT NULL,
	[fstrCity] [varchar](20) NOT NULL,
	[fstrState] [varchar](4) NOT NULL,
	[fstrCountry] [varchar](4) NOT NULL,
	[fstrZipCode] [varchar](9) NOT NULL,
	[fblnOutSide] [tinyint] NOT NULL,
	[fcurReeNet] [money] NOT NULL,
	[fcurReeWth] [money] NOT NULL,
	[fblnFilled] [tinyint] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fstrMPDLN] [varchar](300) NOT NULL,
	[fstrTaxForm] [varchar](63) NOT NULL,
	[fstrSource] [varchar](6) NOT NULL,
	[fblnFound] [tinyint] NOT NULL,
 CONSTRAINT [PK_tblO85S] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC,
	[flngRepNum] ASC,
	[fblnFilled] ASC,
	[fstrTaxForm] ASC,
	[fstrMPDLN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPitAdj]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPitAdj](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fcurAjFedTaxBonds] [money] NOT NULL,
	[fcurAjNOLAddition] [money] NOT NULL,
	[fcurAjCollegeTerm] [money] NOT NULL,
	[fcurAjLandCons] [money] NOT NULL,
	[fcurAjTotalAdd] [money] NOT NULL,
	[fcurAjIntDiv] [money] NOT NULL,
	[fcurAjNMNOL] [money] NOT NULL,
	[fcurAjIntUSGovt] [money] NOT NULL,
	[fcurAjRailRoad] [money] NOT NULL,
	[fcurAjIndianLand] [money] NOT NULL,
	[fstrAjPrimeTribe] [varchar](50) NOT NULL,
	[fstrAjSpouseTribe] [varchar](50) NOT NULL,
	[fblnAjPrime100] [tinyint] NOT NULL,
	[fblnAjSpouse100] [tinyint] NOT NULL,
	[fcurAj100Years] [money] NOT NULL,
	[fcurAj65orBlind] [money] NOT NULL,
	[fcurAjNMMedCare] [money] NOT NULL,
	[fcurAjNMEdnTrust] [money] NOT NULL,
	[fcurAjNetCapGains] [money] NOT NULL,
	[fcurAjMilitary] [money] NOT NULL,
	[fcurAjNMMedical65] [money] NOT NULL,
	[fcurAjOrganDon] [money] NOT NULL,
	[fcurAjNMNatlGuard] [money] NOT NULL,
	[fcurAjStateLocTax] [money] NOT NULL,
	[fcurAjTotalDeduct] [money] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fcurAjActDutyPay] [money] NOT NULL,
 CONSTRAINT [PK_tblPitAdj] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPitCR]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPitCR](
	[fstrBatchID] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fcurCRCultProp] [money] NOT NULL,
	[fcurCRBusFac] [money] NOT NULL,
	[fcurCRRuralJob] [money] NOT NULL,
	[fcurCRTechJobs] [money] NOT NULL,
	[fcurCRElecCard] [money] NOT NULL,
	[fcurCRJobMentor] [money] NOT NULL,
	[fcurCRLandCons] [money] NOT NULL,
	[fcurCRAffordHouse] [money] NOT NULL,
	[fcurCRSolarDev] [money] NOT NULL,
	[fcurCRBioDiesel] [money] NOT NULL,
	[fcurCRSusBldg] [money] NOT NULL,
	[fcurCRAngelInv] [money] NOT NULL,
	[fcurCRHealthCare] [money] NOT NULL,
	[fcurCRWaterCons] [money] NOT NULL,
	[fcurCRAdvEnergy] [money] NOT NULL,
	[fcurCRGeolPump] [money] NOT NULL,
	[fcurCRBiomass] [money] NOT NULL,
	[fcurCRFilmApplied] [money] NOT NULL,
	[fcurCRFilmApproved] [money] NOT NULL,
	[fcurCRCancerTrial] [money] NOT NULL,
	[fcurCRVetEmploy] [money] NOT NULL,
	[fcurCRTotalCredits] [money] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblPitCR] PRIMARY KEY CLUSTERED 
(
	[fstrBatchID] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rfrControlHeaders]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rfrControlHeaders](
	[idControlHeaders] [int] IDENTITY(1,1) NOT NULL,
	[fstrFileType] [varchar](10) NOT NULL,
	[fstrTaxProgram] [varchar](3) NOT NULL,
	[flngTaxYear] [int] NOT NULL,
	[fstrTaxForm] [varchar](30) NOT NULL,
	[fstrBlockTitle] [varchar](50) NOT NULL,
	[flngBlock] [int] NOT NULL,
	[fstrTable] [varchar](50) NOT NULL,
	[flngClipTop] [int] NOT NULL,
	[flngClipRight] [int] NOT NULL,
	[flngClipBottom] [int] NOT NULL,
	[flngClipLeft] [int] NOT NULL,
	[fstrTemplateImage] [varchar](256) NOT NULL,
	[fintZoomPerc] [int] NOT NULL,
	[fstrFormType] [varchar](2) NOT NULL,
	[flngRepeatOffset] [int] NOT NULL,
	[flngHeaderStart] [int] NOT NULL,
	[flngReturnHeadersIDFK] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOgd]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOgd](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[fblnFein] [tinyint] NOT NULL,
	[fblnSsn] [tinyint] NOT NULL,
	[fstrID] [varchar](9) NOT NULL,
	[fcurTotalDue] [money] NOT NULL,
	[fblnAmend] [tinyint] NOT NULL,
	[fdtmPostMarkDate] [datetime] NOT NULL,
	[fstrName] [varchar](40) NOT NULL,
	[fstrStreet] [varchar](40) NOT NULL,
	[fstrCity] [varchar](20) NOT NULL,
	[fstrState] [varchar](4) NOT NULL,
	[fstrCountry] [varchar](4) NOT NULL,
	[fstrZipCode] [varchar](9) NOT NULL,
	[fcurPage] [money] NOT NULL,
	[fcurAllPage] [money] NOT NULL,
	[fdtmSigned] [datetime] NOT NULL,
	[fstrPhone] [varchar](10) NOT NULL,
	[fstrEmail] [varchar](80) NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fblnFound] [tinyint] NOT NULL,
 CONSTRAINT [PK_tblOgd] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCitPtdS]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCitPtdS](
	[fstrBatchId] [varchar](10) NOT NULL,
	[fdtmBatchDate] [datetime] NOT NULL,
	[flngSequence] [int] NOT NULL,
	[flngRepNum] [int] NOT NULL,
	[fstrId] [varchar](9) NOT NULL,
	[fblnFein] [tinyint] NOT NULL,
	[fblnSsn] [tinyint] NOT NULL,
	[fstrName] [varchar](40) NOT NULL,
	[fstrStreet] [varchar](40) NOT NULL,
	[fstrCity] [varchar](20) NOT NULL,
	[fstrState] [varchar](4) NOT NULL,
	[fstrCountry] [varchar](4) NOT NULL,
	[fstrZipCode] [varchar](9) NOT NULL,
	[fblnOutSide] [tinyint] NOT NULL,
	[fcurOwnNet] [money] NOT NULL,
	[fcurOwnWth] [money] NOT NULL,
	[fbln41353] [tinyint] NOT NULL,
	[fblnFilled] [tinyint] NOT NULL,
	[fstrWho] [varchar](256) NOT NULL,
	[fdtmWhen] [datetime] NOT NULL,
	[fstrMPDLN] [varchar](300) NOT NULL,
	[fstrTaxForm] [varchar](63) NOT NULL,
	[fstrSource] [varchar](6) NOT NULL,
	[fblnFound] [tinyint] NOT NULL,
 CONSTRAINT [PK_tblCitPtdS] PRIMARY KEY CLUSTERED 
(
	[fstrBatchId] ASC,
	[fdtmBatchDate] ASC,
	[flngSequence] ASC,
	[flngRepNum] ASC,
	[fblnFilled] ASC,
	[fstrTaxForm] ASC,
	[fstrMPDLN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 08/04/2015 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Default [DF__aspnet_Ap__Appli__1A7FC340]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD  DEFAULT (newid()) FOR [ApplicationId]
GO
/****** Object:  Default [DF__aspnet_Me__Passw__2F7AE026]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[aspnet_Membership] ADD  DEFAULT ((0)) FOR [PasswordFormat]
GO
/****** Object:  Default [DF__aspnet_Pa__PathI__601E1781]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[aspnet_Paths] ADD  DEFAULT (newid()) FOR [PathId]
GO
/****** Object:  Default [DF__aspnet_Perso__Id__67BF3949]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF__aspnet_Ro__RoleI__4D0B430D]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD  DEFAULT (newid()) FOR [RoleId]
GO
/****** Object:  Default [DF__aspnet_Us__UserI__1E505424]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (newid()) FOR [UserId]
GO
/****** Object:  Default [DF__aspnet_Us__Mobil__1F44785D]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (NULL) FOR [MobileAlias]
GO
/****** Object:  Default [DF__aspnet_Us__IsAno__20389C96]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT ((0)) FOR [IsAnonymous]
GO
/****** Object:  Default [DF_errMsg_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[errMsg] ADD  CONSTRAINT [DF_errMsg_fstrWho]  DEFAULT ('') FOR [fstrWho]
GO
/****** Object:  Default [DF_rfrAddDoc_fblnActive]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrAddDoc] ADD  CONSTRAINT [DF_rfrAddDoc_fblnActive]  DEFAULT ((1)) FOR [fblnActive]
GO
/****** Object:  Default [DF_rfrAddDoc_fblnPtdAddition]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrAddDoc] ADD  CONSTRAINT [DF_rfrAddDoc_fblnPtdAddition]  DEFAULT ((0)) FOR [fblnPtdAddition]
GO
/****** Object:  Default [DF_rfrControlHeaders_fstrFileType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControlHeaders] ADD  CONSTRAINT [DF_rfrControlHeaders_fstrFileType]  DEFAULT ('') FOR [fstrFileType]
GO
/****** Object:  Default [DF_rfrControlHeaders_fstrTaxProgram]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControlHeaders] ADD  CONSTRAINT [DF_rfrControlHeaders_fstrTaxProgram]  DEFAULT ('') FOR [fstrTaxProgram]
GO
/****** Object:  Default [DF_rfrControlHeaders_flngTaxYear]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControlHeaders] ADD  CONSTRAINT [DF_rfrControlHeaders_flngTaxYear]  DEFAULT ((0)) FOR [flngTaxYear]
GO
/****** Object:  Default [DF_rfrControlHeaders_fstrBlockTitle]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControlHeaders] ADD  CONSTRAINT [DF_rfrControlHeaders_fstrBlockTitle]  DEFAULT ('') FOR [fstrBlockTitle]
GO
/****** Object:  Default [DF_rfrControlHeaders_fintZoomPerc]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControlHeaders] ADD  CONSTRAINT [DF_rfrControlHeaders_fintZoomPerc]  DEFAULT ((100)) FOR [fintZoomPerc]
GO
/****** Object:  Default [DF_rfrControlHeaders_fstrFormType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControlHeaders] ADD  CONSTRAINT [DF_rfrControlHeaders_fstrFormType]  DEFAULT ('N') FOR [fstrFormType]
GO
/****** Object:  Default [DF_rfrControlHeaders_flngRepeatOffset]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControlHeaders] ADD  CONSTRAINT [DF_rfrControlHeaders_flngRepeatOffset]  DEFAULT ((0)) FOR [flngRepeatOffset]
GO
/****** Object:  Default [DF_rfrControlHeaders_flngHeaderStart]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControlHeaders] ADD  CONSTRAINT [DF_rfrControlHeaders_flngHeaderStart]  DEFAULT ((0)) FOR [flngHeaderStart]
GO
/****** Object:  Default [DF_rfrControlHeaders_returnHeadersIDFK]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControlHeaders] ADD  CONSTRAINT [DF_rfrControlHeaders_returnHeadersIDFK]  DEFAULT ((-1)) FOR [flngReturnHeadersIDFK]
GO
/****** Object:  Default [DF_rfrControls_fstrFileType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_fstrFileType]  DEFAULT ('') FOR [fstrFileType]
GO
/****** Object:  Default [DF_rfrControls_fstrDocName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_fstrDocName]  DEFAULT ('') FOR [fstrDocName]
GO
/****** Object:  Default [DF_rfrControls_fstrTaxProgram]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_fstrTaxProgram]  DEFAULT (' ') FOR [fstrTaxProgram]
GO
/****** Object:  Default [DF_rfrControls_flngTaxYear]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_flngTaxYear]  DEFAULT ((0)) FOR [flngTaxYear]
GO
/****** Object:  Default [DF_rfrControls_fstrTaxForm]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_fstrTaxForm]  DEFAULT (' ') FOR [fstrTaxForm]
GO
/****** Object:  Default [DF_rfrControls_flngOrder]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_flngOrder]  DEFAULT ((0)) FOR [flngOrder]
GO
/****** Object:  Default [DF_rfrControls_fstrTable]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_fstrTable]  DEFAULT (' ') FOR [fstrTable]
GO
/****** Object:  Default [DF_rfrControls_fstrColumn]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_fstrColumn]  DEFAULT (' ') FOR [fstrColumn]
GO
/****** Object:  Default [DF_rfrControls_fstrFormat]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_fstrFormat]  DEFAULT (' ') FOR [fstrFormat]
GO
/****** Object:  Default [DF_rfrControls_flngDispLength]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_flngDispLength]  DEFAULT ((0)) FOR [flngDispLength]
GO
/****** Object:  Default [DF_rfrControls_flngMaxLength]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_flngMaxLength]  DEFAULT ((0)) FOR [flngMaxLength]
GO
/****** Object:  Default [DF_rfrControls_fblnHidden]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_fblnHidden]  DEFAULT ((0)) FOR [fblnHidden]
GO
/****** Object:  Default [DF_rfrControls_fblnRequired]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_fblnRequired]  DEFAULT ((0)) FOR [fblnRequired]
GO
/****** Object:  Default [DF_rfrControls_flngVBVarType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_flngVBVarType]  DEFAULT ((0)) FOR [flngVBVarType]
GO
/****** Object:  Default [DF_rfrControls_flngBlock]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_flngBlock]  DEFAULT ((0)) FOR [flngBlock]
GO
/****** Object:  Default [DF_rfrControls_fblnPostBack]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_fblnPostBack]  DEFAULT ((0)) FOR [fblnPostBack]
GO
/****** Object:  Default [DF_rfrControls_fblnVertSkip]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_fblnVertSkip]  DEFAULT ((0)) FOR [fblnVertSkip]
GO
/****** Object:  Default [DF_rfrControls_fstrLabel]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_fstrLabel]  DEFAULT (' ') FOR [fstrLabel]
GO
/****** Object:  Default [DF_rfrControls_fblnActive]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_fblnActive]  DEFAULT ((0)) FOR [fblnActive]
GO
/****** Object:  Default [DF_rfrControls_flngCtrlMove]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_flngCtrlMove]  DEFAULT ((0)) FOR [flngCtrlMove]
GO
/****** Object:  Default [DF_rfrControls_flngImgMoveX]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_flngImgMoveX]  DEFAULT ((0)) FOR [flngImgMoveX]
GO
/****** Object:  Default [DF_rfrControls_flngImgMoveY]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_flngImgMoveY]  DEFAULT ((0)) FOR [flngImgMoveY]
GO
/****** Object:  Default [DF_rfrControls_flngMarkerMoveX]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_flngMarkerMoveX]  DEFAULT ((0)) FOR [flngMarkerMoveX]
GO
/****** Object:  Default [DF_rfrControls_flngMarkerMoveY]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_flngMarkerMoveY]  DEFAULT ((0)) FOR [flngMarkerMoveY]
GO
/****** Object:  Default [DF_rfrControls_fstrNextCtrl]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_fstrNextCtrl]  DEFAULT ('') FOR [fstrNextCtrl]
GO
/****** Object:  Default [DF_rfrControls_flngFormatIDFK]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_flngFormatIDFK]  DEFAULT ((0)) FOR [flngFormatIDFK]
GO
/****** Object:  Default [DF_rfrControls_fstrTranslate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_fstrTranslate]  DEFAULT (' ') FOR [fstrTranslate]
GO
/****** Object:  Default [DF_rfrControls_flngClipTop]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_flngClipTop]  DEFAULT ((0)) FOR [flngClipTop]
GO
/****** Object:  Default [DF_rfrControls_flngClipRight]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_flngClipRight]  DEFAULT ((0)) FOR [flngClipRight]
GO
/****** Object:  Default [DF_rfrControls_flngClipBottom]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_flngClipBottom]  DEFAULT ((0)) FOR [flngClipBottom]
GO
/****** Object:  Default [DF_rfrControls_flngClipLeft]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_flngClipLeft]  DEFAULT ((0)) FOR [flngClipLeft]
GO
/****** Object:  Default [DF_rfrControls_fstrBlockHeader]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_fstrBlockHeader]  DEFAULT ('') FOR [fstrBlockHeader]
GO
/****** Object:  Default [DF_rfrControls_fstrFormType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_fstrFormType]  DEFAULT ('N') FOR [fstrFormType]
GO
/****** Object:  Default [DF_rfrControls_flngHeaderIDFK]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_flngHeaderIDFK]  DEFAULT ((-1)) FOR [flngControlHeadersIDFK]
GO
/****** Object:  Default [DF_rfrControls_fblnPtwd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrControls] ADD  CONSTRAINT [DF_rfrControls_fblnPtwd]  DEFAULT ((0)) FOR [fblnPtdAddition]
GO
/****** Object:  Default [DF_rfrCRDropDown_fstrCrdName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrCRDropDown] ADD  CONSTRAINT [DF_rfrCRDropDown_fstrCrdName]  DEFAULT (' ') FOR [fstrCrdName]
GO
/****** Object:  Default [DF_rfrDocType_fstrDocType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrDocType] ADD  CONSTRAINT [DF_rfrDocType_fstrDocType]  DEFAULT (' ') FOR [fstrDocType]
GO
/****** Object:  Default [DF_rfrDocType_fstrDocDesc]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrDocType] ADD  CONSTRAINT [DF_rfrDocType_fstrDocDesc]  DEFAULT (' ') FOR [fstrDocDesc]
GO
/****** Object:  Default [DF_rfrGkInstall_IDrfrControls]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_IDrfrControls]  DEFAULT ((0)) FOR [IDrfrControls]
GO
/****** Object:  Default [DF_rfrGkInstall_fstrFileType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_fstrFileType]  DEFAULT (' ') FOR [fstrFileType]
GO
/****** Object:  Default [DF_rfrGkInstall_flngCmd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_flngCmd]  DEFAULT ((0)) FOR [flngCmd]
GO
/****** Object:  Default [DF_rfrGkInstall_fstrDocName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_fstrDocName]  DEFAULT (' ') FOR [fstrDocName]
GO
/****** Object:  Default [DF_rfrGkInstall_fstrInputID]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_fstrInputID]  DEFAULT (' ') FOR [fstrInputID]
GO
/****** Object:  Default [DF_rfrGkInstall_fstrTaxProgram]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_fstrTaxProgram]  DEFAULT (' ') FOR [fstrTaxProgram]
GO
/****** Object:  Default [DF_rfrGkInstall_flngTaxYear]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_flngTaxYear]  DEFAULT ((0)) FOR [flngTaxYear]
GO
/****** Object:  Default [DF_rfrGkInstall_fstrTaxForm]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_fstrTaxForm]  DEFAULT (' ') FOR [fstrTaxForm]
GO
/****** Object:  Default [DF_rfrGkInstall_flngOrder]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_flngOrder]  DEFAULT ((0)) FOR [flngOrder]
GO
/****** Object:  Default [DF_rfrGkInstall_fstrTable]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_fstrTable]  DEFAULT (' ') FOR [fstrTable]
GO
/****** Object:  Default [DF_rfrGkInstall_fstrColumn]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_fstrColumn]  DEFAULT (' ') FOR [fstrColumn]
GO
/****** Object:  Default [DF_rfrGkInstall_fstrFormat]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_fstrFormat]  DEFAULT (' ') FOR [fstrFormat]
GO
/****** Object:  Default [DF_rfrGkInstall_flngDispLength]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_flngDispLength]  DEFAULT ((0)) FOR [flngDispLength]
GO
/****** Object:  Default [DF_rfrGkInstall_flngMaxLength]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_flngMaxLength]  DEFAULT ((0)) FOR [flngMaxLength]
GO
/****** Object:  Default [DF_rfrGkInstall_fblnHidden]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_fblnHidden]  DEFAULT ((0)) FOR [fblnHidden]
GO
/****** Object:  Default [DF_rfrGkInstall_fblnRequired]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_fblnRequired]  DEFAULT ((0)) FOR [fblnRequired]
GO
/****** Object:  Default [DF_rfrGkInstall_flngVBVarType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_flngVBVarType]  DEFAULT ((0)) FOR [flngVBVarType]
GO
/****** Object:  Default [DF_rfrGkInstall_flngBlock]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_flngBlock]  DEFAULT ((0)) FOR [flngBlock]
GO
/****** Object:  Default [DF_rfrGkInstall_fblnPostBack]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_fblnPostBack]  DEFAULT ((0)) FOR [fblnPostBack]
GO
/****** Object:  Default [DF_rfrGkInstall_fblnVertSkip]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_fblnVertSkip]  DEFAULT ((0)) FOR [fblnVertSkip]
GO
/****** Object:  Default [DF_rfrGkInstall_fstrLabel]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_fstrLabel]  DEFAULT (' ') FOR [fstrLabel]
GO
/****** Object:  Default [DF_rfrGkInstall_fblnActive]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_fblnActive]  DEFAULT ((0)) FOR [fblnActive]
GO
/****** Object:  Default [DF_rfrGkInstall_flngCtrlMove]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_flngCtrlMove]  DEFAULT ((0)) FOR [flngCtrlMove]
GO
/****** Object:  Default [DF_rfrGkInstall_flngImgMoveX]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_flngImgMoveX]  DEFAULT ((0)) FOR [flngImgMoveX]
GO
/****** Object:  Default [DF_rfrGkInstall_flngImgMoveY]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_flngImgMoveY]  DEFAULT ((0)) FOR [flngImgMoveY]
GO
/****** Object:  Default [DF_rfrGkInstall_flngMarkerMoveX]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_flngMarkerMoveX]  DEFAULT ((0)) FOR [flngMarkerMoveX]
GO
/****** Object:  Default [DF_rfrGkInstall_flngMarkerMoveY]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_flngMarkerMoveY]  DEFAULT ((0)) FOR [flngMarkerMoveY]
GO
/****** Object:  Default [DF_rfrGkInstall_fstrNextCtrl]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_fstrNextCtrl]  DEFAULT (' ') FOR [fstrNextCtrl]
GO
/****** Object:  Default [DF_rfrGkInstall_flngFormatIDFK]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_flngFormatIDFK]  DEFAULT ((0)) FOR [flngFormatIDFK]
GO
/****** Object:  Default [DF_rfrGkInstall_fstrTranslate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_fstrTranslate]  DEFAULT (' ') FOR [fstrTranslate]
GO
/****** Object:  Default [DF_rfrGkInstall_flngClipTop]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_flngClipTop]  DEFAULT ((0)) FOR [flngClipTop]
GO
/****** Object:  Default [DF_rfrGkInstall_flngClipRight]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_flngClipRight]  DEFAULT ((0)) FOR [flngClipRight]
GO
/****** Object:  Default [DF_rfrGkInstall_flngClipBottom]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_flngClipBottom]  DEFAULT ((0)) FOR [flngClipBottom]
GO
/****** Object:  Default [DF_rfrGkInstall_flngClipLeft]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_flngClipLeft]  DEFAULT ((0)) FOR [flngClipLeft]
GO
/****** Object:  Default [DF_rfrGkInstall_fstrBlockHeader]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_fstrBlockHeader]  DEFAULT (' ') FOR [fstrBlockHeader]
GO
/****** Object:  Default [DF_rfrGkInstall_fstrFormType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_fstrFormType]  DEFAULT ('N') FOR [fstrFormType]
GO
/****** Object:  Default [DF_rfrGkInstall_flngControlHeadersIDFK]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_flngControlHeadersIDFK]  DEFAULT ((-1)) FOR [flngControlHeadersIDFK]
GO
/****** Object:  Default [DF_rfrGkInstall_fblnPtdAddition]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_fblnPtdAddition]  DEFAULT ((0)) FOR [fblnPtdAddition]
GO
/****** Object:  Default [DF_rfrGkInstall_fdtmFilingPeriod]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_fdtmFilingPeriod]  DEFAULT ('12/31/9999') FOR [fdtmFilingPeriod]
GO
/****** Object:  Default [DF_rfrGkInstall_fdtmDueDate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_fdtmDueDate]  DEFAULT ('12/31/9999') FOR [fdtmDueDate]
GO
/****** Object:  Default [DF_rfrGkInstall_fdecConstant]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_fdecConstant]  DEFAULT ((0)) FOR [fdecConstant]
GO
/****** Object:  Default [DF_rfrGkInstall_flngIdReturnHeaders]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrGkInstall] ADD  CONSTRAINT [DF_rfrGkInstall_flngIdReturnHeaders]  DEFAULT ((0)) FOR [flngIdReturnHeaders]
GO
/****** Object:  Default [DF_rfrJavaAutoFunctions_fstrName1]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrJavaAutoFunctions] ADD  CONSTRAINT [DF_rfrJavaAutoFunctions_fstrName1]  DEFAULT ('') FOR [fstrName1]
GO
/****** Object:  Default [DF_rfrJavaAutoFunctions_fstrName2]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrJavaAutoFunctions] ADD  CONSTRAINT [DF_rfrJavaAutoFunctions_fstrName2]  DEFAULT ('') FOR [fstrName2]
GO
/****** Object:  Default [DF_rfrTaxPgm_fstrFileType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrTaxPgm] ADD  CONSTRAINT [DF_rfrTaxPgm_fstrFileType]  DEFAULT (' ') FOR [fstrFileType]
GO
/****** Object:  Default [DF_rfrTaxPgm_fstrTaxProgram]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrTaxPgm] ADD  CONSTRAINT [DF_rfrTaxPgm_fstrTaxProgram]  DEFAULT (' ') FOR [fstrTaxProgram]
GO
/****** Object:  Default [DF_rfrTaxPgm_flngTaxYear]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrTaxPgm] ADD  CONSTRAINT [DF_rfrTaxPgm_flngTaxYear]  DEFAULT (' ') FOR [fstrTaxYear]
GO
/****** Object:  Default [DF_rfrTaxPgm_fintJobIdDev]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrTaxPgm] ADD  CONSTRAINT [DF_rfrTaxPgm_fintJobIdDev]  DEFAULT ((0)) FOR [fintJobIdDev]
GO
/****** Object:  Default [DF_rfrTaxPgm_fintJobIdProd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrTaxPgm] ADD  CONSTRAINT [DF_rfrTaxPgm_fintJobIdProd]  DEFAULT ((0)) FOR [fintJobIdProd]
GO
/****** Object:  Default [DF_rfrTaxPgm_fstrSQL]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrTaxPgm] ADD  CONSTRAINT [DF_rfrTaxPgm_fstrSQL]  DEFAULT (' ') FOR [fstrSQL]
GO
/****** Object:  Default [DF_rfrTaxPgm_fstrBatchSource]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrTaxPgm] ADD  CONSTRAINT [DF_rfrTaxPgm_fstrBatchSource]  DEFAULT (' ') FOR [fstrBatchSource]
GO
/****** Object:  Default [DF_rfrTaxPgm_fstrBatchPrefix]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrTaxPgm] ADD  CONSTRAINT [DF_rfrTaxPgm_fstrBatchPrefix]  DEFAULT (' ') FOR [fstrBatchPrefix]
GO
/****** Object:  Default [DF_rfrTaxPgm_fstrBatchSuffix]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrTaxPgm] ADD  CONSTRAINT [DF_rfrTaxPgm_fstrBatchSuffix]  DEFAULT (' ') FOR [fstrBatchSuffix]
GO
/****** Object:  Default [DF_rfrTaxPgm_fstrBatchType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrTaxPgm] ADD  CONSTRAINT [DF_rfrTaxPgm_fstrBatchType]  DEFAULT (' ') FOR [fstrBatchType]
GO
/****** Object:  Default [DF_rfrTaxPgm_fstrAccountType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrTaxPgm] ADD  CONSTRAINT [DF_rfrTaxPgm_fstrAccountType]  DEFAULT (' ') FOR [fstrAccountType]
GO
/****** Object:  Default [DF_rfrTaxPgm_fdtmFilingPeriod]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrTaxPgm] ADD  CONSTRAINT [DF_rfrTaxPgm_fdtmFilingPeriod]  DEFAULT ('12/31/9999') FOR [fdtmFilingPeriod]
GO
/****** Object:  Default [DF_rfrTaxPgm_fdtmDueDate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrTaxPgm] ADD  CONSTRAINT [DF_rfrTaxPgm_fdtmDueDate]  DEFAULT ('12/31/9999') FOR [fdtmDueDate]
GO
/****** Object:  Default [DF_rfrTaxPgm_fstrDocType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrTaxPgm] ADD  CONSTRAINT [DF_rfrTaxPgm_fstrDocType]  DEFAULT (' ') FOR [fstrDocType]
GO
/****** Object:  Default [DF_rfrTaxPgm_fintDocVer]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrTaxPgm] ADD  CONSTRAINT [DF_rfrTaxPgm_fintDocVer]  DEFAULT ((0)) FOR [fintDocVer]
GO
/****** Object:  Default [DF_rfrTaxPgm_fstrPrimType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrTaxPgm] ADD  CONSTRAINT [DF_rfrTaxPgm_fstrPrimType]  DEFAULT (' ') FOR [fstrPrimType]
GO
/****** Object:  Default [DF_rfrTaxPgm_fstrSecType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrTaxPgm] ADD  CONSTRAINT [DF_rfrTaxPgm_fstrSecType]  DEFAULT (' ') FOR [fstrSecType]
GO
/****** Object:  Default [DF_rfrTaxPgm_fbln2Db]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrTaxPgm] ADD  CONSTRAINT [DF_rfrTaxPgm_fbln2Db]  DEFAULT ((0)) FOR [fbln2Db]
GO
/****** Object:  Default [DF_rfrTaxPgm_fblnImport]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrTaxPgm] ADD  CONSTRAINT [DF_rfrTaxPgm_fblnImport]  DEFAULT ((0)) FOR [fblnImport]
GO
/****** Object:  Default [DF_rfrTaxPgm_fblnExtract]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrTaxPgm] ADD  CONSTRAINT [DF_rfrTaxPgm_fblnExtract]  DEFAULT ((0)) FOR [fblnExtract]
GO
/****** Object:  Default [DF_rfrTaxPgm_fblnActive]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrTaxPgm] ADD  CONSTRAINT [DF_rfrTaxPgm_fblnActive]  DEFAULT ((1)) FOR [fblnActive]
GO
/****** Object:  Default [DF_rfrTaxPgm_fblnPtdAlso]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrTaxPgm] ADD  CONSTRAINT [DF_rfrTaxPgm_fblnPtdAlso]  DEFAULT ((0)) FOR [fblnPtdAddition]
GO
/****** Object:  Default [DF_rfrTaxPgm_fintCompDev]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrTaxPgm] ADD  CONSTRAINT [DF_rfrTaxPgm_fintCompDev]  DEFAULT ((0)) FOR [fintCompDev]
GO
/****** Object:  Default [DF_rfrTaxPgm_fintCompPrd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[rfrTaxPgm] ADD  CONSTRAINT [DF_rfrTaxPgm_fintCompPrd]  DEFAULT ((0)) FOR [fintCompPrd]
GO
/****** Object:  Default [DF_tblAutoJavaComplete_fblnOnBlur]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblAutoJavaComplete] ADD  CONSTRAINT [DF_tblAutoJavaComplete_fblnOnBlur]  DEFAULT ((0)) FOR [fblnOnBlur]
GO
/****** Object:  Default [DF_tblAutoJavaComplete_flngName1IDFK]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblAutoJavaComplete] ADD  CONSTRAINT [DF_tblAutoJavaComplete_flngName1IDFK]  DEFAULT ((-1)) FOR [flngName1IDFK]
GO
/****** Object:  Default [DF_tblAutoJavaComplete_flngName2IDFK]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblAutoJavaComplete] ADD  CONSTRAINT [DF_tblAutoJavaComplete_flngName2IDFK]  DEFAULT ((-1)) FOR [flngName2IDFK]
GO
/****** Object:  Default [DF_tblAutoJavaComplete_fstrFuncName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblAutoJavaComplete] ADD  CONSTRAINT [DF_tblAutoJavaComplete_fstrFuncName]  DEFAULT (' ') FOR [fstrFuncName]
GO
/****** Object:  Default [DF_tblAutoJavaComplete_fstrFileType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblAutoJavaComplete] ADD  CONSTRAINT [DF_tblAutoJavaComplete_fstrFileType]  DEFAULT (' ') FOR [fstrFileType]
GO
/****** Object:  Default [DF_tblAutoJavaComplete_fstrTaxForm]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblAutoJavaComplete] ADD  CONSTRAINT [DF_tblAutoJavaComplete_fstrTaxForm]  DEFAULT (' ') FOR [fstrTaxForm]
GO
/****** Object:  Default [DF_tblAutoJavaComplete_flngCtlBlock]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblAutoJavaComplete] ADD  CONSTRAINT [DF_tblAutoJavaComplete_flngCtlBlock]  DEFAULT ((0)) FOR [flngCtlBlock]
GO
/****** Object:  Default [DF_tblAutoJavaComplete_flngOutOrder]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblAutoJavaComplete] ADD  CONSTRAINT [DF_tblAutoJavaComplete_flngOutOrder]  DEFAULT ((0)) FOR [flngOutOrder]
GO
/****** Object:  Default [DF_tblAutoJavaComplete_flngC1Order]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblAutoJavaComplete] ADD  CONSTRAINT [DF_tblAutoJavaComplete_flngC1Order]  DEFAULT ((0)) FOR [flngC1Order]
GO
/****** Object:  Default [DF_tblAutoJavaComplete_flngC2Order]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblAutoJavaComplete] ADD  CONSTRAINT [DF_tblAutoJavaComplete_flngC2Order]  DEFAULT ((0)) FOR [flngC2Order]
GO
/****** Object:  Default [DF_tblAutoJavaComplete_flngN1Order]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblAutoJavaComplete] ADD  CONSTRAINT [DF_tblAutoJavaComplete_flngN1Order]  DEFAULT ((0)) FOR [flngN1Order]
GO
/****** Object:  Default [DF_tblAutoJavaComplete_flngN2Order]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblAutoJavaComplete] ADD  CONSTRAINT [DF_tblAutoJavaComplete_flngN2Order]  DEFAULT ((0)) FOR [flngN2Order]
GO
/****** Object:  Default [DF_tblDataEntry_BatchImage_fdtmImageCheckedIn]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchImage] ADD  CONSTRAINT [DF_tblDataEntry_BatchImage_fdtmImageCheckedIn]  DEFAULT ('12/31/9999') FOR [fdtmImageCheckedIn]
GO
/****** Object:  Default [DF_tblBatchImage_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchImage] ADD  CONSTRAINT [DF_tblBatchImage_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblBatchImage_fblnPtdAddition]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchImage] ADD  CONSTRAINT [DF_tblBatchImage_fblnPtdAddition]  DEFAULT ((0)) FOR [fblnPtdAddition]
GO
/****** Object:  Default [DF_itblBatchInfo_kstrBatchType_1]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchInfo] ADD  CONSTRAINT [DF_itblBatchInfo_kstrBatchType_1]  DEFAULT (' ') FOR [fstrBatchType]
GO
/****** Object:  Default [DF_itblBatchInfo_kstrYear]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchInfo] ADD  CONSTRAINT [DF_itblBatchInfo_kstrYear]  DEFAULT ('2003') FOR [fstrForm]
GO
/****** Object:  Default [DF_tblBatchInfo_fstrDLN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchInfo] ADD  CONSTRAINT [DF_tblBatchInfo_fstrDLN]  DEFAULT (' ') FOR [fstrDLN]
GO
/****** Object:  Default [DF_itblBatchInfo_kintBatchCount]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchInfo] ADD  CONSTRAINT [DF_itblBatchInfo_kintBatchCount]  DEFAULT ((0)) FOR [fintBatchCount]
GO
/****** Object:  Default [DF_itblBatchInfo_kcurBatchAmount]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchInfo] ADD  CONSTRAINT [DF_itblBatchInfo_kcurBatchAmount]  DEFAULT ((0.0000)) FOR [fcurBatchAmount]
GO
/****** Object:  Default [DF_itblBatchInfo_kintHeaderCount]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchInfo] ADD  CONSTRAINT [DF_itblBatchInfo_kintHeaderCount]  DEFAULT ((0)) FOR [fintHeaderCount]
GO
/****** Object:  Default [DF_itblBatchInfo_kcurHeaderAmount_1]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchInfo] ADD  CONSTRAINT [DF_itblBatchInfo_kcurHeaderAmount_1]  DEFAULT ((0.0000)) FOR [fcurHeaderAmount]
GO
/****** Object:  Default [DF_itblBatchInfo_kintRejectCount]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchInfo] ADD  CONSTRAINT [DF_itblBatchInfo_kintRejectCount]  DEFAULT ((0)) FOR [fintRejectCount]
GO
/****** Object:  Default [DF_itblBatchInfo_kcurRejectAmount]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchInfo] ADD  CONSTRAINT [DF_itblBatchInfo_kcurRejectAmount]  DEFAULT ((0.0000)) FOR [fcurRejectAmount]
GO
/****** Object:  Default [DF_itblBatchInfo_kstrBatchUploaded]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchInfo] ADD  CONSTRAINT [DF_itblBatchInfo_kstrBatchUploaded]  DEFAULT ('N') FOR [fstrBatchUploaded]
GO
/****** Object:  Default [DF_itblBatchInfo_kdtmBatchUploaded]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchInfo] ADD  CONSTRAINT [DF_itblBatchInfo_kdtmBatchUploaded]  DEFAULT ('12/31/9999') FOR [fdtmBatchUploaded]
GO
/****** Object:  Default [DF_itblBatchInfo_kstrPaymentUploaded]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchInfo] ADD  CONSTRAINT [DF_itblBatchInfo_kstrPaymentUploaded]  DEFAULT ('N') FOR [fstrPaymentUploaded]
GO
/****** Object:  Default [DF_itblBatchInfo_kdtmPaymentUploaded]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchInfo] ADD  CONSTRAINT [DF_itblBatchInfo_kdtmPaymentUploaded]  DEFAULT ('12/31/9999') FOR [fdtmPaymentUploaded]
GO
/****** Object:  Default [DF_itblBatchInfo_kdtmBatchCreated]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchInfo] ADD  CONSTRAINT [DF_itblBatchInfo_kdtmBatchCreated]  DEFAULT (getdate()) FOR [fdtmBatchCreated]
GO
/****** Object:  Default [DF_tblBatchInfo_fdtmReceivedDate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchInfo] ADD  CONSTRAINT [DF_tblBatchInfo_fdtmReceivedDate]  DEFAULT ('12/31/9999') FOR [fdtmReceivedDate]
GO
/****** Object:  Default [DF_tblBatchInfo_fdtmDepositDate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchInfo] ADD  CONSTRAINT [DF_tblBatchInfo_fdtmDepositDate]  DEFAULT ('12/31/9999') FOR [fdtmDepositDate]
GO
/****** Object:  Default [DF_tblBatchInfo_fdtmPostmarkDate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchInfo] ADD  CONSTRAINT [DF_tblBatchInfo_fdtmPostmarkDate]  DEFAULT ('12/31/9999') FOR [fdtmPostmarkDate]
GO
/****** Object:  Default [DF_itblBatchInfo_kstrBatchStatus]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchInfo] ADD  CONSTRAINT [DF_itblBatchInfo_kstrBatchStatus]  DEFAULT ('O') FOR [fstrBatchStatus]
GO
/****** Object:  Default [DF_itblBatchInfo_kstrBatchUser]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchInfo] ADD  CONSTRAINT [DF_itblBatchInfo_kstrBatchUser]  DEFAULT (' ') FOR [fstrBatchUser]
GO
/****** Object:  Default [DF_itblBatchInfo_kstrTimelyBatch]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchInfo] ADD  CONSTRAINT [DF_itblBatchInfo_kstrTimelyBatch]  DEFAULT ('N') FOR [fstrTimelyBatch]
GO
/****** Object:  Default [DF_itblBatchInfo_kstrImageUploaded]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchInfo] ADD  CONSTRAINT [DF_itblBatchInfo_kstrImageUploaded]  DEFAULT ('N') FOR [fstrImageUploaded]
GO
/****** Object:  Default [DF__itblBatch__kdtmI__3C2ACFCE]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchInfo] ADD  CONSTRAINT [DF__itblBatch__kdtmI__3C2ACFCE]  DEFAULT ('12/31/9999') FOR [fdtmImageUploaded]
GO
/****** Object:  Default [DF_itblBatchInfo_kstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchInfo] ADD  CONSTRAINT [DF_itblBatchInfo_kstrWho]  DEFAULT ('Batch') FOR [fstrWho]
GO
/****** Object:  Default [DF_itblBatchInfo_kdtmWhenAssigned]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchInfo] ADD  CONSTRAINT [DF_itblBatchInfo_kdtmWhenAssigned]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblBatchInfo_fdtmAssigned]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBatchInfo] ADD  CONSTRAINT [DF_tblBatchInfo_fdtmAssigned]  DEFAULT ('12/31/9999') FOR [fdtmAssigned]
GO
/****** Object:  Default [DF_tblBInfo2_fstrBatchType_1]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBInfo2] ADD  CONSTRAINT [DF_tblBInfo2_fstrBatchType_1]  DEFAULT (' ') FOR [fstrBatchType]
GO
/****** Object:  Default [DF_tblBInfo2_fstrYear]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBInfo2] ADD  CONSTRAINT [DF_tblBInfo2_fstrYear]  DEFAULT (' ') FOR [fstrForm]
GO
/****** Object:  Default [DF_tblBInfo2_fstrDLN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBInfo2] ADD  CONSTRAINT [DF_tblBInfo2_fstrDLN]  DEFAULT (' ') FOR [fstrDLN]
GO
/****** Object:  Default [DF_tblBInfo2_fintBatchCount]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBInfo2] ADD  CONSTRAINT [DF_tblBInfo2_fintBatchCount]  DEFAULT ((0)) FOR [fintBatchCount]
GO
/****** Object:  Default [DF_tblBInfo2_fcurBatchAmount]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBInfo2] ADD  CONSTRAINT [DF_tblBInfo2_fcurBatchAmount]  DEFAULT ((0.0000)) FOR [fcurBatchAmount]
GO
/****** Object:  Default [DF_tblBInfo2_fintHeaderCount]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBInfo2] ADD  CONSTRAINT [DF_tblBInfo2_fintHeaderCount]  DEFAULT ((0)) FOR [fintHeaderCount]
GO
/****** Object:  Default [DF_tblBInfo2_fcurHeaderAmount_1]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBInfo2] ADD  CONSTRAINT [DF_tblBInfo2_fcurHeaderAmount_1]  DEFAULT ((0.0000)) FOR [fcurHeaderAmount]
GO
/****** Object:  Default [DF_tblBInfo2_fintRejectCount]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBInfo2] ADD  CONSTRAINT [DF_tblBInfo2_fintRejectCount]  DEFAULT ((0)) FOR [fintRejectCount]
GO
/****** Object:  Default [DF_tblBInfo2_fcurRejectAmount]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBInfo2] ADD  CONSTRAINT [DF_tblBInfo2_fcurRejectAmount]  DEFAULT ((0.0000)) FOR [fcurRejectAmount]
GO
/****** Object:  Default [DF_tblBInfo2_fstrBatchUploaded]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBInfo2] ADD  CONSTRAINT [DF_tblBInfo2_fstrBatchUploaded]  DEFAULT ('N') FOR [fstrBatchUploaded]
GO
/****** Object:  Default [DF_tblBInfo2_fdtmBatchUploaded]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBInfo2] ADD  CONSTRAINT [DF_tblBInfo2_fdtmBatchUploaded]  DEFAULT ('12/31/9999') FOR [fdtmBatchUploaded]
GO
/****** Object:  Default [DF_tblBInfo2_fstrPaymentUploaded]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBInfo2] ADD  CONSTRAINT [DF_tblBInfo2_fstrPaymentUploaded]  DEFAULT ('N') FOR [fstrPaymentUploaded]
GO
/****** Object:  Default [DF_tblBInfo2_fdtmPaymentUploaded]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBInfo2] ADD  CONSTRAINT [DF_tblBInfo2_fdtmPaymentUploaded]  DEFAULT ('12/31/9999') FOR [fdtmPaymentUploaded]
GO
/****** Object:  Default [DF_tblBInfo2_fdtmBatchCreated]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBInfo2] ADD  CONSTRAINT [DF_tblBInfo2_fdtmBatchCreated]  DEFAULT (getdate()) FOR [fdtmBatchCreated]
GO
/****** Object:  Default [DF_tblBInfo2_fdtmReceivedDate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBInfo2] ADD  CONSTRAINT [DF_tblBInfo2_fdtmReceivedDate]  DEFAULT ('12/31/9999') FOR [fdtmReceivedDate]
GO
/****** Object:  Default [DF_tblBInfo2_fdtmDepositDate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBInfo2] ADD  CONSTRAINT [DF_tblBInfo2_fdtmDepositDate]  DEFAULT ('12/31/9999') FOR [fdtmDepositDate]
GO
/****** Object:  Default [DF_tblBInfo2_fdtmPostmarkDate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBInfo2] ADD  CONSTRAINT [DF_tblBInfo2_fdtmPostmarkDate]  DEFAULT ('12/31/9999') FOR [fdtmPostmarkDate]
GO
/****** Object:  Default [DF_tblBInfo2_fstrBatchStatus]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBInfo2] ADD  CONSTRAINT [DF_tblBInfo2_fstrBatchStatus]  DEFAULT ('O') FOR [fstrBatchStatus]
GO
/****** Object:  Default [DF_tblBInfo2_fstrBatchUser]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBInfo2] ADD  CONSTRAINT [DF_tblBInfo2_fstrBatchUser]  DEFAULT (' ') FOR [fstrBatchUser]
GO
/****** Object:  Default [DF_tblBInfo2_fstrTimelyBatch]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBInfo2] ADD  CONSTRAINT [DF_tblBInfo2_fstrTimelyBatch]  DEFAULT ('N') FOR [fstrTimelyBatch]
GO
/****** Object:  Default [DF_tblBInfo2_fstrImageUploaded]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBInfo2] ADD  CONSTRAINT [DF_tblBInfo2_fstrImageUploaded]  DEFAULT ('N') FOR [fstrImageUploaded]
GO
/****** Object:  Default [DF_tblBInfo2_fdtmImageUploaded]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBInfo2] ADD  CONSTRAINT [DF_tblBInfo2_fdtmImageUploaded]  DEFAULT ('12/31/9999') FOR [fdtmImageUploaded]
GO
/****** Object:  Default [DF_tblBInfo2_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBInfo2] ADD  CONSTRAINT [DF_tblBInfo2_fstrWho]  DEFAULT ('Batch') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblBInfo2_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBInfo2] ADD  CONSTRAINT [DF_tblBInfo2_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblBInfo2_fdtmAssigned]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblBInfo2] ADD  CONSTRAINT [DF_tblBInfo2_fdtmAssigned]  DEFAULT ('12/31/9999') FOR [fdtmAssigned]
GO
/****** Object:  Default [DF_tblCit_fstrFein]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fstrFein]  DEFAULT (' ') FOR [fstrFein]
GO
/****** Object:  Default [DF_tblCit_fstrCrsID]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fstrCrsID]  DEFAULT (' ') FOR [fstrCrsID]
GO
/****** Object:  Default [DF_tblCit_fstrName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fstrName]  DEFAULT (' ') FOR [fstrName]
GO
/****** Object:  Default [DF_tblCit_fstrStreet]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fstrStreet]  DEFAULT (' ') FOR [fstrStreet]
GO
/****** Object:  Default [DF_tblCit_fstrCity]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fstrCity]  DEFAULT (' ') FOR [fstrCity]
GO
/****** Object:  Default [DF_tblCit_fstrState]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fstrState]  DEFAULT (' ') FOR [fstrState]
GO
/****** Object:  Default [DF_tblCit_fstrCountry]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fstrCountry]  DEFAULT ('USA') FOR [fstrCountry]
GO
/****** Object:  Default [DF_tblCit_fstrZipCode]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fstrZipCode]  DEFAULT (' ') FOR [fstrZipCode]
GO
/****** Object:  Default [DF_tblCit_fdtmTaxYrBeg]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fdtmTaxYrBeg]  DEFAULT ('12/31/9999') FOR [fdtmTaxYrBeg]
GO
/****** Object:  Default [DF_tblCit_fdtmTaxYrEnd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fdtmTaxYrEnd]  DEFAULT ('12/31/9999') FOR [fdtmTaxYrEnd]
GO
/****** Object:  Default [DF_tblCit_fdtmExtDue]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fdtmExtDue]  DEFAULT ('12/31/9999') FOR [fdtmExtDue]
GO
/****** Object:  Default [DF_tblCit_fdtmPostMark]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fdtmPostMark]  DEFAULT ('12/31/9999') FOR [fdtmPostMarkDate]
GO
/****** Object:  Default [DF_tblCit_fstrReturnFlag]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fstrReturnFlag]  DEFAULT ('1') FOR [fstrReturnFlag]
GO
/****** Object:  Default [DF_tblCit_fstrPhoneNo]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fstrPhoneNo]  DEFAULT (' ') FOR [fstrPhoneNo]
GO
/****** Object:  Default [DF_tblCit_fstrNAICSCode]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fstrNAICSCode]  DEFAULT (' ') FOR [fstrNAICSCode]
GO
/****** Object:  Default [DF_tblCit_fstrIncomeMethod]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fstrIncomeMethod]  DEFAULT (' ') FOR [fstrIncomeMethod]
GO
/****** Object:  Default [DF_tblCit_fstrAccountingMethod]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fstrAccountingMethod]  DEFAULT (' ') FOR [fstrAccountingMethod]
GO
/****** Object:  Default [DF_tblCit_fstrFinalReturnType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fstrFinalReturnType]  DEFAULT (' ') FOR [fstrFinalReturnType]
GO
/****** Object:  Default [DF_tblCit_fdtmFinalReturnDate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fdtmFinalReturnDate]  DEFAULT ('12/31/9999') FOR [fdtmFinalReturnDate]
GO
/****** Object:  Default [DF_tblCit_fstrLegalEntType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fstrLegalEntType]  DEFAULT (' ') FOR [fstrLegalEntType]
GO
/****** Object:  Default [DF_tblCit_fblnImmune]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fblnImmune]  DEFAULT ((0)) FOR [fblnImmune]
GO
/****** Object:  Default [DF_tblCit_fstrRouting1Num]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fstrRouting1Num]  DEFAULT (' ') FOR [fstrRouting1Num]
GO
/****** Object:  Default [DF_tblCit_fstrRoutingNum]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fstrRoutingNum]  DEFAULT (' ') FOR [fstrRoutingNum]
GO
/****** Object:  Default [DF_tblCit_fstrAccount1Num]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fstrAccount1Num]  DEFAULT (' ') FOR [fstrAccount1Num]
GO
/****** Object:  Default [DF_tblCit_fstrAccountNum]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fstrAccountNum]  DEFAULT (' ') FOR [fstrAccountNum]
GO
/****** Object:  Default [DF_tblCit_fstrAccountType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fstrAccountType]  DEFAULT (' ') FOR [fstrAccountType]
GO
/****** Object:  Default [DF_tblCit_fblnAcctChk]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fblnAcctChk]  DEFAULT ((0)) FOR [fblnAcctChk]
GO
/****** Object:  Default [DF_tblCit_fblnAcctSav]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fblnAcctSav]  DEFAULT ((0)) FOR [fblnAcctSav]
GO
/****** Object:  Default [DF_tblCit_fblnIATFlag]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fblnIATFlag]  DEFAULT ((0)) FOR [fblnIATFlag]
GO
/****** Object:  Default [DF_tblCit_fblnIATYes]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fblnIATYes]  DEFAULT ((0)) FOR [fblnIATYes]
GO
/****** Object:  Default [DF_tblCit_fblnIATNo]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fblnIATNo]  DEFAULT ((0)) FOR [fblnIATNo]
GO
/****** Object:  Default [DF_tblCit_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblCit_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblCit_fstrStateOrg]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fstrStateOrg]  DEFAULT (' ') FOR [fstrStateOrg]
GO
/****** Object:  Default [DF_tblCit_fdtmDateOrg]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fdtmDateOrg]  DEFAULT ('12/31/9999') FOR [fdtmDateOrg]
GO
/****** Object:  Default [DF_tblCit_fdtmNMStart]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fdtmNMStart]  DEFAULT ('12/31/9999') FOR [fdtmNMStart]
GO
/****** Object:  Default [DF_tblCit_fstrDomicile]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit] ADD  CONSTRAINT [DF_tblCit_fstrDomicile]  DEFAULT (' ') FOR [fstrDomicile]
GO
/****** Object:  Default [DF_tblCit2_fcurTaxable]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurTaxable]  DEFAULT ((0)) FOR [fcurTaxable]
GO
/****** Object:  Default [DF_tblCit2_fcurIntMuni]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurIntMuni]  DEFAULT ((0)) FOR [fcurIntMuni]
GO
/****** Object:  Default [DF_tblCit2_fcurFedSpDed]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurFedSpDed]  DEFAULT ((0)) FOR [fcurFedSpDed]
GO
/****** Object:  Default [DF_tblCit2_fcurNMBase]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurNMBase]  DEFAULT ((0)) FOR [fcurNMBase]
GO
/****** Object:  Default [DF_tblCit2_fcurNMNOL]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurNMNOL]  DEFAULT ((0)) FOR [fcurNMNOL]
GO
/****** Object:  Default [DF_tblCit2_fcurIntUSOblig]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurIntUSOblig]  DEFAULT ((0)) FOR [fcurIntUSOblig]
GO
/****** Object:  Default [DF_tblCit2_fcurNMSubTotal]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurNMSubTotal]  DEFAULT ((0)) FOR [fcurNMSubTotal]
GO
/****** Object:  Default [DF_tblCit2_fcurDednForDiv]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurDednForDiv]  DEFAULT ((0)) FOR [fcurDednForDiv]
GO
/****** Object:  Default [DF_tblCit2_fcurNMNetTaxable]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurNMNetTaxable]  DEFAULT ((0)) FOR [fcurNMNetTaxable]
GO
/****** Object:  Default [DF_tblCit2_fcurComputedIncTax]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurComputedIncTax]  DEFAULT ((0)) FOR [fcurComputedIncTax]
GO
/****** Object:  Default [DF_tblCit2_fcurNMPercentage]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurNMPercentage]  DEFAULT ((100)) FOR [fcurNMPercentage]
GO
/****** Object:  Default [DF_tblCit2_fcurNMIncomeTax]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurNMIncomeTax]  DEFAULT ((0)) FOR [fcurNMIncomeTax]
GO
/****** Object:  Default [DF_tblCit2_fcurTotTaxCredits]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurTotTaxCredits]  DEFAULT ((0)) FOR [fcurTotTaxCredits]
GO
/****** Object:  Default [DF_tblCit2_fcurNetIncomeTax]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurNetIncomeTax]  DEFAULT ((0)) FOR [fcurNetIncomeTax]
GO
/****** Object:  Default [DF_tblCit2_fcurFranchiseTax]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurFranchiseTax]  DEFAULT ((50)) FOR [fcurFranchiseTax]
GO
/****** Object:  Default [DF_tblCit2_fcurTotIncFranch]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurTotIncFranch]  DEFAULT ((0)) FOR [fcurTotIncFranch]
GO
/****** Object:  Default [DF_tblCit2_fcurRefundApplied]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurRefundApplied]  DEFAULT ((0)) FOR [fcurRefundApplied]
GO
/****** Object:  Default [DF_tblCit2_fcurSubTotal2]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurSubTotal2]  DEFAULT ((0)) FOR [fcurSubTotal2]
GO
/****** Object:  Default [DF_tblCit2_fblnPaymtQuart]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fblnPaymtQuart]  DEFAULT ((0)) FOR [fblnPaymtQuart]
GO
/****** Object:  Default [DF_tblCit2_fblnPaymtTent]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fblnPaymtTent]  DEFAULT ((0)) FOR [fblnPaymtTent]
GO
/****** Object:  Default [DF_tblCit2_fblnPaymtYear]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fblnPaymtYear]  DEFAULT ((0)) FOR [fblnPaymtYear]
GO
/****** Object:  Default [DF_tblCit2_fblnPaymtMethFour]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fblnPaymtMethFour]  DEFAULT ((0)) FOR [fblnPaymtMethFour]
GO
/****** Object:  Default [DF_tblCit2_fcurTotalPayments]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurTotalPayments]  DEFAULT ((0)) FOR [fcurTotalPayments]
GO
/****** Object:  Default [DF_tblCit2_fcurTaxWithholdOGP]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurTaxWithholdOGP]  DEFAULT ((0)) FOR [fcurTaxWithholdOGP]
GO
/****** Object:  Default [DF_tblCit2_fcurNMWithPass]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurNMWithPass]  DEFAULT ((0)) FOR [fcurNMWithPass]
GO
/****** Object:  Default [DF_tblCit2_fcurNMWithTotBen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurNMWithTotBen]  DEFAULT ((0)) FOR [fcurNMWithTotBen]
GO
/****** Object:  Default [DF_tblCit2_fcurTaxDue]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurTaxDue]  DEFAULT ((0)) FOR [fcurTaxDue]
GO
/****** Object:  Default [DF_tblCit2_fcurPenalty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurPenalty]  DEFAULT ((0)) FOR [fcurPenalty]
GO
/****** Object:  Default [DF_tblCit2_fcurInterest]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurInterest]  DEFAULT ((0)) FOR [fcurInterest]
GO
/****** Object:  Default [DF_tblCit2_fcurTotalDue]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurTotalDue]  DEFAULT ((0)) FOR [fcurTotalDue]
GO
/****** Object:  Default [DF_tblCit2_fcurOverPaymt]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurOverPaymt]  DEFAULT ((0)) FOR [fcurOverPaymt]
GO
/****** Object:  Default [DF_tblCit2_fcurOvPaymentNxtYr]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurOvPaymentNxtYr]  DEFAULT ((0)) FOR [fcurOvPaymentNxtYr]
GO
/****** Object:  Default [DF_tblCit2_fcurOvPaymentRef]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurOvPaymentRef]  DEFAULT ((0)) FOR [fcurOvPaymentRef]
GO
/****** Object:  Default [DF_tblCit2_fcurRefRenewEner]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurRefRenewEner]  DEFAULT ((0)) FOR [fcurRefRenewEner]
GO
/****** Object:  Default [DF_tblCit2_fcurTotalRefCred]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurTotalRefCred]  DEFAULT ((0)) FOR [fcurTotalRefCred]
GO
/****** Object:  Default [DF_tblCit2_fcurFilmProduction]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurFilmProduction]  DEFAULT ((0)) FOR [fcurFilmProduction]
GO
/****** Object:  Default [DF_tblCit2_fstrTPEmailAdd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fstrTPEmailAdd]  DEFAULT (' ') FOR [fstrTPEmailAdd]
GO
/****** Object:  Default [DF_tblCit2_fstrPrepCRSID]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fstrPrepCRSID]  DEFAULT (' ') FOR [fstrPrepCRSID]
GO
/****** Object:  Default [DF_tblCit2_fstrPrepFEIN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fstrPrepFEIN]  DEFAULT (' ') FOR [fstrPrepFEIN]
GO
/****** Object:  Default [DF_tblCit2_fstrPrepSSNPTIN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fstrPrepSSNPTIN]  DEFAULT (' ') FOR [fstrPrepSSNPTIN]
GO
/****** Object:  Default [DF_tblCit2_fstrPrepPhoneNum]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fstrPrepPhoneNum]  DEFAULT (' ') FOR [fstrPrepPhoneNum]
GO
/****** Object:  Default [DF_tblCit2_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblCit2_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblCit2_fcurFedNol]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurFedNol]  DEFAULT ((0)) FOR [fcurFedNol]
GO
/****** Object:  Default [DF_tblCit2_fcurTrfCrd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCit2] ADD  CONSTRAINT [DF_tblCit2_fcurTrfCrd]  DEFAULT ((0)) FOR [fcurTrfCrd]
GO
/****** Object:  Default [DF_tblCitA_fblnAChgReport]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fblnAChgReport]  DEFAULT ((0)) FOR [fblnAChgReport]
GO
/****** Object:  Default [DF_tblCitA_fdtmAManufacture]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fdtmAManufacture]  DEFAULT ('12/31/9999') FOR [fdtmAManufacture]
GO
/****** Object:  Default [DF_tblCitA_fcurANMNetTaxInc]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fcurANMNetTaxInc]  DEFAULT ((0)) FOR [fcurANMNetTaxInc]
GO
/****** Object:  Default [DF_tblCitA_fcurANetAllocInc]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fcurANetAllocInc]  DEFAULT ((0)) FOR [fcurANetAllocInc]
GO
/****** Object:  Default [DF_tblCitA_fcurAApportInc]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fcurAApportInc]  DEFAULT ((0)) FOR [fcurAApportInc]
GO
/****** Object:  Default [DF_tblCitA_fcurANMApportInc]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fcurANMApportInc]  DEFAULT ((0)) FOR [fcurANMApportInc]
GO
/****** Object:  Default [DF_tblCitA_fcurAInventory]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fcurAInventory]  DEFAULT ((0)) FOR [fcurAInventory]
GO
/****** Object:  Default [DF_tblCitA_fcurANMInventory]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fcurANMInventory]  DEFAULT ((0)) FOR [fcurANMInventory]
GO
/****** Object:  Default [DF_tblCitA_fcurARealProperty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fcurARealProperty]  DEFAULT ((0)) FOR [fcurARealProperty]
GO
/****** Object:  Default [DF_tblCitA_fcurANMRealProperty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fcurANMRealProperty]  DEFAULT ((0)) FOR [fcurANMRealProperty]
GO
/****** Object:  Default [DF_tblCitA_fcurAPerProperty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fcurAPerProperty]  DEFAULT ((0)) FOR [fcurAPerProperty]
GO
/****** Object:  Default [DF_tblCitA_fcurANMPerProperty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fcurANMPerProperty]  DEFAULT ((0)) FOR [fcurANMPerProperty]
GO
/****** Object:  Default [DF_tblCitA_fcurARentProperty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fcurARentProperty]  DEFAULT ((0)) FOR [fcurARentProperty]
GO
/****** Object:  Default [DF_tblCitA_fcurANMRentProperty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fcurANMRentProperty]  DEFAULT ((0)) FOR [fcurANMRentProperty]
GO
/****** Object:  Default [DF_tblCitA_fcurATotalProperty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fcurATotalProperty]  DEFAULT ((0)) FOR [fcurATotalProperty]
GO
/****** Object:  Default [DF_tblCitA_fcurANMTotalProperty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fcurANMTotalProperty]  DEFAULT ((0)) FOR [fcurANMTotalProperty]
GO
/****** Object:  Default [DF_tblCitA_fcurAPropertyFactor]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fcurAPropertyFactor]  DEFAULT ((0)) FOR [fcurAPropertyFactor]
GO
/****** Object:  Default [DF_tblCitA_fcurATotalPayRoll]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fcurATotalPayRoll]  DEFAULT ((0)) FOR [fcurATotalPayRoll]
GO
/****** Object:  Default [DF_tblCitA_fcurANMPayRoll]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fcurANMPayRoll]  DEFAULT ((0)) FOR [fcurANMPayRoll]
GO
/****** Object:  Default [DF_tblCitA_fcurAPayRollFactor]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fcurAPayRollFactor]  DEFAULT ((0)) FOR [fcurAPayRollFactor]
GO
/****** Object:  Default [DF_tblCitA_fcurASales]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fcurASales]  DEFAULT ((0)) FOR [fcurASales]
GO
/****** Object:  Default [DF_tblCitA_fcurANMSales]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fcurANMSales]  DEFAULT ((0)) FOR [fcurANMSales]
GO
/****** Object:  Default [DF_tblCitA_fcurASalesFactor]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fcurASalesFactor]  DEFAULT ((0)) FOR [fcurASalesFactor]
GO
/****** Object:  Default [DF_tblCitA_fcurTotalFactors]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fcurTotalFactors]  DEFAULT ((0)) FOR [fcurATotalFactors]
GO
/****** Object:  Default [DF_tblCitA_fcurAvgFactor]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fcurAvgFactor]  DEFAULT ((0)) FOR [fcurAAvgFactor]
GO
/****** Object:  Default [DF_tblCitA_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblCitA_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblCitA_fdtmAElection]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitA] ADD  CONSTRAINT [DF_tblCitA_fdtmAElection]  DEFAULT ('12/31/9999') FOR [fdtmAElection]
GO
/****** Object:  Default [DF_tblCitB_fcurBDividends]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBDividends]  DEFAULT ((0)) FOR [fcurBDividends]
GO
/****** Object:  Default [DF_tblCitB_fcurBNMDividends]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBNMDividends]  DEFAULT ((0)) FOR [fcurBNMDividends]
GO
/****** Object:  Default [DF_tblCitB_fcurBInterest]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBInterest]  DEFAULT ((0)) FOR [fcurBInterest]
GO
/****** Object:  Default [DF_tblCitB_fcurBNMInterest]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBNMInterest]  DEFAULT ((0)) FOR [fcurBNMInterest]
GO
/****** Object:  Default [DF_tblCitB_fcurBRents]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBRents]  DEFAULT ((0)) FOR [fcurBRents]
GO
/****** Object:  Default [DF_tblCitB_fcurBNMRents]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBNMRents]  DEFAULT ((0)) FOR [fcurBNMRents]
GO
/****** Object:  Default [DF_tblCitB_fcurBRoyalties]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBRoyalties]  DEFAULT ((0)) FOR [fcurBRoyalties]
GO
/****** Object:  Default [DF_tblCitB_fcurBNMRoyalties]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBNMRoyalties]  DEFAULT ((0)) FOR [fcurBNMRoyalties]
GO
/****** Object:  Default [DF_tblCitB_fcurBProfitLoss]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBProfitLoss]  DEFAULT ((0)) FOR [fcurBProfitLoss]
GO
/****** Object:  Default [DF_tblCitB_fcurBNMProfitLoss]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBNMProfitLoss]  DEFAULT ((0)) FOR [fcurBNMProfitLoss]
GO
/****** Object:  Default [DF_tblCitB_fcurBIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBIncome]  DEFAULT ((0)) FOR [fcurBIncome]
GO
/****** Object:  Default [DF_tblCitB_fcurBNMIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBNMIncome]  DEFAULT ((0)) FOR [fcurBNMIncome]
GO
/****** Object:  Default [DF_tblCitB_fcurBOthIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBOthIncome]  DEFAULT ((0)) FOR [fcurBOthIncome]
GO
/****** Object:  Default [DF_tblCitB_fcurBNMOthIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBNMOthIncome]  DEFAULT ((0)) FOR [fcurBNMOthIncome]
GO
/****** Object:  Default [DF_tblCitB_fcurBNetAllocInc]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBNetAllocInc]  DEFAULT ((0)) FOR [fcurBNetAllocInc]
GO
/****** Object:  Default [DF_tblCitB_fcurBNMNetAllocInc]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBNMNetAllocInc]  DEFAULT ((0)) FOR [fcurBNMNetAllocInc]
GO
/****** Object:  Default [DF_tblCitB_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblCitB_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblCitB_fcurBGaDividends]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBGaDividends]  DEFAULT ((0)) FOR [fcurBGaDividends]
GO
/****** Object:  Default [DF_tblCitB_fcurBReDividends]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBReDividends]  DEFAULT ((0)) FOR [fcurBReDividends]
GO
/****** Object:  Default [DF_tblCitB_fcurBGaInterest]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBGaInterest]  DEFAULT ((0)) FOR [fcurBGaInterest]
GO
/****** Object:  Default [DF_tblCitB_fcurBReInterest]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBReInterest]  DEFAULT ((0)) FOR [fcurBReInterest]
GO
/****** Object:  Default [DF_tblCitB_fcurBGaRents]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBGaRents]  DEFAULT ((0)) FOR [fcurBGaRents]
GO
/****** Object:  Default [DF_tblCitB_fcurBReRents]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBReRents]  DEFAULT ((0)) FOR [fcurBReRents]
GO
/****** Object:  Default [DF_tblCitB_fcurBGaRoyalties]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBGaRoyalties]  DEFAULT ((0)) FOR [fcurBGaRoyalties]
GO
/****** Object:  Default [DF_tblCitB_fcurBReRoyalties]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBReRoyalties]  DEFAULT ((0)) FOR [fcurBReRoyalties]
GO
/****** Object:  Default [DF_tblCitB_fcurBGaProfitLoss]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBGaProfitLoss]  DEFAULT ((0)) FOR [fcurBGaProfitLoss]
GO
/****** Object:  Default [DF_tblCitB_fcurBReProfitLoss]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBReProfitLoss]  DEFAULT ((0)) FOR [fcurBReProfitLoss]
GO
/****** Object:  Default [DF_tblCitB_fcurBGaIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBGaIncome]  DEFAULT ((0)) FOR [fcurBGaIncome]
GO
/****** Object:  Default [DF_tblCitB_fcurBReIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBReIncome]  DEFAULT ((0)) FOR [fcurBReIncome]
GO
/****** Object:  Default [DF_tblCitB_fcurBGaOthIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBGaOthIncome]  DEFAULT ((0)) FOR [fcurBGaOthIncome]
GO
/****** Object:  Default [DF_tblCitB_fcurBReOthIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitB] ADD  CONSTRAINT [DF_tblCitB_fcurBReOthIncome]  DEFAULT ((0)) FOR [fcurBReOthIncome]
GO
/****** Object:  Default [DF_tblCitC_fcurCNMNetTaxable]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitC] ADD  CONSTRAINT [DF_tblCitC_fcurCNMNetTaxable]  DEFAULT ((0)) FOR [fcurCNMNetTaxable]
GO
/****** Object:  Default [DF_tblCitC_fcurCNMAllocIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitC] ADD  CONSTRAINT [DF_tblCitC_fcurCNMAllocIncome]  DEFAULT ((0)) FOR [fcurCNMAllocIncome]
GO
/****** Object:  Default [DF_tblCitC_fcurCNMApportIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitC] ADD  CONSTRAINT [DF_tblCitC_fcurCNMApportIncome]  DEFAULT ((0)) FOR [fcurCNMApportIncome]
GO
/****** Object:  Default [DF_tblCitC_fcurCSubTotal]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitC] ADD  CONSTRAINT [DF_tblCitC_fcurCSubTotal]  DEFAULT ((0)) FOR [fcurCSubTotal]
GO
/****** Object:  Default [DF_tblCitC_fcurCNMPercentage]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitC] ADD  CONSTRAINT [DF_tblCitC_fcurCNMPercentage]  DEFAULT ((0)) FOR [fcurCNMPercentage]
GO
/****** Object:  Default [DF_tblCitC_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitC] ADD  CONSTRAINT [DF_tblCitC_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblCitC_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitC] ADD  CONSTRAINT [DF_tblCitC_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblCitCR_fcurCRChildCare]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCR] ADD  CONSTRAINT [DF_tblCitCR_fcurCRChildCare]  DEFAULT ((0)) FOR [fcurCRChildCare]
GO
/****** Object:  Default [DF_tblCitCR_fcurCRCultProp]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCR] ADD  CONSTRAINT [DF_tblCitCR_fcurCRCultProp]  DEFAULT ((0)) FOR [fcurCRCultProp]
GO
/****** Object:  Default [DF_tblCitCR_fcurCRBusFac]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCR] ADD  CONSTRAINT [DF_tblCitCR_fcurCRBusFac]  DEFAULT ((0)) FOR [fcurCRBusFac]
GO
/****** Object:  Default [DF_tblCitCR_fcurCRInterGov]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCR] ADD  CONSTRAINT [DF_tblCitCR_fcurCRInterGov]  DEFAULT ((0)) FOR [fcurCRInterGov]
GO
/****** Object:  Default [DF_tblCitCR_fcurCRRuralJob]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCR] ADD  CONSTRAINT [DF_tblCitCR_fcurCRRuralJob]  DEFAULT ((0)) FOR [fcurCRRuralJob]
GO
/****** Object:  Default [DF_tblCitCR_fcurCRTechJobs]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCR] ADD  CONSTRAINT [DF_tblCitCR_fcurCRTechJobs]  DEFAULT ((0)) FOR [fcurCRTechJobs]
GO
/****** Object:  Default [DF_tblCitCR_fcurCRElecCard]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCR] ADD  CONSTRAINT [DF_tblCitCR_fcurCRElecCard]  DEFAULT ((0)) FOR [fcurCRElecCard]
GO
/****** Object:  Default [DF_tblCitCR_fcurCRJobMentor]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCR] ADD  CONSTRAINT [DF_tblCitCR_fcurCRJobMentor]  DEFAULT ((0)) FOR [fcurCRJobMentor]
GO
/****** Object:  Default [DF_tblCitCR_fcurCRLandCons]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCR] ADD  CONSTRAINT [DF_tblCitCR_fcurCRLandCons]  DEFAULT ((0)) FOR [fcurCRLandCons]
GO
/****** Object:  Default [DF_tblCitCR_fcurCRAffordHouse]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCR] ADD  CONSTRAINT [DF_tblCitCR_fcurCRAffordHouse]  DEFAULT ((0)) FOR [fcurCRAffordHouse]
GO
/****** Object:  Default [DF_tblCitCR_fcurCRBioDiesel]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCR] ADD  CONSTRAINT [DF_tblCitCR_fcurCRBioDiesel]  DEFAULT ((0)) FOR [fcurCRBioDiesel]
GO
/****** Object:  Default [DF_tblCitCR_fcurCRSusBldg]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCR] ADD  CONSTRAINT [DF_tblCitCR_fcurCRSusBldg]  DEFAULT ((0)) FOR [fcurCRSusBldg]
GO
/****** Object:  Default [DF_tblCitCR_fcurCRWaterCons]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCR] ADD  CONSTRAINT [DF_tblCitCR_fcurCRWaterCons]  DEFAULT ((0)) FOR [fcurCRWaterCons]
GO
/****** Object:  Default [DF_tblCitCR_fcurCRAdvEnergy]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCR] ADD  CONSTRAINT [DF_tblCitCR_fcurCRAdvEnergy]  DEFAULT ((0)) FOR [fcurCRAdvEnergy]
GO
/****** Object:  Default [DF_tblCitCR_fcurCRGeolPump]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCR] ADD  CONSTRAINT [DF_tblCitCR_fcurCRGeolPump]  DEFAULT ((0)) FOR [fcurCRGeolPump]
GO
/****** Object:  Default [DF_tblCitCR_fcurCRAgrBioMass]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCR] ADD  CONSTRAINT [DF_tblCitCR_fcurCRAgrBioMass]  DEFAULT ((0)) FOR [fcurCRAgrBioMass]
GO
/****** Object:  Default [DF_tblCitCR_fcurCRFilmApplied]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCR] ADD  CONSTRAINT [DF_tblCitCR_fcurCRFilmApplied]  DEFAULT ((0)) FOR [fcurCRFilmApplied]
GO
/****** Object:  Default [DF_tblCitCR_fcurCRFilmApproved]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCR] ADD  CONSTRAINT [DF_tblCitCR_fcurCRFilmApproved]  DEFAULT ((0)) FOR [fcurCRFilmApproved]
GO
/****** Object:  Default [DF_tblCitCR_fcurCRRenewEner]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCR] ADD  CONSTRAINT [DF_tblCitCR_fcurCRRenewEner]  DEFAULT ((0)) FOR [fcurCRRenewEner]
GO
/****** Object:  Default [DF_tblCitCR_fcurCRVetEmploy]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCR] ADD  CONSTRAINT [DF_tblCitCR_fcurCRVetEmploy]  DEFAULT ((0)) FOR [fcurCRVetEmploy]
GO
/****** Object:  Default [DF_tblCitCR_fcurCRTotCredit]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCR] ADD  CONSTRAINT [DF_tblCitCR_fcurCRTotCredit]  DEFAULT ((0)) FOR [fcurCRTotCredit]
GO
/****** Object:  Default [DF_tblCitCR_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCR] ADD  CONSTRAINT [DF_tblCitCR_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblCitCR_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCR] ADD  CONSTRAINT [DF_tblCitCR_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblCitCRS_flngRepNum]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCRS] ADD  CONSTRAINT [DF_tblCitCRS_flngRepNum]  DEFAULT ((0)) FOR [flngRepNum]
GO
/****** Object:  Default [DF_tblCitCRS_fstrCrdType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCRS] ADD  CONSTRAINT [DF_tblCitCRS_fstrCrdType]  DEFAULT (' ') FOR [fstrCrdType]
GO
/****** Object:  Default [DF_tblCitCRS_fstrApprove]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCRS] ADD  CONSTRAINT [DF_tblCitCRS_fstrApprove]  DEFAULT (' ') FOR [fstrApprove]
GO
/****** Object:  Default [DF_tblCitCRS_fcurApplied]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCRS] ADD  CONSTRAINT [DF_tblCitCRS_fcurApplied]  DEFAULT ((0)) FOR [fcurApplied]
GO
/****** Object:  Default [DF_tblCitCRS_fcurRefund]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCRS] ADD  CONSTRAINT [DF_tblCitCRS_fcurRefund]  DEFAULT ((0)) FOR [fcurRefund]
GO
/****** Object:  Default [DF_tblCitCRS_fblnFilled]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCRS] ADD  CONSTRAINT [DF_tblCitCRS_fblnFilled]  DEFAULT ((0)) FOR [fblnFilled]
GO
/****** Object:  Default [DF_tblCitCRS_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCRS] ADD  CONSTRAINT [DF_tblCitCRS_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblCitCRS_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCRS] ADD  CONSTRAINT [DF_tblCitCRS_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblCitCRS_fstrMPDLN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCRS] ADD  CONSTRAINT [DF_tblCitCRS_fstrMPDLN]  DEFAULT (' ') FOR [fstrMPDLN]
GO
/****** Object:  Default [DF_tblCitCRS_fstrTaxForm]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCRS] ADD  CONSTRAINT [DF_tblCitCRS_fstrTaxForm]  DEFAULT (' ') FOR [fstrTaxForm]
GO
/****** Object:  Default [DF_tblCitCRS_fstrSource]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCRS] ADD  CONSTRAINT [DF_tblCitCRS_fstrSource]  DEFAULT ('GENTAX') FOR [fstrSource]
GO
/****** Object:  Default [DF_tblCitCRS_fblnFound]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCRS] ADD  CONSTRAINT [DF_tblCitCRS_fblnFound]  DEFAULT ((0)) FOR [fblnFound]
GO
/****** Object:  Default [DF_tblCitCrsT_fcurTotApplied1]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCrsT] ADD  CONSTRAINT [DF_tblCitCrsT_fcurTotApplied1]  DEFAULT ((0)) FOR [fcurTotApplied1]
GO
/****** Object:  Default [DF_tblCitCrsT_fcurTotRefund1]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCrsT] ADD  CONSTRAINT [DF_tblCitCrsT_fcurTotRefund1]  DEFAULT ((0)) FOR [fcurTotRefund1]
GO
/****** Object:  Default [DF_tblCitCrsT_fcurTotApplied2]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCrsT] ADD  CONSTRAINT [DF_tblCitCrsT_fcurTotApplied2]  DEFAULT ((0)) FOR [fcurTotApplied2]
GO
/****** Object:  Default [DF_tblCitCrsT_fcurTotRefund2]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCrsT] ADD  CONSTRAINT [DF_tblCitCrsT_fcurTotRefund2]  DEFAULT ((0)) FOR [fcurTotRefund2]
GO
/****** Object:  Default [DF_tblCitCrsT_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCrsT] ADD  CONSTRAINT [DF_tblCitCrsT_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblCitCrsT_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitCrsT] ADD  CONSTRAINT [DF_tblCitCrsT_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblCitD_fcurDForDiv]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitD] ADD  CONSTRAINT [DF_tblCitD_fcurDForDiv]  DEFAULT ((0)) FOR [fcurDForDiv]
GO
/****** Object:  Default [DF_tblCitD_fcurDDivLess20]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitD] ADD  CONSTRAINT [DF_tblCitD_fcurDDivLess20]  DEFAULT ((0)) FOR [fcurDDivLess20]
GO
/****** Object:  Default [DF_tblCitD_fcurDDivLess80]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitD] ADD  CONSTRAINT [DF_tblCitD_fcurDDivLess80]  DEFAULT ((0)) FOR [fcurDDivLess80]
GO
/****** Object:  Default [DF_tblCitD_fcurDDivMore80]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitD] ADD  CONSTRAINT [DF_tblCitD_fcurDDivMore80]  DEFAULT ((0)) FOR [fcurDDivMore80]
GO
/****** Object:  Default [DF_tblCitD_fcurDTotalNMDedn]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitD] ADD  CONSTRAINT [DF_tblCitD_fcurDTotalNMDedn]  DEFAULT ((0)) FOR [fcurDTotalNMDedn]
GO
/****** Object:  Default [DF_tblCitD_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitD] ADD  CONSTRAINT [DF_tblCitD_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblCitD_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitD] ADD  CONSTRAINT [DF_tblCitD_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblCitPtd_fstrFein]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fstrFein]  DEFAULT (' ') FOR [fstrFein]
GO
/****** Object:  Default [DF_tblCitPtd_fcurNMNetIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fcurNMNetIncome]  DEFAULT ((0)) FOR [fcurNMNetIncome]
GO
/****** Object:  Default [DF_tblCitPtd_fblnAmend]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fblnAmend]  DEFAULT ((0)) FOR [fblnAmend]
GO
/****** Object:  Default [DF_tblCitPtd_fdtmPostMarkDate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fdtmPostMarkDate]  DEFAULT ('12/31/9999') FOR [fdtmPostMarkDate]
GO
/****** Object:  Default [DF_tblCitPtd_fstrName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fstrName]  DEFAULT (' ') FOR [fstrName]
GO
/****** Object:  Default [DF_tblCitPtd_fstrAddress]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fstrAddress]  DEFAULT (' ') FOR [fstrStreet]
GO
/****** Object:  Default [DF_tblCitPtd_fstrCity]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fstrCity]  DEFAULT (' ') FOR [fstrCity]
GO
/****** Object:  Default [DF_tblCitPtd_fstrState]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fstrState]  DEFAULT (' ') FOR [fstrState]
GO
/****** Object:  Default [DF_tblCitPtd_fstrCountry]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fstrCountry]  DEFAULT ('USA') FOR [fstrCountry]
GO
/****** Object:  Default [DF_tblCitPtd_fstrZipCode]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fstrZipCode]  DEFAULT (' ') FOR [fstrZipCode]
GO
/****** Object:  Default [DF_tblCitPtd_fblnPTE]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fblnPTE]  DEFAULT ((0)) FOR [fblnPte]
GO
/****** Object:  Default [DF_tblCitPtd_fblnScorp]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fblnScorp]  DEFAULT ((0)) FOR [fblnScorp]
GO
/****** Object:  Default [DF_tblCitPtd_fblnCit]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fblnCit]  DEFAULT ((1)) FOR [fblnCit]
GO
/****** Object:  Default [DF_tblCitPtd_fblnFid]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fblnFid]  DEFAULT ((0)) FOR [fblnFid]
GO
/****** Object:  Default [DF_tblCitPtd_fblnOth]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fblnOth]  DEFAULT ((0)) FOR [fblnOth]
GO
/****** Object:  Default [DF_tblCitPtd_fstrOthWhy]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fstrOthWhy]  DEFAULT (' ') FOR [fstrOthWhy]
GO
/****** Object:  Default [DF_tblCitPtd_fdtmTaxBeg]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fdtmTaxBeg]  DEFAULT ('12/31/9999') FOR [fdtmTaxYrBeg]
GO
/****** Object:  Default [DF_tblCitPtd_fdtmTaxEnd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fdtmTaxEnd]  DEFAULT ('12/31/9999') FOR [fdtmTaxYrEnd]
GO
/****** Object:  Default [DF_tblCitPtd_fdtmDue]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fdtmDue]  DEFAULT ('12/31/9999') FOR [fdtmTaxDue]
GO
/****** Object:  Default [DF_tblCitPtd_fdtmExtend]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fdtmExtend]  DEFAULT ('12/31/9999') FOR [fdtmExtDue]
GO
/****** Object:  Default [DF_tblCitPtd_fcurWthPage]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fcurWthPage]  DEFAULT ((0)) FOR [fcurWthPage]
GO
/****** Object:  Default [DF_tblCitPtd_fcurWthAll]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fcurWthAll]  DEFAULT ((0)) FOR [fcurWthAll]
GO
/****** Object:  Default [DF_tblCitPtd_fcurWthOwn]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fcurWthOwn]  DEFAULT ((0)) FOR [fcurWthOwn]
GO
/****** Object:  Default [DF_tblCitPtd_fcurWthPte]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fcurWthPte]  DEFAULT ((0)) FOR [fcurWthPte]
GO
/****** Object:  Default [DF_tblCitPtd_fcurSubTotal]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fcurSubTotal]  DEFAULT ((0)) FOR [fcurSubTotal]
GO
/****** Object:  Default [DF_tblCitPtd_fcurPenalty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fcurPenalty]  DEFAULT ((0)) FOR [fcurPenalty]
GO
/****** Object:  Default [DF_tblCitPtd_fcurInterest]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fcurInterest]  DEFAULT ((0)) FOR [fcurInterest]
GO
/****** Object:  Default [DF_tblCitPtd_fcurTotalDue]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fcurTotalDue]  DEFAULT ((0)) FOR [fcurTotalDue]
GO
/****** Object:  Default [DF_tblCitPtd_fdtmSign]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fdtmSign]  DEFAULT ('12/31/9999') FOR [fdtmSigned]
GO
/****** Object:  Default [DF_tblCitPtd_fstrPhone]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fstrPhone]  DEFAULT (' ') FOR [fstrPhone]
GO
/****** Object:  Default [DF_tblCitPtd_fstrEmail]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fstrEmail]  DEFAULT (' ') FOR [fstrEmail]
GO
/****** Object:  Default [DF_tblCitPtd_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblCitPtd_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtd] ADD  CONSTRAINT [DF_tblCitPtd_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblCitPtdS_flngRepNum]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtdS] ADD  CONSTRAINT [DF_tblCitPtdS_flngRepNum]  DEFAULT ((0)) FOR [flngRepNum]
GO
/****** Object:  Default [DF_tblCitPtdS_fstrId]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtdS] ADD  CONSTRAINT [DF_tblCitPtdS_fstrId]  DEFAULT (' ') FOR [fstrId]
GO
/****** Object:  Default [DF_tblCitPtdS_fblnFein]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtdS] ADD  CONSTRAINT [DF_tblCitPtdS_fblnFein]  DEFAULT ((0)) FOR [fblnFein]
GO
/****** Object:  Default [DF_tblCitPtdS_fblnSsn]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtdS] ADD  CONSTRAINT [DF_tblCitPtdS_fblnSsn]  DEFAULT ((0)) FOR [fblnSsn]
GO
/****** Object:  Default [DF_tblCitPtdS_fstrName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtdS] ADD  CONSTRAINT [DF_tblCitPtdS_fstrName]  DEFAULT (' ') FOR [fstrName]
GO
/****** Object:  Default [DF_tblCitPtdS_fstrAddr]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtdS] ADD  CONSTRAINT [DF_tblCitPtdS_fstrAddr]  DEFAULT (' ') FOR [fstrStreet]
GO
/****** Object:  Default [DF_tblCitPtdS_fstrCity]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtdS] ADD  CONSTRAINT [DF_tblCitPtdS_fstrCity]  DEFAULT (' ') FOR [fstrCity]
GO
/****** Object:  Default [DF_tblCitPtdS_fstrState]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtdS] ADD  CONSTRAINT [DF_tblCitPtdS_fstrState]  DEFAULT (' ') FOR [fstrState]
GO
/****** Object:  Default [DF_tblCitPtdS_fstrCountry]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtdS] ADD  CONSTRAINT [DF_tblCitPtdS_fstrCountry]  DEFAULT ('USA') FOR [fstrCountry]
GO
/****** Object:  Default [DF_tblCitPtdS_fstrZipCode]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtdS] ADD  CONSTRAINT [DF_tblCitPtdS_fstrZipCode]  DEFAULT (' ') FOR [fstrZipCode]
GO
/****** Object:  Default [DF_tblCitPtdS_fblnOutSide]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtdS] ADD  CONSTRAINT [DF_tblCitPtdS_fblnOutSide]  DEFAULT ((0)) FOR [fblnOutSide]
GO
/****** Object:  Default [DF_tblCitPtdS_fcurOwnNet]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtdS] ADD  CONSTRAINT [DF_tblCitPtdS_fcurOwnNet]  DEFAULT ((0)) FOR [fcurOwnNet]
GO
/****** Object:  Default [DF_tblCitPtdS_fcurOwnWth]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtdS] ADD  CONSTRAINT [DF_tblCitPtdS_fcurOwnWth]  DEFAULT ((0)) FOR [fcurOwnWth]
GO
/****** Object:  Default [DF_tblCitPtdS_fbln41353]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtdS] ADD  CONSTRAINT [DF_tblCitPtdS_fbln41353]  DEFAULT ((0)) FOR [fbln41353]
GO
/****** Object:  Default [DF_tblCitPtdS_fblnFilled]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtdS] ADD  CONSTRAINT [DF_tblCitPtdS_fblnFilled]  DEFAULT ((0)) FOR [fblnFilled]
GO
/****** Object:  Default [DF_tblCitPtdS_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtdS] ADD  CONSTRAINT [DF_tblCitPtdS_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblCitPtdS_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtdS] ADD  CONSTRAINT [DF_tblCitPtdS_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblCitPtdS_fstrMPDLN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtdS] ADD  CONSTRAINT [DF_tblCitPtdS_fstrMPDLN]  DEFAULT (' ') FOR [fstrMPDLN]
GO
/****** Object:  Default [DF_tblCitPtdS_fstrTaxForm]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtdS] ADD  CONSTRAINT [DF_tblCitPtdS_fstrTaxForm]  DEFAULT ('') FOR [fstrTaxForm]
GO
/****** Object:  Default [DF_tblCitPtdS_fstrSource]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtdS] ADD  CONSTRAINT [DF_tblCitPtdS_fstrSource]  DEFAULT ('GENKFI') FOR [fstrSource]
GO
/****** Object:  Default [DF_tblCitPtdS_fblnFound]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitPtdS] ADD  CONSTRAINT [DF_tblCitPtdS_fblnFound]  DEFAULT ((0)) FOR [fblnFound]
GO
/****** Object:  Default [DF__tblCitRPT__flngR__2BE024C3]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitRPT] ADD  CONSTRAINT [DF__tblCitRPT__flngR__2BE024C3]  DEFAULT ((1)) FOR [flngRepNum]
GO
/****** Object:  Default [DF__tblCitRPT__fstrC__2CD448FC]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitRPT] ADD  CONSTRAINT [DF__tblCitRPT__fstrC__2CD448FC]  DEFAULT ('') FOR [fstrCorpName]
GO
/****** Object:  Default [DF__tblCitRPT__fstrC__2DC86D35]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitRPT] ADD  CONSTRAINT [DF__tblCitRPT__fstrC__2DC86D35]  DEFAULT ('') FOR [fstrCorpFEIN]
GO
/****** Object:  Default [DF__tblCitRPT__fstrP__2EBC916E]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitRPT] ADD  CONSTRAINT [DF__tblCitRPT__fstrP__2EBC916E]  DEFAULT ((0)) FOR [fstrPaymentApplied]
GO
/****** Object:  Default [DF__tblCitRPT__fstr5__2FB0B5A7]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitRPT] ADD  CONSTRAINT [DF__tblCitRPT__fstr5__2FB0B5A7]  DEFAULT ((0)) FOR [fstr50FranTax]
GO
/****** Object:  Default [DF_tblCitRPT_fblnFilled]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitRPT] ADD  CONSTRAINT [DF_tblCitRPT_fblnFilled]  DEFAULT ((0)) FOR [fblnFilled]
GO
/****** Object:  Default [DF_tblCitRPT_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitRPT] ADD  CONSTRAINT [DF_tblCitRPT_fstrWho]  DEFAULT ('') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblCitRPT_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitRPT] ADD  CONSTRAINT [DF_tblCitRPT_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblCitRPT_fstrState]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitRPT] ADD  CONSTRAINT [DF_tblCitRPT_fstrState]  DEFAULT (' ') FOR [fstrState]
GO
/****** Object:  Default [DF_tblCitRPT_fstrCountry]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitRPT] ADD  CONSTRAINT [DF_tblCitRPT_fstrCountry]  DEFAULT ('USA') FOR [fstrCountry]
GO
/****** Object:  Default [DF_tblCitRPT_fcurTrfCrd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCitRPT] ADD  CONSTRAINT [DF_tblCitRPT_fcurTrfCrd]  DEFAULT ((0)) FOR [fcurTrfCrd]
GO
/****** Object:  Default [DF_tblCorresp_fstrDocType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCorresp] ADD  CONSTRAINT [DF_tblCorresp_fstrDocType]  DEFAULT (' ') FOR [fstrDocType]
GO
/****** Object:  Default [DF_tblCorresp_fstrDocRefNbr]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCorresp] ADD  CONSTRAINT [DF_tblCorresp_fstrDocRefNbr]  DEFAULT (' ') FOR [fstrDocRefNbr]
GO
/****** Object:  Default [DF_tblCorresp_fstrCrsWdtId]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCorresp] ADD  CONSTRAINT [DF_tblCorresp_fstrCrsWdtId]  DEFAULT (' ') FOR [fstrCrsWdtId]
GO
/****** Object:  Default [DF_tblCorresp_fstrCitId]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCorresp] ADD  CONSTRAINT [DF_tblCorresp_fstrCitId]  DEFAULT (' ') FOR [fstrCitId]
GO
/****** Object:  Default [DF_tblCorresp_fstrFein]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCorresp] ADD  CONSTRAINT [DF_tblCorresp_fstrFein]  DEFAULT (' ') FOR [fstrFein]
GO
/****** Object:  Default [DF_tblCorresp_fstrSsn]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCorresp] ADD  CONSTRAINT [DF_tblCorresp_fstrSsn]  DEFAULT (' ') FOR [fstrSsn]
GO
/****** Object:  Default [DF_tblCorresp_fstrProgramType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCorresp] ADD  CONSTRAINT [DF_tblCorresp_fstrProgramType]  DEFAULT (' ') FOR [fstrProgramType]
GO
/****** Object:  Default [DF_tblCorresp_fstrLocation]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCorresp] ADD  CONSTRAINT [DF_tblCorresp_fstrLocation]  DEFAULT ('IBML') FOR [fstrLocation]
GO
/****** Object:  Default [DF_tblCorresp_fstrDLN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCorresp] ADD  CONSTRAINT [DF_tblCorresp_fstrDLN]  DEFAULT (' ') FOR [fstrDLN]
GO
/****** Object:  Default [DF_tblCorresp_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCorresp] ADD  CONSTRAINT [DF_tblCorresp_fstrWho]  DEFAULT ('BATCH') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblCorresp_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblCorresp] ADD  CONSTRAINT [DF_tblCorresp_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblExtError_fstrExtPgm]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblExtError] ADD  CONSTRAINT [DF_tblExtError_fstrExtPgm]  DEFAULT (' ') FOR [fstrExtPgm]
GO
/****** Object:  Default [DF_tblExtError_fstrBatchId]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblExtError] ADD  CONSTRAINT [DF_tblExtError_fstrBatchId]  DEFAULT (' ') FOR [fstrBatchId]
GO
/****** Object:  Default [DF_tblExtError_fintJobId]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblExtError] ADD  CONSTRAINT [DF_tblExtError_fintJobId]  DEFAULT ((0)) FOR [fintJobId]
GO
/****** Object:  Default [DF_tblExtError_flngSequence]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblExtError] ADD  CONSTRAINT [DF_tblExtError_flngSequence]  DEFAULT ((0)) FOR [flngSequence]
GO
/****** Object:  Default [DF_tblExtError_fstrFileType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblExtError] ADD  CONSTRAINT [DF_tblExtError_fstrFileType]  DEFAULT (' ') FOR [fstrFileType]
GO
/****** Object:  Default [DF_tblMbiError_fstrTaxProgram]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblExtError] ADD  CONSTRAINT [DF_tblMbiError_fstrTaxProgram]  DEFAULT (' ') FOR [fstrTaxProgram]
GO
/****** Object:  Default [DF_tblMbiError_fstrTaxYear]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblExtError] ADD  CONSTRAINT [DF_tblMbiError_fstrTaxYear]  DEFAULT (' ') FOR [fstrTaxYear]
GO
/****** Object:  Default [DF_tblExtError_fstrErrMsg]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblExtError] ADD  CONSTRAINT [DF_tblExtError_fstrErrMsg]  DEFAULT (' ') FOR [fstrErrMsg]
GO
/****** Object:  Default [DF_tblMbiError_fstrImgPath]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblExtError] ADD  CONSTRAINT [DF_tblMbiError_fstrImgPath]  DEFAULT (' ') FOR [fstrImgPath]
GO
/****** Object:  Default [DF_tblMbiError_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblExtError] ADD  CONSTRAINT [DF_tblMbiError_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblExtError_fblnActive]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblExtError] ADD  CONSTRAINT [DF_tblExtError_fblnActive]  DEFAULT ((1)) FOR [fblnActive]
GO
/****** Object:  Default [DF_tblFid_fstrFein]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fstrFein]  DEFAULT (' ') FOR [fstrFein]
GO
/****** Object:  Default [DF_tblFid_fstrEstate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fstrEstate]  DEFAULT (' ') FOR [fstrEstate]
GO
/****** Object:  Default [DF_tblFid_fstrName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fstrName]  DEFAULT (' ') FOR [fstrName]
GO
/****** Object:  Default [DF_tblFid_fstrAddress]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fstrAddress]  DEFAULT (' ') FOR [fstrAddress]
GO
/****** Object:  Default [DF_tblFid_fstrCity]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fstrCity]  DEFAULT (' ') FOR [fstrCity]
GO
/****** Object:  Default [DF_tblFid_fstrState]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fstrState]  DEFAULT (' ') FOR [fstrState]
GO
/****** Object:  Default [DF_tblFid_fstrCountry]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fstrCountry]  DEFAULT ('USA') FOR [fstrCountry]
GO
/****** Object:  Default [DF_tblFid_fstrZipCode]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fstrZipCode]  DEFAULT (' ') FOR [fstrZipCode]
GO
/****** Object:  Default [DF_tblFid_fdtmPostMark]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fdtmPostMark]  DEFAULT ('12/31/9999') FOR [fdtmPostMarkDate]
GO
/****** Object:  Default [DF_tblFid_fdtmEstateCreate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fdtmEstateCreate]  DEFAULT ('12/31/9999') FOR [fdtmEstateCreate]
GO
/****** Object:  Default [DF_tblFid_fdtmDistribution]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fdtmDistribution]  DEFAULT ('12/31/9999') FOR [fdtmDistribution]
GO
/****** Object:  Default [DF_tblFid_fblnFedAdjust]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fblnFedAdjust]  DEFAULT ((0)) FOR [fblnFedAdjust]
GO
/****** Object:  Default [DF_tblFid_fintSpecCalc]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fintSpecCalc]  DEFAULT ((0)) FOR [fintSpecCalc]
GO
/****** Object:  Default [DF_tblFid_fdtmTaxYrBeg]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fdtmTaxYrBeg]  DEFAULT ('12/31/9999') FOR [fdtmTaxYrBeg]
GO
/****** Object:  Default [DF_tblFid_fdtmTaxYrEnd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fdtmTaxYrEnd]  DEFAULT ('12/31/9999') FOR [fdtmTaxYrEnd]
GO
/****** Object:  Default [DF_tblFid_fblnAmended]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fblnAmended]  DEFAULT ((0)) FOR [fblnAmended]
GO
/****** Object:  Default [DF_tblFid_fblnEstate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fblnEstate]  DEFAULT ((0)) FOR [fblnEstate]
GO
/****** Object:  Default [DF_tblFid_fblnSimple]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fblnSimple]  DEFAULT ((0)) FOR [fblnSimple]
GO
/****** Object:  Default [DF_tblFid_fblnComplex]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fblnComplex]  DEFAULT ((0)) FOR [fblnComplex]
GO
/****** Object:  Default [DF_tblFid_fblnNMResident]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fblnNMResident]  DEFAULT ((0)) FOR [fblnNMResident]
GO
/****** Object:  Default [DF_tblFid_fdtmExtDueDate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fdtmExtDueDate]  DEFAULT ('12/31/9999') FOR [fdtmExtDueDate]
GO
/****** Object:  Default [DF_tblFid_fcurFedTaxInc]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurFedTaxInc]  DEFAULT ((0)) FOR [fcurFedTaxInc]
GO
/****** Object:  Default [DF_tblFid_fcurFedIncAdd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurFedIncAdd]  DEFAULT ((0)) FOR [fcurFedIncAdd]
GO
/****** Object:  Default [DF_tblFid_fcurFedIncDed]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurFedIncDed]  DEFAULT ((0)) FOR [fcurFedIncDed]
GO
/****** Object:  Default [DF_tblFid_fcurNMTaxable]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurNMTaxable]  DEFAULT ((0)) FOR [fcurNMTaxable]
GO
/****** Object:  Default [DF_tblFid_fcurGrossTaxDue]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurGrossTaxDue]  DEFAULT ((0)) FOR [fcurGrossTaxDue]
GO
/****** Object:  Default [DF_tblFid_fcurNMPercent]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurNMPercent]  DEFAULT ((100)) FOR [fcurNMPercent]
GO
/****** Object:  Default [DF_tblFid_fcurNMIncTax]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurNMIncTax]  DEFAULT ((0)) FOR [fcurNMIncTax]
GO
/****** Object:  Default [DF_tblFid_fcurLumpSumTax]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurLumpSumTax]  DEFAULT ((0)) FOR [fcurLumpSumTax]
GO
/****** Object:  Default [DF_tblFid_fcurTotNMTax]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurTotNMTax]  DEFAULT ((0)) FOR [fcurTotNMTax]
GO
/****** Object:  Default [DF_tblFid_fcurTaxPdOthState]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurTaxPdOthState]  DEFAULT ((0)) FOR [fcurTaxPdOthState]
GO
/****** Object:  Default [DF_tblFid_fcurCredApplied]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurCredApplied]  DEFAULT ((0)) FOR [fcurCredApplied]
GO
/****** Object:  Default [DF_tblFid_fcurNetNMTax]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurNetNMTax]  DEFAULT ((0)) FOR [fcurNetNMTax]
GO
/****** Object:  Default [DF_tblFid_fcurTotPymts]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurTotPymts]  DEFAULT ((0)) FOR [fcurTotPymts]
GO
/****** Object:  Default [DF_tblFid_fcurNMWithHold]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurNMWithHold]  DEFAULT ((0)) FOR [fcurNMWithHold]
GO
/****** Object:  Default [DF_tblFid_fcurNMWithOGP]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurNMWithOGP]  DEFAULT ((0)) FOR [fcurNMWithOGP]
GO
/****** Object:  Default [DF_tblFid_fcurNMWithPass]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurNMWithPass]  DEFAULT ((0)) FOR [fcurNMWithPass]
GO
/****** Object:  Default [DF_tblFid_fcurNMWithTotBen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurNMWithTotBen]  DEFAULT ((0)) FOR [fcurNMWithTotBen]
GO
/****** Object:  Default [DF_tblFid_fcurPymtWithTot]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurPymtWithTot]  DEFAULT ((0)) FOR [fcurPymtWithTot]
GO
/****** Object:  Default [DF_tblFid_fcurTaxDue]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurTaxDue]  DEFAULT ((0)) FOR [fcurTaxDue]
GO
/****** Object:  Default [DF_tblFid_fcurPenalty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurPenalty]  DEFAULT ((0)) FOR [fcurPenalty]
GO
/****** Object:  Default [DF_tblFid_fcurInterest]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurInterest]  DEFAULT ((0)) FOR [fcurInterest]
GO
/****** Object:  Default [DF_tblFid_fcurTotalDue]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurTotalDue]  DEFAULT ((0)) FOR [fcurTotalDue]
GO
/****** Object:  Default [DF_tblFid_fcurOvpymt]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurOvpymt]  DEFAULT ((0)) FOR [fcurOvpymt]
GO
/****** Object:  Default [DF_tblFid_fcurApplyOvpymt]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurApplyOvpymt]  DEFAULT ((0)) FOR [fcurApplyOvpymt]
GO
/****** Object:  Default [DF_tblFid_fcurRefOvpymt]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurRefOvpymt]  DEFAULT ((0)) FOR [fcurRefOvpymt]
GO
/****** Object:  Default [DF_tblFid_fcurRefRenewEner]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurRefRenewEner]  DEFAULT ((0)) FOR [fcurRefRenewEner]
GO
/****** Object:  Default [DF_tblFid_fcurTotRefCrd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurTotRefCrd]  DEFAULT ((0)) FOR [fcurTotRefCrd]
GO
/****** Object:  Default [DF_tblFid_fcurRefFilmProd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurRefFilmProd]  DEFAULT ((0)) FOR [fcurRefFilmProd]
GO
/****** Object:  Default [DF_tblFid_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblFid_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblFid_fcurFedNol]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurFedNol]  DEFAULT ((0)) FOR [fcurFedNol]
GO
/****** Object:  Default [DF_tblFid_fcurTrfCrd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid] ADD  CONSTRAINT [DF_tblFid_fcurTrfCrd]  DEFAULT ((0)) FOR [fcurTrfCrd]
GO
/****** Object:  Default [DF_tblFid2_fcurFedNOL]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid2] ADD  CONSTRAINT [DF_tblFid2_fcurFedNOL]  DEFAULT ((0)) FOR [fcurFedNOL]
GO
/****** Object:  Default [DF_tblFid2_fcurNonNMMuni]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid2] ADD  CONSTRAINT [DF_tblFid2_fcurNonNMMuni]  DEFAULT ((0)) FOR [fcurNonNMMuni]
GO
/****** Object:  Default [DF_tblFid2_fcurFedAdd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid2] ADD  CONSTRAINT [DF_tblFid2_fcurFedAdd]  DEFAULT ((0)) FOR [fcurFedAdd]
GO
/****** Object:  Default [DF_tblFid2_fcurNMNOL]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid2] ADD  CONSTRAINT [DF_tblFid2_fcurNMNOL]  DEFAULT ((0)) FOR [fcurNMNOL]
GO
/****** Object:  Default [DF_tblFid2_fcurUSBondInt]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid2] ADD  CONSTRAINT [DF_tblFid2_fcurUSBondInt]  DEFAULT ((0)) FOR [fcurUSBondInt]
GO
/****** Object:  Default [DF_tblFid2_fcurNetCapGain]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid2] ADD  CONSTRAINT [DF_tblFid2_fcurNetCapGain]  DEFAULT ((0)) FOR [fcurNetCapGain]
GO
/****** Object:  Default [DF_tblFid2_fcurTotDed]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid2] ADD  CONSTRAINT [DF_tblFid2_fcurTotDed]  DEFAULT ((0)) FOR [fcurTotDed]
GO
/****** Object:  Default [DF_tblFid2_fcurTotDistAmt]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid2] ADD  CONSTRAINT [DF_tblFid2_fcurTotDistAmt]  DEFAULT ((0)) FOR [fcurTotDistAmt]
GO
/****** Object:  Default [DF_tblFid2_fstrRouting1Num]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid2] ADD  CONSTRAINT [DF_tblFid2_fstrRouting1Num]  DEFAULT (' ') FOR [fstrRouting1Num]
GO
/****** Object:  Default [DF_tblFid2_fstrRoutingNum]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid2] ADD  CONSTRAINT [DF_tblFid2_fstrRoutingNum]  DEFAULT (' ') FOR [fstrRoutingNum]
GO
/****** Object:  Default [DF_tblFid2_fstrAccount1Num]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid2] ADD  CONSTRAINT [DF_tblFid2_fstrAccount1Num]  DEFAULT (' ') FOR [fstrAccount1Num]
GO
/****** Object:  Default [DF_tblFid2_fstrAccountNum]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid2] ADD  CONSTRAINT [DF_tblFid2_fstrAccountNum]  DEFAULT (' ') FOR [fstrAccountNum]
GO
/****** Object:  Default [DF_tblFid2_fstrAccountType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid2] ADD  CONSTRAINT [DF_tblFid2_fstrAccountType]  DEFAULT (' ') FOR [fstrAccountType]
GO
/****** Object:  Default [DF_tblFid2_fblnAcctChk]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid2] ADD  CONSTRAINT [DF_tblFid2_fblnAcctChk]  DEFAULT ((0)) FOR [fblnAcctChk]
GO
/****** Object:  Default [DF_tblFid2_fblnAcctSav]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid2] ADD  CONSTRAINT [DF_tblFid2_fblnAcctSav]  DEFAULT ((0)) FOR [fblnAcctSav]
GO
/****** Object:  Default [DF_tblFid2_fblnIATFlag]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid2] ADD  CONSTRAINT [DF_tblFid2_fblnIATFlag]  DEFAULT ((0)) FOR [fblnIATFlag]
GO
/****** Object:  Default [DF_tblFid2_fblnIATYes]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid2] ADD  CONSTRAINT [DF_tblFid2_fblnIATYes]  DEFAULT ((0)) FOR [fblnIATYes]
GO
/****** Object:  Default [DF_tblFid2_fblnIATNo]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid2] ADD  CONSTRAINT [DF_tblFid2_fblnIATNo]  DEFAULT ((0)) FOR [fblnIATNo]
GO
/****** Object:  Default [DF_tblFid2_fstrPhoneNo]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid2] ADD  CONSTRAINT [DF_tblFid2_fstrPhoneNo]  DEFAULT (' ') FOR [fstrPhoneNo]
GO
/****** Object:  Default [DF_tblFid2_fstrEmail]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid2] ADD  CONSTRAINT [DF_tblFid2_fstrEmail]  DEFAULT (' ') FOR [fstrEmail]
GO
/****** Object:  Default [DF_tblFid2_fstrPrepName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid2] ADD  CONSTRAINT [DF_tblFid2_fstrPrepName]  DEFAULT (' ') FOR [fstrPrepName]
GO
/****** Object:  Default [DF_tblFid2_fstrPrepEIN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid2] ADD  CONSTRAINT [DF_tblFid2_fstrPrepEIN]  DEFAULT (' ') FOR [fstrPrepEIN]
GO
/****** Object:  Default [DF_tblFid2_fstrPrepCRSID]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid2] ADD  CONSTRAINT [DF_tblFid2_fstrPrepCRSID]  DEFAULT (' ') FOR [fstrPrepCRSID]
GO
/****** Object:  Default [DF_tblFid2_fstrPrepPTIN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid2] ADD  CONSTRAINT [DF_tblFid2_fstrPrepPTIN]  DEFAULT (' ') FOR [fstrPrepPTIN]
GO
/****** Object:  Default [DF_tblFid2_fstrPrepPhone]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid2] ADD  CONSTRAINT [DF_tblFid2_fstrPrepPhone]  DEFAULT (' ') FOR [fstrPrepPhone]
GO
/****** Object:  Default [DF_tblFid2_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid2] ADD  CONSTRAINT [DF_tblFid2_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblFid2_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFid2] ADD  CONSTRAINT [DF_tblFid2_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblFidB_fcurBGrsDiv]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBGrsDiv]  DEFAULT ((0)) FOR [fcurBGrsDiv]
GO
/****** Object:  Default [DF_tblFidB_fcurBDstDiv]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBDstDiv]  DEFAULT ((0)) FOR [fcurBDstDiv]
GO
/****** Object:  Default [DF_tblFidB_fcurBNetDiv]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBNetDiv]  DEFAULT ((0)) FOR [fcurBNetDiv]
GO
/****** Object:  Default [DF_tblFidB_fcurBAlcDiv]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBAlcDiv]  DEFAULT ((0)) FOR [fcurBAlcDiv]
GO
/****** Object:  Default [DF_tblFidB_fcurBGrsInt]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBGrsInt]  DEFAULT ((0)) FOR [fcurBGrsInt]
GO
/****** Object:  Default [DF_tblFidB_fcurBDstInt]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBDstInt]  DEFAULT ((0)) FOR [fcurBDstInt]
GO
/****** Object:  Default [DF_tblFidB_fcurBNetInt]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBNetInt]  DEFAULT ((0)) FOR [fcurBNetInt]
GO
/****** Object:  Default [DF_tblFidB_fcurBAlcInt]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBAlcInt]  DEFAULT ((0)) FOR [fcurBAlcInt]
GO
/****** Object:  Default [DF_tblFidB_fcurBGrsFid]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBGrsFid]  DEFAULT ((0)) FOR [fcurBGrsFid]
GO
/****** Object:  Default [DF_tblFidB_fcurBDstFid]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBDstFid]  DEFAULT ((0)) FOR [fcurBDstFid]
GO
/****** Object:  Default [DF_tblFidB_fcurBNetFid]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBNetFid]  DEFAULT ((0)) FOR [fcurBNetFid]
GO
/****** Object:  Default [DF_tblFidB_fcurBAlcFid]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBAlcFid]  DEFAULT ((0)) FOR [fcurBAlcFid]
GO
/****** Object:  Default [DF_tblFidB_fcurBGrsRR]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBGrsRR]  DEFAULT ((0)) FOR [fcurBGrsRR]
GO
/****** Object:  Default [DF_tblFidB_fcurBDstRR]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBDstRR]  DEFAULT ((0)) FOR [fcurBDstRR]
GO
/****** Object:  Default [DF_tblFidB_fcurBNetRR]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBNetRR]  DEFAULT ((0)) FOR [fcurBNetRR]
GO
/****** Object:  Default [DF_tblFidB_fcurBAlcRR]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBAlcRR]  DEFAULT ((0)) FOR [fcurBAlcRR]
GO
/****** Object:  Default [DF_tblFidB_fcurBGrsPL]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBGrsPL]  DEFAULT ((0)) FOR [fcurBGrsPL]
GO
/****** Object:  Default [DF_tblFidB_fcurBDstPL]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBDstPL]  DEFAULT ((0)) FOR [fcurBDstPL]
GO
/****** Object:  Default [DF_tblFidB_fcurBNetPL]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBNetPL]  DEFAULT ((0)) FOR [fcurBNetPL]
GO
/****** Object:  Default [DF_tblFidB_fcurBAlcPL]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBAlcPL]  DEFAULT ((0)) FOR [fcurBAlcPL]
GO
/****** Object:  Default [DF_tblFidB_fcurBNetFarm]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBNetFarm]  DEFAULT ((0)) FOR [fcurBNetFarm]
GO
/****** Object:  Default [DF_tblFidB_fcurBAlcFarm]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBAlcFarm]  DEFAULT ((0)) FOR [fcurBAlcFarm]
GO
/****** Object:  Default [DF_tblFidB_fcurBGrsOth]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBGrsOth]  DEFAULT ((0)) FOR [fcurBGrsOth]
GO
/****** Object:  Default [DF_tblFidB_fcurBDstOth]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBDstOth]  DEFAULT ((0)) FOR [fcurBDstOth]
GO
/****** Object:  Default [DF_tblFidB_fcurBNetOth]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBNetOth]  DEFAULT ((0)) FOR [fcurBNetOth]
GO
/****** Object:  Default [DF_tblFidB_fcurBAlcOth]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBAlcOth]  DEFAULT ((0)) FOR [fcurBAlcOth]
GO
/****** Object:  Default [DF_tblFidB_fcurBGrsTot]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBGrsTot]  DEFAULT ((0)) FOR [fcurBGrsTot]
GO
/****** Object:  Default [DF_tblFidB_fcurBDstTot]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBDstTot]  DEFAULT ((0)) FOR [fcurBDstTot]
GO
/****** Object:  Default [DF_tblFidB_fcurBNetTot]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBNetTot]  DEFAULT ((0)) FOR [fcurBNetTot]
GO
/****** Object:  Default [DF_tblFidB_fcurBAlcTot]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBAlcTot]  DEFAULT ((0)) FOR [fcurBAlcTot]
GO
/****** Object:  Default [DF_tblFidB_fcurBAllocPercent]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBAllocPercent]  DEFAULT ((0)) FOR [fcurBAllocPercent]
GO
/****** Object:  Default [DF_tblFidB_fcurBNetExemp]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBNetExemp]  DEFAULT ((0)) FOR [fcurBNetExemp]
GO
/****** Object:  Default [DF_tblFidB_fcurBAlcExemp]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBAlcExemp]  DEFAULT ((0)) FOR [fcurBAlcExemp]
GO
/****** Object:  Default [DF_tblFidB_fcurBNetDist]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBNetDist]  DEFAULT ((0)) FOR [fcurBNetDist]
GO
/****** Object:  Default [DF_tblFidB_fcurBAlcDist]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBAlcDist]  DEFAULT ((0)) FOR [fcurBAlcDist]
GO
/****** Object:  Default [DF_tblFidB_fcurBNetODed]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBNetODed]  DEFAULT ((0)) FOR [fcurBNetODed]
GO
/****** Object:  Default [DF_tblFidB_fcurBAlcODed]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBAlcODed]  DEFAULT ((0)) FOR [fcurBAlcODed]
GO
/****** Object:  Default [DF_tblFidB_fcurBNetTTotal]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBNetTTotal]  DEFAULT ((0)) FOR [fcurBNetTTotal]
GO
/****** Object:  Default [DF_tblFidB_fcurBAlcTTotal]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBAlcTTotal]  DEFAULT ((0)) FOR [fcurBAlcTTotal]
GO
/****** Object:  Default [DF_tblFidB_fcurBNetTax]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBNetTax]  DEFAULT ((0)) FOR [fcurBNetTax]
GO
/****** Object:  Default [DF_tblFidB_fcurBAlcTax]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBAlcTax]  DEFAULT ((0)) FOR [fcurBAlcTax]
GO
/****** Object:  Default [DF_tblFidB_fcurBNetLump]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBNetLump]  DEFAULT ((0)) FOR [fcurBNetLump]
GO
/****** Object:  Default [DF_tblFidB_fcurBAlcLump]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBAlcLump]  DEFAULT ((0)) FOR [fcurBAlcLump]
GO
/****** Object:  Default [DF_tblFidB_fcurBNetTotTax]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBNetTotTax]  DEFAULT ((0)) FOR [fcurBNetTotTax]
GO
/****** Object:  Default [DF_tblFidB_fcurBAlcTotTax]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBAlcTotTax]  DEFAULT ((0)) FOR [fcurBAlcTotTax]
GO
/****** Object:  Default [DF_tblFidB_fcurBNMIncPercent]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBNMIncPercent]  DEFAULT ((0)) FOR [fcurBNMIncPercent]
GO
/****** Object:  Default [DF_tblFidB_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblFidB_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblFidB_fcurBGrDiv]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBGrDiv]  DEFAULT ((0)) FOR [fcurBGrDiv]
GO
/****** Object:  Default [DF_tblFidB_fcurBReDiv]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBReDiv]  DEFAULT ((0)) FOR [fcurBReDiv]
GO
/****** Object:  Default [DF_tblFidB_fcurBGrInt]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBGrInt]  DEFAULT ((0)) FOR [fcurBGrInt]
GO
/****** Object:  Default [DF_tblFidB_fcurBReInt]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBReInt]  DEFAULT ((0)) FOR [fcurBReInt]
GO
/****** Object:  Default [DF_tblFidB_fcurBGrFid]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBGrFid]  DEFAULT ((0)) FOR [fcurBGrFid]
GO
/****** Object:  Default [DF_tblFidB_fcurBReFid]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBReFid]  DEFAULT ((0)) FOR [fcurBReFid]
GO
/****** Object:  Default [DF_tblFidB_fcurBGrRR]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBGrRR]  DEFAULT ((0)) FOR [fcurBGrRR]
GO
/****** Object:  Default [DF_tblFidB_fcurBReRR]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBReRR]  DEFAULT ((0)) FOR [fcurBReRR]
GO
/****** Object:  Default [DF_tblFidB_fcurBGrPL]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBGrPL]  DEFAULT ((0)) FOR [fcurBGrPL]
GO
/****** Object:  Default [DF_tblFidB_fcurBRePL]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBRePL]  DEFAULT ((0)) FOR [fcurBRePL]
GO
/****** Object:  Default [DF_tblFidB_fcurBGrOth]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBGrOth]  DEFAULT ((0)) FOR [fcurBGrOth]
GO
/****** Object:  Default [DF_tblFidB_fcurBReOth]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBReOth]  DEFAULT ((0)) FOR [fcurBReOth]
GO
/****** Object:  Default [DF_tblFidB_fcurBGrTot]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBGrTot]  DEFAULT ((0)) FOR [fcurBGrTot]
GO
/****** Object:  Default [DF_tblFidB_fcurBReTot]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB] ADD  CONSTRAINT [DF_tblFidB_fcurBReTot]  DEFAULT ((0)) FOR [fcurBReTot]
GO
/****** Object:  Default [DF_tblFidB2_fcurB2Inventory]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB2] ADD  CONSTRAINT [DF_tblFidB2_fcurB2Inventory]  DEFAULT ((0)) FOR [fcurB2Inventory]
GO
/****** Object:  Default [DF_tblFidB2_fcurB2NMInventory]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB2] ADD  CONSTRAINT [DF_tblFidB2_fcurB2NMInventory]  DEFAULT ((0)) FOR [fcurB2NMInventory]
GO
/****** Object:  Default [DF_tblFidB2_fcurB2Real]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB2] ADD  CONSTRAINT [DF_tblFidB2_fcurB2Real]  DEFAULT ((0)) FOR [fcurB2Real]
GO
/****** Object:  Default [DF_tblFidB2_fcurB2NMReal]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB2] ADD  CONSTRAINT [DF_tblFidB2_fcurB2NMReal]  DEFAULT ((0)) FOR [fcurB2NMReal]
GO
/****** Object:  Default [DF_tblFidB2_fcurB2Rented]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB2] ADD  CONSTRAINT [DF_tblFidB2_fcurB2Rented]  DEFAULT ((0)) FOR [fcurB2Rented]
GO
/****** Object:  Default [DF_tblFidB2_fcurB2NMRented]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB2] ADD  CONSTRAINT [DF_tblFidB2_fcurB2NMRented]  DEFAULT ((0)) FOR [fcurB2NMRented]
GO
/****** Object:  Default [DF_tblFidB2_fcurB2Property]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB2] ADD  CONSTRAINT [DF_tblFidB2_fcurB2Property]  DEFAULT ((0)) FOR [fcurB2Property]
GO
/****** Object:  Default [DF_tblFidB2_fcurB2NMProperty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB2] ADD  CONSTRAINT [DF_tblFidB2_fcurB2NMProperty]  DEFAULT ((0)) FOR [fcurB2NMProperty]
GO
/****** Object:  Default [DF_tblFidB2_fcurB2PropertyFactor]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB2] ADD  CONSTRAINT [DF_tblFidB2_fcurB2PropertyFactor]  DEFAULT ((0)) FOR [fcurB2PropertyFactor]
GO
/****** Object:  Default [DF_tblFidB2_fcurB2Payroll]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB2] ADD  CONSTRAINT [DF_tblFidB2_fcurB2Payroll]  DEFAULT ((0)) FOR [fcurB2Payroll]
GO
/****** Object:  Default [DF_tblFidB2_fcurB2NMPayroll]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB2] ADD  CONSTRAINT [DF_tblFidB2_fcurB2NMPayroll]  DEFAULT ((0)) FOR [fcurB2NMPayroll]
GO
/****** Object:  Default [DF_tblFidB2_fcurB2PayrollFactor]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB2] ADD  CONSTRAINT [DF_tblFidB2_fcurB2PayrollFactor]  DEFAULT ((0)) FOR [fcurB2PayrollFactor]
GO
/****** Object:  Default [DF_tblFidB2_fcurB2Sales]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB2] ADD  CONSTRAINT [DF_tblFidB2_fcurB2Sales]  DEFAULT ((0)) FOR [fcurB2Sales]
GO
/****** Object:  Default [DF_tblFidB2_fcurBRNMSales]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB2] ADD  CONSTRAINT [DF_tblFidB2_fcurBRNMSales]  DEFAULT ((0)) FOR [fcurB2NMSales]
GO
/****** Object:  Default [DF_tblFidB2_fcurB2SalesFactor]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB2] ADD  CONSTRAINT [DF_tblFidB2_fcurB2SalesFactor]  DEFAULT ((0)) FOR [fcurB2SalesFactor]
GO
/****** Object:  Default [DF_tblFidB2_fcurB2TotFactor]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB2] ADD  CONSTRAINT [DF_tblFidB2_fcurB2TotFactor]  DEFAULT ((0)) FOR [fcurB2TotFactor]
GO
/****** Object:  Default [DF_tblFidB2_fcurB2AvgFactor]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB2] ADD  CONSTRAINT [DF_tblFidB2_fcurB2AvgFactor]  DEFAULT ((0)) FOR [fcurB2AvgFactor]
GO
/****** Object:  Default [DF_tblFidB2_fdtmB2ApportDate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB2] ADD  CONSTRAINT [DF_tblFidB2_fdtmB2ApportDate]  DEFAULT ('12/31/9999') FOR [fdtmB2ApportDate]
GO
/****** Object:  Default [DF_tblFidB2_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB2] ADD  CONSTRAINT [DF_tblFidB2_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblFidB2_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB2] ADD  CONSTRAINT [DF_tblFidB2_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblFidB2_fcurB2Personal]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB2] ADD  CONSTRAINT [DF_tblFidB2_fcurB2Personal]  DEFAULT ((0)) FOR [fcurB2Personal]
GO
/****** Object:  Default [DF_tblFidB2_fcurB2NMPersonal]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB2] ADD  CONSTRAINT [DF_tblFidB2_fcurB2NMPersonal]  DEFAULT ((0)) FOR [fcurB2NMPersonal]
GO
/****** Object:  Default [DF_tblFidB2_fdtmB2Election]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidB2] ADD  CONSTRAINT [DF_tblFidB2_fdtmB2Election]  DEFAULT ('12/31/9999') FOR [fdtmB2Election]
GO
/****** Object:  Default [DF_tblFidCR_fcurCRCultProp]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCR] ADD  CONSTRAINT [DF_tblFidCR_fcurCRCultProp]  DEFAULT ((0)) FOR [fcurCRCultProp]
GO
/****** Object:  Default [DF_tblFidCR_fcurCRBusFac]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCR] ADD  CONSTRAINT [DF_tblFidCR_fcurCRBusFac]  DEFAULT ((0)) FOR [fcurCRBusFac]
GO
/****** Object:  Default [DF_tblFidCR_fcurCRRuralJob]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCR] ADD  CONSTRAINT [DF_tblFidCR_fcurCRRuralJob]  DEFAULT ((0)) FOR [fcurCRRuralJob]
GO
/****** Object:  Default [DF_tblFidCR_fcurCRTechJob]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCR] ADD  CONSTRAINT [DF_tblFidCR_fcurCRTechJob]  DEFAULT ((0)) FOR [fcurCRTechJob]
GO
/****** Object:  Default [DF_tblFidCR_fcurCRElecCard]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCR] ADD  CONSTRAINT [DF_tblFidCR_fcurCRElecCard]  DEFAULT ((0)) FOR [fcurCRElecCard]
GO
/****** Object:  Default [DF_tblFidCR_fcurCRJobMentor]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCR] ADD  CONSTRAINT [DF_tblFidCR_fcurCRJobMentor]  DEFAULT ((0)) FOR [fcurCRJobMentor]
GO
/****** Object:  Default [DF_tblFidCR_fcurCRLandCons]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCR] ADD  CONSTRAINT [DF_tblFidCR_fcurCRLandCons]  DEFAULT ((0)) FOR [fcurCRLandCons]
GO
/****** Object:  Default [DF_tblFidCR_fcurCRAffHouse]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCR] ADD  CONSTRAINT [DF_tblFidCR_fcurCRAffHouse]  DEFAULT ((0)) FOR [fcurCRAffHouse]
GO
/****** Object:  Default [DF_tblFidCR_fcurCRSolarDev]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCR] ADD  CONSTRAINT [DF_tblFidCR_fcurCRSolarDev]  DEFAULT ((0)) FOR [fcurCRSolarDev]
GO
/****** Object:  Default [DF_tblFidCR_fcurCRBioDiesel]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCR] ADD  CONSTRAINT [DF_tblFidCR_fcurCRBioDiesel]  DEFAULT ((0)) FOR [fcurCRBioDiesel]
GO
/****** Object:  Default [DF_tblFidCR_fcurCRSusBldg]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCR] ADD  CONSTRAINT [DF_tblFidCR_fcurCRSusBldg]  DEFAULT ((0)) FOR [fcurCRSusBldg]
GO
/****** Object:  Default [DF_tblFidCR_fcurCRAngelInv]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCR] ADD  CONSTRAINT [DF_tblFidCR_fcurCRAngelInv]  DEFAULT ((0)) FOR [fcurCRAngelInv]
GO
/****** Object:  Default [DF_tblFidCR_fcurCRRuralHealth]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCR] ADD  CONSTRAINT [DF_tblFidCR_fcurCRRuralHealth]  DEFAULT ((0)) FOR [fcurCRRuralHealth]
GO
/****** Object:  Default [DF_tblFidCR_fcurCRWaterCons]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCR] ADD  CONSTRAINT [DF_tblFidCR_fcurCRWaterCons]  DEFAULT ((0)) FOR [fcurCRWaterCons]
GO
/****** Object:  Default [DF_tblFidCR_fcurCRAdvEnergy]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCR] ADD  CONSTRAINT [DF_tblFidCR_fcurCRAdvEnergy]  DEFAULT ((0)) FOR [fcurCRAdvEnergy]
GO
/****** Object:  Default [DF_tblFidCR_fcurCRGeothermal]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCR] ADD  CONSTRAINT [DF_tblFidCR_fcurCRGeothermal]  DEFAULT ((0)) FOR [fcurCRGeothermal]
GO
/****** Object:  Default [DF_tblFidCR_fcurCRAgrBioMass]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCR] ADD  CONSTRAINT [DF_tblFidCR_fcurCRAgrBioMass]  DEFAULT ((0)) FOR [fcurCRAgrBioMass]
GO
/****** Object:  Default [DF_tblFidCR_fcurCRFilmApplied]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCR] ADD  CONSTRAINT [DF_tblFidCR_fcurCRFilmApplied]  DEFAULT ((0)) FOR [fcurCRFilmApplied]
GO
/****** Object:  Default [DF_tblFidCR_fcurCRFilmApproved]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCR] ADD  CONSTRAINT [DF_tblFidCR_fcurCRFilmApproved]  DEFAULT ((0)) FOR [fcurCRFilmApproved]
GO
/****** Object:  Default [DF_tblFidCR_fcurCRRenewEner]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCR] ADD  CONSTRAINT [DF_tblFidCR_fcurCRRenewEner]  DEFAULT ((0)) FOR [fcurCRRenewEner]
GO
/****** Object:  Default [DF_tblFidCR_fcurCRCancer]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCR] ADD  CONSTRAINT [DF_tblFidCR_fcurCRCancer]  DEFAULT ((0)) FOR [fcurCRCancer]
GO
/****** Object:  Default [DF_tblFidCR_fcurCRVetEmploy]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCR] ADD  CONSTRAINT [DF_tblFidCR_fcurCRVetEmploy]  DEFAULT ((0)) FOR [fcurCRVetEmploy]
GO
/****** Object:  Default [DF_tblFidCR_fcurCRTotalCredit]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCR] ADD  CONSTRAINT [DF_tblFidCR_fcurCRTotalCredit]  DEFAULT ((0)) FOR [fcurCRTotalCredit]
GO
/****** Object:  Default [DF_tblFidCR_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCR] ADD  CONSTRAINT [DF_tblFidCR_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblFidCR_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCR] ADD  CONSTRAINT [DF_tblFidCR_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblFidCRS_flngRepNum]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCRS] ADD  CONSTRAINT [DF_tblFidCRS_flngRepNum]  DEFAULT ((0)) FOR [flngRepNum]
GO
/****** Object:  Default [DF_tblFidCRS_fstrCrdType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCRS] ADD  CONSTRAINT [DF_tblFidCRS_fstrCrdType]  DEFAULT (' ') FOR [fstrCrdType]
GO
/****** Object:  Default [DF_tblFidCRS_fstrApprove]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCRS] ADD  CONSTRAINT [DF_tblFidCRS_fstrApprove]  DEFAULT (' ') FOR [fstrApprove]
GO
/****** Object:  Default [DF_tblFidCRS_fcurApplied]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCRS] ADD  CONSTRAINT [DF_tblFidCRS_fcurApplied]  DEFAULT ((0)) FOR [fcurApplied]
GO
/****** Object:  Default [DF_tblFidCRS_fcurRefund]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCRS] ADD  CONSTRAINT [DF_tblFidCRS_fcurRefund]  DEFAULT ((0)) FOR [fcurRefund]
GO
/****** Object:  Default [DF_tblFidCRS_fblnFilled]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCRS] ADD  CONSTRAINT [DF_tblFidCRS_fblnFilled]  DEFAULT ((0)) FOR [fblnFilled]
GO
/****** Object:  Default [DF_tblFidCRS_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCRS] ADD  CONSTRAINT [DF_tblFidCRS_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblFidCRS_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCRS] ADD  CONSTRAINT [DF_tblFidCRS_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblFidCRS_fstrMPDLN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCRS] ADD  CONSTRAINT [DF_tblFidCRS_fstrMPDLN]  DEFAULT (' ') FOR [fstrMPDLN]
GO
/****** Object:  Default [DF_tblFidCRS_fstrTaxForm]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCRS] ADD  CONSTRAINT [DF_tblFidCRS_fstrTaxForm]  DEFAULT (' ') FOR [fstrTaxForm]
GO
/****** Object:  Default [DF_tblFidCRS_fstrSource]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCRS] ADD  CONSTRAINT [DF_tblFidCRS_fstrSource]  DEFAULT ('GENTAX') FOR [fstrSource]
GO
/****** Object:  Default [DF_tblFidCRS_fblnFound]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCRS] ADD  CONSTRAINT [DF_tblFidCRS_fblnFound]  DEFAULT ((0)) FOR [fblnFound]
GO
/****** Object:  Default [DF_tblFidCrsT_fcurTotApplied1]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCrsT] ADD  CONSTRAINT [DF_tblFidCrsT_fcurTotApplied1]  DEFAULT ((0)) FOR [fcurTotApplied1]
GO
/****** Object:  Default [DF_tblFidCrsT_fcurTotRefund1]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCrsT] ADD  CONSTRAINT [DF_tblFidCrsT_fcurTotRefund1]  DEFAULT ((0)) FOR [fcurTotRefund1]
GO
/****** Object:  Default [DF_tblFidCrsT_fcurTotApplied2]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCrsT] ADD  CONSTRAINT [DF_tblFidCrsT_fcurTotApplied2]  DEFAULT ((0)) FOR [fcurTotApplied2]
GO
/****** Object:  Default [DF_tblFidCrsT_fcurTotRefund2]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCrsT] ADD  CONSTRAINT [DF_tblFidCrsT_fcurTotRefund2]  DEFAULT ((0)) FOR [fcurTotRefund2]
GO
/****** Object:  Default [DF_tblFidCrsT_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCrsT] ADD  CONSTRAINT [DF_tblFidCrsT_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblFidCrsT_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidCrsT] ADD  CONSTRAINT [DF_tblFidCrsT_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblFidD_fstrFein]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fstrFein]  DEFAULT (' ') FOR [fstrFein]
GO
/****** Object:  Default [DF_tblFidD_fcurNMNetIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fcurNMNetIncome]  DEFAULT ((0)) FOR [fcurNMNetIncome]
GO
/****** Object:  Default [DF_tblFidD_fblnAmend]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fblnAmend]  DEFAULT ((0)) FOR [fblnAmend]
GO
/****** Object:  Default [DF_tblFidD_fdtmPostMarkDate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fdtmPostMarkDate]  DEFAULT ('12/31/9999') FOR [fdtmPostMarkDate]
GO
/****** Object:  Default [DF_tblFidD_fstrName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fstrName]  DEFAULT (' ') FOR [fstrName]
GO
/****** Object:  Default [DF_tblFidD_fstrAddress]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fstrAddress]  DEFAULT (' ') FOR [fstrStreet]
GO
/****** Object:  Default [DF_tblFidD_fstrCity]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fstrCity]  DEFAULT (' ') FOR [fstrCity]
GO
/****** Object:  Default [DF_tblFidD_fstrState]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fstrState]  DEFAULT (' ') FOR [fstrState]
GO
/****** Object:  Default [DF_tblFidD_fstrCountry]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fstrCountry]  DEFAULT ('USA') FOR [fstrCountry]
GO
/****** Object:  Default [DF_tblFidD_fstrZipCode]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fstrZipCode]  DEFAULT (' ') FOR [fstrZipCode]
GO
/****** Object:  Default [DF_tblFidD_fblnPTE]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fblnPTE]  DEFAULT ((0)) FOR [fblnPte]
GO
/****** Object:  Default [DF_tblFidD_fblnScorp]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fblnScorp]  DEFAULT ((0)) FOR [fblnScorp]
GO
/****** Object:  Default [DF_tblFidD_fblnCit]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fblnCit]  DEFAULT ((0)) FOR [fblnCit]
GO
/****** Object:  Default [DF_tblFidD_fblnFid]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fblnFid]  DEFAULT ((1)) FOR [fblnFid]
GO
/****** Object:  Default [DF_tblFidD_fblnOth]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fblnOth]  DEFAULT ((0)) FOR [fblnOth]
GO
/****** Object:  Default [DF_tblFidD_fstrOthWhy]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fstrOthWhy]  DEFAULT (' ') FOR [fstrOthWhy]
GO
/****** Object:  Default [DF_tblFidD_fdtmTaxBeg]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fdtmTaxBeg]  DEFAULT ('12/31/9999') FOR [fdtmTaxYrBeg]
GO
/****** Object:  Default [DF_tblFidD_fdtmTaxEnd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fdtmTaxEnd]  DEFAULT ('12/31/9999') FOR [fdtmTaxYrEnd]
GO
/****** Object:  Default [DF_tblFidD_fdtmDue]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fdtmDue]  DEFAULT ('12/31/9999') FOR [fdtmTaxDue]
GO
/****** Object:  Default [DF_tblFidD_fdtmExtend]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fdtmExtend]  DEFAULT ('12/31/9999') FOR [fdtmExtDue]
GO
/****** Object:  Default [DF_tblFidD_fcurWthPage]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fcurWthPage]  DEFAULT ((0)) FOR [fcurWthPage]
GO
/****** Object:  Default [DF_tblFidD_fcurWthAll]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fcurWthAll]  DEFAULT ((0)) FOR [fcurWthAll]
GO
/****** Object:  Default [DF_tblFidD_fcurWthOwn]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fcurWthOwn]  DEFAULT ((0)) FOR [fcurWthOwn]
GO
/****** Object:  Default [DF_tblFidD_fcurWthPte]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fcurWthPte]  DEFAULT ((0)) FOR [fcurWthPte]
GO
/****** Object:  Default [DF_tblFidD_fcurSubTotal]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fcurSubTotal]  DEFAULT ((0)) FOR [fcurSubTotal]
GO
/****** Object:  Default [DF_tblFidD_fcurPenalty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fcurPenalty]  DEFAULT ((0)) FOR [fcurPenalty]
GO
/****** Object:  Default [DF_tblFidD_fcurInterest]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fcurInterest]  DEFAULT ((0)) FOR [fcurInterest]
GO
/****** Object:  Default [DF_tblFidD_fcurTotalDue]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fcurTotalDue]  DEFAULT ((0)) FOR [fcurTotalDue]
GO
/****** Object:  Default [DF_tblFidD_fdtmSign]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fdtmSign]  DEFAULT ('12/31/9999') FOR [fdtmSigned]
GO
/****** Object:  Default [DF_tblFidD_fstrPhone]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fstrPhone]  DEFAULT (' ') FOR [fstrPhone]
GO
/****** Object:  Default [DF_tblFidD_fstrEmail]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fstrEmail]  DEFAULT (' ') FOR [fstrEmail]
GO
/****** Object:  Default [DF_tblFidD_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblFidD_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidD] ADD  CONSTRAINT [DF_tblFidD_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblFidDS_flngRepNum]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidDS] ADD  CONSTRAINT [DF_tblFidDS_flngRepNum]  DEFAULT ((0)) FOR [flngRepNum]
GO
/****** Object:  Default [DF_tblFidDS_fstrId]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidDS] ADD  CONSTRAINT [DF_tblFidDS_fstrId]  DEFAULT (' ') FOR [fstrId]
GO
/****** Object:  Default [DF_tblFidDS_fblnFein]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidDS] ADD  CONSTRAINT [DF_tblFidDS_fblnFein]  DEFAULT ((0)) FOR [fblnFein]
GO
/****** Object:  Default [DF_tblFidDS_fblnSsn]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidDS] ADD  CONSTRAINT [DF_tblFidDS_fblnSsn]  DEFAULT ((0)) FOR [fblnSsn]
GO
/****** Object:  Default [DF_tblFidDS_fstrName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidDS] ADD  CONSTRAINT [DF_tblFidDS_fstrName]  DEFAULT (' ') FOR [fstrName]
GO
/****** Object:  Default [DF_tblFidDS_fstrAddr]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidDS] ADD  CONSTRAINT [DF_tblFidDS_fstrAddr]  DEFAULT (' ') FOR [fstrStreet]
GO
/****** Object:  Default [DF_tblFidDS_fstrCity]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidDS] ADD  CONSTRAINT [DF_tblFidDS_fstrCity]  DEFAULT (' ') FOR [fstrCity]
GO
/****** Object:  Default [DF_tblFidDS_fstrState]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidDS] ADD  CONSTRAINT [DF_tblFidDS_fstrState]  DEFAULT (' ') FOR [fstrState]
GO
/****** Object:  Default [DF_tblFidDS_fstrCountry]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidDS] ADD  CONSTRAINT [DF_tblFidDS_fstrCountry]  DEFAULT ('USA') FOR [fstrCountry]
GO
/****** Object:  Default [DF_tblFidDS_fstrZipCode]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidDS] ADD  CONSTRAINT [DF_tblFidDS_fstrZipCode]  DEFAULT (' ') FOR [fstrZipCode]
GO
/****** Object:  Default [DF_tblFidDS_fblnOutSide]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidDS] ADD  CONSTRAINT [DF_tblFidDS_fblnOutSide]  DEFAULT ((0)) FOR [fblnOutSide]
GO
/****** Object:  Default [DF_tblFidDS_fcurOwnNet]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidDS] ADD  CONSTRAINT [DF_tblFidDS_fcurOwnNet]  DEFAULT ((0)) FOR [fcurOwnNet]
GO
/****** Object:  Default [DF_tblFidDS_fcurOwnWth]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidDS] ADD  CONSTRAINT [DF_tblFidDS_fcurOwnWth]  DEFAULT ((0)) FOR [fcurOwnWth]
GO
/****** Object:  Default [DF_tblFidDS_fbln41353]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidDS] ADD  CONSTRAINT [DF_tblFidDS_fbln41353]  DEFAULT ((0)) FOR [fbln41353]
GO
/****** Object:  Default [DF_tblFidDS_fblnFilled]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidDS] ADD  CONSTRAINT [DF_tblFidDS_fblnFilled]  DEFAULT ((0)) FOR [fblnFilled]
GO
/****** Object:  Default [DF_tblFidDS_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidDS] ADD  CONSTRAINT [DF_tblFidDS_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblFidDS_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidDS] ADD  CONSTRAINT [DF_tblFidDS_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblFidDS_fstrMPDLN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidDS] ADD  CONSTRAINT [DF_tblFidDS_fstrMPDLN]  DEFAULT (' ') FOR [fstrMPDLN]
GO
/****** Object:  Default [DF_tblFidDS_fstrTaxForm]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidDS] ADD  CONSTRAINT [DF_tblFidDS_fstrTaxForm]  DEFAULT ('') FOR [fstrTaxForm]
GO
/****** Object:  Default [DF_tblFidDS_fstrSource]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidDS] ADD  CONSTRAINT [DF_tblFidDS_fstrSource]  DEFAULT ('GENKFI') FOR [fstrSource]
GO
/****** Object:  Default [DF_tblFidDS_fblnFound]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblFidDS] ADD  CONSTRAINT [DF_tblFidDS_fblnFound]  DEFAULT ((0)) FOR [fblnFound]
GO
/****** Object:  Default [DF_tblKeQMast_fstrUserID]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblKeQMast] ADD  CONSTRAINT [DF_tblKeQMast_fstrUserID]  DEFAULT (' ') FOR [fstrUserID]
GO
/****** Object:  Default [DF_tblKeQMast_fstrStatus]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblKeQMast] ADD  CONSTRAINT [DF_tblKeQMast_fstrStatus]  DEFAULT ('A') FOR [fstrStatus]
GO
/****** Object:  Default [DF_tblKeQMast_fstrEmpty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblKeQMast] ADD  CONSTRAINT [DF_tblKeQMast_fstrEmpty]  DEFAULT ('N') FOR [fstrChanged]
GO
/****** Object:  Default [DF_tblKeQMast_fstrFormName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblKeQMast] ADD  CONSTRAINT [DF_tblKeQMast_fstrFormName]  DEFAULT (' ') FOR [fstrFormName]
GO
/****** Object:  Default [DF_tblKeQMast_fstrImagePath]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblKeQMast] ADD  CONSTRAINT [DF_tblKeQMast_fstrImagePath]  DEFAULT (' ') FOR [fstrImagePath]
GO
/****** Object:  Default [DF_tblKeQMast_fstrTaxProgram]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblKeQMast] ADD  CONSTRAINT [DF_tblKeQMast_fstrTaxProgram]  DEFAULT (' ') FOR [fstrTaxProgram]
GO
/****** Object:  Default [DF_tblKeQMast_flngTaxYear]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblKeQMast] ADD  CONSTRAINT [DF_tblKeQMast_flngTaxYear]  DEFAULT ((0)) FOR [flngTaxYear]
GO
/****** Object:  Default [DF_tblKeQMast_fstrFileType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblKeQMast] ADD  CONSTRAINT [DF_tblKeQMast_fstrFileType]  DEFAULT (' ') FOR [fstrFileType]
GO
/****** Object:  Default [DF_tblKeQMast_fstrDLN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblKeQMast] ADD  CONSTRAINT [DF_tblKeQMast_fstrDLN]  DEFAULT ('') FOR [fstrDLN]
GO
/****** Object:  Default [DF_tblKeQMast_fstrTimelyBatch]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblKeQMast] ADD  CONSTRAINT [DF_tblKeQMast_fstrTimelyBatch]  DEFAULT ('N') FOR [fstrTimelyBatch]
GO
/****** Object:  Default [DF_tblKeQMast_fdtmPostMarkDate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblKeQMast] ADD  CONSTRAINT [DF_tblKeQMast_fdtmPostMarkDate]  DEFAULT (((12)/(31))/(9999)) FOR [fdtmPostMarkDate]
GO
/****** Object:  Default [DF_tblKeQMast_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblKeQMast] ADD  CONSTRAINT [DF_tblKeQMast_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhenFinished]
GO
/****** Object:  Default [DF_tblKeQMast_fstrWhoFinished]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblKeQMast] ADD  CONSTRAINT [DF_tblKeQMast_fstrWhoFinished]  DEFAULT ('') FOR [fstrWhoFinished]
GO
/****** Object:  Default [DF_tblKeQueue_fstrTitle]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblKeQueue] ADD  CONSTRAINT [DF_tblKeQueue_fstrTitle]  DEFAULT (' ') FOR [fstrTitle]
GO
/****** Object:  Default [DF_tblKeQueue_fstrFormName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblKeQueue] ADD  CONSTRAINT [DF_tblKeQueue_fstrFormName]  DEFAULT (' ') FOR [fstrFormName]
GO
/****** Object:  Default [DF_tblKeQueue_fstrImagePath]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblKeQueue] ADD  CONSTRAINT [DF_tblKeQueue_fstrImagePath]  DEFAULT (' ') FOR [fstrImagePath]
GO
/****** Object:  Default [DF_tblKeQueue_fstrStatus]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblKeQueue] ADD  CONSTRAINT [DF_tblKeQueue_fstrStatus]  DEFAULT ('A') FOR [fstrStatus]
GO
/****** Object:  Default [DF_tblKeQueue_fstrTaxProgram]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblKeQueue] ADD  CONSTRAINT [DF_tblKeQueue_fstrTaxProgram]  DEFAULT (' ') FOR [fstrTaxProgram]
GO
/****** Object:  Default [DF_tblKeQueue_flngTaxYear]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblKeQueue] ADD  CONSTRAINT [DF_tblKeQueue_flngTaxYear]  DEFAULT ((0)) FOR [flngTaxYear]
GO
/****** Object:  Default [DF_tblKeQueue_fstrFileType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblKeQueue] ADD  CONSTRAINT [DF_tblKeQueue_fstrFileType]  DEFAULT (' ') FOR [fstrFileType]
GO
/****** Object:  Default [DF_tblKeQueue_fstrDLN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblKeQueue] ADD  CONSTRAINT [DF_tblKeQueue_fstrDLN]  DEFAULT ('') FOR [fstrDLN]
GO
/****** Object:  Default [DF_tblKeQueue_fstrTimelyBatch]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblKeQueue] ADD  CONSTRAINT [DF_tblKeQueue_fstrTimelyBatch]  DEFAULT ('N') FOR [fstrTimelyBatch]
GO
/****** Object:  Default [DF_tblKeQueue_fdtmPostMarkDate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblKeQueue] ADD  CONSTRAINT [DF_tblKeQueue_fdtmPostMarkDate]  DEFAULT (((12)/(31))/(9999)) FOR [fdtmPostMarkDate]
GO
/****** Object:  Default [DF_tblO85_fblnFein]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85] ADD  CONSTRAINT [DF_tblO85_fblnFein]  DEFAULT ((0)) FOR [fblnFein]
GO
/****** Object:  Default [DF_tblO85_fblnSsn]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85] ADD  CONSTRAINT [DF_tblO85_fblnSsn]  DEFAULT ((0)) FOR [fblnSsn]
GO
/****** Object:  Default [DF_tblO85_fstrID]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85] ADD  CONSTRAINT [DF_tblO85_fstrID]  DEFAULT (' ') FOR [fstrID]
GO
/****** Object:  Default [DF_tblO85_fcurNMDistrib]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85] ADD  CONSTRAINT [DF_tblO85_fcurNMDistrib]  DEFAULT ((0)) FOR [fcurTotalDue]
GO
/****** Object:  Default [DF_tblO85_fblnAmend]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85] ADD  CONSTRAINT [DF_tblO85_fblnAmend]  DEFAULT ((0)) FOR [fblnAmend]
GO
/****** Object:  Default [DF_tblO85_fdtmPostMarkDate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85] ADD  CONSTRAINT [DF_tblO85_fdtmPostMarkDate]  DEFAULT ('12/31/9999') FOR [fdtmPostMarkDate]
GO
/****** Object:  Default [DF_tblO85_fstrName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85] ADD  CONSTRAINT [DF_tblO85_fstrName]  DEFAULT (' ') FOR [fstrName]
GO
/****** Object:  Default [DF_tblO85_fstrStreet]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85] ADD  CONSTRAINT [DF_tblO85_fstrStreet]  DEFAULT (' ') FOR [fstrStreet]
GO
/****** Object:  Default [DF_tblO85_fstrCity]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85] ADD  CONSTRAINT [DF_tblO85_fstrCity]  DEFAULT (' ') FOR [fstrCity]
GO
/****** Object:  Default [DF_tblO85_fstrState]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85] ADD  CONSTRAINT [DF_tblO85_fstrState]  DEFAULT (' ') FOR [fstrState]
GO
/****** Object:  Default [DF_tblO85_fstrCountry]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85] ADD  CONSTRAINT [DF_tblO85_fstrCountry]  DEFAULT ('USA') FOR [fstrCountry]
GO
/****** Object:  Default [DF_tblO85_fstrZipCode]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85] ADD  CONSTRAINT [DF_tblO85_fstrZipCode]  DEFAULT (' ') FOR [fstrZipCode]
GO
/****** Object:  Default [DF_tblO85_fcurPage]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85] ADD  CONSTRAINT [DF_tblO85_fcurPage]  DEFAULT ((0)) FOR [fcurPage]
GO
/****** Object:  Default [DF_tblO85_fcurAllPage]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85] ADD  CONSTRAINT [DF_tblO85_fcurAllPage]  DEFAULT ((0)) FOR [fcurAllPage]
GO
/****** Object:  Default [DF_tblO85_fdtmSigned]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85] ADD  CONSTRAINT [DF_tblO85_fdtmSigned]  DEFAULT ('12/31/9999') FOR [fdtmSigned]
GO
/****** Object:  Default [DF_tblO85_fstrPhone]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85] ADD  CONSTRAINT [DF_tblO85_fstrPhone]  DEFAULT (' ') FOR [fstrPhone]
GO
/****** Object:  Default [DF_tblO85_fstrEmail]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85] ADD  CONSTRAINT [DF_tblO85_fstrEmail]  DEFAULT (' ') FOR [fstrEmail]
GO
/****** Object:  Default [DF_tblO85_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85] ADD  CONSTRAINT [DF_tblO85_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblO85_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85] ADD  CONSTRAINT [DF_tblO85_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblO85_fblnFound]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85] ADD  CONSTRAINT [DF_tblO85_fblnFound]  DEFAULT ((0)) FOR [fblnFound]
GO
/****** Object:  Default [DF_tblO85S_flngRepNum]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85S] ADD  CONSTRAINT [DF_tblO85S_flngRepNum]  DEFAULT ((0)) FOR [flngRepNum]
GO
/****** Object:  Default [DF_tblO85S_fstrId]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85S] ADD  CONSTRAINT [DF_tblO85S_fstrId]  DEFAULT (' ') FOR [fstrId]
GO
/****** Object:  Default [DF_tblO85S_fblnFein]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85S] ADD  CONSTRAINT [DF_tblO85S_fblnFein]  DEFAULT ((0)) FOR [fblnFein]
GO
/****** Object:  Default [DF_tblO85S_fblnSsn]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85S] ADD  CONSTRAINT [DF_tblO85S_fblnSsn]  DEFAULT ((0)) FOR [fblnSsn]
GO
/****** Object:  Default [DF_tblO85S_fstrName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85S] ADD  CONSTRAINT [DF_tblO85S_fstrName]  DEFAULT (' ') FOR [fstrName]
GO
/****** Object:  Default [DF_tblO85S_fstrStreet]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85S] ADD  CONSTRAINT [DF_tblO85S_fstrStreet]  DEFAULT (' ') FOR [fstrStreet]
GO
/****** Object:  Default [DF_tblO85S_fstrCity]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85S] ADD  CONSTRAINT [DF_tblO85S_fstrCity]  DEFAULT (' ') FOR [fstrCity]
GO
/****** Object:  Default [DF_tblO85S_fstrState]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85S] ADD  CONSTRAINT [DF_tblO85S_fstrState]  DEFAULT (' ') FOR [fstrState]
GO
/****** Object:  Default [DF_tblO85S_fstrCountry]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85S] ADD  CONSTRAINT [DF_tblO85S_fstrCountry]  DEFAULT ('USA') FOR [fstrCountry]
GO
/****** Object:  Default [DF_tblO85S_fstrZipCode]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85S] ADD  CONSTRAINT [DF_tblO85S_fstrZipCode]  DEFAULT (' ') FOR [fstrZipCode]
GO
/****** Object:  Default [DF_tblO85S_fblnOutSide]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85S] ADD  CONSTRAINT [DF_tblO85S_fblnOutSide]  DEFAULT ((0)) FOR [fblnOutSide]
GO
/****** Object:  Default [DF_tblO85S_fcurReeNet]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85S] ADD  CONSTRAINT [DF_tblO85S_fcurReeNet]  DEFAULT ((0)) FOR [fcurReeNet]
GO
/****** Object:  Default [DF_tblO85S_fcurReeWth]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85S] ADD  CONSTRAINT [DF_tblO85S_fcurReeWth]  DEFAULT ((0)) FOR [fcurReeWth]
GO
/****** Object:  Default [DF_tblO85S_fblnFilled]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85S] ADD  CONSTRAINT [DF_tblO85S_fblnFilled]  DEFAULT ((0)) FOR [fblnFilled]
GO
/****** Object:  Default [DF_tblO85S_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85S] ADD  CONSTRAINT [DF_tblO85S_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblO85S_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85S] ADD  CONSTRAINT [DF_tblO85S_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblO85S_fstrMPDLN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85S] ADD  CONSTRAINT [DF_tblO85S_fstrMPDLN]  DEFAULT (' ') FOR [fstrMPDLN]
GO
/****** Object:  Default [DF_tblO85S_fstrTaxForm]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85S] ADD  CONSTRAINT [DF_tblO85S_fstrTaxForm]  DEFAULT ('') FOR [fstrTaxForm]
GO
/****** Object:  Default [DF_tblO85S_fstrSource]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85S] ADD  CONSTRAINT [DF_tblO85S_fstrSource]  DEFAULT ('GENKFI') FOR [fstrSource]
GO
/****** Object:  Default [DF_tblO85S_fblnFound]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO85S] ADD  CONSTRAINT [DF_tblO85S_fblnFound]  DEFAULT ((0)) FOR [fblnFound]
GO
/****** Object:  Default [DF_tblO99_fblnFein]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99] ADD  CONSTRAINT [DF_tblO99_fblnFein]  DEFAULT ((0)) FOR [fblnFein]
GO
/****** Object:  Default [DF_tblO99_fblnSsn]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99] ADD  CONSTRAINT [DF_tblO99_fblnSsn]  DEFAULT ((0)) FOR [fblnSsn]
GO
/****** Object:  Default [DF_tblO99_fstrID]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99] ADD  CONSTRAINT [DF_tblO99_fstrID]  DEFAULT (' ') FOR [fstrID]
GO
/****** Object:  Default [DF_tblO99_fcurNMDistrib]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99] ADD  CONSTRAINT [DF_tblO99_fcurNMDistrib]  DEFAULT ((0)) FOR [fcurTotalDue]
GO
/****** Object:  Default [DF_tblO99_fblnAmend]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99] ADD  CONSTRAINT [DF_tblO99_fblnAmend]  DEFAULT ((0)) FOR [fblnAmend]
GO
/****** Object:  Default [DF_tblO99_fdtmPostMarkDate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99] ADD  CONSTRAINT [DF_tblO99_fdtmPostMarkDate]  DEFAULT ('12/31/9999') FOR [fdtmPostMarkDate]
GO
/****** Object:  Default [DF_tblO99_fstrName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99] ADD  CONSTRAINT [DF_tblO99_fstrName]  DEFAULT (' ') FOR [fstrName]
GO
/****** Object:  Default [DF_tblO99_fstrStreet]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99] ADD  CONSTRAINT [DF_tblO99_fstrStreet]  DEFAULT (' ') FOR [fstrStreet]
GO
/****** Object:  Default [DF_tblO99_fstrCity]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99] ADD  CONSTRAINT [DF_tblO99_fstrCity]  DEFAULT (' ') FOR [fstrCity]
GO
/****** Object:  Default [DF_tblO99_fstrState]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99] ADD  CONSTRAINT [DF_tblO99_fstrState]  DEFAULT (' ') FOR [fstrState]
GO
/****** Object:  Default [DF_tblO99_fstrCountry]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99] ADD  CONSTRAINT [DF_tblO99_fstrCountry]  DEFAULT ('USA') FOR [fstrCountry]
GO
/****** Object:  Default [DF_tblO99_fstrZipCode]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99] ADD  CONSTRAINT [DF_tblO99_fstrZipCode]  DEFAULT (' ') FOR [fstrZipCode]
GO
/****** Object:  Default [DF_tblO99_fcurPage]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99] ADD  CONSTRAINT [DF_tblO99_fcurPage]  DEFAULT ((0)) FOR [fcurPage]
GO
/****** Object:  Default [DF_tblO99_fcurAllPage]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99] ADD  CONSTRAINT [DF_tblO99_fcurAllPage]  DEFAULT ((0)) FOR [fcurAllPage]
GO
/****** Object:  Default [DF_tblO99_fdtmSigned]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99] ADD  CONSTRAINT [DF_tblO99_fdtmSigned]  DEFAULT ('12/31/9999') FOR [fdtmSigned]
GO
/****** Object:  Default [DF_tblO99_fstrPhone]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99] ADD  CONSTRAINT [DF_tblO99_fstrPhone]  DEFAULT (' ') FOR [fstrPhone]
GO
/****** Object:  Default [DF_tblO99_fstrEmail]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99] ADD  CONSTRAINT [DF_tblO99_fstrEmail]  DEFAULT (' ') FOR [fstrEmail]
GO
/****** Object:  Default [DF_tblO99_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99] ADD  CONSTRAINT [DF_tblO99_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblO99_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99] ADD  CONSTRAINT [DF_tblO99_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblO99_fblnFound]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99] ADD  CONSTRAINT [DF_tblO99_fblnFound]  DEFAULT ((0)) FOR [fblnFound]
GO
/****** Object:  Default [DF_tblO99S_flngRepNum]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99S] ADD  CONSTRAINT [DF_tblO99S_flngRepNum]  DEFAULT ((0)) FOR [flngRepNum]
GO
/****** Object:  Default [DF_tblO99S_fstrId]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99S] ADD  CONSTRAINT [DF_tblO99S_fstrId]  DEFAULT (' ') FOR [fstrId]
GO
/****** Object:  Default [DF_tblO99S_fblnFein]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99S] ADD  CONSTRAINT [DF_tblO99S_fblnFein]  DEFAULT ((0)) FOR [fblnFein]
GO
/****** Object:  Default [DF_tblO99S_fblnSsn]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99S] ADD  CONSTRAINT [DF_tblO99S_fblnSsn]  DEFAULT ((0)) FOR [fblnSsn]
GO
/****** Object:  Default [DF_tblO99S_fstrName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99S] ADD  CONSTRAINT [DF_tblO99S_fstrName]  DEFAULT (' ') FOR [fstrName]
GO
/****** Object:  Default [DF_tblO99S_fstrStreet]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99S] ADD  CONSTRAINT [DF_tblO99S_fstrStreet]  DEFAULT (' ') FOR [fstrStreet]
GO
/****** Object:  Default [DF_tblO99S_fstrCity]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99S] ADD  CONSTRAINT [DF_tblO99S_fstrCity]  DEFAULT (' ') FOR [fstrCity]
GO
/****** Object:  Default [DF_tblO99S_fstrState]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99S] ADD  CONSTRAINT [DF_tblO99S_fstrState]  DEFAULT (' ') FOR [fstrState]
GO
/****** Object:  Default [DF_tblO99S_fstrCountry]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99S] ADD  CONSTRAINT [DF_tblO99S_fstrCountry]  DEFAULT ('USA') FOR [fstrCountry]
GO
/****** Object:  Default [DF_tblO99S_fstrZipCode]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99S] ADD  CONSTRAINT [DF_tblO99S_fstrZipCode]  DEFAULT (' ') FOR [fstrZipCode]
GO
/****** Object:  Default [DF_tblO99S_fblnOutSide]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99S] ADD  CONSTRAINT [DF_tblO99S_fblnOutSide]  DEFAULT ((0)) FOR [fblnOutSide]
GO
/****** Object:  Default [DF_tblO99S_fcurReeNet]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99S] ADD  CONSTRAINT [DF_tblO99S_fcurReeNet]  DEFAULT ((0)) FOR [fcurReeNet]
GO
/****** Object:  Default [DF_tblO99S_fcurReeWth]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99S] ADD  CONSTRAINT [DF_tblO99S_fcurReeWth]  DEFAULT ((0)) FOR [fcurReeWth]
GO
/****** Object:  Default [DF_tblO99S_fblnFilled]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99S] ADD  CONSTRAINT [DF_tblO99S_fblnFilled]  DEFAULT ((0)) FOR [fblnFilled]
GO
/****** Object:  Default [DF_tblO99S_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99S] ADD  CONSTRAINT [DF_tblO99S_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblO99S_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99S] ADD  CONSTRAINT [DF_tblO99S_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblO99S_fstrMPDLN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99S] ADD  CONSTRAINT [DF_tblO99S_fstrMPDLN]  DEFAULT (' ') FOR [fstrMPDLN]
GO
/****** Object:  Default [DF_tblO99S_fstrTaxForm]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99S] ADD  CONSTRAINT [DF_tblO99S_fstrTaxForm]  DEFAULT ('') FOR [fstrTaxForm]
GO
/****** Object:  Default [DF_tblO99S_fstrSource]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99S] ADD  CONSTRAINT [DF_tblO99S_fstrSource]  DEFAULT ('GENKFI') FOR [fstrSource]
GO
/****** Object:  Default [DF_tblO99S_fblnFound]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblO99S] ADD  CONSTRAINT [DF_tblO99S_fblnFound]  DEFAULT ((0)) FOR [fblnFound]
GO
/****** Object:  Default [DF_tblOgd_fblnFein]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgd] ADD  CONSTRAINT [DF_tblOgd_fblnFein]  DEFAULT ((0)) FOR [fblnFein]
GO
/****** Object:  Default [DF_tblOgd_fblnSsn]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgd] ADD  CONSTRAINT [DF_tblOgd_fblnSsn]  DEFAULT ((0)) FOR [fblnSsn]
GO
/****** Object:  Default [DF_tblOgd_fstrID]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgd] ADD  CONSTRAINT [DF_tblOgd_fstrID]  DEFAULT (' ') FOR [fstrID]
GO
/****** Object:  Default [DF_tblOgd_fcurNMDistrib]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgd] ADD  CONSTRAINT [DF_tblOgd_fcurNMDistrib]  DEFAULT ((0)) FOR [fcurTotalDue]
GO
/****** Object:  Default [DF_tblOgd_fblnAmend]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgd] ADD  CONSTRAINT [DF_tblOgd_fblnAmend]  DEFAULT ((0)) FOR [fblnAmend]
GO
/****** Object:  Default [DF_tblOgd_fdtmPostMarkDate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgd] ADD  CONSTRAINT [DF_tblOgd_fdtmPostMarkDate]  DEFAULT ('12/31/9999') FOR [fdtmPostMarkDate]
GO
/****** Object:  Default [DF_tblOgd_fstrName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgd] ADD  CONSTRAINT [DF_tblOgd_fstrName]  DEFAULT (' ') FOR [fstrName]
GO
/****** Object:  Default [DF_tblOgd_fstrStreet]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgd] ADD  CONSTRAINT [DF_tblOgd_fstrStreet]  DEFAULT (' ') FOR [fstrStreet]
GO
/****** Object:  Default [DF_tblOgd_fstrCity]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgd] ADD  CONSTRAINT [DF_tblOgd_fstrCity]  DEFAULT (' ') FOR [fstrCity]
GO
/****** Object:  Default [DF_tblOgd_fstrState]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgd] ADD  CONSTRAINT [DF_tblOgd_fstrState]  DEFAULT (' ') FOR [fstrState]
GO
/****** Object:  Default [DF_tblOgd_fstrCountry]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgd] ADD  CONSTRAINT [DF_tblOgd_fstrCountry]  DEFAULT ('USA') FOR [fstrCountry]
GO
/****** Object:  Default [DF_tblOgd_fstrZipCode]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgd] ADD  CONSTRAINT [DF_tblOgd_fstrZipCode]  DEFAULT (' ') FOR [fstrZipCode]
GO
/****** Object:  Default [DF_tblOgd_fcurPage]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgd] ADD  CONSTRAINT [DF_tblOgd_fcurPage]  DEFAULT ((0)) FOR [fcurPage]
GO
/****** Object:  Default [DF_tblOgd_fcurAllPage]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgd] ADD  CONSTRAINT [DF_tblOgd_fcurAllPage]  DEFAULT ((0)) FOR [fcurAllPage]
GO
/****** Object:  Default [DF_tblOgd_fdtmSigned]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgd] ADD  CONSTRAINT [DF_tblOgd_fdtmSigned]  DEFAULT ('12/31/9999') FOR [fdtmSigned]
GO
/****** Object:  Default [DF_tblOgd_fstrPhone]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgd] ADD  CONSTRAINT [DF_tblOgd_fstrPhone]  DEFAULT (' ') FOR [fstrPhone]
GO
/****** Object:  Default [DF_tblOgd_fstrEmail]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgd] ADD  CONSTRAINT [DF_tblOgd_fstrEmail]  DEFAULT (' ') FOR [fstrEmail]
GO
/****** Object:  Default [DF_tblOgd_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgd] ADD  CONSTRAINT [DF_tblOgd_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblOgd_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgd] ADD  CONSTRAINT [DF_tblOgd_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblOgd_fblnFound]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgd] ADD  CONSTRAINT [DF_tblOgd_fblnFound]  DEFAULT ((0)) FOR [fblnFound]
GO
/****** Object:  Default [DF_tblOgdS_flngRepNum]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgdS] ADD  CONSTRAINT [DF_tblOgdS_flngRepNum]  DEFAULT ((0)) FOR [flngRepNum]
GO
/****** Object:  Default [DF_tblOgdS_fstrId]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgdS] ADD  CONSTRAINT [DF_tblOgdS_fstrId]  DEFAULT (' ') FOR [fstrId]
GO
/****** Object:  Default [DF_tblOgdS_fblnFein]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgdS] ADD  CONSTRAINT [DF_tblOgdS_fblnFein]  DEFAULT ((0)) FOR [fblnFein]
GO
/****** Object:  Default [DF_tblOgdS_fblnSsn]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgdS] ADD  CONSTRAINT [DF_tblOgdS_fblnSsn]  DEFAULT ((0)) FOR [fblnSsn]
GO
/****** Object:  Default [DF_tblOgdS_fstrName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgdS] ADD  CONSTRAINT [DF_tblOgdS_fstrName]  DEFAULT (' ') FOR [fstrName]
GO
/****** Object:  Default [DF_tblOgdS_fstrStreet]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgdS] ADD  CONSTRAINT [DF_tblOgdS_fstrStreet]  DEFAULT (' ') FOR [fstrStreet]
GO
/****** Object:  Default [DF_tblOgdS_fstrCity]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgdS] ADD  CONSTRAINT [DF_tblOgdS_fstrCity]  DEFAULT (' ') FOR [fstrCity]
GO
/****** Object:  Default [DF_tblOgdS_fstrState]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgdS] ADD  CONSTRAINT [DF_tblOgdS_fstrState]  DEFAULT (' ') FOR [fstrState]
GO
/****** Object:  Default [DF_tblOgdS_fstrCountry]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgdS] ADD  CONSTRAINT [DF_tblOgdS_fstrCountry]  DEFAULT ('USA') FOR [fstrCountry]
GO
/****** Object:  Default [DF_tblOgdS_fstrZipCode]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgdS] ADD  CONSTRAINT [DF_tblOgdS_fstrZipCode]  DEFAULT (' ') FOR [fstrZipCode]
GO
/****** Object:  Default [DF_tblOgdS_fblnOutSide]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgdS] ADD  CONSTRAINT [DF_tblOgdS_fblnOutSide]  DEFAULT ((0)) FOR [fblnOutSide]
GO
/****** Object:  Default [DF_tblOgdS_fcurReeNet]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgdS] ADD  CONSTRAINT [DF_tblOgdS_fcurReeNet]  DEFAULT ((0)) FOR [fcurReeNet]
GO
/****** Object:  Default [DF_tblOgdS_fcurReeWth]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgdS] ADD  CONSTRAINT [DF_tblOgdS_fcurReeWth]  DEFAULT ((0)) FOR [fcurReeWth]
GO
/****** Object:  Default [DF_tblOgdS_fblnFilled]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgdS] ADD  CONSTRAINT [DF_tblOgdS_fblnFilled]  DEFAULT ((0)) FOR [fblnFilled]
GO
/****** Object:  Default [DF_tblOgdS_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgdS] ADD  CONSTRAINT [DF_tblOgdS_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblOgdS_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgdS] ADD  CONSTRAINT [DF_tblOgdS_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblOgdS_fstrMPDLN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgdS] ADD  CONSTRAINT [DF_tblOgdS_fstrMPDLN]  DEFAULT (' ') FOR [fstrMPDLN]
GO
/****** Object:  Default [DF_tblOgdS_fstrTaxForm]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgdS] ADD  CONSTRAINT [DF_tblOgdS_fstrTaxForm]  DEFAULT ('') FOR [fstrTaxForm]
GO
/****** Object:  Default [DF_tblOgdS_fstrSource]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgdS] ADD  CONSTRAINT [DF_tblOgdS_fstrSource]  DEFAULT ('GENKFI') FOR [fstrSource]
GO
/****** Object:  Default [DF_tblOgdS_fblnFound]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblOgdS] ADD  CONSTRAINT [DF_tblOgdS_fblnFound]  DEFAULT ((0)) FOR [fblnFound]
GO
/****** Object:  Default [DF_tblPit_fstrPSSN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fstrPSSN]  DEFAULT (' ') FOR [fstrPSSN]
GO
/****** Object:  Default [DF_tblPit_fblnPBlind]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fblnPBlind]  DEFAULT ((0)) FOR [fblnPBlind]
GO
/****** Object:  Default [DF_tblPit_fblnP65]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fblnP65]  DEFAULT ((0)) FOR [fblnP65]
GO
/****** Object:  Default [DF_tblPit_fstrPResident]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fstrPResident]  DEFAULT ('R') FOR [fstrPResident]
GO
/****** Object:  Default [DF_tblPit_fdtmPDob]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fdtmPDob]  DEFAULT ('12/31/9999') FOR [fdtmPDob]
GO
/****** Object:  Default [DF_tblPit_fstrPFirst]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fstrPFirst]  DEFAULT (' ') FOR [fstrPFirst]
GO
/****** Object:  Default [DF_tblPit_fstrPMiddle]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fstrPMiddle]  DEFAULT (' ') FOR [fstrPMiddle]
GO
/****** Object:  Default [DF_tblPit_fstrPLast]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fstrPLast]  DEFAULT (' ') FOR [fstrPLast]
GO
/****** Object:  Default [DF_tblPit_fstrPSuffix]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fstrPSuffix]  DEFAULT (' ') FOR [fstrPSuffix]
GO
/****** Object:  Default [DF_tblPit_fstrSpSSN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fstrSpSSN]  DEFAULT (' ') FOR [fstrSpSSN]
GO
/****** Object:  Default [DF_tblPit_fblnSpBlind]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fblnSpBlind]  DEFAULT ((0)) FOR [fblnSpBlind]
GO
/****** Object:  Default [DF_tblPit_fblnSp65]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fblnSp65]  DEFAULT ((0)) FOR [fblnSp65]
GO
/****** Object:  Default [DF_tblPit_fstrSpResident]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fstrSpResident]  DEFAULT ('R') FOR [fstrSpResident]
GO
/****** Object:  Default [DF_tblPit_fdtmSDob]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fdtmSDob]  DEFAULT ('12/31/9999') FOR [fdtmSDob]
GO
/****** Object:  Default [DF_tblPit_fstrSFirstName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fstrSFirstName]  DEFAULT (' ') FOR [fstrSFirst]
GO
/****** Object:  Default [DF_tblPit_fstrSMiddleInitial]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fstrSMiddleInitial]  DEFAULT (' ') FOR [fstrSMiddle]
GO
/****** Object:  Default [DF_tblPit_fstrSLastName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fstrSLastName]  DEFAULT (' ') FOR [fstrSLast]
GO
/****** Object:  Default [DF_tblPit_fstrSSuffix]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fstrSSuffix]  DEFAULT (' ') FOR [fstrSSuffix]
GO
/****** Object:  Default [DF_tblPit_fdtmPostmark]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fdtmPostmark]  DEFAULT ('12/31/9999') FOR [fdtmPostMarkDate]
GO
/****** Object:  Default [DF_tblPit_fdtmTaxYrBeg]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fdtmTaxYrBeg]  DEFAULT ('12/31/9999') FOR [fdtmTaxYrBeg]
GO
/****** Object:  Default [DF_tblPit_fdtmTaxYrEnd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fdtmTaxYrEnd]  DEFAULT ('12/31/9999') FOR [fdtmTaxYrEnd]
GO
/****** Object:  Default [DF_tblPit_fblnAddrChg]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fblnAddrChg]  DEFAULT ((0)) FOR [fblnAddrChg]
GO
/****** Object:  Default [DF_tblPit_fstrName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fstrName]  DEFAULT (' ') FOR [fstrName]
GO
/****** Object:  Default [DF_tblPit_fstrAddress]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fstrAddress]  DEFAULT (' ') FOR [fstrAddress]
GO
/****** Object:  Default [DF_tblPit_fstrCity]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fstrCity]  DEFAULT (' ') FOR [fstrCity]
GO
/****** Object:  Default [DF_tblPit_fstrState]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fstrState]  DEFAULT (' ') FOR [fstrState]
GO
/****** Object:  Default [DF_tblPit_fstrCountry]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fstrCountry]  DEFAULT ('USA') FOR [fstrCountry]
GO
/****** Object:  Default [DF_tblPit_fstrZipCode]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fstrZipCode]  DEFAULT (' ') FOR [fstrZipCode]
GO
/****** Object:  Default [DF_tblPit_fstrCFirstName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fstrCFirstName]  DEFAULT (' ') FOR [fstrCFirst]
GO
/****** Object:  Default [DF_tblPit_fstrCMiddle]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fstrCMiddle]  DEFAULT (' ') FOR [fstrCMiddle]
GO
/****** Object:  Default [DF_tblPit_fstrCLastName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fstrCLastName]  DEFAULT (' ') FOR [fstrCLast]
GO
/****** Object:  Default [DF_tblPit_fstrCSuffix]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fstrCSuffix]  DEFAULT (' ') FOR [fstrCSuffix]
GO
/****** Object:  Default [DF_tblPit_fstrCSSN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fstrCSSN]  DEFAULT (' ') FOR [fstrCSSN]
GO
/****** Object:  Default [DF_tblPit_fblnPDeceased]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fblnPDeceased]  DEFAULT ((0)) FOR [fblnPDeceased]
GO
/****** Object:  Default [DF_tblPit_fdtmPDeceased]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fdtmPDeceased]  DEFAULT ('12/31/9999') FOR [fdtmPDeceased]
GO
/****** Object:  Default [DF_tblPit_fblnSpDeceased]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fblnSpDeceased]  DEFAULT ((0)) FOR [fblnSpDeceased]
GO
/****** Object:  Default [DF_tblPit_fdtmSpDeceased]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fdtmSpDeceased]  DEFAULT ('12/31/9999') FOR [fdtmSpDeceased]
GO
/****** Object:  Default [DF_tblPit_fintExemptions]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fintExemptions]  DEFAULT ((0)) FOR [fintExemptions]
GO
/****** Object:  Default [DF_tblPit_fblnExtension]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fblnExtension]  DEFAULT ((0)) FOR [fblnExtension]
GO
/****** Object:  Default [DF_tblPit_fdtmExtension]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fdtmExtension]  DEFAULT ('12/31/9999') FOR [fdtmExtension]
GO
/****** Object:  Default [DF_tblPit_fintFilingStatus]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fintFilingStatus]  DEFAULT ((0)) FOR [fintFilingStatus]
GO
/****** Object:  Default [DF_tblPit_fstrHOHDep]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fstrHOHDep]  DEFAULT (' ') FOR [fstrHOHDep]
GO
/****** Object:  Default [DF_tblPit_fcurFedAGI]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fcurFedAGI]  DEFAULT ((0)) FOR [fcurFedAGI]
GO
/****** Object:  Default [DF_tblPit_fcurItemFedDed]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fcurItemFedDed]  DEFAULT ((0)) FOR [fcurItemFedDed]
GO
/****** Object:  Default [DF_tblPit_fcurTotFedAdd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fcurTotFedAdd]  DEFAULT ((0)) FOR [fcurTotFedAdd]
GO
/****** Object:  Default [DF_tblPit_fcurFedStdItmDed]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fcurFedStdItmDed]  DEFAULT ((0)) FOR [fcurFedStdItmDed]
GO
/****** Object:  Default [DF_tblPit_fblnItemized]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fblnItemized]  DEFAULT ((0)) FOR [fblnItemized]
GO
/****** Object:  Default [DF_tblPit_fcurFedExemption]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fcurFedExemption]  DEFAULT ((0)) FOR [fcurFedExemption]
GO
/****** Object:  Default [DF_tblPit_fcurNMLowIncomeDedn]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fcurNMLowIncomeDedn]  DEFAULT ((0)) FOR [fcurNMLowDedn]
GO
/****** Object:  Default [DF_tblPit_fcurFedDedns]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fcurFedDedns]  DEFAULT ((0)) FOR [fcurFedDedns]
GO
/****** Object:  Default [DF_tblPit_fcurMedicalCare]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fcurMedicalCare]  DEFAULT ((0)) FOR [fcurMedicalCare]
GO
/****** Object:  Default [DF_tblPit_fcurMedicalCareExp]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fcurMedicalCareExp]  DEFAULT ((0)) FOR [fcurMedicalCareExp]
GO
/****** Object:  Default [DF_tblPit_fcurNMTaxInc]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fcurNMTaxInc]  DEFAULT ((0)) FOR [fcurNMTaxInc]
GO
/****** Object:  Default [DF_tblPit_fcurNMIncomeTax]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fcurNMIncomeTax]  DEFAULT ((0)) FOR [fcurNMIncomeTax]
GO
/****** Object:  Default [DF_tblPit_fstrSchedule]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fstrSchedule]  DEFAULT ('R') FOR [fstrSchedule]
GO
/****** Object:  Default [DF_tblPit_fcurLumpsum]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fcurLumpsum]  DEFAULT ((0)) FOR [fcurLumpsum]
GO
/****** Object:  Default [DF_tblPit_fcurOthStateCred]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fcurOthStateCred]  DEFAULT ((0)) FOR [fcurOthStateCred]
GO
/****** Object:  Default [DF_tblPit_fcurNonRefundable]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fcurNonRefundable]  DEFAULT ((0)) FOR [fcurNonRefundable]
GO
/****** Object:  Default [DF_tblPit_fcurNetIncomeTax]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fcurNetIncomeTax]  DEFAULT ((0)) FOR [fcurNetIncomeTax]
GO
/****** Object:  Default [DF_tblPit_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblPit_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblPit_fcurFedNol]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit] ADD  CONSTRAINT [DF_tblPit_fcurFedNol]  DEFAULT ((0)) FOR [fcurFedNol]
GO
/****** Object:  Default [DF_tblPit2_fcurNMNetTaxPass]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fcurNMNetTaxPass]  DEFAULT ((0)) FOR [fcurNMNetTaxPass]
GO
/****** Object:  Default [DF_tblPit2_fcurTotalClaimed]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fcurTotalClaimed]  DEFAULT ((0)) FOR [fcurTotalClaimed]
GO
/****** Object:  Default [DF_tblPit2_fcurWorkFamCred]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fcurWorkFamCred]  DEFAULT ((0)) FOR [fcurWorkFamCred]
GO
/****** Object:  Default [DF_tblPit2_fcurFedEICredit]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fcurFedEICredit]  DEFAULT ((0)) FOR [fcurFedEICredit]
GO
/****** Object:  Default [DF_tblPit2_fcurIncTaxWithheld]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fcurIncTaxWithheld]  DEFAULT ((0)) FOR [fcurIncTaxWithheld]
GO
/****** Object:  Default [DF_tblPit2_fcurIncTaxWithOGP]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fcurIncTaxWithOGP]  DEFAULT ((0)) FOR [fcurIncTaxWithOGP]
GO
/****** Object:  Default [DF_tblPit2_fcurIncTaxWithPTE]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fcurIncTaxWithPTE]  DEFAULT ((0)) FOR [fcurIncTaxWithPTE]
GO
/****** Object:  Default [DF_tblPit2_fcurEstimatedPymt]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fcurEstimatedPymt]  DEFAULT ((0)) FOR [fcurEstimatedPymt]
GO
/****** Object:  Default [DF_tblPit2_fcurOtherPayments]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fcurOtherPayments]  DEFAULT ((0)) FOR [fcurOtherPayments]
GO
/****** Object:  Default [DF_tblPit2_fcurPaymtnCredits]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fcurPaymtnCredits]  DEFAULT ((0)) FOR [fcurPaymtnCredits]
GO
/****** Object:  Default [DF_tblPit2_fcurTaxDue]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fcurTaxDue]  DEFAULT ((0)) FOR [fcurTaxDue]
GO
/****** Object:  Default [DF_tblPit2_fcurEstPymtPenalty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fcurEstPymtPenalty]  DEFAULT ((0)) FOR [fcurEstPymtPenalty]
GO
/****** Object:  Default [DF_tblPit2_fstrPenaltyCalcMeth]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fstrPenaltyCalcMeth]  DEFAULT (' ') FOR [fstrPenaltyCalcMeth]
GO
/****** Object:  Default [DF_tblPit2_fcurPenalty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fcurPenalty]  DEFAULT ((0)) FOR [fcurPenalty]
GO
/****** Object:  Default [DF_tblPit2_fcurInterest]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fcurInterest]  DEFAULT ((0)) FOR [fcurInterest]
GO
/****** Object:  Default [DF_tblPit2_fcurTotalDue]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fcurTotalDue]  DEFAULT ((0)) FOR [fcurTotalDue]
GO
/****** Object:  Default [DF_tblPit2_fcurOverPayment]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fcurOverPayment]  DEFAULT ((0)) FOR [fcurOverPayment]
GO
/****** Object:  Default [DF_tblPit2_fcurRefundDonations]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fcurRefundDonations]  DEFAULT ((0)) FOR [fcurRefundDonations]
GO
/****** Object:  Default [DF_tblPit2_fcurAppliedEstTax]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fcurAppliedEstTax]  DEFAULT ((0)) FOR [fcurAppliedEstTax]
GO
/****** Object:  Default [DF_tblPit2_fcurRefundAmount]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fcurRefundAmount]  DEFAULT ((0)) FOR [fcurRefundAmount]
GO
/****** Object:  Default [DF_tblPit2_fstrRouting1Num]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fstrRouting1Num]  DEFAULT (' ') FOR [fstrRouting1Num]
GO
/****** Object:  Default [DF_tblPit2_fstrRoutingNumber]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fstrRoutingNumber]  DEFAULT (' ') FOR [fstrRoutingNumber]
GO
/****** Object:  Default [DF_tblPit2_fstrAccount1Num]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fstrAccount1Num]  DEFAULT (' ') FOR [fstrAccount1Num]
GO
/****** Object:  Default [DF_tblPit2_fstrAccountNumber]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fstrAccountNumber]  DEFAULT (' ') FOR [fstrAccountNumber]
GO
/****** Object:  Default [DF_tblPit2_fstrAccountType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fstrAccountType]  DEFAULT (' ') FOR [fstrAccountType]
GO
/****** Object:  Default [DF_tblPit2_fblnAcctChk]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fblnAcctChk]  DEFAULT ((0)) FOR [fblnAcctChk]
GO
/****** Object:  Default [DF_tblPit2_fblnAcctSav]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fblnAcctSav]  DEFAULT ((0)) FOR [fblnAcctSav]
GO
/****** Object:  Default [DF_tblPit2_fblnIATFlag]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fblnIATFlag]  DEFAULT ((0)) FOR [fblnIATFlag]
GO
/****** Object:  Default [DF_tblPit2_fblnIATYes]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fblnIATYes]  DEFAULT ((0)) FOR [fblnIATYes]
GO
/****** Object:  Default [DF_tblPit2_fblnIATNo]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fblnIATNo]  DEFAULT ((0)) FOR [fblnIATNo]
GO
/****** Object:  Default [DF_tblPit2_fstrTPPhone]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fstrTPPhone]  DEFAULT (' ') FOR [fstrTPPhone]
GO
/****** Object:  Default [DF_tblPit2_fstrTPEmail]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fstrTPEmail]  DEFAULT (' ') FOR [fstrTPEmail]
GO
/****** Object:  Default [DF_tblPit2_fstrPrepCRS]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fstrPrepCRS]  DEFAULT (' ') FOR [fstrPrepCRS]
GO
/****** Object:  Default [DF_tblPit2_fstrPrepPTIN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fstrPrepPTIN]  DEFAULT (' ') FOR [fstrPrepPTIN]
GO
/****** Object:  Default [DF_tblPit2_fstrPrepEIN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fstrPrepEIN]  DEFAULT (' ') FOR [fstrPrepEIN]
GO
/****** Object:  Default [DF_tblPit2_fstrPrepPhone]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fstrPrepPhone]  DEFAULT (' ') FOR [fstrPrepPhone]
GO
/****** Object:  Default [DF_tblPit2_fbln41338Flg]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fbln41338Flg]  DEFAULT ((0)) FOR [fbln41338Flg]
GO
/****** Object:  Default [DF_tblPit2_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblPit2_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblPit2_fcurTrfCrd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fcurTrfCrd]  DEFAULT ((0)) FOR [fcurTrfCrd]
GO
/****** Object:  Default [DF_tblPit2_fstrNMPin]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPit2] ADD  CONSTRAINT [DF_tblPit2_fstrNMPin]  DEFAULT (' ') FOR [fstrNMPin]
GO
/****** Object:  Default [DF_tblPitAdj_fcurAjFedTaxBonds]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fcurAjFedTaxBonds]  DEFAULT ((0)) FOR [fcurAjFedTaxBonds]
GO
/****** Object:  Default [DF_tblPitAdj_fcurAjNOLAddition]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fcurAjNOLAddition]  DEFAULT ((0)) FOR [fcurAjNOLAddition]
GO
/****** Object:  Default [DF_tblPitAdj_fcurAjCollegeTerm]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fcurAjCollegeTerm]  DEFAULT ((0)) FOR [fcurAjCollegeTerm]
GO
/****** Object:  Default [DF_tblPitAdj_fcurAjLandCons]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fcurAjLandCons]  DEFAULT ((0)) FOR [fcurAjLandCons]
GO
/****** Object:  Default [DF_tblPitAdj_fcurAjTotalAdd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fcurAjTotalAdd]  DEFAULT ((0)) FOR [fcurAjTotalAdd]
GO
/****** Object:  Default [DF_tblPitAdj_fcurAjIntDiv]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fcurAjIntDiv]  DEFAULT ((0)) FOR [fcurAjIntDiv]
GO
/****** Object:  Default [DF_tblPitAdj_fcurAjNMNOL]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fcurAjNMNOL]  DEFAULT ((0)) FOR [fcurAjNMNOL]
GO
/****** Object:  Default [DF_tblPitAdj_fcurAjIntUSGovt]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fcurAjIntUSGovt]  DEFAULT ((0)) FOR [fcurAjIntUSGovt]
GO
/****** Object:  Default [DF_tblPitAdj_fcurAjRailRoad]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fcurAjRailRoad]  DEFAULT ((0)) FOR [fcurAjRailRoad]
GO
/****** Object:  Default [DF_tblPitAdj_fcurAjIndianLand]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fcurAjIndianLand]  DEFAULT ((0)) FOR [fcurAjIndianLand]
GO
/****** Object:  Default [DF_tblPitAdj_fstrAjPrimeTribe]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fstrAjPrimeTribe]  DEFAULT (' ') FOR [fstrAjPrimeTribe]
GO
/****** Object:  Default [DF_tblPitAdj_fstrAjSpouseTribe]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fstrAjSpouseTribe]  DEFAULT (' ') FOR [fstrAjSpouseTribe]
GO
/****** Object:  Default [DF_tblPitAdj_fblnAjPrime100]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fblnAjPrime100]  DEFAULT ((0)) FOR [fblnAjPrime100]
GO
/****** Object:  Default [DF_tblPitAdj_fblnAjSpouse100]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fblnAjSpouse100]  DEFAULT ((0)) FOR [fblnAjSpouse100]
GO
/****** Object:  Default [DF_tblPitAdj_fcurAj100Years]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fcurAj100Years]  DEFAULT ((0)) FOR [fcurAj100Years]
GO
/****** Object:  Default [DF_tblPitAdj_fcurAj65orBlind]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fcurAj65orBlind]  DEFAULT ((0)) FOR [fcurAj65orBlind]
GO
/****** Object:  Default [DF_tblPitAdj_fcurAjNMMedCare]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fcurAjNMMedCare]  DEFAULT ((0)) FOR [fcurAjNMMedCare]
GO
/****** Object:  Default [DF_tblPitAdj_fcurAjNMEdnTrust]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fcurAjNMEdnTrust]  DEFAULT ((0)) FOR [fcurAjNMEdnTrust]
GO
/****** Object:  Default [DF_tblPitAdj_fcurAjNetCapGains]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fcurAjNetCapGains]  DEFAULT ((0)) FOR [fcurAjNetCapGains]
GO
/****** Object:  Default [DF_tblPitAdj_fcurAjMilitary]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fcurAjMilitary]  DEFAULT ((0)) FOR [fcurAjMilitary]
GO
/****** Object:  Default [DF_tblPitAdj_fcurAjNMMedical65]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fcurAjNMMedical65]  DEFAULT ((0)) FOR [fcurAjNMMedical65]
GO
/****** Object:  Default [DF_tblPitAdj_fcurAjOrganDon]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fcurAjOrganDon]  DEFAULT ((0)) FOR [fcurAjOrganDon]
GO
/****** Object:  Default [DF_tblPitAdj_fcurAjNMNatlGuard]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fcurAjNMNatlGuard]  DEFAULT ((0)) FOR [fcurAjNMNatlGuard]
GO
/****** Object:  Default [DF_tblPitAdj_fcurAjStateLocTax]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fcurAjStateLocTax]  DEFAULT ((0)) FOR [fcurAjStateLocTax]
GO
/****** Object:  Default [DF_tblPitAdj_fcurAjTotalDeduct]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fcurAjTotalDeduct]  DEFAULT ((0)) FOR [fcurAjTotalDeduct]
GO
/****** Object:  Default [DF_tblPitAdj_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblPitAdj_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblPitAdj_fcurAjActDutyPay]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitAdj] ADD  CONSTRAINT [DF_tblPitAdj_fcurAjActDutyPay]  DEFAULT ((0)) FOR [fcurAjActDutyPay]
GO
/****** Object:  Default [DF_tblPitB_fdtmBPFrom]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fdtmBPFrom]  DEFAULT ('12/31/9999') FOR [fdtmBPFrom]
GO
/****** Object:  Default [DF_tblPitB_fdtmBPTo]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fdtmBPTo]  DEFAULT ('12/31/9999') FOR [fdtmBPTo]
GO
/****** Object:  Default [DF_tblPitB_fdtmBSpFrom]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fdtmBSpFrom]  DEFAULT ('12/31/9999') FOR [fdtmBSpFrom]
GO
/****** Object:  Default [DF_tblPitB_fdtmBSpTo]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fdtmBSpTo]  DEFAULT ('12/31/9999') FOR [fdtmBSpTo]
GO
/****** Object:  Default [DF_tblPitB_fblnBPMilitary]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fblnBPMilitary]  DEFAULT ((0)) FOR [fblnBPMilitary]
GO
/****** Object:  Default [DF_tblPitB_fblnBSpMilitary]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fblnBSpMilitary]  DEFAULT ((0)) FOR [fblnBSpMilitary]
GO
/****** Object:  Default [DF_tblPitB_fcurBWages]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fcurBWages]  DEFAULT ((0)) FOR [fcurBWages]
GO
/****** Object:  Default [DF_tblPitB_fcurBNMWages]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fcurBNMWages]  DEFAULT ((0)) FOR [fcurBNMWages]
GO
/****** Object:  Default [DF_tblPitB_fblnBCalc110]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fblnBCalc110]  DEFAULT ((0)) FOR [fblnBCalc110]
GO
/****** Object:  Default [DF_tblPitB_fcurBInterest]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fcurBInterest]  DEFAULT ((0)) FOR [fcurBInterest]
GO
/****** Object:  Default [DF_tblPitB_fcurBNMInterest]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fcurBNMInterest]  DEFAULT ((0)) FOR [fcurBNMInterest]
GO
/****** Object:  Default [DF_tblPitB_fcurBPensions]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fcurBPensions]  DEFAULT ((0)) FOR [fcurBPensions]
GO
/****** Object:  Default [DF_tblPitB_fcurBNMPensions]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fcurBNMPensions]  DEFAULT ((0)) FOR [fcurBNMPensions]
GO
/****** Object:  Default [DF_tblPitB_fcurBRents]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fcurBRents]  DEFAULT ((0)) FOR [fcurBRents]
GO
/****** Object:  Default [DF_tblPitB_fcurBNMRents]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fcurBNMRents]  DEFAULT ((0)) FOR [fcurBNMRents]
GO
/****** Object:  Default [DF_tblPitB_fcurBGains]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fcurBGains]  DEFAULT ((0)) FOR [fcurBGains]
GO
/****** Object:  Default [DF_tblPitB_fcurBNMGains]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fcurBNMGains]  DEFAULT ((0)) FOR [fcurBNMGains]
GO
/****** Object:  Default [DF_tblPitB_fcurBIncPte]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fcurBIncPte]  DEFAULT ((0)) FOR [fcurBIncPte]
GO
/****** Object:  Default [DF_tblPitB_fcurBNMIncPte]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fcurBNMIncPte]  DEFAULT ((0)) FOR [fcurBNMIncPte]
GO
/****** Object:  Default [DF_tblPitB_fcurBOthInc]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fcurBOthInc]  DEFAULT ((0)) FOR [fcurBOthInc]
GO
/****** Object:  Default [DF_tblPitB_fcurBNMOthInc]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fcurBNMOthInc]  DEFAULT ((0)) FOR [fcurBNMOthInc]
GO
/****** Object:  Default [DF_tblPitB_fcurBFarm]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fcurBFarm]  DEFAULT ((0)) FOR [fcurBFarm]
GO
/****** Object:  Default [DF_tblPitB_fcurBNMFarm]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fcurBNMFarm]  DEFAULT ((0)) FOR [fcurBNMFarm]
GO
/****** Object:  Default [DF_tblPitB_fcurBSubTotal]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fcurBSubTotal]  DEFAULT ((0)) FOR [fcurBSubTotal]
GO
/****** Object:  Default [DF_tblPitB_fcurBNMSubTotal]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fcurBNMSubTotal]  DEFAULT ((0)) FOR [fcurBNMSubTotal]
GO
/****** Object:  Default [DF_tblPitB_fcurBFedAdj]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fcurBFedAdj]  DEFAULT ((0)) FOR [fcurBFedAdj]
GO
/****** Object:  Default [DF_tblPitB_fcurBNMFedAdj]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fcurBNMFedAdj]  DEFAULT ((0)) FOR [fcurBNMFedAdj]
GO
/****** Object:  Default [DF_tblPitB_fcurBTotInc]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fcurBTotInc]  DEFAULT ((0)) FOR [fcurBTotInc]
GO
/****** Object:  Default [DF_tblPitB_fcurBNMTotInc]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fcurBNMTotInc]  DEFAULT ((0)) FOR [fcurBNMTotInc]
GO
/****** Object:  Default [DF_tblPitB_fcurBPercent]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fcurBPercent]  DEFAULT ((1)) FOR [fcurBPercent]
GO
/****** Object:  Default [DF_tblPitB_fcurBTaxTable]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fcurBTaxTable]  DEFAULT ((0)) FOR [fcurBTaxTable]
GO
/****** Object:  Default [DF_tblPitB_fcurBFinalTax]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fcurBFinalTax]  DEFAULT ((0)) FOR [fcurBFinalTax]
GO
/****** Object:  Default [DF_tblPitB_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblPitB_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB] ADD  CONSTRAINT [DF_tblPitB_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblPitB2_flngRepNum]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB2] ADD  CONSTRAINT [DF_tblPitB2_flngRepNum]  DEFAULT ('') FOR [fstrMPDLN]
GO
/****** Object:  Default [DF_tblPitB2_fstrB2Fein]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB2] ADD  CONSTRAINT [DF_tblPitB2_fstrB2Fein]  DEFAULT (' ') FOR [fstrB2Fein]
GO
/****** Object:  Default [DF_tblPitB2_fstrB2Crs]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB2] ADD  CONSTRAINT [DF_tblPitB2_fstrB2Crs]  DEFAULT (' ') FOR [fstrB2Crs]
GO
/****** Object:  Default [DF_tblPitB2_fstrB2Name]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB2] ADD  CONSTRAINT [DF_tblPitB2_fstrB2Name]  DEFAULT (' ') FOR [fstrB2Name]
GO
/****** Object:  Default [DF_tblPitB2_fstrB2Street]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB2] ADD  CONSTRAINT [DF_tblPitB2_fstrB2Street]  DEFAULT (' ') FOR [fstrB2Street]
GO
/****** Object:  Default [DF_tblPitB2_fstrB2City]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB2] ADD  CONSTRAINT [DF_tblPitB2_fstrB2City]  DEFAULT (' ') FOR [fstrB2City]
GO
/****** Object:  Default [DF_tblPitB2_fstrB2State]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB2] ADD  CONSTRAINT [DF_tblPitB2_fstrB2State]  DEFAULT (' ') FOR [fstrB2State]
GO
/****** Object:  Default [DF_tblPitB2_fstrB2Country]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB2] ADD  CONSTRAINT [DF_tblPitB2_fstrB2Country]  DEFAULT (' ') FOR [fstrB2Country]
GO
/****** Object:  Default [DF_tblPitB2_fstrB2ZipCode]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB2] ADD  CONSTRAINT [DF_tblPitB2_fstrB2ZipCode]  DEFAULT (' ') FOR [fstrB2ZipCode]
GO
/****** Object:  Default [DF_tblPitB2_fcurB2Property]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB2] ADD  CONSTRAINT [DF_tblPitB2_fcurB2Property]  DEFAULT ((0)) FOR [fcurB2Property]
GO
/****** Object:  Default [DF_tblPitB2_fcurB2NMProperty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB2] ADD  CONSTRAINT [DF_tblPitB2_fcurB2NMProperty]  DEFAULT ((0)) FOR [fcurB2NMProperty]
GO
/****** Object:  Default [DF_tblPitB2_fcurB2PropertyFactor]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB2] ADD  CONSTRAINT [DF_tblPitB2_fcurB2PropertyFactor]  DEFAULT ((0)) FOR [fcurB2PropertyFactor]
GO
/****** Object:  Default [DF_tblPitB2_fcurB2Payroll]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB2] ADD  CONSTRAINT [DF_tblPitB2_fcurB2Payroll]  DEFAULT ((0)) FOR [fcurB2Payroll]
GO
/****** Object:  Default [DF_tblPitB2_fcurB2NMPayroll]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB2] ADD  CONSTRAINT [DF_tblPitB2_fcurB2NMPayroll]  DEFAULT ((0)) FOR [fcurB2NMPayroll]
GO
/****** Object:  Default [DF_tblPitB2_fcurB2PayrollFactor]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB2] ADD  CONSTRAINT [DF_tblPitB2_fcurB2PayrollFactor]  DEFAULT ((0)) FOR [fcurB2PayrollFactor]
GO
/****** Object:  Default [DF_tblPitB2_fcurB2Sales]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB2] ADD  CONSTRAINT [DF_tblPitB2_fcurB2Sales]  DEFAULT ((0)) FOR [fcurB2Sales]
GO
/****** Object:  Default [DF_tblPitB2_fcurB2NMSales]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB2] ADD  CONSTRAINT [DF_tblPitB2_fcurB2NMSales]  DEFAULT ((0)) FOR [fcurB2NMSales]
GO
/****** Object:  Default [DF_tblPitB2_fcurB2SalesFactor]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB2] ADD  CONSTRAINT [DF_tblPitB2_fcurB2SalesFactor]  DEFAULT ((0)) FOR [fcurB2SalesFactor]
GO
/****** Object:  Default [DF_tblPitB2_fcurB2TotalFactor]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB2] ADD  CONSTRAINT [DF_tblPitB2_fcurB2TotalFactor]  DEFAULT ((0)) FOR [fcurB2TotalFactor]
GO
/****** Object:  Default [DF_tblPitB2_fcurB2AvgFactor]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB2] ADD  CONSTRAINT [DF_tblPitB2_fcurB2AvgFactor]  DEFAULT ((0)) FOR [fcurB2AvgFactor]
GO
/****** Object:  Default [DF_tblPitB2_fdtmB2ManufDate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB2] ADD  CONSTRAINT [DF_tblPitB2_fdtmB2ManufDate]  DEFAULT ('12/31/9999') FOR [fdtmB2ManufDate]
GO
/****** Object:  Default [DF_tblPitB2_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB2] ADD  CONSTRAINT [DF_tblPitB2_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblPitB2_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB2] ADD  CONSTRAINT [DF_tblPitB2_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblPitB2_fdtmB2Election]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitB2] ADD  CONSTRAINT [DF_tblPitB2_fdtmB2Election]  DEFAULT ('12/31/9999') FOR [fdtmB2Election]
GO
/****** Object:  Default [DF_tblPitCR_fcurCRCultProp]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCR] ADD  CONSTRAINT [DF_tblPitCR_fcurCRCultProp]  DEFAULT ((0)) FOR [fcurCRCultProp]
GO
/****** Object:  Default [DF_tblPitCR_fcurCRBusFac]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCR] ADD  CONSTRAINT [DF_tblPitCR_fcurCRBusFac]  DEFAULT ((0)) FOR [fcurCRBusFac]
GO
/****** Object:  Default [DF_tblPitCR_fcurCRRuralJob]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCR] ADD  CONSTRAINT [DF_tblPitCR_fcurCRRuralJob]  DEFAULT ((0)) FOR [fcurCRRuralJob]
GO
/****** Object:  Default [DF_tblPitCR_fcurCRTechJobs]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCR] ADD  CONSTRAINT [DF_tblPitCR_fcurCRTechJobs]  DEFAULT ((0)) FOR [fcurCRTechJobs]
GO
/****** Object:  Default [DF_tblPitCR_fcurCRElecCard]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCR] ADD  CONSTRAINT [DF_tblPitCR_fcurCRElecCard]  DEFAULT ((0)) FOR [fcurCRElecCard]
GO
/****** Object:  Default [DF_tblPitCR_fcurCRJobMentor]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCR] ADD  CONSTRAINT [DF_tblPitCR_fcurCRJobMentor]  DEFAULT ((0)) FOR [fcurCRJobMentor]
GO
/****** Object:  Default [DF_tblPitCR_fcurCRLandCons]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCR] ADD  CONSTRAINT [DF_tblPitCR_fcurCRLandCons]  DEFAULT ((0)) FOR [fcurCRLandCons]
GO
/****** Object:  Default [DF_tblPitCR_fcurCRAffordHouse]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCR] ADD  CONSTRAINT [DF_tblPitCR_fcurCRAffordHouse]  DEFAULT ((0)) FOR [fcurCRAffordHouse]
GO
/****** Object:  Default [DF_tblPitCR_fcurCRSolarDev]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCR] ADD  CONSTRAINT [DF_tblPitCR_fcurCRSolarDev]  DEFAULT ((0)) FOR [fcurCRSolarDev]
GO
/****** Object:  Default [DF_tblPitCR_fcurCRBioDiesel]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCR] ADD  CONSTRAINT [DF_tblPitCR_fcurCRBioDiesel]  DEFAULT ((0)) FOR [fcurCRBioDiesel]
GO
/****** Object:  Default [DF_tblPitCR_fcurCRSusBldg]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCR] ADD  CONSTRAINT [DF_tblPitCR_fcurCRSusBldg]  DEFAULT ((0)) FOR [fcurCRSusBldg]
GO
/****** Object:  Default [DF_tblPitCR_fcurCRAngelInv]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCR] ADD  CONSTRAINT [DF_tblPitCR_fcurCRAngelInv]  DEFAULT ((0)) FOR [fcurCRAngelInv]
GO
/****** Object:  Default [DF_tblPitCR_fcurCRHealthCare]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCR] ADD  CONSTRAINT [DF_tblPitCR_fcurCRHealthCare]  DEFAULT ((0)) FOR [fcurCRHealthCare]
GO
/****** Object:  Default [DF_tblPitCR_fcurCRWaterCons]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCR] ADD  CONSTRAINT [DF_tblPitCR_fcurCRWaterCons]  DEFAULT ((0)) FOR [fcurCRWaterCons]
GO
/****** Object:  Default [DF_tblPitCR_fcurCRAdvEnergy]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCR] ADD  CONSTRAINT [DF_tblPitCR_fcurCRAdvEnergy]  DEFAULT ((0)) FOR [fcurCRAdvEnergy]
GO
/****** Object:  Default [DF_tblPitCR_fcurCRGeolPump]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCR] ADD  CONSTRAINT [DF_tblPitCR_fcurCRGeolPump]  DEFAULT ((0)) FOR [fcurCRGeolPump]
GO
/****** Object:  Default [DF_tblPitCR_fcurCRBiomass]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCR] ADD  CONSTRAINT [DF_tblPitCR_fcurCRBiomass]  DEFAULT ((0)) FOR [fcurCRBiomass]
GO
/****** Object:  Default [DF_tblPitCR_fcurCRFilmApplied]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCR] ADD  CONSTRAINT [DF_tblPitCR_fcurCRFilmApplied]  DEFAULT ((0)) FOR [fcurCRFilmApplied]
GO
/****** Object:  Default [DF_tblPitCR_fcurCRFilmApproved]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCR] ADD  CONSTRAINT [DF_tblPitCR_fcurCRFilmApproved]  DEFAULT ((0)) FOR [fcurCRFilmApproved]
GO
/****** Object:  Default [DF_tblPitCR_fcurCRCancerTrial]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCR] ADD  CONSTRAINT [DF_tblPitCR_fcurCRCancerTrial]  DEFAULT ((0)) FOR [fcurCRCancerTrial]
GO
/****** Object:  Default [DF_tblPitCR_fcurCRVetEmploy]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCR] ADD  CONSTRAINT [DF_tblPitCR_fcurCRVetEmploy]  DEFAULT ((0)) FOR [fcurCRVetEmploy]
GO
/****** Object:  Default [DF_tblPitCR_fcurCRTotalCredits]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCR] ADD  CONSTRAINT [DF_tblPitCR_fcurCRTotalCredits]  DEFAULT ((0)) FOR [fcurCRTotalCredits]
GO
/****** Object:  Default [DF_tblPitCR_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCR] ADD  CONSTRAINT [DF_tblPitCR_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblPitCR_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCR] ADD  CONSTRAINT [DF_tblPitCR_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblPitCRS_flngRepNum]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCRS] ADD  CONSTRAINT [DF_tblPitCRS_flngRepNum]  DEFAULT ((0)) FOR [flngRepNum]
GO
/****** Object:  Default [DF_tblPitCRS_fstrCrdType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCRS] ADD  CONSTRAINT [DF_tblPitCRS_fstrCrdType]  DEFAULT (' ') FOR [fstrCrdType]
GO
/****** Object:  Default [DF_tblPitCRS_fstrApprove]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCRS] ADD  CONSTRAINT [DF_tblPitCRS_fstrApprove]  DEFAULT (' ') FOR [fstrApprove]
GO
/****** Object:  Default [DF_tblPitCRS_fcurApplied]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCRS] ADD  CONSTRAINT [DF_tblPitCRS_fcurApplied]  DEFAULT ((0)) FOR [fcurApplied]
GO
/****** Object:  Default [DF_tblPitCRS_fcurRefund]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCRS] ADD  CONSTRAINT [DF_tblPitCRS_fcurRefund]  DEFAULT ((0)) FOR [fcurRefund]
GO
/****** Object:  Default [DF_tblPitCRS_fblnFilled]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCRS] ADD  CONSTRAINT [DF_tblPitCRS_fblnFilled]  DEFAULT ((0)) FOR [fblnFilled]
GO
/****** Object:  Default [DF_tblPitCRS_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCRS] ADD  CONSTRAINT [DF_tblPitCRS_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblPitCRS_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCRS] ADD  CONSTRAINT [DF_tblPitCRS_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblPitCRS_fstrMPDLN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCRS] ADD  CONSTRAINT [DF_tblPitCRS_fstrMPDLN]  DEFAULT (' ') FOR [fstrMPDLN]
GO
/****** Object:  Default [DF_tblPitCRS_fstrTaxForm]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCRS] ADD  CONSTRAINT [DF_tblPitCRS_fstrTaxForm]  DEFAULT (' ') FOR [fstrTaxForm]
GO
/****** Object:  Default [DF_tblPitCRS_fstrSource]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCRS] ADD  CONSTRAINT [DF_tblPitCRS_fstrSource]  DEFAULT ('GENTAX') FOR [fstrSource]
GO
/****** Object:  Default [DF_tblPitCRS_fblnFound]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCRS] ADD  CONSTRAINT [DF_tblPitCRS_fblnFound]  DEFAULT ((0)) FOR [fblnFound]
GO
/****** Object:  Default [DF_tblPitCrsT_fcurTotApplied1]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCrsT] ADD  CONSTRAINT [DF_tblPitCrsT_fcurTotApplied1]  DEFAULT ((0)) FOR [fcurTotApplied1]
GO
/****** Object:  Default [DF_tblPitCrsT_fcurTotRefund1]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCrsT] ADD  CONSTRAINT [DF_tblPitCrsT_fcurTotRefund1]  DEFAULT ((0)) FOR [fcurTotRefund1]
GO
/****** Object:  Default [DF_tblPitCrsT_fcurTotApplied2]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCrsT] ADD  CONSTRAINT [DF_tblPitCrsT_fcurTotApplied2]  DEFAULT ((0)) FOR [fcurTotApplied2]
GO
/****** Object:  Default [DF_tblPitCrsT_fcurTotRefund2]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCrsT] ADD  CONSTRAINT [DF_tblPitCrsT_fcurTotRefund2]  DEFAULT ((0)) FOR [fcurTotRefund2]
GO
/****** Object:  Default [DF_tblPitCrsT_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCrsT] ADD  CONSTRAINT [DF_tblPitCrsT_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblPitCrsT_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitCrsT] ADD  CONSTRAINT [DF_tblPitCrsT_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblPitD_fcurDOverPayment]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitD] ADD  CONSTRAINT [DF_tblPitD_fcurDOverPayment]  DEFAULT ((0)) FOR [fcurDOverPayment]
GO
/****** Object:  Default [DF_tblPitD_fcurDWildLife]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitD] ADD  CONSTRAINT [DF_tblPitD_fcurDWildLife]  DEFAULT ((0)) FOR [fcurDWildLife]
GO
/****** Object:  Default [DF_tblPitD_fcurDVetCemetery]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitD] ADD  CONSTRAINT [DF_tblPitD_fcurDVetCemetery]  DEFAULT ((0)) FOR [fcurDVetCemetery]
GO
/****** Object:  Default [DF_tblPitD_fcurDNMAbuseEd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitD] ADD  CONSTRAINT [DF_tblPitD_fcurDNMAbuseEd]  DEFAULT ((0)) FOR [fcurDNMAbuseEd]
GO
/****** Object:  Default [DF_tblPitD_fcurDNMForest]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitD] ADD  CONSTRAINT [DF_tblPitD_fcurDNMForest]  DEFAULT ((0)) FOR [fcurDNMForest]
GO
/****** Object:  Default [DF_tblPitD_fcurDGuardMember]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitD] ADD  CONSTRAINT [DF_tblPitD_fcurDGuardMember]  DEFAULT ((0)) FOR [fcurDGuardMember]
GO
/****** Object:  Default [DF_tblPitD_fcurDKidParks]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitD] ADD  CONSTRAINT [DF_tblPitD_fcurDKidParks]  DEFAULT ((0)) FOR [fcurDKidParks]
GO
/****** Object:  Default [DF_tblPitD_fcurDAmyotrophic]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitD] ADD  CONSTRAINT [DF_tblPitD_fcurDAmyotrophic]  DEFAULT ((0)) FOR [fcurDAmyotrophic]
GO
/****** Object:  Default [DF_tblPitD_fcurDVietnam]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitD] ADD  CONSTRAINT [DF_tblPitD_fcurDVietnam]  DEFAULT ((0)) FOR [fcurDVietnam]
GO
/****** Object:  Default [DF_tblPitD_fintDPParty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitD] ADD  CONSTRAINT [DF_tblPitD_fintDPParty]  DEFAULT ((0)) FOR [fintDPParty]
GO
/****** Object:  Default [DF_tblPitD_fintDSpParty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitD] ADD  CONSTRAINT [DF_tblPitD_fintDSpParty]  DEFAULT ((0)) FOR [fintDSpParty]
GO
/****** Object:  Default [DF_tblPitD_fcurDPartyAmt]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitD] ADD  CONSTRAINT [DF_tblPitD_fcurDPartyAmt]  DEFAULT ((0)) FOR [fcurDPartyAmt]
GO
/****** Object:  Default [DF_tblPitD_fcurDVetFund]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitD] ADD  CONSTRAINT [DF_tblPitD_fcurDVetFund]  DEFAULT ((0)) FOR [fcurDVetFund]
GO
/****** Object:  Default [DF_tblPitD_fcurDLottery]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitD] ADD  CONSTRAINT [DF_tblPitD_fcurDLottery]  DEFAULT ((0)) FOR [fcurDLottery]
GO
/****** Object:  Default [DF_tblPitD_fcurDHorse]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitD] ADD  CONSTRAINT [DF_tblPitD_fcurDHorse]  DEFAULT ((0)) FOR [fcurDHorse]
GO
/****** Object:  Default [DF_tblPitD_fcurDTotalContrib]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitD] ADD  CONSTRAINT [DF_tblPitD_fcurDTotalContrib]  DEFAULT ((0)) FOR [fcurDTotalContrib]
GO
/****** Object:  Default [DF_tblPitD_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitD] ADD  CONSTRAINT [DF_tblPitD_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblPitD_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitD] ADD  CONSTRAINT [DF_tblPitD_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblPitRC_fblnRCPResident]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fblnRCPResident]  DEFAULT ((0)) FOR [fblnRCPResident]
GO
/****** Object:  Default [DF_tblPitRC_fblnRCSpResident]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fblnRCSpResident]  DEFAULT ((0)) FOR [fblnRCSpResident]
GO
/****** Object:  Default [DF_tblPitRC_fblnRCPPhyPresent]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fblnRCPPhyPresent]  DEFAULT ((0)) FOR [fblnRCPPhyPresent]
GO
/****** Object:  Default [DF_tblPitRC_fblnRCSpPhyPresent]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fblnRCSpPhyPresent]  DEFAULT ((0)) FOR [fblnRCSpPhyPresent]
GO
/****** Object:  Default [DF_tblPitRC_fblnRCPOthClaim]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fblnRCPOthClaim]  DEFAULT ((0)) FOR [fblnRCPOthClaim]
GO
/****** Object:  Default [DF_tblPitRC_fblnRCSpOthClaim]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fblnRCSpOthClaim]  DEFAULT ((0)) FOR [fblnRCSpOthClaim]
GO
/****** Object:  Default [DF_tblPitRC_fblnRCPInmate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fblnRCPInmate]  DEFAULT ((0)) FOR [fblnRCPInmate]
GO
/****** Object:  Default [DF_tblPitRC_fblnRCSpInmate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fblnRCSpInmate]  DEFAULT ((0)) FOR [fblnRCSpInmate]
GO
/****** Object:  Default [DF_tblPitRC_fintRCExemptions]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fintRCExemptions]  DEFAULT ((0)) FOR [fintRCExemptions]
GO
/****** Object:  Default [DF_tblPitRC_fintRCNotQualify]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fintRCNotQualify]  DEFAULT ((0)) FOR [fintRCNotQualify]
GO
/****** Object:  Default [DF_tblPitRC_fintRCAllowable]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fintRCAllowable]  DEFAULT ((0)) FOR [fintRCAllowable]
GO
/****** Object:  Default [DF_tblPitRC_fintRCExtraExempt]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fintRCExtraExempt]  DEFAULT ((0)) FOR [fintRCExtraExempt]
GO
/****** Object:  Default [DF_tblPitRC_fintRCTotalExempt]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fintRCTotalExempt]  DEFAULT ((0)) FOR [fintRCTotalExempt]
GO
/****** Object:  Default [DF_tblPitRC_fintRCPExempt65]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fintRCPExempt65]  DEFAULT ((0)) FOR [fintRCPExempt65]
GO
/****** Object:  Default [DF_tblPitRC_fintRCSpExempt65]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fintRCSpExempt65]  DEFAULT ((0)) FOR [fintRCSpExempt65]
GO
/****** Object:  Default [DF_tblPitRC_fintRCSubtotal]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fintRCSubtotal]  DEFAULT ((0)) FOR [fintRCSubtotal]
GO
/****** Object:  Default [DF_tblPitRC_fintRCMFSExempts]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fintRCMFSExempts]  DEFAULT ((0)) FOR [fintRCMFSExempts]
GO
/****** Object:  Default [DF_tblPitRC_fintRCTotExempts]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fintRCTotExempts]  DEFAULT ((0)) FOR [fintRCTotExempts]
GO
/****** Object:  Default [DF_tblPitRC_fcurRCWages]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fcurRCWages]  DEFAULT ((0)) FOR [fcurRCWages]
GO
/****** Object:  Default [DF_tblPitRC_fcurRCSSBenefits]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fcurRCSSBenefits]  DEFAULT ((0)) FOR [fcurRCSSBenefits]
GO
/****** Object:  Default [DF_tblPitRC_fcurRCUnemploy]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fcurRCUnemploy]  DEFAULT ((0)) FOR [fcurRCUnemploy]
GO
/****** Object:  Default [DF_tblPitRC_fcurRCPublicAssist]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fcurRCPublicAssist]  DEFAULT ((0)) FOR [fcurRCPublicAssist]
GO
/****** Object:  Default [DF_tblPitRC_fcurRCNetProfit]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fcurRCNetProfit]  DEFAULT ((0)) FOR [fcurRCNetProfit]
GO
/****** Object:  Default [DF_tblPitRC_fcurRCCapitalGains]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fcurRCCapitalGains]  DEFAULT ((0)) FOR [fcurRCCapitalGains]
GO
/****** Object:  Default [DF_tblPitRC_fcurRCGiftsofCash]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fcurRCGiftsofCash]  DEFAULT ((0)) FOR [fcurRCGiftsofCash]
GO
/****** Object:  Default [DF_tblPitRC_fcurRCOtherIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fcurRCOtherIncome]  DEFAULT ((0)) FOR [fcurRCOtherIncome]
GO
/****** Object:  Default [DF_tblPitRC_fcurRCModifiedGross]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fcurRCModifiedGross]  DEFAULT ((0)) FOR [fcurRCModifiedGross]
GO
/****** Object:  Default [DF_tblPitRC_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblPitRC_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC] ADD  CONSTRAINT [DF_tblPitRC_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblPitRC2_fcurRC2ModGross]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC2] ADD  CONSTRAINT [DF_tblPitRC2_fcurRC2ModGross]  DEFAULT ((0)) FOR [fcurRC2ModGross]
GO
/****** Object:  Default [DF_tblPitRC2_fcurRC2TotExemp]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC2] ADD  CONSTRAINT [DF_tblPitRC2_fcurRC2TotExemp]  DEFAULT ((0)) FOR [fcurRC2TotExemp]
GO
/****** Object:  Default [DF_tblPitRC2_fcurRC2LowRebate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC2] ADD  CONSTRAINT [DF_tblPitRC2_fcurRC2LowRebate]  DEFAULT ((0)) FOR [fcurRC2LowRebate]
GO
/****** Object:  Default [DF_tblPitRC2_fcurRC2PropOwn65]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC2] ADD  CONSTRAINT [DF_tblPitRC2_fcurRC2PropOwn65]  DEFAULT ((0)) FOR [fcurRC2PropOwn65]
GO
/****** Object:  Default [DF_tblPitRC2_fcurRC2Rent65]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC2] ADD  CONSTRAINT [DF_tblPitRC2_fcurRC2Rent65]  DEFAULT ((0)) FOR [fcurRC2Rent65]
GO
/****** Object:  Default [DF_tblPitRC2_fblnRC2RentGov65]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC2] ADD  CONSTRAINT [DF_tblPitRC2_fblnRC2RentGov65]  DEFAULT ((0)) FOR [fblnRC2RentGov65]
GO
/****** Object:  Default [DF_tblPitRC2_fcurRC2Multiply65]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC2] ADD  CONSTRAINT [DF_tblPitRC2_fcurRC2Multiply65]  DEFAULT ((0)) FOR [fcurRC2Multiply65]
GO
/****** Object:  Default [DF_tblPitRC2_fcurRC2Add65]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC2] ADD  CONSTRAINT [DF_tblPitRC2_fcurRC2Add65]  DEFAULT ((0)) FOR [fcurRC2Add65]
GO
/****** Object:  Default [DF_tblPitRC2_fcurRC2Find65]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC2] ADD  CONSTRAINT [DF_tblPitRC2_fcurRC2Find65]  DEFAULT ((0)) FOR [fcurRC2Find65]
GO
/****** Object:  Default [DF_tblPitRC2_fcurRC2Rebate65]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC2] ADD  CONSTRAINT [DF_tblPitRC2_fcurRC2Rebate65]  DEFAULT ((0)) FOR [fcurRC2Rebate65]
GO
/****** Object:  Default [DF_tblPitRC2_fblnRC2LACounty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC2] ADD  CONSTRAINT [DF_tblPitRC2_fblnRC2LACounty]  DEFAULT ((0)) FOR [fblnRC2LACounty]
GO
/****** Object:  Default [DF_tblPitRC2_fblnRC2SFCounty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC2] ADD  CONSTRAINT [DF_tblPitRC2_fblnRC2SFCounty]  DEFAULT ((0)) FOR [fblnRC2SFCounty]
GO
/****** Object:  Default [DF_tblPitRC2_fcurRC2PrpOwnLow]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC2] ADD  CONSTRAINT [DF_tblPitRC2_fcurRC2PrpOwnLow]  DEFAULT ((0)) FOR [fcurRC2PrpOwnLow]
GO
/****** Object:  Default [DF_tblPitRC2_fcurRC2FindLow]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC2] ADD  CONSTRAINT [DF_tblPitRC2_fcurRC2FindLow]  DEFAULT ((0)) FOR [fcurRC2FindLow]
GO
/****** Object:  Default [DF_tblPitRC2_fcurRC2RebateLow]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC2] ADD  CONSTRAINT [DF_tblPitRC2_fcurRC2RebateLow]  DEFAULT ((0)) FOR [fcurRC2RebateLow]
GO
/****** Object:  Default [DF_tblPitRC2_fcurRC2TotalColG]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC2] ADD  CONSTRAINT [DF_tblPitRC2_fcurRC2TotalColG]  DEFAULT ((0)) FOR [fcurRC2TotalColG]
GO
/****** Object:  Default [DF_tblPitRC2_fintRC2QualifyDep]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC2] ADD  CONSTRAINT [DF_tblPitRC2_fintRC2QualifyDep]  DEFAULT ((0)) FOR [fintRC2QualifyDep]
GO
/****** Object:  Default [DF_tblPitRC2_fcurRC2FedChildCare]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC2] ADD  CONSTRAINT [DF_tblPitRC2_fcurRC2FedChildCare]  DEFAULT ((0)) FOR [fcurRC2FedChildCare]
GO
/****** Object:  Default [DF_tblPitRC2_fcurRC2NMChildCare]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC2] ADD  CONSTRAINT [DF_tblPitRC2_fcurRC2NMChildCare]  DEFAULT ((0)) FOR [fcurRC2NMChildCare]
GO
/****** Object:  Default [DF_tblPitRC2_fcurRC2MedicalCare65]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC2] ADD  CONSTRAINT [DF_tblPitRC2_fcurRC2MedicalCare65]  DEFAULT ((0)) FOR [fcurRC2MedicalCare65]
GO
/****** Object:  Default [DF_tblPitRC2_fcurRC2AdoptionChild]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC2] ADD  CONSTRAINT [DF_tblPitRC2_fcurRC2AdoptionChild]  DEFAULT ((0)) FOR [fcurRC2AdoptionChild]
GO
/****** Object:  Default [DF_tblPitRC2_fcurRC2RenewEnergy]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC2] ADD  CONSTRAINT [DF_tblPitRC2_fcurRC2RenewEnergy]  DEFAULT ((0)) FOR [fcurRC2RenewEnergy]
GO
/****** Object:  Default [DF_tblPitRC2_fcurRC2FilmProd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC2] ADD  CONSTRAINT [DF_tblPitRC2_fcurRC2FilmProd]  DEFAULT ((0)) FOR [fcurRC2FilmProd]
GO
/****** Object:  Default [DF_tblPitRC2_fcurRC2TotalClaimed]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC2] ADD  CONSTRAINT [DF_tblPitRC2_fcurRC2TotalClaimed]  DEFAULT ((0)) FOR [fcurRC2TotalClaimed]
GO
/****** Object:  Default [DF_tblPitRC2_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC2] ADD  CONSTRAINT [DF_tblPitRC2_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblPitRC2_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitRC2] ADD  CONSTRAINT [DF_tblPitRC2_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblPitS_flngRepNum]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitS] ADD  CONSTRAINT [DF_tblPitS_flngRepNum]  DEFAULT ((0)) FOR [flngRepNum]
GO
/****** Object:  Default [DF_tblPitS_fstrSDepName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitS] ADD  CONSTRAINT [DF_tblPitS_fstrSDepName]  DEFAULT (' ') FOR [fstrSDepName]
GO
/****** Object:  Default [DF_tblPitS_fstrSDepSSN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitS] ADD  CONSTRAINT [DF_tblPitS_fstrSDepSSN]  DEFAULT (' ') FOR [fstrSDepSSN]
GO
/****** Object:  Default [DF_tblPitS_fdtmSDepDOB]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitS] ADD  CONSTRAINT [DF_tblPitS_fdtmSDepDOB]  DEFAULT ('12/31/9999') FOR [fdtmSDepDOB]
GO
/****** Object:  Default [DF_tblPitS_fblnFilled]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitS] ADD  CONSTRAINT [DF_tblPitS_fblnFilled]  DEFAULT ((0)) FOR [fblnFilled]
GO
/****** Object:  Default [DF_tblPitS_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitS] ADD  CONSTRAINT [DF_tblPitS_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblPitS_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitS] ADD  CONSTRAINT [DF_tblPitS_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF__tblPitS__fstrTax__7EA369F8]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPitS] ADD  DEFAULT ('') FOR [fstrTaxForm]
GO
/****** Object:  Default [DF_tblPtd_fstrFein]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fstrFein]  DEFAULT (' ') FOR [fstrFein]
GO
/****** Object:  Default [DF_tblPtd_fcurNMNetIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fcurNMNetIncome]  DEFAULT ((0)) FOR [fcurNMNetIncome]
GO
/****** Object:  Default [DF_tblPtd_fblnAmend]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fblnAmend]  DEFAULT ((0)) FOR [fblnAmend]
GO
/****** Object:  Default [DF_tblPtd_fdtmPostMarkDate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fdtmPostMarkDate]  DEFAULT ('12/31/9999') FOR [fdtmPostMarkDate]
GO
/****** Object:  Default [DF_tblPtd_fstrName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fstrName]  DEFAULT (' ') FOR [fstrName]
GO
/****** Object:  Default [DF_tblPtd_fstrAddress]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fstrAddress]  DEFAULT (' ') FOR [fstrStreet]
GO
/****** Object:  Default [DF_tblPtd_fstrCity]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fstrCity]  DEFAULT (' ') FOR [fstrCity]
GO
/****** Object:  Default [DF_tblPtd_fstrState]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fstrState]  DEFAULT (' ') FOR [fstrState]
GO
/****** Object:  Default [DF_tblPtd_fstrCountry]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fstrCountry]  DEFAULT ('USA') FOR [fstrCountry]
GO
/****** Object:  Default [DF_tblPtd_fstrZipCode]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fstrZipCode]  DEFAULT (' ') FOR [fstrZipCode]
GO
/****** Object:  Default [DF_Table_1_fblnPTE]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_Table_1_fblnPTE]  DEFAULT ((0)) FOR [fblnPte]
GO
/****** Object:  Default [DF_tblPtd_fblnScorp]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fblnScorp]  DEFAULT ((0)) FOR [fblnScorp]
GO
/****** Object:  Default [DF_tblPtd_fblnCit]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fblnCit]  DEFAULT ((0)) FOR [fblnCit]
GO
/****** Object:  Default [DF_tblPtd_fblnFid]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fblnFid]  DEFAULT ((0)) FOR [fblnFid]
GO
/****** Object:  Default [DF_tblPtd_fblnOth]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fblnOth]  DEFAULT ((0)) FOR [fblnOth]
GO
/****** Object:  Default [DF_tblPtd_fstrOthWhy]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fstrOthWhy]  DEFAULT (' ') FOR [fstrOthWhy]
GO
/****** Object:  Default [DF_tblPtd_fdtmTaxBeg]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fdtmTaxBeg]  DEFAULT ('12/31/9999') FOR [fdtmTaxYrBeg]
GO
/****** Object:  Default [DF_tblPtd_fdtmTaxEnd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fdtmTaxEnd]  DEFAULT ('12/31/9999') FOR [fdtmTaxYrEnd]
GO
/****** Object:  Default [DF_tblPtd_fdtmDue]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fdtmDue]  DEFAULT ('12/31/9999') FOR [fdtmTaxDue]
GO
/****** Object:  Default [DF_tblPtd_fdtmExtend]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fdtmExtend]  DEFAULT ('12/31/9999') FOR [fdtmExtDue]
GO
/****** Object:  Default [DF_tblPtd_fcurWthPage]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fcurWthPage]  DEFAULT ((0)) FOR [fcurWthPage]
GO
/****** Object:  Default [DF_tblPtd_fcurWthAll]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fcurWthAll]  DEFAULT ((0)) FOR [fcurWthAll]
GO
/****** Object:  Default [DF_tblPtd_fcurWthOwn]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fcurWthOwn]  DEFAULT ((0)) FOR [fcurWthOwn]
GO
/****** Object:  Default [DF_tblPtd_fcurWthPte]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fcurWthPte]  DEFAULT ((0)) FOR [fcurWthPte]
GO
/****** Object:  Default [DF_tblPtd_fcurSubTotal]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fcurSubTotal]  DEFAULT ((0)) FOR [fcurSubTotal]
GO
/****** Object:  Default [DF_tblPtd_fcurPenalty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fcurPenalty]  DEFAULT ((0)) FOR [fcurPenalty]
GO
/****** Object:  Default [DF_tblPtd_fcurInterest]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fcurInterest]  DEFAULT ((0)) FOR [fcurInterest]
GO
/****** Object:  Default [DF_tblPtd_fcurTotalDue]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fcurTotalDue]  DEFAULT ((0)) FOR [fcurTotalDue]
GO
/****** Object:  Default [DF_tblPtd_fdtmSign]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fdtmSign]  DEFAULT ('12/31/9999') FOR [fdtmSigned]
GO
/****** Object:  Default [DF_tblPtd_fstrPhone]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fstrPhone]  DEFAULT (' ') FOR [fstrPhone]
GO
/****** Object:  Default [DF_tblPtd_fstrEmail]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fstrEmail]  DEFAULT (' ') FOR [fstrEmail]
GO
/****** Object:  Default [DF_tblPtd_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblPtd_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtd] ADD  CONSTRAINT [DF_tblPtd_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblPtdS_flngRepNum]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtdS] ADD  CONSTRAINT [DF_tblPtdS_flngRepNum]  DEFAULT ((0)) FOR [flngRepNum]
GO
/****** Object:  Default [DF_tblPtdS_fstrId]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtdS] ADD  CONSTRAINT [DF_tblPtdS_fstrId]  DEFAULT (' ') FOR [fstrId]
GO
/****** Object:  Default [DF_tblPtdS_fblnFein]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtdS] ADD  CONSTRAINT [DF_tblPtdS_fblnFein]  DEFAULT ((0)) FOR [fblnFein]
GO
/****** Object:  Default [DF_tblPtdS_fblnSsn]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtdS] ADD  CONSTRAINT [DF_tblPtdS_fblnSsn]  DEFAULT ((0)) FOR [fblnSsn]
GO
/****** Object:  Default [DF_tblPtdS_fstrName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtdS] ADD  CONSTRAINT [DF_tblPtdS_fstrName]  DEFAULT (' ') FOR [fstrName]
GO
/****** Object:  Default [DF_tblPtdS_fstrAddr]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtdS] ADD  CONSTRAINT [DF_tblPtdS_fstrAddr]  DEFAULT (' ') FOR [fstrStreet]
GO
/****** Object:  Default [DF_tblPtdS_fstrCity]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtdS] ADD  CONSTRAINT [DF_tblPtdS_fstrCity]  DEFAULT (' ') FOR [fstrCity]
GO
/****** Object:  Default [DF_tblPtdS_fstrState]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtdS] ADD  CONSTRAINT [DF_tblPtdS_fstrState]  DEFAULT (' ') FOR [fstrState]
GO
/****** Object:  Default [DF_tblPtdS_fstrCountry]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtdS] ADD  CONSTRAINT [DF_tblPtdS_fstrCountry]  DEFAULT ('USA') FOR [fstrCountry]
GO
/****** Object:  Default [DF_tblPtdS_fstrZipCode]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtdS] ADD  CONSTRAINT [DF_tblPtdS_fstrZipCode]  DEFAULT (' ') FOR [fstrZipCode]
GO
/****** Object:  Default [DF_tblPtdS_fblnOutSide]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtdS] ADD  CONSTRAINT [DF_tblPtdS_fblnOutSide]  DEFAULT ((0)) FOR [fblnOutSide]
GO
/****** Object:  Default [DF_tblPtdS_fcurOwnNet]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtdS] ADD  CONSTRAINT [DF_tblPtdS_fcurOwnNet]  DEFAULT ((0)) FOR [fcurOwnNet]
GO
/****** Object:  Default [DF_tblPtdS_fcurOwnWth]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtdS] ADD  CONSTRAINT [DF_tblPtdS_fcurOwnWth]  DEFAULT ((0)) FOR [fcurOwnWth]
GO
/****** Object:  Default [DF_tblPtdS_fbln41353]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtdS] ADD  CONSTRAINT [DF_tblPtdS_fbln41353]  DEFAULT ((0)) FOR [fbln41353]
GO
/****** Object:  Default [DF_tblPtdS_fblnFilled]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtdS] ADD  CONSTRAINT [DF_tblPtdS_fblnFilled]  DEFAULT ((0)) FOR [fblnFilled]
GO
/****** Object:  Default [DF_tblPtdS_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtdS] ADD  CONSTRAINT [DF_tblPtdS_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblPtdS_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtdS] ADD  CONSTRAINT [DF_tblPtdS_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblPtdS_fstrMPDLN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtdS] ADD  CONSTRAINT [DF_tblPtdS_fstrMPDLN]  DEFAULT (' ') FOR [fstrMPDLN]
GO
/****** Object:  Default [DF_tblPtdS_fstrTaxForm]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtdS] ADD  CONSTRAINT [DF_tblPtdS_fstrTaxForm]  DEFAULT ('') FOR [fstrTaxForm]
GO
/****** Object:  Default [DF_tblPtdS_fstrSource]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtdS] ADD  CONSTRAINT [DF_tblPtdS_fstrSource]  DEFAULT ('GENKFI') FOR [fstrSource]
GO
/****** Object:  Default [DF_tblPtdS_fblnFound]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtdS] ADD  CONSTRAINT [DF_tblPtdS_fblnFound]  DEFAULT ((0)) FOR [fblnFound]
GO
/****** Object:  Default [DF_tblPte_fstrFEIN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fstrFEIN]  DEFAULT (' ') FOR [fstrFEIN]
GO
/****** Object:  Default [DF_tblPte_fstrCRSId]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fstrCRSId]  DEFAULT (' ') FOR [fstrCRSId]
GO
/****** Object:  Default [DF_tblPte_fstrName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fstrName]  DEFAULT (' ') FOR [fstrName]
GO
/****** Object:  Default [DF_tblPte_fstrStreet]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fstrStreet]  DEFAULT (' ') FOR [fstrStreet]
GO
/****** Object:  Default [DF_tblPte_fstrCity]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fstrCity]  DEFAULT (' ') FOR [fstrCity]
GO
/****** Object:  Default [DF_tblPte_fstrState]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fstrState]  DEFAULT (' ') FOR [fstrState]
GO
/****** Object:  Default [DF_tblPte_fstrCountry]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fstrCountry]  DEFAULT ('USA') FOR [fstrCountry]
GO
/****** Object:  Default [DF_tblPte_fstrZipCode]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fstrZipCode]  DEFAULT (' ') FOR [fstrZipCode]
GO
/****** Object:  Default [DF_tblPte_fstrTaxYrBeg]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fstrTaxYrBeg]  DEFAULT ('12/31/9999') FOR [fdtmTaxYrBeg]
GO
/****** Object:  Default [DF_tblPte_fstrTaxYrEnd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fstrTaxYrEnd]  DEFAULT ('12/31/9999') FOR [fdtmTaxYrEnd]
GO
/****** Object:  Default [DF_tblPte_fdtmExtDue]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fdtmExtDue]  DEFAULT ('12/31/9999') FOR [fdtmExtDue]
GO
/****** Object:  Default [DF_tblPte_fdtmPostMark]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fdtmPostMark]  DEFAULT ('12/31/9999') FOR [fdtmPostMarkDate]
GO
/****** Object:  Default [DF_tblPte_fblnAmended]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fblnAmended]  DEFAULT ((0)) FOR [fblnAmended]
GO
/****** Object:  Default [DF_tblPte_fstrNAICSCode]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fstrNAICSCode]  DEFAULT (' ') FOR [fstrNAICSCode]
GO
/****** Object:  Default [DF_tblPte_fstrStateOrg]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fstrStateOrg]  DEFAULT (' ') FOR [fstrStateOrg]
GO
/****** Object:  Default [DF_tblPte_fdtmDateOrg]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fdtmDateOrg]  DEFAULT ('12/31/9999') FOR [fdtmDateOrg]
GO
/****** Object:  Default [DF_tblPte_fdtmDateBeg]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fdtmDateBeg]  DEFAULT ('12/31/9999') FOR [fdtmDateBeg]
GO
/****** Object:  Default [DF_tblPte_fdtmFinalReturn]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fdtmFinalReturn]  DEFAULT ('12/31/9999') FOR [fdtmFinalReturn]
GO
/****** Object:  Default [DF_tblPte_fcurTaxWithheldOGP]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fcurTaxWithheldOGP]  DEFAULT ((0)) FOR [fcurTaxWithheldOGP]
GO
/****** Object:  Default [DF_tblPte_fcurWithPteNetInc]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fcurWithPteNetInc]  DEFAULT ((0)) FOR [fcurWithPteNetInc]
GO
/****** Object:  Default [DF_tblPte_fcurRefundOverpmt]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fcurRefundOverpmt]  DEFAULT ((0)) FOR [fcurRefundOverpmt]
GO
/****** Object:  Default [DF_tblPte_fcurNMWithPass]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fcurNMWithPass]  DEFAULT ((0)) FOR [fcurNMWithPass]
GO
/****** Object:  Default [DF_tblPte_fcurWithPdPteOwNet]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fcurWithPdPteOwNet]  DEFAULT ((0)) FOR [fcurWithPdPteOwNet]
GO
/****** Object:  Default [DF_tblPte_fcurOrdinaryIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fcurOrdinaryIncome]  DEFAULT ((0)) FOR [fcurOrdinaryIncome]
GO
/****** Object:  Default [DF_tblPte_fcurOtherIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fcurOtherIncome]  DEFAULT ((0)) FOR [fcurOtherIncome]
GO
/****** Object:  Default [DF_tblPte_fcurIntMuniBond]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fcurIntMuniBond]  DEFAULT ((0)) FOR [fcurIntMuniBond]
GO
/****** Object:  Default [DF_tblPte_fcurSubTotal]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fcurSubTotal]  DEFAULT ((0)) FOR [fcurSubTotal]
GO
/****** Object:  Default [DF_tblPte_fcurIntFedBond]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fcurIntFedBond]  DEFAULT ((0)) FOR [fcurIntFedBond]
GO
/****** Object:  Default [DF_tblPte_fcurAllowDeduct]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fcurAllowDeduct]  DEFAULT ((0)) FOR [fcurAllowDeduct]
GO
/****** Object:  Default [DF_tblPte_fcurAllocatedIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fcurAllocatedIncome]  DEFAULT ((0)) FOR [fcurAllocatedIncome]
GO
/****** Object:  Default [DF_tblPte_fcurAppIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fcurAppIncome]  DEFAULT ((0)) FOR [fcurAppIncome]
GO
/****** Object:  Default [DF_tblPte_fcurNMPercent]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fcurNMPercent]  DEFAULT ((100)) FOR [fcurNMPercent]
GO
/****** Object:  Default [DF_tblPte_fcurNMAppIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fcurNMAppIncome]  DEFAULT ((0)) FOR [fcurNMAppIncome]
GO
/****** Object:  Default [DF_tblPte_fcurNMAllocatedInc]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fcurNMAllocatedInc]  DEFAULT ((0)) FOR [fcurNMAllocatedInc]
GO
/****** Object:  Default [DF_tblPte_fcurNMNetIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fcurNMNetIncome]  DEFAULT ((0)) FOR [fcurNMNetIncome]
GO
/****** Object:  Default [DF_tblPte_fcurFlmPrd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fcurFlmPrd]  DEFAULT ((0)) FOR [fcurFlmPrd]
GO
/****** Object:  Default [DF_tblPte_fstrPhoneNo]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fstrPhoneNo]  DEFAULT (' ') FOR [fstrPhoneNo]
GO
/****** Object:  Default [DF_tblPte_fstrTPEmailAdd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fstrTPEmailAdd]  DEFAULT (' ') FOR [fstrTPEmailAdd]
GO
/****** Object:  Default [DF_tblPte_fstrPrepCRSID]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fstrPrepCRSID]  DEFAULT (' ') FOR [fstrPrepCRSID]
GO
/****** Object:  Default [DF_tblPte_fstrPrepFEIN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fstrPrepFEIN]  DEFAULT (' ') FOR [fstrPrepFEIN]
GO
/****** Object:  Default [DF_tblPte_fstrPrepSSNPTIN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fstrPrepSSNPTIN]  DEFAULT (' ') FOR [fstrPrepSSNPTIN]
GO
/****** Object:  Default [DF_tblPte_fstrPrepPhoneNum]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fstrPrepPhoneNum]  DEFAULT (' ') FOR [fstrPrepPhoneNum]
GO
/****** Object:  Default [DF_tblPte_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblPte_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPte] ADD  CONSTRAINT [DF_tblPte_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblPteA_fcurAInventory]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteA] ADD  CONSTRAINT [DF_tblPteA_fcurAInventory]  DEFAULT ((0)) FOR [fcurAInventory]
GO
/****** Object:  Default [DF_tblPteA_fcurANMInventory]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteA] ADD  CONSTRAINT [DF_tblPteA_fcurANMInventory]  DEFAULT ((0)) FOR [fcurANMInventory]
GO
/****** Object:  Default [DF_tblPteA_fcurARealProperty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteA] ADD  CONSTRAINT [DF_tblPteA_fcurARealProperty]  DEFAULT ((0)) FOR [fcurARealProperty]
GO
/****** Object:  Default [DF_tblPteA_fcurANMRealProperty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteA] ADD  CONSTRAINT [DF_tblPteA_fcurANMRealProperty]  DEFAULT ((0)) FOR [fcurANMRealProperty]
GO
/****** Object:  Default [DF_tblPteA_fcurAPerProperty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteA] ADD  CONSTRAINT [DF_tblPteA_fcurAPerProperty]  DEFAULT ((0)) FOR [fcurAPerProperty]
GO
/****** Object:  Default [DF_tblPteA_fcurANMPerProperty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteA] ADD  CONSTRAINT [DF_tblPteA_fcurANMPerProperty]  DEFAULT ((0)) FOR [fcurANMPerProperty]
GO
/****** Object:  Default [DF_tblPteA_fcurARentProperty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteA] ADD  CONSTRAINT [DF_tblPteA_fcurARentProperty]  DEFAULT ((0)) FOR [fcurARentProperty]
GO
/****** Object:  Default [DF_tblPteA_fcurANMRentProperty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteA] ADD  CONSTRAINT [DF_tblPteA_fcurANMRentProperty]  DEFAULT ((0)) FOR [fcurANMRentProperty]
GO
/****** Object:  Default [DF_tblPteA_fcurATotalProperty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteA] ADD  CONSTRAINT [DF_tblPteA_fcurATotalProperty]  DEFAULT ((0)) FOR [fcurATotalProperty]
GO
/****** Object:  Default [DF_tblPteA_fcurANMTotalProperty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteA] ADD  CONSTRAINT [DF_tblPteA_fcurANMTotalProperty]  DEFAULT ((0)) FOR [fcurANMTotalProperty]
GO
/****** Object:  Default [DF_tblPteA_fcurAPropertyFactor]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteA] ADD  CONSTRAINT [DF_tblPteA_fcurAPropertyFactor]  DEFAULT ((0)) FOR [fcurAPropertyFactor]
GO
/****** Object:  Default [DF_tblPteA_fcurATotalPayRoll]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteA] ADD  CONSTRAINT [DF_tblPteA_fcurATotalPayRoll]  DEFAULT ((0)) FOR [fcurATotalPayRoll]
GO
/****** Object:  Default [DF_tblPteA_fcurANMPayRoll]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteA] ADD  CONSTRAINT [DF_tblPteA_fcurANMPayRoll]  DEFAULT ((0)) FOR [fcurANMPayRoll]
GO
/****** Object:  Default [DF_tblPteA_fcurAPayRollFactor]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteA] ADD  CONSTRAINT [DF_tblPteA_fcurAPayRollFactor]  DEFAULT ((0)) FOR [fcurAPayRollFactor]
GO
/****** Object:  Default [DF_tblPteA_fcurASales]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteA] ADD  CONSTRAINT [DF_tblPteA_fcurASales]  DEFAULT ((0)) FOR [fcurASales]
GO
/****** Object:  Default [DF_tblPteA_fcurANMSales]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteA] ADD  CONSTRAINT [DF_tblPteA_fcurANMSales]  DEFAULT ((0)) FOR [fcurANMSales]
GO
/****** Object:  Default [DF_tblPteA_fcurASalesFactor]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteA] ADD  CONSTRAINT [DF_tblPteA_fcurASalesFactor]  DEFAULT ((0)) FOR [fcurASalesFactor]
GO
/****** Object:  Default [DF_tblPteA_fcurATotalFactors]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteA] ADD  CONSTRAINT [DF_tblPteA_fcurATotalFactors]  DEFAULT ((0)) FOR [fcurATotalFactors]
GO
/****** Object:  Default [DF_tblPteA_fdtmATaxYearEnd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteA] ADD  CONSTRAINT [DF_tblPteA_fdtmATaxYearEnd]  DEFAULT ('12/31/9999') FOR [fdtmATaxYearEnd]
GO
/****** Object:  Default [DF_tblPteA_fdtmAManufacture]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteA] ADD  CONSTRAINT [DF_tblPteA_fdtmAManufacture]  DEFAULT ('12/31/9999') FOR [fdtmAManufacture]
GO
/****** Object:  Default [DF_tblPteA_fcurAAvgFactor]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteA] ADD  CONSTRAINT [DF_tblPteA_fcurAAvgFactor]  DEFAULT ((0)) FOR [fcurAAvgFactor]
GO
/****** Object:  Default [DF_tblPteA_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteA] ADD  CONSTRAINT [DF_tblPteA_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblPteA_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteA] ADD  CONSTRAINT [DF_tblPteA_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblPteB_fcurBDividends]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteB] ADD  CONSTRAINT [DF_tblPteB_fcurBDividends]  DEFAULT ((0)) FOR [fcurBDividends]
GO
/****** Object:  Default [DF_tblPteB_fcurBNMDividends]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteB] ADD  CONSTRAINT [DF_tblPteB_fcurBNMDividends]  DEFAULT ((0)) FOR [fcurBNMDividends]
GO
/****** Object:  Default [DF_tblPteB_fcurBInterest]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteB] ADD  CONSTRAINT [DF_tblPteB_fcurBInterest]  DEFAULT ((0)) FOR [fcurBInterest]
GO
/****** Object:  Default [DF_tblPteB_fcurBNMInterest]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteB] ADD  CONSTRAINT [DF_tblPteB_fcurBNMInterest]  DEFAULT ((0)) FOR [fcurBNMInterest]
GO
/****** Object:  Default [DF_tblPteB_fcurBRents]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteB] ADD  CONSTRAINT [DF_tblPteB_fcurBRents]  DEFAULT ((0)) FOR [fcurBRents]
GO
/****** Object:  Default [DF_tblPteB_fcurBNMRents]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteB] ADD  CONSTRAINT [DF_tblPteB_fcurBNMRents]  DEFAULT ((0)) FOR [fcurBNMRents]
GO
/****** Object:  Default [DF_tblPteB_fcurBRoyalties]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteB] ADD  CONSTRAINT [DF_tblPteB_fcurBRoyalties]  DEFAULT ((0)) FOR [fcurBRoyalties]
GO
/****** Object:  Default [DF_tblPteB_fcurBNMRoyalties]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteB] ADD  CONSTRAINT [DF_tblPteB_fcurBNMRoyalties]  DEFAULT ((0)) FOR [fcurBNMRoyalties]
GO
/****** Object:  Default [DF_tblPteB_fcurBProfitLoss]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteB] ADD  CONSTRAINT [DF_tblPteB_fcurBProfitLoss]  DEFAULT ((0)) FOR [fcurBProfitLoss]
GO
/****** Object:  Default [DF_tblPteB_fcurBNMProfitLoss]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteB] ADD  CONSTRAINT [DF_tblPteB_fcurBNMProfitLoss]  DEFAULT ((0)) FOR [fcurBNMProfitLoss]
GO
/****** Object:  Default [DF_tblPteB_fcurBIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteB] ADD  CONSTRAINT [DF_tblPteB_fcurBIncome]  DEFAULT ((0)) FOR [fcurBIncome]
GO
/****** Object:  Default [DF_tblPteB_fcurBNMIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteB] ADD  CONSTRAINT [DF_tblPteB_fcurBNMIncome]  DEFAULT ((0)) FOR [fcurBNMIncome]
GO
/****** Object:  Default [DF_tblPteB_fcurBOthIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteB] ADD  CONSTRAINT [DF_tblPteB_fcurBOthIncome]  DEFAULT ((0)) FOR [fcurBOthIncome]
GO
/****** Object:  Default [DF_tblPteB_fcurBNMOthIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteB] ADD  CONSTRAINT [DF_tblPteB_fcurBNMOthIncome]  DEFAULT ((0)) FOR [fcurBNMOthIncome]
GO
/****** Object:  Default [DF_tblPteB_fcurBNetAllocInc]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteB] ADD  CONSTRAINT [DF_tblPteB_fcurBNetAllocInc]  DEFAULT ((0)) FOR [fcurBNetAllocInc]
GO
/****** Object:  Default [DF_tblPteB_fcurBNMNetAllocInc]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteB] ADD  CONSTRAINT [DF_tblPteB_fcurBNMNetAllocInc]  DEFAULT ((0)) FOR [fcurBNMNetAllocInc]
GO
/****** Object:  Default [DF_tblPteB_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteB] ADD  CONSTRAINT [DF_tblPteB_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblPteB_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPteB] ADD  CONSTRAINT [DF_tblPteB_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblPtePtd_fstrFein]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fstrFein]  DEFAULT (' ') FOR [fstrFein]
GO
/****** Object:  Default [DF_tblPtePtd_fcurNMNetIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fcurNMNetIncome]  DEFAULT ((0)) FOR [fcurNMNetIncome]
GO
/****** Object:  Default [DF_tblPtePtd_fblnAmend]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fblnAmend]  DEFAULT ((0)) FOR [fblnAmend]
GO
/****** Object:  Default [DF_tblPtePtd_fdtmPostMarkDate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fdtmPostMarkDate]  DEFAULT ('12/31/9999') FOR [fdtmPostMarkDate]
GO
/****** Object:  Default [DF_tblPtePtd_fstrName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fstrName]  DEFAULT (' ') FOR [fstrName]
GO
/****** Object:  Default [DF_tblPtePtd_fstrAddress]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fstrAddress]  DEFAULT (' ') FOR [fstrStreet]
GO
/****** Object:  Default [DF_tblPtePtd_fstrCity]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fstrCity]  DEFAULT (' ') FOR [fstrCity]
GO
/****** Object:  Default [DF_tblPtePtd_fstrState]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fstrState]  DEFAULT (' ') FOR [fstrState]
GO
/****** Object:  Default [DF_tblPtePtd_fstrCountry]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fstrCountry]  DEFAULT ('USA') FOR [fstrCountry]
GO
/****** Object:  Default [DF_tblPtePtd_fstrZipCode]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fstrZipCode]  DEFAULT (' ') FOR [fstrZipCode]
GO
/****** Object:  Default [DF_tblPtePtd_fblnPTE]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fblnPTE]  DEFAULT ((1)) FOR [fblnPte]
GO
/****** Object:  Default [DF_tblPtePtd_fblnScorp]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fblnScorp]  DEFAULT ((0)) FOR [fblnScorp]
GO
/****** Object:  Default [DF_tblPtePtd_fblnCit]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fblnCit]  DEFAULT ((0)) FOR [fblnCit]
GO
/****** Object:  Default [DF_tblPtePtd_fblnFid]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fblnFid]  DEFAULT ((0)) FOR [fblnFid]
GO
/****** Object:  Default [DF_tblPtePtd_fblnOth]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fblnOth]  DEFAULT ((0)) FOR [fblnOth]
GO
/****** Object:  Default [DF_tblPtePtd_fstrOthWhy]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fstrOthWhy]  DEFAULT (' ') FOR [fstrOthWhy]
GO
/****** Object:  Default [DF_tblPtePtd_fdtmTaxBeg]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fdtmTaxBeg]  DEFAULT ('12/31/9999') FOR [fdtmTaxYrBeg]
GO
/****** Object:  Default [DF_tblPtePtd_fdtmTaxEnd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fdtmTaxEnd]  DEFAULT ('12/31/9999') FOR [fdtmTaxYrEnd]
GO
/****** Object:  Default [DF_tblPtePtd_fdtmDue]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fdtmDue]  DEFAULT ('12/31/9999') FOR [fdtmTaxDue]
GO
/****** Object:  Default [DF_tblPtePtd_fdtmExtend]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fdtmExtend]  DEFAULT ('12/31/9999') FOR [fdtmExtDue]
GO
/****** Object:  Default [DF_tblPtePtd_fcurWthPage]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fcurWthPage]  DEFAULT ((0)) FOR [fcurWthPage]
GO
/****** Object:  Default [DF_tblPtePtd_fcurWthAll]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fcurWthAll]  DEFAULT ((0)) FOR [fcurWthAll]
GO
/****** Object:  Default [DF_tblPtePtd_fcurWthOwn]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fcurWthOwn]  DEFAULT ((0)) FOR [fcurWthOwn]
GO
/****** Object:  Default [DF_tblPtePtd_fcurWthPte]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fcurWthPte]  DEFAULT ((0)) FOR [fcurWthPte]
GO
/****** Object:  Default [DF_tblPtePtd_fcurSubTotal]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fcurSubTotal]  DEFAULT ((0)) FOR [fcurSubTotal]
GO
/****** Object:  Default [DF_tblPtePtd_fcurPenalty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fcurPenalty]  DEFAULT ((0)) FOR [fcurPenalty]
GO
/****** Object:  Default [DF_tblPtePtd_fcurInterest]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fcurInterest]  DEFAULT ((0)) FOR [fcurInterest]
GO
/****** Object:  Default [DF_tblPtePtd_fcurTotalDue]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fcurTotalDue]  DEFAULT ((0)) FOR [fcurTotalDue]
GO
/****** Object:  Default [DF_tblPtePtd_fdtmSign]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fdtmSign]  DEFAULT ('12/31/9999') FOR [fdtmSigned]
GO
/****** Object:  Default [DF_tblPtePtd_fstrPhone]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fstrPhone]  DEFAULT (' ') FOR [fstrPhone]
GO
/****** Object:  Default [DF_tblPtePtd_fstrEmail]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fstrEmail]  DEFAULT (' ') FOR [fstrEmail]
GO
/****** Object:  Default [DF_tblPtePtd_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblPtePtd_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtd] ADD  CONSTRAINT [DF_tblPtePtd_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblPtePtdS_flngRepNum]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtdS] ADD  CONSTRAINT [DF_tblPtePtdS_flngRepNum]  DEFAULT ((0)) FOR [flngRepNum]
GO
/****** Object:  Default [DF_tblPtePtdS_fstrId]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtdS] ADD  CONSTRAINT [DF_tblPtePtdS_fstrId]  DEFAULT (' ') FOR [fstrId]
GO
/****** Object:  Default [DF_tblPtePtdS_fblnFein]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtdS] ADD  CONSTRAINT [DF_tblPtePtdS_fblnFein]  DEFAULT ((0)) FOR [fblnFein]
GO
/****** Object:  Default [DF_tblPtePtdS_fblnSsn]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtdS] ADD  CONSTRAINT [DF_tblPtePtdS_fblnSsn]  DEFAULT ((0)) FOR [fblnSsn]
GO
/****** Object:  Default [DF_tblPtePtdS_fstrName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtdS] ADD  CONSTRAINT [DF_tblPtePtdS_fstrName]  DEFAULT (' ') FOR [fstrName]
GO
/****** Object:  Default [DF_tblPtePtdS_fstrAddr]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtdS] ADD  CONSTRAINT [DF_tblPtePtdS_fstrAddr]  DEFAULT (' ') FOR [fstrStreet]
GO
/****** Object:  Default [DF_tblPtePtdS_fstrCity]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtdS] ADD  CONSTRAINT [DF_tblPtePtdS_fstrCity]  DEFAULT (' ') FOR [fstrCity]
GO
/****** Object:  Default [DF_tblPtePtdS_fstrState]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtdS] ADD  CONSTRAINT [DF_tblPtePtdS_fstrState]  DEFAULT (' ') FOR [fstrState]
GO
/****** Object:  Default [DF_tblPtePtdS_fstrCountry]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtdS] ADD  CONSTRAINT [DF_tblPtePtdS_fstrCountry]  DEFAULT ('USA') FOR [fstrCountry]
GO
/****** Object:  Default [DF_tblPtePtdS_fstrZipCode]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtdS] ADD  CONSTRAINT [DF_tblPtePtdS_fstrZipCode]  DEFAULT (' ') FOR [fstrZipCode]
GO
/****** Object:  Default [DF_tblPtePtdS_fblnOutSide]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtdS] ADD  CONSTRAINT [DF_tblPtePtdS_fblnOutSide]  DEFAULT ((0)) FOR [fblnOutSide]
GO
/****** Object:  Default [DF_tblPtePtdS_fcurOwnNet]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtdS] ADD  CONSTRAINT [DF_tblPtePtdS_fcurOwnNet]  DEFAULT ((0)) FOR [fcurOwnNet]
GO
/****** Object:  Default [DF_tblPtePtdS_fcurOwnWth]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtdS] ADD  CONSTRAINT [DF_tblPtePtdS_fcurOwnWth]  DEFAULT ((0)) FOR [fcurOwnWth]
GO
/****** Object:  Default [DF_tblPtePtdS_fbln41353]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtdS] ADD  CONSTRAINT [DF_tblPtePtdS_fbln41353]  DEFAULT ((0)) FOR [fbln41353]
GO
/****** Object:  Default [DF_tblPtePtdS_fblnFilled]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtdS] ADD  CONSTRAINT [DF_tblPtePtdS_fblnFilled]  DEFAULT ((0)) FOR [fblnFilled]
GO
/****** Object:  Default [DF_tblPtePtdS_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtdS] ADD  CONSTRAINT [DF_tblPtePtdS_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblPtePtdS_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtdS] ADD  CONSTRAINT [DF_tblPtePtdS_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblPtePtdS_fstrMPDLN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtdS] ADD  CONSTRAINT [DF_tblPtePtdS_fstrMPDLN]  DEFAULT (' ') FOR [fstrMPDLN]
GO
/****** Object:  Default [DF_tblPtePtdS_fstrTaxForm]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtdS] ADD  CONSTRAINT [DF_tblPtePtdS_fstrTaxForm]  DEFAULT ('') FOR [fstrTaxForm]
GO
/****** Object:  Default [DF_tblPtePtdS_fstrSource]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtdS] ADD  CONSTRAINT [DF_tblPtePtdS_fstrSource]  DEFAULT ('GENKFI') FOR [fstrSource]
GO
/****** Object:  Default [DF_tblPtePtdS_fblnFound]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblPtePtdS] ADD  CONSTRAINT [DF_tblPtePtdS_fblnFound]  DEFAULT ((0)) FOR [fblnFound]
GO
/****** Object:  Default [DF_tblScoPtd_fstrFein]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fstrFein]  DEFAULT (' ') FOR [fstrFein]
GO
/****** Object:  Default [DF_tblScoPtd_fcurNMNetIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fcurNMNetIncome]  DEFAULT ((0)) FOR [fcurNMNetIncome]
GO
/****** Object:  Default [DF_tblScoPtd_fblnAmend]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fblnAmend]  DEFAULT ((0)) FOR [fblnAmend]
GO
/****** Object:  Default [DF_tblScoPtd_fdtmPostMarkDate]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fdtmPostMarkDate]  DEFAULT ('12/31/9999') FOR [fdtmPostMarkDate]
GO
/****** Object:  Default [DF_tblScoPtd_fstrName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fstrName]  DEFAULT (' ') FOR [fstrName]
GO
/****** Object:  Default [DF_tblScoPtd_fstrAddress]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fstrAddress]  DEFAULT (' ') FOR [fstrStreet]
GO
/****** Object:  Default [DF_tblScoPtd_fstrCity]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fstrCity]  DEFAULT (' ') FOR [fstrCity]
GO
/****** Object:  Default [DF_tblScoPtd_fstrState]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fstrState]  DEFAULT (' ') FOR [fstrState]
GO
/****** Object:  Default [DF_tblScoPtd_fstrCountry]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fstrCountry]  DEFAULT ('USA') FOR [fstrCountry]
GO
/****** Object:  Default [DF_tblScoPtd_fstrZipCode]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fstrZipCode]  DEFAULT (' ') FOR [fstrZipCode]
GO
/****** Object:  Default [DF_tblScoPtd_fblnPTE]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fblnPTE]  DEFAULT ((0)) FOR [fblnPte]
GO
/****** Object:  Default [DF_tblScoPtd_fblnScorp]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fblnScorp]  DEFAULT ((1)) FOR [fblnScorp]
GO
/****** Object:  Default [DF_tblScoPtd_fblnCit]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fblnCit]  DEFAULT ((0)) FOR [fblnCit]
GO
/****** Object:  Default [DF_tblScoPtd_fblnFid]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fblnFid]  DEFAULT ((0)) FOR [fblnFid]
GO
/****** Object:  Default [DF_tblScoPtd_fblnOth]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fblnOth]  DEFAULT ((0)) FOR [fblnOth]
GO
/****** Object:  Default [DF_tblScoPtd_fstrOthWhy]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fstrOthWhy]  DEFAULT (' ') FOR [fstrOthWhy]
GO
/****** Object:  Default [DF_tblScoPtd_fdtmTaxBeg]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fdtmTaxBeg]  DEFAULT ('12/31/9999') FOR [fdtmTaxYrBeg]
GO
/****** Object:  Default [DF_tblScoPtd_fdtmTaxEnd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fdtmTaxEnd]  DEFAULT ('12/31/9999') FOR [fdtmTaxYrEnd]
GO
/****** Object:  Default [DF_tblScoPtd_fdtmDue]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fdtmDue]  DEFAULT ('12/31/9999') FOR [fdtmTaxDue]
GO
/****** Object:  Default [DF_tblScoPtd_fdtmExtend]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fdtmExtend]  DEFAULT ('12/31/9999') FOR [fdtmExtDue]
GO
/****** Object:  Default [DF_tblScoPtd_fcurWthPage]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fcurWthPage]  DEFAULT ((0)) FOR [fcurWthPage]
GO
/****** Object:  Default [DF_tblScoPtd_fcurWthAll]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fcurWthAll]  DEFAULT ((0)) FOR [fcurWthAll]
GO
/****** Object:  Default [DF_tblScoPtd_fcurWthOwn]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fcurWthOwn]  DEFAULT ((0)) FOR [fcurWthOwn]
GO
/****** Object:  Default [DF_tblScoPtd_fcurWthPte]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fcurWthPte]  DEFAULT ((0)) FOR [fcurWthPte]
GO
/****** Object:  Default [DF_tblScoPtd_fcurSubTotal]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fcurSubTotal]  DEFAULT ((0)) FOR [fcurSubTotal]
GO
/****** Object:  Default [DF_tblScoPtd_fcurPenalty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fcurPenalty]  DEFAULT ((0)) FOR [fcurPenalty]
GO
/****** Object:  Default [DF_tblScoPtd_fcurInterest]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fcurInterest]  DEFAULT ((0)) FOR [fcurInterest]
GO
/****** Object:  Default [DF_tblScoPtd_fcurTotalDue]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fcurTotalDue]  DEFAULT ((0)) FOR [fcurTotalDue]
GO
/****** Object:  Default [DF_tblScoPtd_fdtmSign]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fdtmSign]  DEFAULT ('12/31/9999') FOR [fdtmSigned]
GO
/****** Object:  Default [DF_tblScoPtd_fstrPhone]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fstrPhone]  DEFAULT (' ') FOR [fstrPhone]
GO
/****** Object:  Default [DF_tblScoPtd_fstrEmail]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fstrEmail]  DEFAULT (' ') FOR [fstrEmail]
GO
/****** Object:  Default [DF_tblScoPtd_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblScoPtd_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtd] ADD  CONSTRAINT [DF_tblScoPtd_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblScoPtdS_flngRepNum]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtdS] ADD  CONSTRAINT [DF_tblScoPtdS_flngRepNum]  DEFAULT ((0)) FOR [flngRepNum]
GO
/****** Object:  Default [DF_tblScoPtdS_fstrId]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtdS] ADD  CONSTRAINT [DF_tblScoPtdS_fstrId]  DEFAULT (' ') FOR [fstrId]
GO
/****** Object:  Default [DF_tblScoPtdS_fblnFein]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtdS] ADD  CONSTRAINT [DF_tblScoPtdS_fblnFein]  DEFAULT ((0)) FOR [fblnFein]
GO
/****** Object:  Default [DF_tblScoPtdS_fblnSsn]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtdS] ADD  CONSTRAINT [DF_tblScoPtdS_fblnSsn]  DEFAULT ((0)) FOR [fblnSsn]
GO
/****** Object:  Default [DF_tblScoPtdS_fstrName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtdS] ADD  CONSTRAINT [DF_tblScoPtdS_fstrName]  DEFAULT (' ') FOR [fstrName]
GO
/****** Object:  Default [DF_tblScoPtdS_fstrAddr]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtdS] ADD  CONSTRAINT [DF_tblScoPtdS_fstrAddr]  DEFAULT (' ') FOR [fstrStreet]
GO
/****** Object:  Default [DF_tblScoPtdS_fstrCity]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtdS] ADD  CONSTRAINT [DF_tblScoPtdS_fstrCity]  DEFAULT (' ') FOR [fstrCity]
GO
/****** Object:  Default [DF_tblScoPtdS_fstrState]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtdS] ADD  CONSTRAINT [DF_tblScoPtdS_fstrState]  DEFAULT (' ') FOR [fstrState]
GO
/****** Object:  Default [DF_tblScoPtdS_fstrCountry]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtdS] ADD  CONSTRAINT [DF_tblScoPtdS_fstrCountry]  DEFAULT ('USA') FOR [fstrCountry]
GO
/****** Object:  Default [DF_tblScoPtdS_fstrZipCode]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtdS] ADD  CONSTRAINT [DF_tblScoPtdS_fstrZipCode]  DEFAULT (' ') FOR [fstrZipCode]
GO
/****** Object:  Default [DF_tblScoPtdS_fblnOutSide]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtdS] ADD  CONSTRAINT [DF_tblScoPtdS_fblnOutSide]  DEFAULT ((0)) FOR [fblnOutSide]
GO
/****** Object:  Default [DF_tblScoPtdS_fcurOwnNet]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtdS] ADD  CONSTRAINT [DF_tblScoPtdS_fcurOwnNet]  DEFAULT ((0)) FOR [fcurOwnNet]
GO
/****** Object:  Default [DF_tblScoPtdS_fcurOwnWth]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtdS] ADD  CONSTRAINT [DF_tblScoPtdS_fcurOwnWth]  DEFAULT ((0)) FOR [fcurOwnWth]
GO
/****** Object:  Default [DF_tblScoPtdS_fbln41353]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtdS] ADD  CONSTRAINT [DF_tblScoPtdS_fbln41353]  DEFAULT ((0)) FOR [fbln41353]
GO
/****** Object:  Default [DF_tblScoPtdS_fblnFilled]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtdS] ADD  CONSTRAINT [DF_tblScoPtdS_fblnFilled]  DEFAULT ((0)) FOR [fblnFilled]
GO
/****** Object:  Default [DF_tblScoPtdS_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtdS] ADD  CONSTRAINT [DF_tblScoPtdS_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblScoPtdS_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtdS] ADD  CONSTRAINT [DF_tblScoPtdS_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblScoPtdS_fstrMPDLN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtdS] ADD  CONSTRAINT [DF_tblScoPtdS_fstrMPDLN]  DEFAULT (' ') FOR [fstrMPDLN]
GO
/****** Object:  Default [DF_tblScoPtdS_fstrTaxForm]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtdS] ADD  CONSTRAINT [DF_tblScoPtdS_fstrTaxForm]  DEFAULT ('') FOR [fstrTaxForm]
GO
/****** Object:  Default [DF_tblScoPtdS_fstrSource]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtdS] ADD  CONSTRAINT [DF_tblScoPtdS_fstrSource]  DEFAULT ('GENKFI') FOR [fstrSource]
GO
/****** Object:  Default [DF_tblScoPtdS_fblnFound]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScoPtdS] ADD  CONSTRAINT [DF_tblScoPtdS_fblnFound]  DEFAULT ((0)) FOR [fblnFound]
GO
/****** Object:  Default [DF_tblScorp_fstrFein]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fstrFein]  DEFAULT (' ') FOR [fstrFein]
GO
/****** Object:  Default [DF_tblScorp_fstrCrsId]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fstrCrsId]  DEFAULT (' ') FOR [fstrCrsId]
GO
/****** Object:  Default [DF_tblScorp_fstrName]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fstrName]  DEFAULT (' ') FOR [fstrName]
GO
/****** Object:  Default [DF_tblScorp_fstrStreet]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fstrStreet]  DEFAULT (' ') FOR [fstrStreet]
GO
/****** Object:  Default [DF_tblScorp_fstrCity]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fstrCity]  DEFAULT (' ') FOR [fstrCity]
GO
/****** Object:  Default [DF_tblScorp_fstrState]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fstrState]  DEFAULT (' ') FOR [fstrState]
GO
/****** Object:  Default [DF_tblScorp_fstrCountry]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fstrCountry]  DEFAULT ('USA') FOR [fstrCountry]
GO
/****** Object:  Default [DF_tblScorp_fstrZipCode]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fstrZipCode]  DEFAULT (' ') FOR [fstrZipCode]
GO
/****** Object:  Default [DF_tblScorp_fdtmTaxYrBeg]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fdtmTaxYrBeg]  DEFAULT ('12/31/9999') FOR [fdtmTaxYrBeg]
GO
/****** Object:  Default [DF_tblScorp_fdtmTaxYrEnd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fdtmTaxYrEnd]  DEFAULT ('12/31/9999') FOR [fdtmTaxYrEnd]
GO
/****** Object:  Default [DF_tblScorp_fdtmExtDue]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fdtmExtDue]  DEFAULT ('12/31/9999') FOR [fdtmExtDue]
GO
/****** Object:  Default [DF_tblScorp_fdtmPostMark]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fdtmPostMark]  DEFAULT ('12/31/9999') FOR [fdtmPostMarkDate]
GO
/****** Object:  Default [DF_tblScorp_fstrNAICSCode]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fstrNAICSCode]  DEFAULT (' ') FOR [fstrNAICSCode]
GO
/****** Object:  Default [DF_tblScorp_fblnAmended]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fblnAmended]  DEFAULT ((0)) FOR [fblnAmended]
GO
/****** Object:  Default [DF_tblScorp_fdtmFinalReturn]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fdtmFinalReturn]  DEFAULT ('12/31/9999') FOR [fdtmFinalReturn]
GO
/****** Object:  Default [DF_tblScorp_fblnImmune]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fblnImmune]  DEFAULT ((0)) FOR [fblnImmune]
GO
/****** Object:  Default [DF_tblScorp_fcurTaxableIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fcurTaxableIncome]  DEFAULT ((0)) FOR [fcurTaxableIncome]
GO
/****** Object:  Default [DF_tblScorp_fcurIncomeTax]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fcurIncomeTax]  DEFAULT ((0)) FOR [fcurIncomeTax]
GO
/****** Object:  Default [DF_tblScorp_fcurNMPercent]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fcurNMPercent]  DEFAULT ((100)) FOR [fcurNMPercent]
GO
/****** Object:  Default [DF_tblScorp_fcurNMIncomeTax]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fcurNMIncomeTax]  DEFAULT ((0)) FOR [fcurNMIncomeTax]
GO
/****** Object:  Default [DF_tblScorp_fcurNonRefCredits]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fcurNonRefCredits]  DEFAULT ((0)) FOR [fcurNonRefCredits]
GO
/****** Object:  Default [DF_tblScorp_fcurNetIncomeTax]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fcurNetIncomeTax]  DEFAULT ((0)) FOR [fcurNetIncomeTax]
GO
/****** Object:  Default [DF_tblScorp_fcurFranchiseTax]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fcurFranchiseTax]  DEFAULT ((50)) FOR [fcurFranchiseTax]
GO
/****** Object:  Default [DF_tblScorp_fcurTotalIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fcurTotalIncome]  DEFAULT ((0)) FOR [fcurTotalIncome]
GO
/****** Object:  Default [DF_tblScorp_fcurRefundsReceived]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fcurRefundsReceived]  DEFAULT ((0)) FOR [fcurRefundsReceived]
GO
/****** Object:  Default [DF_tblScorp_fcurSubTotal]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fcurSubTotal]  DEFAULT ((0)) FOR [fcurSubTotal]
GO
/****** Object:  Default [DF_tblScorp_fblnPmtExtension]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fblnPmtExtension]  DEFAULT ((0)) FOR [fblnPmtExtension]
GO
/****** Object:  Default [DF_tblScorp_fblnPmtEstimated]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fblnPmtEstimated]  DEFAULT ((0)) FOR [fblnPmtEstimated]
GO
/****** Object:  Default [DF_tblScorp_fblnPmtPriorYear]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fblnPmtPriorYear]  DEFAULT ((0)) FOR [fblnPmtPriorYear]
GO
/****** Object:  Default [DF_tblScorp_fcurTotalPayment]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fcurTotalPayment]  DEFAULT ((0)) FOR [fcurTotalPayment]
GO
/****** Object:  Default [DF_tblScorp_fcurTaxWithheldOGP]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fcurTaxWithheldOGP]  DEFAULT ((0)) FOR [fcurTaxWithheldOGP]
GO
/****** Object:  Default [DF_tblScorp_fcurNMWithPass]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fcurNMWithPass]  DEFAULT ((0)) FOR [fcurNMWithPass]
GO
/****** Object:  Default [DF_tblScorp_fcurNMWithTotBen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fcurNMWithTotBen]  DEFAULT ((0)) FOR [fcurNMWithTotBen]
GO
/****** Object:  Default [DF_tblScorp_fcurRefundCredits]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fcurRefundCredits]  DEFAULT ((0)) FOR [fcurRefundCredits]
GO
/****** Object:  Default [DF_tblScorp_fcurTaxDue]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fcurTaxDue]  DEFAULT ((0)) FOR [fcurTaxDue]
GO
/****** Object:  Default [DF_tblScorp_fcurPenalty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fcurPenalty]  DEFAULT ((0)) FOR [fcurPenalty]
GO
/****** Object:  Default [DF_tblScorp_fcurInterest]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fcurInterest]  DEFAULT ((0)) FOR [fcurInterest]
GO
/****** Object:  Default [DF_tblScorp_fcurTotalDue]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fcurTotalDue]  DEFAULT ((0)) FOR [fcurTotalDue]
GO
/****** Object:  Default [DF_tblScorp_fcurOverPayment]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fcurOverPayment]  DEFAULT ((0)) FOR [fcurOverPayment]
GO
/****** Object:  Default [DF_tblScorp_fcurOvPaymtNextYr]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fcurOvPaymtNextYr]  DEFAULT ((0)) FOR [fcurOvPaymtNextYr]
GO
/****** Object:  Default [DF_tblScorp_fcurOvPaymtRefund]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fcurOvPaymtRefund]  DEFAULT ((0)) FOR [fcurOvPaymtRefund]
GO
/****** Object:  Default [DF_tblScorp_fcurRenewEner]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fcurRenewEner]  DEFAULT ((0)) FOR [fcurRenewEner]
GO
/****** Object:  Default [DF_tblScorp_fcurRefundCrd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fcurRefundCrd]  DEFAULT ((0)) FOR [fcurRefundCrd]
GO
/****** Object:  Default [DF_tblScorp_fcurFilmProduction]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fcurFilmProduction]  DEFAULT ((0)) FOR [fcurFilmProduction]
GO
/****** Object:  Default [DF_tblScorp_fstrRouting1Num]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fstrRouting1Num]  DEFAULT (' ') FOR [fstrRouting1Num]
GO
/****** Object:  Default [DF_tblScorp_fstrRoutingNum]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fstrRoutingNum]  DEFAULT (' ') FOR [fstrRoutingNum]
GO
/****** Object:  Default [DF_tblScorp_fstrAccount1Num]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fstrAccount1Num]  DEFAULT (' ') FOR [fstrAccount1Num]
GO
/****** Object:  Default [DF_tblScorp_fstrAccountNum]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fstrAccountNum]  DEFAULT (' ') FOR [fstrAccountNum]
GO
/****** Object:  Default [DF_tblScorp_fstrAccountType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fstrAccountType]  DEFAULT (' ') FOR [fstrAccountType]
GO
/****** Object:  Default [DF_tblScorp_fblnAcctChk]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fblnAcctChk]  DEFAULT ((0)) FOR [fblnAcctChk]
GO
/****** Object:  Default [DF_tblScorp_fblnAcctSav]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fblnAcctSav]  DEFAULT ((0)) FOR [fblnAcctSav]
GO
/****** Object:  Default [DF_tblScorp_fblnIATFlag]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fblnIATFlag]  DEFAULT ((0)) FOR [fblnIATFlag]
GO
/****** Object:  Default [DF_tblScorp_fblnIATYes]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fblnIATYes]  DEFAULT ((0)) FOR [fblnIATYes]
GO
/****** Object:  Default [DF_tblScorp_fblnIATNo]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fblnIATNo]  DEFAULT ((0)) FOR [fblnIATNo]
GO
/****** Object:  Default [DF_tblScorp_fstrPhoneNo]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fstrPhoneNo]  DEFAULT (' ') FOR [fstrPhoneNo]
GO
/****** Object:  Default [DF_tblScorp_fstrTPEmailAdd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fstrTPEmailAdd]  DEFAULT (' ') FOR [fstrTPEmailAdd]
GO
/****** Object:  Default [DF_tblScorp_fstrPrepCRSID]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fstrPrepCRSID]  DEFAULT (' ') FOR [fstrPrepCRSID]
GO
/****** Object:  Default [DF_tblScorp_fstrPrepFEIN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fstrPrepFEIN]  DEFAULT (' ') FOR [fstrPrepFEIN]
GO
/****** Object:  Default [DF_tblScorp_fstrPrepSSNPTIN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fstrPrepSSNPTIN]  DEFAULT (' ') FOR [fstrPrepSSNPTIN]
GO
/****** Object:  Default [DF_tblScorp_fstrPrepPhoneNum]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fstrPrepPhoneNum]  DEFAULT (' ') FOR [fstrPrepPhoneNum]
GO
/****** Object:  Default [DF_tblScorp_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblScorp_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblScorp_fcurTrfCrd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fcurTrfCrd]  DEFAULT ((0)) FOR [fcurTrfCrd]
GO
/****** Object:  Default [DF_tblScorp_fstrStateOrg]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fstrStateOrg]  DEFAULT (' ') FOR [fstrStateOrg]
GO
/****** Object:  Default [DF_tblScorp_fdtmDateOrg]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblScorp_fdtmDateOrg]  DEFAULT ('12/31/9999') FOR [fdtmDateOrg]
GO
/****** Object:  Default [DF_tblSCorp_fdtmNMStart]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp] ADD  CONSTRAINT [DF_tblSCorp_fdtmNMStart]  DEFAULT ('12/31/9999') FOR [fdtmNMStart]
GO
/****** Object:  Default [DF_tblScorp1_fcurOrdIncomeLoss]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp1] ADD  CONSTRAINT [DF_tblScorp1_fcurOrdIncomeLoss]  DEFAULT ((0)) FOR [fcurOrdIncomeLoss]
GO
/****** Object:  Default [DF_tblScorp1_fcurOthIncomeLoss]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp1] ADD  CONSTRAINT [DF_tblScorp1_fcurOthIncomeLoss]  DEFAULT ((0)) FOR [fcurOthIncomeLoss]
GO
/****** Object:  Default [DF_tblScorp1_fcurIntIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp1] ADD  CONSTRAINT [DF_tblScorp1_fcurIntIncome]  DEFAULT ((0)) FOR [fcurIntIncome]
GO
/****** Object:  Default [DF_tblScorp1_fcurIncomeSubtotal]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp1] ADD  CONSTRAINT [DF_tblScorp1_fcurIncomeSubtotal]  DEFAULT ((0)) FOR [fcurIncomeSubtotal]
GO
/****** Object:  Default [DF_tblScorp1_fcurIntUSOblig]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp1] ADD  CONSTRAINT [DF_tblScorp1_fcurIntUSOblig]  DEFAULT ((0)) FOR [fcurIntUSOblig]
GO
/****** Object:  Default [DF_tblScorp1_fcurAllowDeducts]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp1] ADD  CONSTRAINT [DF_tblScorp1_fcurAllowDeducts]  DEFAULT ((0)) FOR [fcurAllowDeducts]
GO
/****** Object:  Default [DF_tblScorp1_fcurAllocIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp1] ADD  CONSTRAINT [DF_tblScorp1_fcurAllocIncome]  DEFAULT ((0)) FOR [fcurAllocIncome]
GO
/****** Object:  Default [DF_tblScorp1_fcurApportIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp1] ADD  CONSTRAINT [DF_tblScorp1_fcurApportIncome]  DEFAULT ((0)) FOR [fcurApportIncome]
GO
/****** Object:  Default [DF_tblScorp1_fcurAverNMPercent]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp1] ADD  CONSTRAINT [DF_tblScorp1_fcurAverNMPercent]  DEFAULT ((100)) FOR [fcurAverNMPercent]
GO
/****** Object:  Default [DF_tblScorp1_fcurNMApportIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp1] ADD  CONSTRAINT [DF_tblScorp1_fcurNMApportIncome]  DEFAULT ((0)) FOR [fcurNMApportIncome]
GO
/****** Object:  Default [DF_tblScorp1_fcurNMAllocIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp1] ADD  CONSTRAINT [DF_tblScorp1_fcurNMAllocIncome]  DEFAULT ((0)) FOR [fcurNMAllocIncome]
GO
/****** Object:  Default [DF_tblScorp1_fcurNMTaxableIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp1] ADD  CONSTRAINT [DF_tblScorp1_fcurNMTaxableIncome]  DEFAULT ((0)) FOR [fcurNMTaxableIncome]
GO
/****** Object:  Default [DF_tblScorp1_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp1] ADD  CONSTRAINT [DF_tblScorp1_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblScorp1_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorp1] ADD  CONSTRAINT [DF_tblScorp1_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblScorpA_fcurAInventory]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpA] ADD  CONSTRAINT [DF_tblScorpA_fcurAInventory]  DEFAULT ((0)) FOR [fcurAInventory]
GO
/****** Object:  Default [DF_tblScorpA_fcurANMInventory]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpA] ADD  CONSTRAINT [DF_tblScorpA_fcurANMInventory]  DEFAULT ((0)) FOR [fcurANMInventory]
GO
/****** Object:  Default [DF_tblScorpA_fcurARealProperty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpA] ADD  CONSTRAINT [DF_tblScorpA_fcurARealProperty]  DEFAULT ((0)) FOR [fcurARealProperty]
GO
/****** Object:  Default [DF_tblScorpA_fcurANMRealProperty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpA] ADD  CONSTRAINT [DF_tblScorpA_fcurANMRealProperty]  DEFAULT ((0)) FOR [fcurANMRealProperty]
GO
/****** Object:  Default [DF_tblScorpA_fcurAPerProperty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpA] ADD  CONSTRAINT [DF_tblScorpA_fcurAPerProperty]  DEFAULT ((0)) FOR [fcurAPerProperty]
GO
/****** Object:  Default [DF_tblScorpA_fcurANMPerProperty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpA] ADD  CONSTRAINT [DF_tblScorpA_fcurANMPerProperty]  DEFAULT ((0)) FOR [fcurANMPerProperty]
GO
/****** Object:  Default [DF_tblScorpA_fcurARentProperty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpA] ADD  CONSTRAINT [DF_tblScorpA_fcurARentProperty]  DEFAULT ((0)) FOR [fcurARentProperty]
GO
/****** Object:  Default [DF_tblScorpA_fcurANMRentProperty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpA] ADD  CONSTRAINT [DF_tblScorpA_fcurANMRentProperty]  DEFAULT ((0)) FOR [fcurANMRentProperty]
GO
/****** Object:  Default [DF_tblScorpA_fcurATotalProperty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpA] ADD  CONSTRAINT [DF_tblScorpA_fcurATotalProperty]  DEFAULT ((0)) FOR [fcurATotalProperty]
GO
/****** Object:  Default [DF_tblScorpA_fcurANMTotalProperty]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpA] ADD  CONSTRAINT [DF_tblScorpA_fcurANMTotalProperty]  DEFAULT ((0)) FOR [fcurANMTotalProperty]
GO
/****** Object:  Default [DF_tblScorpA_fcurAPropertyFactor]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpA] ADD  CONSTRAINT [DF_tblScorpA_fcurAPropertyFactor]  DEFAULT ((0)) FOR [fcurAPropertyFactor]
GO
/****** Object:  Default [DF_tblScorpA_fcurATotalPayRoll]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpA] ADD  CONSTRAINT [DF_tblScorpA_fcurATotalPayRoll]  DEFAULT ((0)) FOR [fcurATotalPayRoll]
GO
/****** Object:  Default [DF_tblScorpA_fcurANMPayRoll]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpA] ADD  CONSTRAINT [DF_tblScorpA_fcurANMPayRoll]  DEFAULT ((0)) FOR [fcurANMPayRoll]
GO
/****** Object:  Default [DF_tblScorpA_fcurAPayRollFactor]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpA] ADD  CONSTRAINT [DF_tblScorpA_fcurAPayRollFactor]  DEFAULT ((0)) FOR [fcurAPayRollFactor]
GO
/****** Object:  Default [DF_tblScorpA_fcurASales]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpA] ADD  CONSTRAINT [DF_tblScorpA_fcurASales]  DEFAULT ((0)) FOR [fcurASales]
GO
/****** Object:  Default [DF_tblScorpA_fcurANMSales]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpA] ADD  CONSTRAINT [DF_tblScorpA_fcurANMSales]  DEFAULT ((0)) FOR [fcurANMSales]
GO
/****** Object:  Default [DF_tblScorpA_fcurASalesFactor]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpA] ADD  CONSTRAINT [DF_tblScorpA_fcurASalesFactor]  DEFAULT ((0)) FOR [fcurASalesFactor]
GO
/****** Object:  Default [DF_tblScorpA_fcurATotalFactors]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpA] ADD  CONSTRAINT [DF_tblScorpA_fcurATotalFactors]  DEFAULT ((0)) FOR [fcurATotalFactors]
GO
/****** Object:  Default [DF_tblScorpA_fdtmATaxYearEnd]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpA] ADD  CONSTRAINT [DF_tblScorpA_fdtmATaxYearEnd]  DEFAULT ('12/31/9999') FOR [fdtmATaxYearEnd]
GO
/****** Object:  Default [DF_tblScorpA_fdtmAElection]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpA] ADD  CONSTRAINT [DF_tblScorpA_fdtmAElection]  DEFAULT ('12/31/9999') FOR [fdtmAElection]
GO
/****** Object:  Default [DF_tblScorpA_fcurAAvgFactor]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpA] ADD  CONSTRAINT [DF_tblScorpA_fcurAAvgFactor]  DEFAULT ((0)) FOR [fcurAAvgFactor]
GO
/****** Object:  Default [DF_tblScorpA_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpA] ADD  CONSTRAINT [DF_tblScorpA_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblScorpA_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpA] ADD  CONSTRAINT [DF_tblScorpA_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblScorpB_fcurBDividends]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpB] ADD  CONSTRAINT [DF_tblScorpB_fcurBDividends]  DEFAULT ((0)) FOR [fcurBDividends]
GO
/****** Object:  Default [DF_tblScorpB_fcurBNMDividends]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpB] ADD  CONSTRAINT [DF_tblScorpB_fcurBNMDividends]  DEFAULT ((0)) FOR [fcurBNMDividends]
GO
/****** Object:  Default [DF_tblScorpB_fcurBInterest]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpB] ADD  CONSTRAINT [DF_tblScorpB_fcurBInterest]  DEFAULT ((0)) FOR [fcurBInterest]
GO
/****** Object:  Default [DF_tblScorpB_fcurBNMInterest]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpB] ADD  CONSTRAINT [DF_tblScorpB_fcurBNMInterest]  DEFAULT ((0)) FOR [fcurBNMInterest]
GO
/****** Object:  Default [DF_tblScorpB_fcurBRents]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpB] ADD  CONSTRAINT [DF_tblScorpB_fcurBRents]  DEFAULT ((0)) FOR [fcurBRents]
GO
/****** Object:  Default [DF_tblScorpB_fcurBNMRents]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpB] ADD  CONSTRAINT [DF_tblScorpB_fcurBNMRents]  DEFAULT ((0)) FOR [fcurBNMRents]
GO
/****** Object:  Default [DF_tblScorpB_fcurBRoyalties]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpB] ADD  CONSTRAINT [DF_tblScorpB_fcurBRoyalties]  DEFAULT ((0)) FOR [fcurBRoyalties]
GO
/****** Object:  Default [DF_tblScorpB_fcurBNMRoyalties]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpB] ADD  CONSTRAINT [DF_tblScorpB_fcurBNMRoyalties]  DEFAULT ((0)) FOR [fcurBNMRoyalties]
GO
/****** Object:  Default [DF_tblScorpB_fcurBProfitLoss]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpB] ADD  CONSTRAINT [DF_tblScorpB_fcurBProfitLoss]  DEFAULT ((0)) FOR [fcurBProfitLoss]
GO
/****** Object:  Default [DF_tblScorpB_fcurBNMProfitLoss]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpB] ADD  CONSTRAINT [DF_tblScorpB_fcurBNMProfitLoss]  DEFAULT ((0)) FOR [fcurBNMProfitLoss]
GO
/****** Object:  Default [DF_tblScorpB_fcurBIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpB] ADD  CONSTRAINT [DF_tblScorpB_fcurBIncome]  DEFAULT ((0)) FOR [fcurBIncome]
GO
/****** Object:  Default [DF_tblScorpB_fcurBNMIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpB] ADD  CONSTRAINT [DF_tblScorpB_fcurBNMIncome]  DEFAULT ((0)) FOR [fcurBNMIncome]
GO
/****** Object:  Default [DF_tblScorpB_fcurBOthIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpB] ADD  CONSTRAINT [DF_tblScorpB_fcurBOthIncome]  DEFAULT ((0)) FOR [fcurBOthIncome]
GO
/****** Object:  Default [DF_tblScorpB_fcurBNMOthIncome]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpB] ADD  CONSTRAINT [DF_tblScorpB_fcurBNMOthIncome]  DEFAULT ((0)) FOR [fcurBNMOthIncome]
GO
/****** Object:  Default [DF_tblScorpB_fcurBNetAlloc]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpB] ADD  CONSTRAINT [DF_tblScorpB_fcurBNetAlloc]  DEFAULT ((0)) FOR [fcurBNetAlloc]
GO
/****** Object:  Default [DF_tblScorpB_fcurBNMNetAlloc]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpB] ADD  CONSTRAINT [DF_tblScorpB_fcurBNMNetAlloc]  DEFAULT ((0)) FOR [fcurBNMNetAlloc]
GO
/****** Object:  Default [DF_tblScorpB_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpB] ADD  CONSTRAINT [DF_tblScorpB_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblScorpB_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpB] ADD  CONSTRAINT [DF_tblScorpB_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblScorpC_fcurCCapital]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpC] ADD  CONSTRAINT [DF_tblScorpC_fcurCCapital]  DEFAULT ((0)) FOR [fcurCCapital]
GO
/****** Object:  Default [DF_tblScorpC_fcurCNMCapital]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpC] ADD  CONSTRAINT [DF_tblScorpC_fcurCNMCapital]  DEFAULT ((0)) FOR [fcurCNMCapital]
GO
/****** Object:  Default [DF_tblScorpC_fcurCPassive]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpC] ADD  CONSTRAINT [DF_tblScorpC_fcurCPassive]  DEFAULT ((0)) FOR [fcurCPassive]
GO
/****** Object:  Default [DF_tblScorpC_fcurCNMPassive]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpC] ADD  CONSTRAINT [DF_tblScorpC_fcurCNMPassive]  DEFAULT ((0)) FOR [fcurCNMPassive]
GO
/****** Object:  Default [DF_tblScorpC_fcurCNetRecognized]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpC] ADD  CONSTRAINT [DF_tblScorpC_fcurCNetRecognized]  DEFAULT ((0)) FOR [fcurCNetRecognized]
GO
/****** Object:  Default [DF_tblScorpC_fcurCNMNetRecognized]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpC] ADD  CONSTRAINT [DF_tblScorpC_fcurCNMNetRecognized]  DEFAULT ((0)) FOR [fcurCNMNetRecognized]
GO
/****** Object:  Default [DF_tblScorpC_fcurCtotal]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpC] ADD  CONSTRAINT [DF_tblScorpC_fcurCtotal]  DEFAULT ((0)) FOR [fcurCtotal]
GO
/****** Object:  Default [DF_tblScorpC_fcurCNMtotal]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpC] ADD  CONSTRAINT [DF_tblScorpC_fcurCNMtotal]  DEFAULT ((0)) FOR [fcurCNMtotal]
GO
/****** Object:  Default [DF_tblScorpC_fcurCNMPerctage]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpC] ADD  CONSTRAINT [DF_tblScorpC_fcurCNMPerctage]  DEFAULT ((0)) FOR [fcurCNMPerctage]
GO
/****** Object:  Default [DF_tblScorpC_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpC] ADD  CONSTRAINT [DF_tblScorpC_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblScorpC_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpC] ADD  CONSTRAINT [DF_tblScorpC_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblScorpCR_fcurCRChildCare]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCR] ADD  CONSTRAINT [DF_tblScorpCR_fcurCRChildCare]  DEFAULT ((0)) FOR [fcurCRChildCare]
GO
/****** Object:  Default [DF_tblScorpCR_fcurCRCultProp]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCR] ADD  CONSTRAINT [DF_tblScorpCR_fcurCRCultProp]  DEFAULT ((0)) FOR [fcurCRCultProp]
GO
/****** Object:  Default [DF_tblScorpCR_fcurCRBusFac]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCR] ADD  CONSTRAINT [DF_tblScorpCR_fcurCRBusFac]  DEFAULT ((0)) FOR [fcurCRBusFac]
GO
/****** Object:  Default [DF_tblScorpCR_fcurCRInterGov]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCR] ADD  CONSTRAINT [DF_tblScorpCR_fcurCRInterGov]  DEFAULT ((0)) FOR [fcurCRInterGov]
GO
/****** Object:  Default [DF_tblScorpCR_fcurCRRuralJob]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCR] ADD  CONSTRAINT [DF_tblScorpCR_fcurCRRuralJob]  DEFAULT ((0)) FOR [fcurCRRuralJob]
GO
/****** Object:  Default [DF_tblScorpCR_fcurCRTechJobs]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCR] ADD  CONSTRAINT [DF_tblScorpCR_fcurCRTechJobs]  DEFAULT ((0)) FOR [fcurCRTechJobs]
GO
/****** Object:  Default [DF_tblScorpCR_fcurCRElecCard]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCR] ADD  CONSTRAINT [DF_tblScorpCR_fcurCRElecCard]  DEFAULT ((0)) FOR [fcurCRElecCard]
GO
/****** Object:  Default [DF_tblScorpCR_fcurCRJobMentor]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCR] ADD  CONSTRAINT [DF_tblScorpCR_fcurCRJobMentor]  DEFAULT ((0)) FOR [fcurCRJobMentor]
GO
/****** Object:  Default [DF_tblScorpCR_fcurCRLandCons]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCR] ADD  CONSTRAINT [DF_tblScorpCR_fcurCRLandCons]  DEFAULT ((0)) FOR [fcurCRLandCons]
GO
/****** Object:  Default [DF_tblScorpCR_fcurCRAffordHouse]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCR] ADD  CONSTRAINT [DF_tblScorpCR_fcurCRAffordHouse]  DEFAULT ((0)) FOR [fcurCRAffordHouse]
GO
/****** Object:  Default [DF_tblScorpCR_fcurCRBioDiesel]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCR] ADD  CONSTRAINT [DF_tblScorpCR_fcurCRBioDiesel]  DEFAULT ((0)) FOR [fcurCRBioDiesel]
GO
/****** Object:  Default [DF_tblScorpCR_fcurCRSusBldg]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCR] ADD  CONSTRAINT [DF_tblScorpCR_fcurCRSusBldg]  DEFAULT ((0)) FOR [fcurCRSusBldg]
GO
/****** Object:  Default [DF_tblScorpCR_fcurCRAdvEnergy]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCR] ADD  CONSTRAINT [DF_tblScorpCR_fcurCRAdvEnergy]  DEFAULT ((0)) FOR [fcurCRAdvEnergy]
GO
/****** Object:  Default [DF_tblScorpCR_fcurCRWaterCons]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCR] ADD  CONSTRAINT [DF_tblScorpCR_fcurCRWaterCons]  DEFAULT ((0)) FOR [fcurCRWaterCons]
GO
/****** Object:  Default [DF_tblScorpCR_fcurCRGeolPump]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCR] ADD  CONSTRAINT [DF_tblScorpCR_fcurCRGeolPump]  DEFAULT ((0)) FOR [fcurCRGeolPump]
GO
/****** Object:  Default [DF_tblScorpCR_fcurCRAgrBioMass]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCR] ADD  CONSTRAINT [DF_tblScorpCR_fcurCRAgrBioMass]  DEFAULT ((0)) FOR [fcurCRAgrBioMass]
GO
/****** Object:  Default [DF_tblScorpCR_fcurCRFilmApplied]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCR] ADD  CONSTRAINT [DF_tblScorpCR_fcurCRFilmApplied]  DEFAULT ((0)) FOR [fcurCRFilmApplied]
GO
/****** Object:  Default [DF_tblScorpCR_fcurCRFilmApproved]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCR] ADD  CONSTRAINT [DF_tblScorpCR_fcurCRFilmApproved]  DEFAULT ((0)) FOR [fcurCRFilmApproved]
GO
/****** Object:  Default [DF_tblScorpCR_fcurCRRenewEner]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCR] ADD  CONSTRAINT [DF_tblScorpCR_fcurCRRenewEner]  DEFAULT ((0)) FOR [fcurCRRenewEner]
GO
/****** Object:  Default [DF_tblScorpCR_fcurCRVetEmploy]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCR] ADD  CONSTRAINT [DF_tblScorpCR_fcurCRVetEmploy]  DEFAULT ((0)) FOR [fcurCRVetEmploy]
GO
/****** Object:  Default [DF_tblScorpCR_fcurCRTotalCredit]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCR] ADD  CONSTRAINT [DF_tblScorpCR_fcurCRTotalCredit]  DEFAULT ((0)) FOR [fcurCRTotalCredit]
GO
/****** Object:  Default [DF_tblScorpCR_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCR] ADD  CONSTRAINT [DF_tblScorpCR_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblScorpCR_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCR] ADD  CONSTRAINT [DF_tblScorpCR_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblScorpCRS_flngRepNum]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCRS] ADD  CONSTRAINT [DF_tblScorpCRS_flngRepNum]  DEFAULT ((0)) FOR [flngRepNum]
GO
/****** Object:  Default [DF_tblScorpCRS_fstrCrdType]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCRS] ADD  CONSTRAINT [DF_tblScorpCRS_fstrCrdType]  DEFAULT (' ') FOR [fstrCrdType]
GO
/****** Object:  Default [DF_tblScorpCRS_fstrApprove]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCRS] ADD  CONSTRAINT [DF_tblScorpCRS_fstrApprove]  DEFAULT (' ') FOR [fstrApprove]
GO
/****** Object:  Default [DF_tblScorpCRS_fcurApplied]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCRS] ADD  CONSTRAINT [DF_tblScorpCRS_fcurApplied]  DEFAULT ((0)) FOR [fcurApplied]
GO
/****** Object:  Default [DF_tblScorpCRS_fcurRefund]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCRS] ADD  CONSTRAINT [DF_tblScorpCRS_fcurRefund]  DEFAULT ((0)) FOR [fcurRefund]
GO
/****** Object:  Default [DF_tblScorpCRS_fblnFilled]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCRS] ADD  CONSTRAINT [DF_tblScorpCRS_fblnFilled]  DEFAULT ((0)) FOR [fblnFilled]
GO
/****** Object:  Default [DF_tblScorpCRS_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCRS] ADD  CONSTRAINT [DF_tblScorpCRS_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblScorpCRS_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCRS] ADD  CONSTRAINT [DF_tblScorpCRS_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  Default [DF_tblScorpCRS_fstrMPDLN]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCRS] ADD  CONSTRAINT [DF_tblScorpCRS_fstrMPDLN]  DEFAULT (' ') FOR [fstrMPDLN]
GO
/****** Object:  Default [DF_tblScorpCRS_fstrTaxForm]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCRS] ADD  CONSTRAINT [DF_tblScorpCRS_fstrTaxForm]  DEFAULT (' ') FOR [fstrTaxForm]
GO
/****** Object:  Default [DF_tblScorpCRS_fstrSource]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCRS] ADD  CONSTRAINT [DF_tblScorpCRS_fstrSource]  DEFAULT ('GENTAX') FOR [fstrSource]
GO
/****** Object:  Default [DF_tblScorpCRS_fblnFound]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCRS] ADD  CONSTRAINT [DF_tblScorpCRS_fblnFound]  DEFAULT ((0)) FOR [fblnFound]
GO
/****** Object:  Default [DF_tblScorpCrsT_fcurTotApplied1]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCrsT] ADD  CONSTRAINT [DF_tblScorpCrsT_fcurTotApplied1]  DEFAULT ((0)) FOR [fcurTotApplied1]
GO
/****** Object:  Default [DF_tblScorpCrsT_fcurTotRefund1]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCrsT] ADD  CONSTRAINT [DF_tblScorpCrsT_fcurTotRefund1]  DEFAULT ((0)) FOR [fcurTotRefund1]
GO
/****** Object:  Default [DF_tblScorpCrsT_fcurTotApplied2]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCrsT] ADD  CONSTRAINT [DF_tblScorpCrsT_fcurTotApplied2]  DEFAULT ((0)) FOR [fcurTotApplied2]
GO
/****** Object:  Default [DF_tblScorpCrsT_fcurTotRefund2]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCrsT] ADD  CONSTRAINT [DF_tblScorpCrsT_fcurTotRefund2]  DEFAULT ((0)) FOR [fcurTotRefund2]
GO
/****** Object:  Default [DF_tblScorpCrsT_fstrWho]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCrsT] ADD  CONSTRAINT [DF_tblScorpCrsT_fstrWho]  DEFAULT (' ') FOR [fstrWho]
GO
/****** Object:  Default [DF_tblScorpCrsT_fdtmWhen]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[tblScorpCrsT] ADD  CONSTRAINT [DF_tblScorpCrsT_fdtmWhen]  DEFAULT (getdate()) FOR [fdtmWhen]
GO
/****** Object:  ForeignKey [FK__aspnet_Me__Appli__2D9297B4]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Me__UserI__2E86BBED]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pa__Appli__5F29F348]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__64E2CC9E]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__68B35D82]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__UserI__69A781BB]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pr__UserI__428DB49A]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Ro__Appli__4C171ED4]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__Appli__1D5C2FEB]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__RoleI__50DBD3F1]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__UserI__4FE7AFB8]    Script Date: 08/04/2015 12:40:33 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO

