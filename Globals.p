UNIT Globals;
INTERFACE
USES
{$L-}
{$U-}
		{$LOAD MQOTP.dumpfile}
		Memtypes, QuickDraw, OSIntf, ToolIntf, PackIntf {$LOAD};
{$U+}
CONST
	NoCntry		= 80; { Number of Countries }
  
  	{ 13-17 used to fill country region with specific pattern }
	Iwhite		= 0; { White }
	Iltgray 	= 1; { Light Gray }
	Igray 		= 2; { Gray }
	Idkgray 	= 3; { Dark Gray }
	Iblack 		= 4; { Black }
  
	MaxNews 	= 128;
  
  	{ 22-30 used for CASE statement decisions related to Make Policies }
	Destabl 	= 0; { Destabalize }
	Econ   		= 1; { Economic Aid }
	Miltry 		= 2; { Military Aid }
	Insg   		= 3; { Aid to Insurgents }
	IntGov 		= 4; { Intervene for Govt }
	IntReb 		= 5; { Intervene for Rebels }
	Pressur 	= 6; { Diplomatic Pressure }
	Treato 		= 7; { Treaty }
	Trado		= 8; { Trade Policy }

TYPE
	RgnArr 		= ARRAY[1..NoCntry] OF RgnHandle;
	NamArr 		= ARRAY[1..NoCntry] OF String[16];
	IntArr 		= ARRAY[1..NoCntry] OF Integer;
	DIntArr 	= ARRAY[1..2] OF IntArr;
	LongIntArr 	= ARRAY[1..NoCntry] OF LongInt;
	MenArr 		= ARRAY[0..8] OF MenuHandle;
	NewsType 	= ARRAY[1..MaxNews] OF LongInt;
	Str32 		= string[32];
	NewStrArr 	= ARRAY[1..5] OF String[255];
	FlagArr 	= ARRAY[1..NoCntry] OF BOOLEAN;
	ShortIArr 	= ARRAY[1..8] OF Integer;
	PixelArr 	= ARRAY[1..576] OF Integer;
	PageArr 	= ARRAY[0..255] OF Integer;
	DorkArr 	= ARRAY [0..271] OF Integer;
	ScoreArr 	= ARRAY [1..10] OF Integer;
	DInteger 	= ARRAY [1..2] OF Integer;

	{ Two-Dimensional Integer Array}
	TwoDArr		= ARRAY[1..80] OF ARRAY[1..80] OF Integer;
	TwoDPtr		= ^TwoDArr;
	TwoDHndl	= ^TwoDPtr;

	{ Two-Dimensional Boolean Array }
	TwoFArr		= ARRAY[1..80] OF ARRAY[1..80] OF Boolean;
	TwoFPtr		= ^TwoFArr;
	TwoFHndl	= ^TwoFPtr;
	
VAR
	CntryRgn:	RgnArr;
	MenuArr:	MenArr;
	StartDummy:	Integer;
	Level:		Integer;
	Human:		Integer;
	Cmptr:		Integer;
	TwoPFlag:	Boolean;
	myEvent:	EventRecord;
	myWind:		WindowPtr;
	whichWindow:	WindowPtr;
	MainWind:	WindowPtr;
	whichControl:	ControlHandle;
	Junk1:		Size;
	Junk2:		Size;
	MidDummy:	Integer;
	CntryNam:	NamArr; { Country Name by Country array }
	Popln:		IntArr; { Population by Country array }
	GNP:		IntArr; { Gross National Product by Country array }
	GovtWing:	IntArr; { Government Wing by Country array }
	InsgWing:	IntArr; { Insurgency Wing by Country array }
	GovtAid:	IntArr;
	PrestVal:	IntArr;
	ConsFrac:	IntArr;
	MiltFrac:	IntArr;
	InvtFrac:	IntArr;
	ConsSpnd:	IntArr;
	MiltSpnd:	IntArr; { Military Spending by Country array }
	InvtSpnd:	IntArr;
	MilPowr:	IntArr;
	MilMen:		IntArr; { Military Manpower by Country array }
	DrafFrac:	IntArr; { Draft Fraction by Country array }
	DontMess:	IntArr; { Don't Mess by Country array }
	Maturity:	IntArr;
	StrngRat:	IntArr;
	CntryCol:	IntArr; { Country Color by Country array }
	CntryRnd:	IntArr; { Real (?) random number by Country array (between 0 and 1, 0 and 1 excluded) }
	GovtStrg:	IntArr; { Government Strength by Country array }
	InsgStrg:	IntArr; { Insurgency Strength by Country array }
	InsgPowr:	IntArr;
	DebgArr1:	IntArr;
	DebgArr2:	IntArr;
	DebgArr3:	IntArr;
	DebgArr4:	IntArr;
	RevlGain:	DIntArr;
	CoupGain:	DIntArr;
	FinlGain:	DIntArr;
	HistDum2:	Integer;
	LeftPowr:	FlagArr;
	FinlFlag:	FlagArr;
	CoupFlag:	FlagArr;
	RebWinFlag:	FlagArr;
	Pressure:	DIntArr;
	Treaty:		DIntArr;
	FinlProb:	DIntArr;
	Destab:		DIntArr;
	EconAid:	DIntArr;
	GPopular:	IntArr;
	MiltPress:	IntArr;
	DipAffDum:	DIntArr;
	IntvIDum:	DIntArr;
	IAidDum:	DIntArr;
	IntvGDum:	DIntArr;
	MAidDum:	DIntArr;
	SqrtStrg:	IntArr;
	HistDum1:	Integer;
	Virgin:		FlagArr;
	OldFinPb:	DIntArr;
	EconAOld:	DIntArr;
	DestaOld:	DIntArr;
	TreatOld:	DIntArr;
	PressOld:	DIntArr;
	Trade:		DIntArr;
	OldGStrg:	IntArr;
	OldIStrg:	IntArr;
	OldGPopl:	IntArr;
	QuitFlag:	Boolean;
	TwoPActF:	Boolean;
	WinFlag:	Boolean;
	DemoFlag:	Boolean;
	ANWFlag:	Boolean;
	CullFlag:	Boolean;
	NoUndoFlag:	Boolean;
	PButHandle:	ControlHandle;
	NButHandle:	ControlHandle;
	RespHndl:	ControlHandle;
	HitCntry:	Integer;
	Year:		Integer;
	OldVHigh:	Integer;
	GoingOut:	Boolean;
	NewsQCtr:	Integer;
	Pugnacty:	DInteger;
	Integrty:	DInteger;
	Adventur:	DInteger;
	TotlIntv:	IntArr;
	Nastiness:	Integer;
	CntryCount:	Integer;
	OldHit:		Integer;
	SumDMess:	Integer;
	AveDMess:	Integer;
	IUSAStrng:	Integer;
	IUSSRStrng:	Integer;
	OldAScor:	Integer;
	OldRScor:	Integer;
	USAStrng:	Integer;
	USSRStrng:	Integer;
	LastNews:	Integer;
	USAScor:	ScoreArr;
	USSRScor:	ScoreArr;
	TimeOfHit:	LongInt;
	Contigus:	ARRAY[1..NoCntry] OF PACKED ARRAY[1..NoCntry] OF Boolean;
	BufferMap:	BitMap;
	BufferHandle:	Handle;
  	BufferRect:	Rect;
	ReplayFlag:	Boolean;
	Host:		ARRAY[1..MaxNews] OF Integer;
	Subject:	ARRAY[1..MaxNews] OF Integer;
	Verb:		ARRAY[1..MaxNews] OF Integer;
	Object:		ARRAY[1..MaxNews] OF Integer;
	NewNVal:	ARRAY[1..MaxNews] OF Integer;
	OldNVal:	ARRAY[1..MaxNews] OF Integer;
	NewsWorth:	ARRAY[1..MaxNews] OF Integer;
	CrisisVal:	ARRAY[1..MaxNews] OF Boolean;
	GlobSubj:	Integer;
	GlobVerb:	Integer;
	GlobObj:	Integer;
	GlobOldV:	Integer;
	GlobNewV:	Integer;
	GlobHost:	Integer;
	GlobCris:	Boolean;
	DipAff:		TwoDHndl;
	MiltAid:	TwoDHndl;
	IntvGovt:	TwoDHndl;
	InsgAid:	TwoDHndl;
	IntvRebl:	TwoDHndl;
	MiltAOld:	TwoDHndl;
	InsgAOld:	TwoDHndl;
	IntvGOld:	TwoDHndl;
	IntvROld:	TwoDHndl;
	MinorSph:	TwoFHndl;
	AdviseFlag:	Boolean;
	AdvisorFace:	ARRAY[1..4] OF BitMap;
	EndDummy:	Integer;
	
PROCEDURE MyWrite(Mantissa: Integer);
PROCEDURE ClearRect(Right,Top,Left,Bottom: Integer);
FUNCTION 	EconConv(Value: Integer): Integer;
FUNCTION 	MAidConv(Value: Integer): Integer;
FUNCTION 	IntvConv(Value: Integer): Integer;
FUNCTION 	EconAMax(x: Integer): Integer;
FUNCTION 	MilMax(x: Integer): Integer;
FUNCTION 	IntvGMax(x,DAij: Integer): Integer;
FUNCTION 	TreatMax(x: Integer): Integer;
PROCEDURE MaxPolcy(Giver: Integer; VAR MaxIntv: Integer; VAR MaxInsg: Integer);
FUNCTION 	InsgAMax(SuprPowr,MinrPowr: Integer): Integer;
FUNCTION 	InsgIMax(SuprPowr,MinrPowr: Integer): Integer;
FUNCTION 	Should(Treata: Integer): Integer;
PROCEDURE SpinWheel(DelayInt: Integer);
PROCEDURE ChgDipAff(i,j,delta: Integer);
PROCEDURE WritScor;
PROCEDURE ReDrawMap;
PROCEDURE SaveMap;
PROCEDURE FillCntry(i,IColor: INTEGER);
PROCEDURE ClearDeck;
FUNCTION 	ReadMouse(Mask: Boolean): Integer;
PROCEDURE CalcScores;
PROCEDURE TimeMesg(OutString: Str255);
FUNCTION MySqrt(Value: LongInt): Integer;
PROCEDURE InsrtNews(Sub,Ver,Obj,Old,New,Hos: Integer; Cri: Boolean);
PROCEDURE DoPolicy(Sub,Ver,Obj,New: Integer; Cri: Boolean);
FUNCTION Impt(ToWhom,Ver,Obj,Old,New: Integer): Integer;
FUNCTION GImpt(Sub,Ver,Obj,Old,New,Bias: Integer; VAR USAImpt: Integer; VAR USSRImpt: Integer): Integer;
FUNCTION Hurt(Ver,Obj,Old,New: Integer): Integer;
PROCEDURE Headline(Base,rank,Vert,LoclSubj,LoclObj,Old: Integer; LoclCris: Boolean);
PROCEDURE GetLabels(Cntry: Integer; 
								VAR AdjectStr,CaptlStr,LeadrStr,LeftStr,RigtStr,NameStr: Str32);
PROCEDURE GrafScor;
PROCEDURE EndGame;
PROCEDURE ExchangP;
FUNCTION  YourOpen(FileName: Str255): Integer;
FUNCTION Influence(SuperPower,Minor: Integer): Integer;
PROCEDURE ChgDMess(Who,HowMuch: Integer);
PROCEDURE ReadFaces;

IMPLEMENTATION
{**********************************************************************}
PROCEDURE MyWrite;
VAR
	LongX:			 LongInt;
	NumString:	 Str255;
BEGIN
	LongX:=ord4(Mantissa);
	NumToString(LongX,NumString);
	DrawString(NumString);
END;
{**********************************************************************}
PROCEDURE ClearRect;
VAR	TempRect:	Rect;
BEGIN
	SetRect(TempRect,Right,Top,Left,Bottom);
	FillRect(TempRect,white);
END;
{**********************************************************************}
FUNCTION EconConv;
BEGIN
	CASE Value OF
		0: EconConv:=0;
		1: EconConv:=1;
		2: EconConv:=2;
		3: EconConv:=5;
		4: EconConv:=10;
		5: EconConv:=20;
	END;
END;
{**********************************************************************}
FUNCTION MAidConv;
BEGIN
	CASE Value OF
		0: MAidConv:=0;
		1: MAidConv:=1;
		2: MAidConv:=5;
		3: MAidConv:=20;
		4: MAidConv:=50;
		5: MAidConv:=100;
	END;
END;
{**********************************************************************}
FUNCTION IntvConv;
BEGIN
	CASE Value OF
		0: IntvConv:=0;
		1: IntvConv:=1;
		2: IntvConv:=5;
		3: IntvConv:=20;
		4: IntvConv:=100;
		5: IntvConv:=500;
	END;
END;
{**********************************************************************}
FUNCTION EconAMax;
BEGIN
	EconAMax:=0;
	IF x> -60 THEN EconAMax:=1;
	IF x> -40 THEN EconAMax:=2;
	IF x> -20 THEN EconAMax:=3;
	IF x>	 0	THEN EconAMax:=4;
	IF x>	 20 THEN EconAMax:=5;
END;
{**********************************************************************}
FUNCTION MilMax;
BEGIN
	MilMax:=0;
	IF x>-40 THEN MilMax:=1;
	IF x>-20 THEN MilMax:=2;
	IF x>	 0 THEN MilMax:=3;
	IF x> 20 THEN MilMax:=4;
	IF x> 40 THEN MilMax:=5;
END;
{**********************************************************************}
FUNCTION IntvGMax;
{x is treaty level, DAij is diplomatic affinity}
BEGIN
	IF Level>=3
		THEN
			BEGIN
				IntvGMax:=0;
				IF x=3 THEN IntvGMax:=2;
				IF x=4 THEN IntvGMax:=4;
				IF x=5 THEN IntvGMax:=5;
			END
		ELSE
			BEGIN
				IntvGMax:=0;
				IF DAij>0 THEN IntvGMax:=1;
				IF DAij>20 THEN IntvGMax:=2;
				IF DAij>40 THEN IntvGMax:=3;
				IF DAij>60 THEN IntvGMax:=4;
				IF DAij>80 THEN IntvGMax:=5;
			END;
END;
{**********************************************************************}
FUNCTION TreatMax;
{x is integrity plus diplomatic affinity minus pugnacity}
BEGIN
	TreatMax:=0;
	IF x>-60 THEN TreatMax:=1;
	IF x>0 THEN TreatMax:=2;
	IF x>40 THEN TreatMax:=3;
	IF x>60 THEN TreatMax:=4;
	IF x>100 THEN TreatMax:=5;
	IF Level<3 THEN TreatMax:=5;
END;
{**********************************************************************}
PROCEDURE MaxPolcy;
VAR i,SumIntv,SumMilt,Men,Spnd:	 Integer;
BEGIN
	SumIntv:=TotlIntv[Giver];
	SumMilt:=GovtAid[Giver];
	Men:=MilMen[Giver];
	Spnd:=MiltSpnd[Giver];
	MaxIntv:=5; MaxInsg:=5;
	FOR i:=4 DOWNTO 0 DO IF MAidConv(i+1)>((Spnd div 8)+SumMilt) THEN MaxInsg:=i;
	FOR i:=4 DOWNTO 0 DO IF IntvConv(i+1)>((Men div 4)-SumIntv) THEN MaxIntv:=i;
END;
{**********************************************************************}
FUNCTION InsgAMax;
VAR i,x,max:	Integer;
BEGIN
	max:=1;
	IF Contigus[SuprPowr,MinrPowr]
		THEN max:=5
		ELSE
			BEGIN
				FOR i:=3 TO NoCntry DO
					BEGIN
						IF Contigus[i,MinrPowr] THEN
							BEGIN
								x:=IntvGovt^^[SuprPowr,i];
								IF x<5 THEN x:=x+1;
								IF x>max THEN max:=x;
							END;
					END;
			END;
	InsgAMax:=max;
END;
{**********************************************************************}
FUNCTION InsgIMax;
VAR i,x,y:	Integer;
BEGIN
	y:=2;
	IF Contigus[SuprPowr,MinrPowr]
		THEN y:=5
		ELSE
			BEGIN
				FOR i:=3 TO NoCntry DO
					BEGIN
						IF Contigus[i,MinrPowr] THEN
							BEGIN
								x:=IntvGovt^^[SuprPowr,i];
								IF x<5 THEN x:=x+1;
								IF x>y THEN y:=x;
							END;
					END;
			END;
	InsgIMax:=y;
END;
{**********************************************************************}
FUNCTION Should;
BEGIN
	CASE Treata OF
		0: Should:=0;
		1: Should:=16;
		2: Should:=32;
		3: Should:=64;
		4: Should:=96;
		5: Should:=128;
	END;
END;
{**********************************************************************}
PROCEDURE SpinWheel;
VAR DelayT:		 LongInt;
BEGIN
	DelayT:=TickCount;
	REPEAT UNTIL TickCount > DelayT+DelayInt;
END;
{**********************************************************************}
PROCEDURE ChgDipAff;
VAR
	x:		Integer;
BEGIN
	x:=DipAff^^[i,j]+delta;
	IF x>127 THEN x:=127;
	IF x<-127 THEN x:=-127;
	DipAff^^[i,j]:=x;
	DipAff^^[j,i]:=x;
END;
{**********************************************************************}
PROCEDURE WritScor;
BEGIN
	ClearRect(215,330,510,340); 
	TextFont(1); 
	TextSize(12);
	MoveTo(220,340); 
	DrawString('USA Score:	 '); 
	MyWrite(USAStrng-IUSAStrng);
	DrawString('				USSR Score:	 '); 
	MyWrite(USSRStrng-IUSSRStrng);
	{SetFontLock(TRUE);} 
	TextFont(0);
END;
{**********************************************************************}
PROCEDURE RedrawMap;
BEGIN
  HLock(BufferHandle);
  BufferMap.baseaddr:=BufferHandle^;
  CopyBits(BufferMap,MainWind^.portbits,BufferRect,BufferRect,srcCopy,NIL);
	HUnlock(BufferHandle);
	WritScor;
END;  
{**********************************************************************}
PROCEDURE SaveMap;
BEGIN
  HLock(BufferHandle);
  BufferMap.baseaddr:=BufferHandle^;
  CopyBits(MainWind^.portbits,BufferMap,BufferRect,BufferRect,srcCopy,NIL);
	HUnlock(BufferHandle);
END;
{**********************************************************************}
PROCEDURE FillCntry;
{fills a country region with the specified color}
VAR
	Color:	 PATTERN;
BEGIN
	CASE Icolor OF
		Iwhite:	 Color:=white;
		Iltgray:	Color:=ltgray;
		Igray:		Color:=gray;
		Idkgray:	Color:=dkgray;
		Iblack:	 Color:=black;
	END;
	IF CntryCol[i]<>IColor THEN
		BEGIN
			CntryCol[i]:=IColor;
			FillRgn(CntryRgn[i],Color);
			FrameRgn(CntryRgn[i]);
		END;
END;
{**********************************************************************}
PROCEDURE ClearDeck;
BEGIN
	 SetPort(MainWind);
	 KillControls(MyWind);
	 DisposeWindow(MyWind);
	 RedrawMap;
END;
{**********************************************************************}
FUNCTION ReadMouse;
VAR JunkFlag:		Boolean;
BEGIN
	ReadMouse:=0;
	JunkFlag:=GetNextEvent(everyEvent,myEvent);
	IF myEvent.what=Mousedown THEN
		BEGIN
			IF FindWindow(myEvent.where,MyWind)=inContent THEN
				BEGIN
					SetOrigin(0,0);
					GlobalToLocal(myEvent.where);
					IF FindControl(myEvent.where,myWind,whichControl) > 0 THEN
								ReadMouse:=TrackControl(whichControl,myEvent.where,NIL)
				END;				{of FindWindow IF}
			IF Mask THEN
				BEGIN
					IF FindWindow(myEvent.where,MyWind)=inGoAway THEN
						BEGIN
							IF TrackGoAway(MyWind,myEvent.where) THEN
								BEGIN
									ClearDeck;
									ReadMouse:=-1;
								END;
						END;
				END;
		END;
END;
{**********************************************************************}
PROCEDURE CalcScores;
VAR
	i:					Integer;
	Sum1,Sum2:		LongInt;
BEGIN
	Sum1:=0; 
	Sum2:=0;
	FOR i:=3 TO NoCntry DO
		BEGIN
			Sum1:=Sum1+ord4(DipAff^^[i,1])*ord4(PrestVal[i]);
			Sum2:=Sum2+ord4(DipAff^^[i,2])*ord4(PrestVal[i]);
		END;
	USAStrng:=Sum1 div 1024; 
	USSRStrng:=Sum2 div 1024;
END;
{********************************************************************************}
PROCEDURE TimeMesg;
BEGIN
	ClearRect(10,20,219,36); 
	MoveTo(10,32); 
	DrawString(OutString);
END;
{********************************************************************************}
FUNCTION MySqrt;
	 external;
{********************************************************************************}
PROCEDURE InsrtNews;
VAR
	i,j:					Integer;
	LowI:					Integer;
	Lowest:				Integer;
	Import:				Integer;
	Worth:				Integer;
	LoclOld:			Integer;
	LoclCri:			Boolean;
BEGIN
	IF Sub=Obj THEN
		BEGIN
			CASE Ver OF
				Destabl:		Import:=5;	 {no apparent meaning any longer}
				Econ:				Import:=14; {rebels win}
				Miltry:			Import:=10; {executive transfer}
				Insg:				Import:=2;	{undefined}
				IntGov:			Import:=2;	{undefined}
				IntReb:			Import:=2;	{undefined}
				Pressur:		Import:=2;	{undefined}
				Treato:			Import:=0;	{"That's the News"}
			END;
		END
	ELSE
		BEGIN
			CASE Ver OF
				Destabl:		Import:=4;
				Econ:				Import:=3;
				Miltry:			Import:=5;
				Insg:				Import:=5;
				IntGov:			Import:=10;
				IntReb:			Import:=10;
				Pressur:		IF New>Old THEN Import:=2 ELSE Import:=12;
				Treato:			Import:=5;
				Trado:			Import:=2;
			END;
		END;
	Import:=Import*(1+Abs(New-Old));
	IF Old>New THEN Import:=Import-1;
	Import:=MySqrt(((MySqrt(ord4(PrestVal[Sub])*PrestVal[Obj]))+1)*ord4(Import));
	IF Import<1 THEN Import:=1;
	
	CullFlag:=FALSE;
	LoclOld:=Old;
	LoclCri:=Cri;
	i:=1;
	WHILE (i<=NewsQCtr) & NOT CullFlag DO
		BEGIN
			IF (Subject[i]=Sub) & (Verb[i]=Ver) & (Object[i]=Obj) THEN
				BEGIN
					LoclOld:=OldNVal[i];
					LoclCri:=(New<=LoclOld);
					j:=i;
					WHILE j<NewsQCtr DO
						BEGIN
							Subject[j]:=Subject[j+1];
							Verb[j]:=Verb[j+1];
							Object[j]:=Object[j+1];
							OldNVal[j]:=OldNVal[j+1];
							NewNVal[j]:=NewNVal[j+1];
							Host[j]:=Host[j+1];
							CrisisVal[j]:=CrisisVal[j+1];
							NewsWorth[j]:=NewsWorth[j+1];
							j:=j+1;
						END;
					NewsQCtr:=NewsQCtr-1;
					CullFlag:=TRUE;
					IF i<LastNews THEN LastNews:=LastNews-1;
				END;
			i:=i+1;
		END;
	IF NOT CullFlag OR (LoclOld<>New) THEN
		BEGIN
			LowI:=NewsQCtr;
			NewsQCtr:=NewsQCtr+1;
			IF NewsQCtr>MaxNews THEN NewsQCtr:=MaxNews;
			Lowest:=Import;
			WHILE (LowI>1) & (NewsWorth[LowI]<Lowest) DO LowI:=LowI-1;
			IF (LowI>0) & (NewsWorth[LowI]<Lowest) THEN LowI:=0;
			IF LowI<MaxNews THEN
				BEGIN
					IF (LowI<(MaxNews-1)) & ((LowI+1)<=(NewsQCtr-1)) THEN
						FOR i:=NewsQCtr-1 DOWNTO LowI+1 DO
							BEGIN
								Subject[i+1]:=Subject[i];
								Verb[i+1]:=Verb[i];
								Object[i+1]:=Object[i];
								OldNVal[i+1]:=OldNVal[i];
								NewNVal[i+1]:=NewNVal[i];
								Host[i+1]:=Host[i];
								CrisisVal[i+1]:=CrisisVal[i];
								NewsWorth[i+1]:=NewsWorth[i];
							END;
					Subject[LowI+1]:=Sub;
					Verb[LowI+1]:=Ver;
					Object[LowI+1]:=Obj;
					OldNVal[LowI+1]:=LoclOld;
					NewNVal[LowI+1]:=New;
					Host[LowI+1]:=Hos;
					CrisisVal[LowI+1]:=LoclCri;
					NewsWorth[LowI+1]:=Import;
					IF LowI<LastNews THEN LastNews:=LastNews+1;
				END;
		END;
	{$IFC DebugFlg}
	IF (Sub=2) & (Ver=6) & (old=1) & (New=1) THEN
		BEGIN
			MoveTo(100,100); DrawString('USSR at war news item: ');
			MyWrite(Obj);
			REPEAT UNTIL Button;
		END;
	{$ENDC}
END;
{********************************************************************************}
PROCEDURE DoPolicy;
{executes a policy declaration by a superpower only, not its results}
VAR
	OldVal:		Integer;
BEGIN
	CASE Ver OF
		Destabl:
			BEGIN 
				OldVal:=Destab[Sub,Obj]; 
				Destab[Sub,Obj]:=New; 
			END;
		Econ:
			BEGIN 
				OldVal:=EconAid[Sub,Obj]; 
				EconAid[Sub,Obj]:=New; 
			END;
		Miltry:
			BEGIN
				OldVal:=MiltAid^^[Sub,Obj]; 
				MiltAid^^[Sub,Obj]:=New;
				GovtAid[Obj]:=GovtAid[Obj]-MAidConv(OldVal)+MAidConv(New);
				GovtAid[Sub]:=GovtAid[Sub]+MAidConv(OldVal)-MAidConv(New);
			END;
		Insg:
			BEGIN
				OldVal:=InsgAid^^[Sub,Obj]; 
				InsgAid^^[Sub,Obj]:=New;
				GovtAid[Sub]:=GovtAid[Sub]+MAidConv(OldVal)-MAidConv(New);
			END;
		IntGov:
			BEGIN
				OldVal:=IntvGovt^^[Sub,Obj]; 
				IntvGovt^^[Sub,Obj]:=New;
				TotlIntv[Sub]:=TotlIntv[Sub]-IntvConv(OldVal)+IntvConv(New);
			END;
		IntReb:
			BEGIN
				OldVal:=IntvRebl^^[Sub,Obj]; 
				IntvRebl^^[Sub,Obj]:=New;
				TotlIntv[Sub]:=TotlIntv[Sub]-IntvConv(OldVal)+IntvConv(New);
			END;
		Pressur:
			BEGIN 
				OldVal:=Pressure[Sub,Obj]; 
				Pressure[Sub,Obj]:=New; 
			END;
		Treato:
			BEGIN 
				OldVal:=Treaty[Sub,Obj]; 
				Treaty[Sub,Obj]:=New; 
			END;
		Trado:
			BEGIN
				OldVal:=Trade[Sub,Obj];
				Trade[Sub,Obj]:=New;
				Cri:=FALSE;
			END;
	END;
	IF (OldVal<>New) | (Sub=Human) THEN InsrtNews(Sub,Ver,Obj,OldVal,New,Obj,Cri);
	{$IFC DebugFlg}
	IF (Obj=2) & (Ver=IntGov) THEN
		BEGIN
			MoveTo(100,100); DrawString('Troop withdrawal from USSR ');
			MyWrite(Sub);
			REPEAT UNTIL Button;
		END;
	{$ENDC}
END;
{************************************************************************}
FUNCTION Hurt;
VAR x:	Integer;
BEGIN
	CASE Ver OF
		Destabl:	 x:=16*(New-Old);
		Econ:			 BEGIN
									x:=-((1024*(EconConv(New)-EconConv(Old)))
											div GNP[Obj]) div (GPopular[Obj]+1);
									IF x=0 THEN x:=Old-New;
								END;
		Miltry:		 BEGIN
									x:=((Old-New)*MiltPress[Obj]) div 4;
									IF x=0 THEN x:=Old-New;
								END;
		Insg:			 x:=12*(New-Old);
		IntGov:		 BEGIN
									x:=((Old-New)*MiltPress[Obj]) div 2;
									IF x=0 THEN x:=Old-New;
								END;
		IntReb:		 x:=25*(New-Old);
		Pressur:		x:=8*New;
		Treato:		 BEGIN
									x:=((Old-New)*MiltPress[Obj]) div 4;
									IF x=0 THEN x:=Old-New;
								END;
	END;
	IF x>127 THEN x:=127; 
	IF x<-127 THEN x:=-127;
	Hurt:=x;
END;
{*************************************************************************}
FUNCTION Impt;
BEGIN
	Impt:=(Hurt(Ver,Obj,Old,New)*DipAff^^[ToWhom,Obj]) div 128;
END;
{*************************************************************************}
{FUNCTION GImpt;
CONST
	MaxLongVal = 134144000;
VAR
	i:	Integer;
	x,y,z,t:	LongInt;
	Lx,Ly,Lz:	LongInt;
BEGIN
	FOR i:=1 TO 2 DO
		BEGIN
			x:=DipAff^^[i,Obj];
			IF (Ver=IntReb) AND (Sub=(3-i)) THEN x:=x+New*8;
			x:=x+Should(Treaty[i,Obj]);
			y:=(ord4(DontMess[Obj])*640) div SumDMess;
			IF y>15 THEN y:=15; 
			IF y<1 THEN y:=1;
			IF i=2 THEN y:=16-y;
			IF (Ver=IntGov) OR (Ver=IntReb) THEN y:=y+8;
			z:=Hurt(Ver,Obj,Old,New);
			IF (Sub=(3-i)) &
				 ((Ver=Miltry) | (Ver=IntGov) | (Ver=Treato)) & (x>0)
				THEN z:=-z;
			t:=(ord4(Adventur[i])*PrestVal[Obj]) div 128;
			IF t<1 THEN t:=1;
			CASE Bias OF
				0: BEGIN END;
				1: BEGIN z:=z*MySqrt(Abs(z)); x:=MySqrt(Abs(x)); END;
				2: BEGIN z:=z*MySqrt(Abs(z)); t:=MySqrt(t); END;
				3: BEGIN y:=y*y; x:=MySqrt(Abs(x)); END;
				4: BEGIN y:=y*y; t:=MySqrt(t); END;
			END;
			Lx:=z*x*y*t;
			IF i=1 THEN Ly:=Lx ELSE Lz:=Lx;
			IF Lx>MaxLongVal THEN Lx:=MaxLongVal;
			IF Lx<-MaxLongVal THEN Lx:=-MaxLongVal;
			Lx:=Lx div 8192;
			IF i=1 THEN USAImpt:=Lx ELSE USSRImpt:=Lx;
		END;
	Lx:=Ly+Lz;
	IF Lx>MaxLongVal THEN Lx:=MaxLongVal;
	IF Lx<-MaxLongVal THEN Lx:=-MaxLongVal;
	GImpt:=Lx div 8192;
END;}
{*************************************************************************}
FUNCTION GImpt;
CONST
	MaxLongVal = 134144000;
VAR
	i:					Integer;
	x,y,z,t,v:	Integer;
	Lx,Ly,Lz:		LongInt;
BEGIN
	FOR i:=1 TO 2 DO
		BEGIN
			x:=DipAff^^[i,Obj] div 4;
			IF x=0 THEN x:=1;
			y:=(Should(Treaty[i,Obj]) div 4)+1;
			z:=(ord4(DontMess[Obj])*1280) div SumDMess;
			IF z>32 THEN z:=32; 
			IF z<1 THEN z:=1;
			IF i=2 THEN z:=33-z;
			t:=Adventur[i] div 2;
			IF t>32 THEN t:=32;
			IF t<1 THEN t:=1;
			v:=Hurt(Ver,Obj,Old,New);
			IF (Sub=(3-i)) &
				 ((Ver=Miltry) | (Ver=IntGov) | (Ver=Treato)) & (DipAff^^[i,Obj]>0)
				THEN v:=-v;
			CASE Bias OF
				0: BEGIN END;
				1: BEGIN x:=x*MySqrt(Abs(x)); y:=MySqrt(y); END;
				2: BEGIN y:=y*MySqrt(y); z:=MySqrt(z); END;
				3: BEGIN z:=z*MySqrt(z); t:=MySqrt(t); END;
				4: BEGIN
						 t:=t*MySqrt(t);
						 IF x>0 THEN x:=MySqrt(x) ELSE x:=-MySqrt(Abs(x)); 
					 END;
			END;
			Lx:=((ord4(z)*x*y*t*v) div 64)*ord4(PrestVal[Obj]);
			{IF (Obj=45) OR (Obj=51) OR (Obj=49) OR (Obj=17) THEN
				BEGIN
					ClearRect(0,100,500,150);
					MoveTo(10,140);
					MyWrite(Obj);
					DrawString('  ');
					MyWrite(x);
					DrawString('  ');
					MyWrite(y);
					DrawString('  ');
					MyWrite(z);
					DrawString('  ');
					MyWrite(t);
					DrawString('  ');
					MyWrite(v);
					REPEAT UNTIL NOT Button; REPEAT UNTIL Button;
				END;}
			IF i=1 THEN Ly:=Lx ELSE Lz:=Lx;
			IF Lx>MaxLongVal THEN Lx:=MaxLongVal;
			IF Lx<-MaxLongVal THEN Lx:=-MaxLongVal;
			Lx:=Lx div 4096;
			IF i=1 THEN USAImpt:=Lx ELSE USSRImpt:=Lx;
		END;
	Lx:=Ly+Lz;
	IF Lx>MaxLongVal THEN Lx:=MaxLongVal;
	IF Lx<-MaxLongVal THEN Lx:=-MaxLongVal;
	GImpt:=Lx div 4096;
END;
{********************************************************************************}
PROCEDURE GetLabels;
VAR
	StrHandle:		StringHandle;
	j,k:					Integer;
BEGIN
	StrHandle:=GetString(1000+Cntry);
	j:=1;	 k:=1;
	REPEAT k:=k+1; UNTIL StrHandle^^[k] = '*';
	AdjectStr:=Copy(StrHandle^^,j,k-j);
	k:=k+1;	j:=k;
	REPEAT k:=k+1; UNTIL StrHandle^^[k] = '*';
	CaptlStr:=Copy(StrHandle^^,j,k-j);
	k:=k+1;	j:=k;
	REPEAT k:=k+1; UNTIL StrHandle^^[k] = '*';
	LeadrStr:=Copy(StrHandle^^,j,k-j);
	k:=k+1;	j:=k;
	REPEAT k:=k+1; UNTIL StrHandle^^[k] = '*';
	LeftStr:=Copy(StrHandle^^,j,k-j);
	k:=k+1;	j:=k;
	REPEAT k:=k+1; UNTIL StrHandle^^[k] = '*';
	RigtStr:=Copy(StrHandle^^,j,k-j);
	k:=k+1;	j:=k;
	REPEAT k:=k+1; UNTIL StrHandle^^[k] = '*';
	NameStr:=Copy(StrHandle^^,j,k-j);
	ReleaseResource(pointer(StrHandle));
END;
{********************************************************************************}
PROCEDURE Headline;
{write a headline specified by Base, rank, LoclSubj, and object}
CONST
	adject = '/';
	leader = '&';
	insgnm = '%';
	capitl = '@';
	Sname	 = '?';
	OAdject = '>';
	OLeader = '+';
	OInsgnm = '#';
	OCapitl = '^';
	OName		= '!';
	LineWidth = 30;

VAR
	i,j,k,x:		Integer;
	StrHandle:	StringHandle;
	Flag:				Boolean;
	insrtflg:		Boolean;
	AdjectStr:	Str32;
	CaptlStr:	 	Str32;
	LeadrStr:	 	Str32;
	LeftStr:	 	Str32;
	RigtStr:	 	Str32;
	NameStr:	 	Str32;
	OAdjectSt:	Str32;
	OCaptlSt:	 	Str32;
	OLeadrSt:	 	Str32;
	OLeftStr:	 	Str32;
	ORigtStr:	 	Str32;
	ONameStr:		Str32;
	insrtstr:		str255;
	savestr:		str255;
	HeadLn:			str255;
	NewsPStr:		NewStrArr;
	SubFlag:		Boolean;
	MinorFlag:	Boolean;
BEGIN
	HeadLn:=''; 
	x:=0;
	FOR i:=0 TO 3 DO
		BEGIN
			StrHandle:=GetString(Base+i);
			{$IFC DebugFlg}
			IF StrHandle = NIL THEN
				BEGIN
					MoveTo(6,15+Vert);
					DrawString('Playtester:');
					MoveTo(6,30+Vert);
					DrawString('Report ResrcErr # '); 
					MyWrite(Base+i);
					SpinWheel(180);
				END;
			{$ENDC}
			CASE StrHandle^^[1] OF
				'0': x:=BitAnd(BitShift((CntryRnd[LoclSubj] div 2)
															 +(CntryRnd[LoclObj] div 2),-2*i-1),3);
				'1': x:=rank;
				'2': x:=BitAnd(Random,3);
				'3': x:=0;
				'4': x:=Old;
			END;
			j:=2;
			WHILE (x>0) AND (j<240) DO
				BEGIN
					j:=j+1;
					IF StrHandle^^[j]='*' THEN x:=x-1;
				END;
			j:=j+1;	
			k:=j;
			REPEAT k:=k+1; UNTIL (StrHandle^^[k]='*') OR (k=250);
			{$IFC DebugFlg}
			IF (j>239) OR (k=250) THEN
				BEGIN
					MoveTo(6,15+Vert);
					DrawString('Playtester:');
					MoveTo(6,30+Vert);
					DrawString('Report StrErr #s:'); 
					MyWrite(Base); 
					MyWrite(x);
					SpinWheel(180);
				END;
			{$ENDC}
			HeadLn:=Concat(HeadLn,Copy(StrHandle^^,j,k-j));
			ReleaseResource(pointer(StrHandle));
		END;
	GetLabels(LoclSubj,AdjectStr,CaptlStr,LeadrStr,LeftStr,RigtStr,NameStr);
	GetLabels(LoclObj,OAdjectSt,OCaptlSt,OLeadrSt,OLeftStr,ORigtStr,ONameStr);
	FOR i:=length(HeadLn) DOWNTO 1 DO
	BEGIN
		insrtflg:=TRUE;
		CASE HeadLn[i] OF
			adject: insrtstr:=AdjectStr;
			leader: BEGIN
								insrtstr:=LeadrStr;
								IF Virgin[LoclSubj] THEN
									BEGIN
										insrtstr:=Concat(insrtstr,' ');
										insrtstr:=Concat(insrtstr,NameStr);
									END;
							END;
			insgnm: BEGIN
								IF LeftPowr[LoclSubj] THEN insrtstr:=RigtStr ELSE insrtstr:=LeftStr;
								IF Base=416 THEN {wotta kluge, wotta kluge!}
									IF LeftPowr[LoclSubj] THEN
										 insrtstr:=LeftStr ELSE insrtstr:=RigtStr;
							END;
			capitl: 	insrtstr:=CaptlStr;
			SName:		insrtstr:=CntryNam[LoclSubj];
			Oadject: 	insrtstr:=OAdjectSt;
			OLeader: BEGIN
								insrtstr:=OLeadrSt;
								IF Virgin[LoclSubj] THEN
									BEGIN
										insrtstr:=Concat(insrtstr,' ');
										insrtstr:=Concat(insrtstr,ONameStr);
									END;
							END;
			Oinsgnm: 	IF LeftPowr[LoclObj] THEN insrtstr:=ORigtStr ELSE insrtstr:=OLeftStr;
			OCapitl: 	insrtstr:=OCaptlSt;
			OName:	 	insrtstr:=CntryNam[LoclObj];
			otherwise insrtflg:=FALSE;
		END;
		IF insrtflg THEN
			BEGIN
				savestr:=Copy(HeadLn,i+1,length(HeadLn)-i);
				Delete(HeadLn,i,length(HeadLn)-i+1);
				HeadLn:=Concat(HeadLn,insrtstr,savestr);
			END;
	END;	{of FOR statement}

	{capitalize first letter if necessary}
	IF ord(HeadLn[1])>96 THEN HeadLn[1]:=Chr(ord(HeadLn[1])-32);
	
	FOR i:=1 TO 5 DO NewsPStr[i]:='';
	j:=LineWidth; 
	i:=1; 
	x:=1;		
	WHILE (j < length(HeadLn)) AND (x < 5)	DO
		BEGIN
			REPEAT j:=j-1; UNTIL HeadLn[j] = ' ';
			NewsPStr[x]:=Copy(HeadLn,i,j-i);
			i:=j+1; 
			x:=x+1; 
			j:=j+LineWidth;
		END;
	NewsPStr[x]:=Copy(Headln,i,length(Headln)-i+1);
	TextFont(1);	
	TextSize(12);
	ClearRect(2,Vert,250,Vert+78);
	FOR i:=1 TO 5 DO
		BEGIN
			MoveTo(6,15*i+Vert);
			DrawString(NewsPStr[i]);
		END;
	SubFlag:=(((Base>=300) & (Base<400)) | ((Base>=700) & (Base<800)));
	MinorFlag:=(LoclSubj<>Cmptr) & (LoclSubj<>Human) & (LoclSubj<>LoclObj)
				& (Influence(Human,LoclSubj)>3) & (rank>Old);
	IF ((LoclSubj=Cmptr) & (LoclSubj<>LoclObj) & NOT LoclCris & SubFlag)
			| MinorFlag
			THEN BEGIN HiliteControl(RespHndl,0); AdviseFlag:=TRUE; END
			ELSE BEGIN HiliteControl(RespHndl,255); AdviseFlag:=FALSE; END;
END;
{********************************************************************************}
PROCEDURE GrafScor;
VAR
	i,j,t,x,y,z:					Integer;
	MyRect:					Rect;
	TempStrng:					Str255;
BEGIN
	CalcScores;
	x:=Level;
	GetIndString(TempStrng,640,x);
	TempStrng:=Concat(TempStrng,' Level');
	x:=100-(StringWidth(TempStrng) div 2);
	MoveTo(x,14); DrawString(TempStrng);
	MoveTo(115,68); DrawString('USA			USSR');
	MoveTo(8,84); DrawString('gain this year:');
	MoveTo(8,100); DrawString('gain to date:');
	MoveTo(115,84); MyWrite(USAStrng-OldAScor);
	MoveTo(160,84); MyWrite(USSRStrng-OldRScor);
	MoveTo(115,100); MyWrite(USAStrng-IUSAStrng);
	MoveTo(160,100); MyWrite(USSRStrng-IUSSRStrng);
	TextFont(1); 
	TextSize(9); 
	TextFace([]);
	x:=40; 
	y:=260;
	MoveTo(x,y-140); LineTo(x,y); LineTo(x+136,y);
	FOR i:=0 TO 8 DO
		BEGIN
			MoveTo(x+17*i,y-1); 
			LineTo(x+17*i,y+1);
			MoveTo(x+17*i,y+9);
			IF i<8 THEN MyWrite(i+89);
		END;
	MoveTo(x-1,y-70); 
	LineTo(x+1,y-70); 
	MoveTo(x-10,y-66); 
	DrawString('0');
	MoveTo(x-1,y-140); 
	LineTo(x+1,y-140); 
	MoveTo(x-30,y-136); 
	DrawString('+700');
	MoveTo(x-1,y); 
	LineTo(x+1,y); 
	MoveTo(x-30,y+4); 
	DrawString('-700');
	FOR j:=1 TO 2 DO
		BEGIN
			MoveTo(x,y);
			FOR i:=1 TO Year-1988 DO
				BEGIN
					IF j=1 THEN t:=USAScor[i] ELSE t:=USSRScor[i];
					z:=(-t div 10)-70; 
					IF z>0 THEN z:=0; IF z<-140 THEN z:=-140;
					LineTo(x+17*(i-1),y+z);
					ClearRect(x+17*(i-1)-2,y+z-2,x+17*(i-1)+2,y+z+2);
					SetRect(MyRect,x+17*(i-1)-2,y+z-2,x+17*(i-1)+3,y+z+3);
					IF j=1 THEN BEGIN FillRect(MyRect,white); FrameRect(MyRect); END
								 ELSE FillRect(MyRect,black);
					MoveTo(x+17*(i-1)+2,y+z);
				END;
		END;
	TextFont(0); 
	TextSize(12);
	REPEAT UNTIL ReadMouse(TRUE)=-1;
END;
{***********************************************************************}
PROCEDURE CenterText(YPos: Integer; CenterString: Str255);
VAR
	XPos:	Integer;
BEGIN
	XPos:=256-(StringWidth(CenterString) div 2);
	MoveTo(XPos,YPos); 
	DrawString(CenterString);
END;
{***********************************************************************}
PROCEDURE EndGame;
VAR
	RestHandle,PlayHandle:						ControlHandle;
	i,x,XPos:						Integer;
	EndFlag:						Boolean;
	MyRect:						Rect;
	TempStrng:						Str255;
BEGIN
	InitCursor;
	TextFont(1); TextSize(12);
	IF WinFlag THEN
		BEGIN
			CalcScores; 
			WritScor;
			SaveMap;
			MyWind:=GetNewWindow(130,NIL,POINTER(-1));
			SetPort(MyWind);
			SetWTitle(MyWind,'End of Game');
			MoveTo(10,36); DrawString('You have kept the peace.');
			MoveTo(10,52); DrawString('	Your scores:');
			GrafScor;
		END
	ELSE
		BEGIN;
			KillControls(MyWind);
			DisposeWindow(MyWind);
			SetPort(MainWind); 
			PenPat(black); 
			PaintRect(MainWind^.portRect);
			TextMode(srcXor); 
			TextFont(7); {Athens}	
			TextSize(18);
			TempStrng:='You have ignited';
			IF ANWFlag THEN TempStrng:=Concat(TempStrng,' an accidental')
								 ELSE TempStrng:=Concat(TempStrng,' a');
			TempStrng:=Concat(TempStrng,' nuclear war.');
			CenterText(80,TempStrng);
			TempStrng:='And no, there is no animated display of a mushroom cloud';
			CenterText(120,TempStrng);
			TempStrng:='with parts of bodies flying through the air.';
			CenterText(140,TempStrng);
			TempStrng:='We do not reward failure.';
			CenterText(200,TempStrng);
			QuitFlag:=TRUE;
			RestHandle:=GetNewControl(132,MainWind);
			{PlayHandle:=GetNewControl(133,MainWind);}
			PenNormal;
			TextMode(srcCopy); 
			EndFlag:=FALSE;
			REPEAT 
				IF ReadMouse(FALSE)>0 THEN 
					BEGIN
						EndFlag:=(WhichControl=RestHandle);
						{ReplayFlag:=(WhichControl=PlayHandle);}
						ReplayFlag:=FALSE; {mask out replay capability}
						IF ReplayFlag THEN
							BEGIN
								TwoPFlag:=TRUE;
								TextMode(srcOr);
								ClearMenuBar;
								x:=7;
								{$IFC DebugFlg}
									x:=8;
								{$ENDC}
								FOR i:=0 TO x DO DeleteMenu(i);
								DrawMenuBar;
								FOR i:=1 TO NoCntry DO DisposeRgn(CntryRgn[i]);
								DisposHandle(BufferHandle);
								DisposHandle(Handle(DipAff));
								DisposHandle(Handle(MiltAid));
								DisposHandle(Handle(IntvGovt));
								DisposHandle(Handle(InsgAid));
								DisposHandle(Handle(IntvRebl));
								DisposHandle(Handle(MiltAOld));
								DisposHandle(Handle(InsgAOld));
								DisposHandle(Handle(IntvGOld));
								DisposHandle(Handle(IntvROld));
								DisposHandle(Handle(MinorSph));
								FOR i:=1 TO 4 DO DisposPtr(AdvisorFace[i].baseAddr);
								Junk2:=100000;
								Junk1:=CompactMem(Junk2);
							END;
					END;
				UNTIL EndFlag OR ReplayFlag;
			KillControls(MainWind);
		END;
END;
{***********************************************************************}
PROCEDURE ExchangP;
VAR
	x,i:					Integer;
	z:					LongInt;
	myPtr:				Ptr;
	myHandle:		 Handle;
	mySWPtr:			SWSynthPtr;
BEGIN
	x:=Human; 
	Human:=Cmptr; 
	Cmptr:=x;
	ClearRect(90,330,205,340);
	MoveTo(90,340); 
	TextFont(0);
	IF Human=1 THEN DrawString('USA holds mouse') 
						 ELSE DrawString('USSR holds mouse');
	myHandle:=NewHandle(8);
	HLock(MyHandle);
	myPtr:=myHandle^;
	mySWPtr:=SWSynthPtr(myPtr);
	mySWPtr^.mode:=swMode;
	IF Human=1 THEN x:=500 ELSE x:=800;
	mySWPtr^.triplets[0].Count:=x;
	mySWPtr^.triplets[0].amplitude:=200;
	mySWPtr^.triplets[0].duration:=30;
	StartSound(myPtr,8,POINTER(-1));
	HUnlock(MyHandle);
	DisposHandle(myHandle);
END;
{**********************************************************************}
FUNCTION YourOpen;
VAR
  Error:		OSErr;
  LocalNum: Integer;
  WDRefNum:	Integer;
BEGIN
  Error:=GetVol(NIL,WDRefNum);
  Error:=FSOpen(FileName,0,LocalNum);
  IF Error<>0 THEN
	BEGIN
	  ClearRect(100,100,512,120);
	  TextFont(0); TextSize(12);
	  MoveTo(102,116); DrawString('Disk Problem');
	  MyWrite(Error); DrawString(FileName);
	  REPEAT UNTIL Button;
	  ExitToShell;
	END;
  YourOpen:=LocalNum;
END;
{**********************************************************************}
FUNCTION Influence;
VAR
	x:	Integer;
BEGIN
	x:=Treaty[SuperPower,Minor]
		+EconAid[SuperPower,Minor]
		+MiltAid^^[SuperPower,Minor]
		+2*IntvGovt^^[SuperPower,Minor]
		-2*Destab[SuperPower,Minor]
		-2*InsgAid^^[SuperPower,Minor]
		-4*IntvRebl^^[SuperPower,Minor];
	IF x<0 THEN x:=0;
	Influence:=x;
END;
{**********************************************************************}
PROCEDURE ChgDMess;
BEGIN
	DontMess[Who]:=DontMess[Who]+HowMuch; 
	SumDMess:=SumDMess+HowMuch;
	IF SumDMess<1 THEN SumDMess:=1;
	AveDMess:=SumDMess div NoCntry;
END;
{***********************************************************************}
PROCEDURE ReadFaces;
CONST
  headerSize = 512;
  BufSize = 512;
  srcBlocks = 8;
TYPE
  diskBlock = packed array [1..512] OF QDbyte;
VAR
  refNum:		Integer;
	scanline:	Integer;
	srcSize:  Integer;
  i,Column:	Integer;
  showRect:	Rect;
	lineRect:	Rect;
	FaceRect:	Rect;
  dstBMap:	BitMap;
	tempBMap:	BitMap;
  dstBits:	packed array [1..72] of byte;
  tempBits:	ARRAY [1..8000] OF Integer;
  srcPtr:		Ptr;
	dstPtr:		Ptr;
	MyPtr:	  Ptr;
  Count:		LongInt;
  error:		OSErr;
  srcBuf:		ARRAY [1..srcBlocks] OF diskBlock;
	StdRect3:	Rect;
BEGIN
	SetRect(StdRect3,0,0,64,64);
  dstBMap.rowBytes:=64;
  dstBMap.baseAddr:=@dstBits;
  SetRect(dstBMap.bounds,0,0,512,1);
  dstPtr:=pointer(dstBMap.baseAddr);
  tempBMap.rowBytes:=64;
  tempBMap.baseAddr:=@tempBits;
  SetRect(tempBMap.bounds,0,0,512,256);
  FOR i:=1 TO 4 DO
    BEGIN
      AdvisorFace[i].rowBytes:=8;
      AdvisorFace[i].baseAddr:=NewPtr(512);
      SetRect(AdvisorFace[i].bounds,0,0,64,64);
    END;
	RefNum:=YourOpen('Advisors');
  Count:=headerSize;
  error:=FSRead(refNum,Count,@srcBuf);
  srcSize:=srcBlocks*512;
  Count:=srcSize;
  error:=FSRead(refNum,Count,@srcBuf);
  Count:=Count-512;
  srcPtr:=@srcBuf;
  SetRect(lineRect,0,0,512,1);
	SetRect(showRect,0,0,512,1);
	FOR Scanline:=1 to 64 do
		BEGIN
			UnpackBits(srcPtr,dstPtr,72);
			CopyBits(dstBMap,tempBMap,lineRect,showRect,srcCopy,NIL);
			dstPtr:=pointer(dstBMap.baseAddr);
			OffsetRect(showRect,0,1);
			IF ORD(srcPtr)>(ORD(@srcBuf)+srcSize-512) THEN
				BEGIN
					srcBuf[1]:=srcBuf[srcBlocks];
					error:=FSRead(refNum,Count,@srcBuf[2]);
					srcPtr:=pointer(ord(srcPtr)+512-srcSize);
				END;
		END;
	FOR Column:=0 To 3 DO
		BEGIN
			SetRect(FaceRect,64*Column,0,64*Column+64,64);
			CopyBits(tempBMap,AdvisorFace[Column+1],FaceRect,StdRect3,srcCopy,NIL);
		END;
  error:=FSClose(refnum);
END;
{**********************************************************************}
END.
