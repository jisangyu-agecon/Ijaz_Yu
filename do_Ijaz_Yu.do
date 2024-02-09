clear all

*global data "C:\Users\arush\Dropbox\Pak_EU_project\replication_package\data"
*global rd "C:\Users\arush\Dropbox\Pak_EU_project\replication_package\rawdata"
*global fig "C:\Users\arush\Dropbox\Pak_EU_project\replication_package\draft\figures"


global data "/Users/jisangyu/Library/CloudStorage/Dropbox/Ijaz_Yu_Pakistan_Tariff_Waiver/replication_package/data"
global rd "/Users/jisangyu/Library/CloudStorage/Dropbox/Ijaz_Yu_Pakistan_Tariff_Waiver/replication_package/rawdata"
global fig "/Users/jisangyu/Library/CloudStorage/Dropbox/Ijaz_Yu_Pakistan_Tariff_Waiver/replication_package"




************************************Yarn export*******************************


import excel "$rd/5205_monthly.xlsx", firstrow clear



gen year=0

forval i=2000/2023{
	
	replace year=`i' if TIME_PERIOD=="`i'-01"
	replace year=`i' if TIME_PERIOD=="`i'-02"
	replace year=`i' if TIME_PERIOD=="`i'-03"
	replace year=`i' if TIME_PERIOD=="`i'-04"
	replace year=`i' if TIME_PERIOD=="`i'-05"
	replace year=`i' if TIME_PERIOD=="`i'-06"
	replace year=`i' if TIME_PERIOD=="`i'-07"
	replace year=`i' if TIME_PERIOD=="`i'-08"
	replace year=`i' if TIME_PERIOD=="`i'-09"
	replace year=`i' if TIME_PERIOD=="`i'-10"
	replace year=`i' if TIME_PERIOD=="`i'-11"
	replace year=`i' if TIME_PERIOD=="`i'-12"
	
}


gen month=0

forval i=1/9{
	
	replace month=`i' if TIME_PERIOD=="2000-0`i'"
	replace month=`i' if TIME_PERIOD=="2001-0`i'"
	replace month=`i' if TIME_PERIOD=="2002-0`i'"
	replace month=`i' if TIME_PERIOD=="2003-0`i'"
	replace month=`i' if TIME_PERIOD=="2004-0`i'"
	replace month=`i' if TIME_PERIOD=="2005-0`i'"
	replace month=`i' if TIME_PERIOD=="2006-0`i'"
	replace month=`i' if TIME_PERIOD=="2007-0`i'"
	replace month=`i' if TIME_PERIOD=="2008-0`i'"
	replace month=`i' if TIME_PERIOD=="2009-0`i'"
	replace month=`i' if TIME_PERIOD=="2010-0`i'"
	replace month=`i' if TIME_PERIOD=="2011-0`i'"
	replace month=`i' if TIME_PERIOD=="2012-0`i'"
	replace month=`i' if TIME_PERIOD=="2013-0`i'"
	replace month=`i' if TIME_PERIOD=="2014-0`i'"
	replace month=`i' if TIME_PERIOD=="2015-0`i'"
	replace month=`i' if TIME_PERIOD=="2016-0`i'"
	replace month=`i' if TIME_PERIOD=="2017-0`i'"
	replace month=`i' if TIME_PERIOD=="2018-0`i'"
	replace month=`i' if TIME_PERIOD=="2019-0`i'"
	replace month=`i' if TIME_PERIOD=="2020-0`i'"
	replace month=`i' if TIME_PERIOD=="2021-0`i'"
	replace month=`i' if TIME_PERIOD=="2022-0`i'"
	replace month=`i' if TIME_PERIOD=="2023-0`i'"
	
	
}

forval i=10/12{
	
	replace month=`i' if TIME_PERIOD=="2000-`i'"
	replace month=`i' if TIME_PERIOD=="2001-`i'"
	replace month=`i' if TIME_PERIOD=="2002-`i'"
	replace month=`i' if TIME_PERIOD=="2003-`i'"
	replace month=`i' if TIME_PERIOD=="2004-`i'"
	replace month=`i' if TIME_PERIOD=="2005-`i'"
	replace month=`i' if TIME_PERIOD=="2006-`i'"
	replace month=`i' if TIME_PERIOD=="2007-`i'"
	replace month=`i' if TIME_PERIOD=="2008-`i'"
	replace month=`i' if TIME_PERIOD=="2009-`i'"
	replace month=`i' if TIME_PERIOD=="2010-`i'"
	replace month=`i' if TIME_PERIOD=="2011-`i'"
	replace month=`i' if TIME_PERIOD=="2012-`i'"
	replace month=`i' if TIME_PERIOD=="2013-`i'"
	replace month=`i' if TIME_PERIOD=="2014-`i'"
	replace month=`i' if TIME_PERIOD=="2015-`i'"
	replace month=`i' if TIME_PERIOD=="2016-`i'"
	replace month=`i' if TIME_PERIOD=="2017-`i'"
	replace month=`i' if TIME_PERIOD=="2018-`i'"
	replace month=`i' if TIME_PERIOD=="2019-`i'"
	replace month=`i' if TIME_PERIOD=="2020-`i'"
	replace month=`i' if TIME_PERIOD=="2021-`i'"
	replace month=`i' if TIME_PERIOD=="2022-`i'"
	replace month=`i' if TIME_PERIOD=="2023-`i'"
	
	
}


gen quarter=0
replace quarter=1 if month==1| month==2| month==3
replace quarter=2 if month==4| month==5| month==6
replace quarter=3 if month==7| month==8| month==9
replace quarter=4 if month==10| month==11| month==12

collapse (sum) OBS_VALUE, by ( partner quarter year)

encode partner, gen(Partner)

gen time="0"

forval i=2000/2023{
	
	replace time="`i'_1" if year==`i' & quarter==1
	replace time="`i'_2" if year==`i' & quarter==2
	replace time="`i'_3" if year==`i' & quarter==3
	replace time="`i'_4" if year==`i' & quarter==4
	
}

encode time, gen(Time)

xtset Partner Time

xtbalance, range(1,94)

gen lnvalue=ln(OBS_VALUE+1)

save "$data/5205_quarterly.dta", replace


**Pakistan==87

tempfile temp

synth lnvalue lnvalue(1) lnvalue(2) lnvalue(3) lnvalue(4) lnvalue(5) lnvalue(6) lnvalue(7) lnvalue(8) lnvalue(9) lnvalue(10) lnvalue(11) lnvalue(12) lnvalue(13) lnvalue(14) lnvalue(15) lnvalue(16) lnvalue(17) lnvalue(18) lnvalue(19) lnvalue(20) lnvalue(21) lnvalue(22) lnvalue(23) lnvalue(24) lnvalue(25) lnvalue(26) lnvalue(27) lnvalue(28) lnvalue(29) lnvalue(30) lnvalue(31) lnvalue(32) lnvalue(33) lnvalue(34) lnvalue(35) lnvalue(36) lnvalue(37) lnvalue(38) lnvalue(39), trunit(87) trperiod(43) resultsperiod(1(1)94) nested keep(`temp')

use `temp', clear

****Figure 1(a)
tw (line _Y_treated _time) (line _Y_synthetic _time), xline(43 52) xlabel(1  "2000" 9 "2002" 17 "2004" 25 "2006" 33 "2008" 41 "2010" 49 "2012" 57 "2014" 65 "2016" 73 "2018" 81 "2020" 89 "2022", grid) graphregion(color(white)) xtitle(Year) ytitle(Log in Trade Value (1000 USD)) legend(order (1 "Pakistan" 2 "Synthetic Pakistan"))

gr export "$fig/5205_trend1.png", replace

keep _Y_treated _Y_synthetic _time
drop if _time==.
rename _time year
rename _Y_treated  treat
rename _Y_synthetic counterfact
gen gap87=treat-counterfact
sort year

****Figure 1(b)
twoway (line gap87 year, lp(solid)lw(vthin)lcolor(black)), yline(0, lpattern(shortdash) lcolor(black)) xtitle(Year) graphregion(color(white)) ytitle(Gap in Trade Value) xline(43 52) xlabel(1  "2000" 9 "2002" 17 "2004" 25 "2006" 33 "2008" 41 "2010" 49 "2012" 57 "2014" 65 "2016" 73 "2018" 81 "2020" 89 "2022", grid)

gr export "$fig/5205_gap1.png", replace


***********

use "$data/5205_quarterly.dta", clear

tempfile temp

synth lnvalue lnvalue(1) lnvalue(2) lnvalue(3) lnvalue(4) lnvalue(5) lnvalue(6) lnvalue(7) lnvalue(8) lnvalue(9) lnvalue(10) lnvalue(11) lnvalue(12) lnvalue(13) lnvalue(14) lnvalue(15) lnvalue(16) lnvalue(17) lnvalue(18) lnvalue(19) lnvalue(20) lnvalue(21) lnvalue(22) lnvalue(23) lnvalue(24) lnvalue(25) lnvalue(26) lnvalue(27) lnvalue(28) lnvalue(29) lnvalue(30) lnvalue(31) lnvalue(32) lnvalue(33) lnvalue(34) lnvalue(35) lnvalue(36) lnvalue(37) lnvalue(38) lnvalue(39), trunit(87) trperiod(43) resultsperiod(1(1)94) nested keep(`temp')

use `temp', clear

keep _Co_Number _W_Weight
drop if _W_Weight==.
drop if _W_Weight==0
gen controls="."
replace controls="India" if _Co_Number==46
replace controls="Peru" if _Co_Number==84

****Figure 1(c)
graph bar (asis) _W_Weight, over(controls) ytitle(Unit weights) graphregion(color(white)) xsize(8)

gr export "$fig/5205_weights1.png", replace

*************************

use "$data/5205_quarterly.dta", clear

local clist 33 36 46 51 78 84 87 116 123
foreach i of local clist{	
	preserve
	
	tempfile temp`i'
	synth lnvalue lnvalue(1) lnvalue(2) lnvalue(3) lnvalue(4) lnvalue(5) lnvalue(6) lnvalue(7) lnvalue(8) lnvalue(9) lnvalue(10) lnvalue(11) lnvalue(12) lnvalue(13) lnvalue(14) lnvalue(15) lnvalue(16) lnvalue(17) lnvalue(18) lnvalue(19) lnvalue(20) lnvalue(21) lnvalue(22) lnvalue(23) lnvalue(24) lnvalue(25) lnvalue(26) lnvalue(27) lnvalue(28) lnvalue(29) lnvalue(30) lnvalue(31) lnvalue(32) lnvalue(33) lnvalue(34) lnvalue(35) lnvalue(36) lnvalue(37) lnvalue(38) lnvalue(39), trunit(`i') trperiod(43) resultsperiod(1(1)94)  keep(`temp`i'')

	matrix country`i' = e(RMSPE)
	matrix rownames country`i'=`i'
	matlist country`i', names(rows)
 
	use `temp`i'', clear
	keep _Y_treated _Y_synthetic _time
 	drop if _time==.
	rename _time year
 	rename _Y_treated  treat`i'
 	rename _Y_synthetic counterfact`i'
 	gen gap`i'=treat`i'-counterfact`i'
 	sort year 
	tempfile gap_`i'
	save `gap_`i'', replace
	restore
}	


use `gap_33', clear
sort year 

local clist 36 46 51 78 84 87 116 123
foreach i of local clist {
		merge 1:1 year using `gap_`i''
		drop _merge 
		sort year 
}

****Figure 1(d)
#delimit;

twoway 
(line gap33 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap36 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap46 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap51 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap78 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap84 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap116 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap123 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap87 year,lp(solid)lw(thick)lcolor(black)), yline(0, lpattern(shortdash) lcolor(black)) ytitle(Gap in Trade Value) graphregion(color(white)) xtitle(Year) xline(43 52) xlabel(1  "2000" 9 "2002" 17 "2004" 25 "2006" 33 "2008" 41 "2010" 49 "2012" 57 "2014" 65 "2016" 73 "2018" 81 "2020" 89 "2022") leg(off);


gr export "$fig/5205_placebo_gap1.png", replace;

#delimit cr

*Summary
preserve 
keep if year>41 & year<49
collapse (mean) gap* (firstnm) year
reshape long gap, i(year) j(id)
sort gap
gen rank=_n
gen PK=0
replace PK=1 if id==87
list gap id rank
save "$data/5205_placebo_2011.dta", replace
restore

preserve 
keep if year>49
collapse (mean) gap* (firstnm) year
reshape long gap, i(year) j(id)
sort gap
gen rank=_n
gen PK=0
replace PK=1 if id==87
list gap id rank
save "$data/5205_placebo_post.dta", replace
restore


*FECT

use "$data/5205_quarterly.dta", clear

gen D=0
replace D=1 if Time>=43 & Partner==87

fect lnvalue ,treat(D) unit(Partner) time(Time) method("ife") force("two-way") cv r(4) vartype(jackknife) se


mat list e(ATT)
mat list e(ATTs)
mat list e(coefs)

****Figure 6(a)
gr export "$fig/5205_fect.png", replace




****************************Fabric export - 5208*****************8

import excel "$rd/5208_monthly.xlsx", firstrow clear



gen year=0

forval i=2000/2023{
	
	replace year=`i' if TIME_PERIOD=="`i'-01"
	replace year=`i' if TIME_PERIOD=="`i'-02"
	replace year=`i' if TIME_PERIOD=="`i'-03"
	replace year=`i' if TIME_PERIOD=="`i'-04"
	replace year=`i' if TIME_PERIOD=="`i'-05"
	replace year=`i' if TIME_PERIOD=="`i'-06"
	replace year=`i' if TIME_PERIOD=="`i'-07"
	replace year=`i' if TIME_PERIOD=="`i'-08"
	replace year=`i' if TIME_PERIOD=="`i'-09"
	replace year=`i' if TIME_PERIOD=="`i'-10"
	replace year=`i' if TIME_PERIOD=="`i'-11"
	replace year=`i' if TIME_PERIOD=="`i'-12"
	
}


gen month=0

forval i=1/9{
	
	replace month=`i' if TIME_PERIOD=="2000-0`i'"
	replace month=`i' if TIME_PERIOD=="2001-0`i'"
	replace month=`i' if TIME_PERIOD=="2002-0`i'"
	replace month=`i' if TIME_PERIOD=="2003-0`i'"
	replace month=`i' if TIME_PERIOD=="2004-0`i'"
	replace month=`i' if TIME_PERIOD=="2005-0`i'"
	replace month=`i' if TIME_PERIOD=="2006-0`i'"
	replace month=`i' if TIME_PERIOD=="2007-0`i'"
	replace month=`i' if TIME_PERIOD=="2008-0`i'"
	replace month=`i' if TIME_PERIOD=="2009-0`i'"
	replace month=`i' if TIME_PERIOD=="2010-0`i'"
	replace month=`i' if TIME_PERIOD=="2011-0`i'"
	replace month=`i' if TIME_PERIOD=="2012-0`i'"
	replace month=`i' if TIME_PERIOD=="2013-0`i'"
	replace month=`i' if TIME_PERIOD=="2014-0`i'"
	replace month=`i' if TIME_PERIOD=="2015-0`i'"
	replace month=`i' if TIME_PERIOD=="2016-0`i'"
	replace month=`i' if TIME_PERIOD=="2017-0`i'"
	replace month=`i' if TIME_PERIOD=="2018-0`i'"
	replace month=`i' if TIME_PERIOD=="2019-0`i'"
	replace month=`i' if TIME_PERIOD=="2020-0`i'"
	replace month=`i' if TIME_PERIOD=="2021-0`i'"
	replace month=`i' if TIME_PERIOD=="2022-0`i'"
	replace month=`i' if TIME_PERIOD=="2023-0`i'"
	
	
}

forval i=10/12{
	
	replace month=`i' if TIME_PERIOD=="2000-`i'"
	replace month=`i' if TIME_PERIOD=="2001-`i'"
	replace month=`i' if TIME_PERIOD=="2002-`i'"
	replace month=`i' if TIME_PERIOD=="2003-`i'"
	replace month=`i' if TIME_PERIOD=="2004-`i'"
	replace month=`i' if TIME_PERIOD=="2005-`i'"
	replace month=`i' if TIME_PERIOD=="2006-`i'"
	replace month=`i' if TIME_PERIOD=="2007-`i'"
	replace month=`i' if TIME_PERIOD=="2008-`i'"
	replace month=`i' if TIME_PERIOD=="2009-`i'"
	replace month=`i' if TIME_PERIOD=="2010-`i'"
	replace month=`i' if TIME_PERIOD=="2011-`i'"
	replace month=`i' if TIME_PERIOD=="2012-`i'"
	replace month=`i' if TIME_PERIOD=="2013-`i'"
	replace month=`i' if TIME_PERIOD=="2014-`i'"
	replace month=`i' if TIME_PERIOD=="2015-`i'"
	replace month=`i' if TIME_PERIOD=="2016-`i'"
	replace month=`i' if TIME_PERIOD=="2017-`i'"
	replace month=`i' if TIME_PERIOD=="2018-`i'"
	replace month=`i' if TIME_PERIOD=="2019-`i'"
	replace month=`i' if TIME_PERIOD=="2020-`i'"
	replace month=`i' if TIME_PERIOD=="2021-`i'"
	replace month=`i' if TIME_PERIOD=="2022-`i'"
	replace month=`i' if TIME_PERIOD=="2023-`i'"
	
	
}


gen quarter=0
replace quarter=1 if month==1| month==2| month==3
replace quarter=2 if month==4| month==5| month==6
replace quarter=3 if month==7| month==8| month==9
replace quarter=4 if month==10| month==11| month==12

collapse (sum) OBS_VALUE, by ( partner quarter year)

encode partner, gen(Partner)

gen time="0"

forval i=2000/2023{
	
	replace time="`i'_1" if year==`i' & quarter==1
	replace time="`i'_2" if year==`i' & quarter==2
	replace time="`i'_3" if year==`i' & quarter==3
	replace time="`i'_4" if year==`i' & quarter==4
	
}

encode time, gen(Time)

xtset Partner Time

xtbalance, range(1,94)

gen lnvalue=ln(OBS_VALUE+1)

save "$data/5208_quarterly.dta", replace

**Pakistan==115

tempfile temp

synth lnvalue lnvalue(1) lnvalue(2) lnvalue(3) lnvalue(4) lnvalue(5) lnvalue(6) lnvalue(7) lnvalue(8) lnvalue(9) lnvalue(10) lnvalue(11) lnvalue(12) lnvalue(13) lnvalue(14) lnvalue(15) lnvalue(16) lnvalue(17) lnvalue(18) lnvalue(19) lnvalue(20) lnvalue(21) lnvalue(22) lnvalue(23) lnvalue(24) lnvalue(25) lnvalue(26) lnvalue(27) lnvalue(28) lnvalue(29) lnvalue(30) lnvalue(31) lnvalue(32) lnvalue(33) lnvalue(34) lnvalue(35) lnvalue(36) lnvalue(37) lnvalue(38) lnvalue(39), trunit(115) trperiod(43) resultsperiod(1(1)94) nested keep(`temp')

use `temp', clear

****Figure 2(a)
tw (line _Y_treated _time) (line _Y_synthetic _time), xline(43 52) xlabel(1  "2000" 9 "2002" 17 "2004" 25 "2006" 33 "2008" 41 "2010" 49 "2012" 57 "2014" 65 "2016" 73 "2018" 81 "2020" 89 "2022", grid) graphregion(color(white)) xtitle(Year) ytitle(Log in Trade Value (1000 USD)) legend(order (1 "Pakistan" 2 "Synthetic Pakistan"))

gr export "$fig/5208_trend1.png", replace

keep _Y_treated _Y_synthetic _time
drop if _time==.
rename _time year
rename _Y_treated  treat
rename _Y_synthetic counterfact
gen gap115=treat-counterfact
sort year

****Figure 2(b)
twoway (line gap115 year, lp(solid)lw(vthin)lcolor(black)), yline(0, lpattern(shortdash) lcolor(black)) xtitle(Year) graphregion(color(white)) ytitle(Gap in Trade Value) xline(43 52) xlabel(1  "2000" 9 "2002" 17 "2004" 25 "2006" 33 "2008" 41 "2010" 49 "2012" 57 "2014" 65 "2016" 73 "2018" 81 "2020" 89 "2022", grid)
gr export "$fig/5208_gap1.png", replace


***********

use "$data/5208_quarterly.dta", clear

tempfile temp

synth lnvalue lnvalue(1) lnvalue(2) lnvalue(3) lnvalue(4) lnvalue(5) lnvalue(6) lnvalue(7) lnvalue(8) lnvalue(9) lnvalue(10) lnvalue(11) lnvalue(12) lnvalue(13) lnvalue(14) lnvalue(15) lnvalue(16) lnvalue(17) lnvalue(18) lnvalue(19) lnvalue(20) lnvalue(21) lnvalue(22) lnvalue(23) lnvalue(24) lnvalue(25) lnvalue(26) lnvalue(27) lnvalue(28) lnvalue(29) lnvalue(30) lnvalue(31) lnvalue(32) lnvalue(33) lnvalue(34) lnvalue(35) lnvalue(36) lnvalue(37) lnvalue(38) lnvalue(39), trunit(115) trperiod(43) resultsperiod(1(1)94) nested keep(`temp')

use `temp', clear

*BD, CN, TR
keep _Co_Number _W_Weight
drop if _W_Weight==.
drop if _W_Weight==0
gen controls="."
replace controls="Bangladesh" if _Co_Number==15
replace controls="China" if _Co_Number==32
replace controls="Turkey" if _Co_Number==148

****Figure 2(c)
graph bar (asis) _W_Weight, over(controls) ytitle(Unit weights) graphregion(color(white)) xsize(8)

gr export "$fig/5208_weights1.png", replace

*************************

use "$data/5208_quarterly.dta", clear

local clist 10 15 22 26 32 46 51 63 67 73 88 89 92 100 112 115 143 147 148 150 152 155
foreach i of local clist{	
	preserve
	
	tempfile temp`i'
	synth lnvalue lnvalue(1) lnvalue(2) lnvalue(3) lnvalue(4) lnvalue(5) lnvalue(6) lnvalue(7) lnvalue(8) lnvalue(9) lnvalue(10) lnvalue(11) lnvalue(12) lnvalue(13) lnvalue(14) lnvalue(15) lnvalue(16) lnvalue(17) lnvalue(18) lnvalue(19) lnvalue(20) lnvalue(21) lnvalue(22) lnvalue(23) lnvalue(24) lnvalue(25) lnvalue(26) lnvalue(27) lnvalue(28) lnvalue(29) lnvalue(30) lnvalue(31) lnvalue(32) lnvalue(33) lnvalue(34) lnvalue(35) lnvalue(36) lnvalue(37) lnvalue(38) lnvalue(39), trunit(`i') trperiod(43) resultsperiod(1(1)94)  keep(`temp`i'')

	matrix country`i' = e(RMSPE)
	matrix rownames country`i'=`i'
	matlist country`i', names(rows)
 
	use `temp`i'', clear
	keep _Y_treated _Y_synthetic _time
 	drop if _time==.
	rename _time year
 	rename _Y_treated  treat`i'
 	rename _Y_synthetic counterfact`i'
 	gen gap`i'=treat`i'-counterfact`i'
 	sort year 
	tempfile gap_`i'
	save `gap_`i'', replace
	restore
	
}	


use `gap_10.dta', clear
sort year 

local clist 15 22 26 32 46 51 63 67 73 88 89 92 100 112 115 143 147 148 150 152 155
foreach i of local clist {
		merge 1:1 year using `gap_`i''
		drop _merge 
		sort year 
}

****Figure 2(d)
#delimit;

twoway 
(line gap15 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap22 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap26 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap32 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap46 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap51 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap63 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap67 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap73 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap88 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap89 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap92 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap100 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap112 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap143 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap148 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap150 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap152 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap155 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap115 year,lp(solid)lw(thick)lcolor(black)), yline(0, lpattern(shortdash) lcolor(black)) ytitle(Gap in prediction of Trade Value) graphregion(color(white)) xtitle(Year) xline(43 52) xlabel(1  "2000" 9 "2002" 17 "2004" 25 "2006" 33 "2008" 41 "2010" 49 "2012" 57 "2014" 65 "2016" 73 "2018" 81 "2020" 89 "2022", grid) leg(off);

gr export "$fig/5208_placebo_gap1.png", replace;

#delimit cr

*Summary
preserve 
keep if year>41 & year<49
collapse (mean) gap* (firstnm) year
reshape long gap, i(year) j(id)
sort gap
gen rank=_n
gen PK=0
replace PK=1 if id==115
list gap id rank
save "$data/5208_placebo_2011.dta", replace
restore

preserve 
keep if year>49
collapse (mean) gap* (firstnm) year
reshape long gap, i(year) j(id)
sort gap
gen rank=_n
gen PK=0
replace PK=1 if id==115
list gap id rank
save "$data/5208_placebo_post.dta", replace
restore



*FECT

use "$data/5208_quarterly.dta", clear

gen D=0
replace D=1 if Time>=43 & Partner==115

fect lnvalue ,treat(D) unit(Partner) time(Time) method("ife") force("two-way") cv r(4) vartype(jackknife) se


mat list e(ATT)
mat list e(ATTs)
mat list e(coefs)

****Figure 6(b)
gr export "$fig/5208_fect.png", replace


************************************************Fabrix Export: 5209 ******************

import excel "$rd/5209_monthly.xlsx", firstrow clear



gen year=0

forval i=2000/2023{
	
	replace year=`i' if TIME_PERIOD=="`i'-01"
	replace year=`i' if TIME_PERIOD=="`i'-02"
	replace year=`i' if TIME_PERIOD=="`i'-03"
	replace year=`i' if TIME_PERIOD=="`i'-04"
	replace year=`i' if TIME_PERIOD=="`i'-05"
	replace year=`i' if TIME_PERIOD=="`i'-06"
	replace year=`i' if TIME_PERIOD=="`i'-07"
	replace year=`i' if TIME_PERIOD=="`i'-08"
	replace year=`i' if TIME_PERIOD=="`i'-09"
	replace year=`i' if TIME_PERIOD=="`i'-10"
	replace year=`i' if TIME_PERIOD=="`i'-11"
	replace year=`i' if TIME_PERIOD=="`i'-12"
	
}


gen month=0

forval i=1/9{
	
	replace month=`i' if TIME_PERIOD=="2000-0`i'"
	replace month=`i' if TIME_PERIOD=="2001-0`i'"
	replace month=`i' if TIME_PERIOD=="2002-0`i'"
	replace month=`i' if TIME_PERIOD=="2003-0`i'"
	replace month=`i' if TIME_PERIOD=="2004-0`i'"
	replace month=`i' if TIME_PERIOD=="2005-0`i'"
	replace month=`i' if TIME_PERIOD=="2006-0`i'"
	replace month=`i' if TIME_PERIOD=="2007-0`i'"
	replace month=`i' if TIME_PERIOD=="2008-0`i'"
	replace month=`i' if TIME_PERIOD=="2009-0`i'"
	replace month=`i' if TIME_PERIOD=="2010-0`i'"
	replace month=`i' if TIME_PERIOD=="2011-0`i'"
	replace month=`i' if TIME_PERIOD=="2012-0`i'"
	replace month=`i' if TIME_PERIOD=="2013-0`i'"
	replace month=`i' if TIME_PERIOD=="2014-0`i'"
	replace month=`i' if TIME_PERIOD=="2015-0`i'"
	replace month=`i' if TIME_PERIOD=="2016-0`i'"
	replace month=`i' if TIME_PERIOD=="2017-0`i'"
	replace month=`i' if TIME_PERIOD=="2018-0`i'"
	replace month=`i' if TIME_PERIOD=="2019-0`i'"
	replace month=`i' if TIME_PERIOD=="2020-0`i'"
	replace month=`i' if TIME_PERIOD=="2021-0`i'"
	replace month=`i' if TIME_PERIOD=="2022-0`i'"
	replace month=`i' if TIME_PERIOD=="2023-0`i'"
	
	
}

forval i=10/12{
	
	replace month=`i' if TIME_PERIOD=="2000-`i'"
	replace month=`i' if TIME_PERIOD=="2001-`i'"
	replace month=`i' if TIME_PERIOD=="2002-`i'"
	replace month=`i' if TIME_PERIOD=="2003-`i'"
	replace month=`i' if TIME_PERIOD=="2004-`i'"
	replace month=`i' if TIME_PERIOD=="2005-`i'"
	replace month=`i' if TIME_PERIOD=="2006-`i'"
	replace month=`i' if TIME_PERIOD=="2007-`i'"
	replace month=`i' if TIME_PERIOD=="2008-`i'"
	replace month=`i' if TIME_PERIOD=="2009-`i'"
	replace month=`i' if TIME_PERIOD=="2010-`i'"
	replace month=`i' if TIME_PERIOD=="2011-`i'"
	replace month=`i' if TIME_PERIOD=="2012-`i'"
	replace month=`i' if TIME_PERIOD=="2013-`i'"
	replace month=`i' if TIME_PERIOD=="2014-`i'"
	replace month=`i' if TIME_PERIOD=="2015-`i'"
	replace month=`i' if TIME_PERIOD=="2016-`i'"
	replace month=`i' if TIME_PERIOD=="2017-`i'"
	replace month=`i' if TIME_PERIOD=="2018-`i'"
	replace month=`i' if TIME_PERIOD=="2019-`i'"
	replace month=`i' if TIME_PERIOD=="2020-`i'"
	replace month=`i' if TIME_PERIOD=="2021-`i'"
	replace month=`i' if TIME_PERIOD=="2022-`i'"
	replace month=`i' if TIME_PERIOD=="2023-`i'"
	
	
}


gen quarter=0
replace quarter=1 if month==1| month==2| month==3
replace quarter=2 if month==4| month==5| month==6
replace quarter=3 if month==7| month==8| month==9
replace quarter=4 if month==10| month==11| month==12

collapse (sum) OBS_VALUE, by ( partner quarter year)

encode partner, gen(Partner)

gen time="0"

forval i=2000/2023{
	
	replace time="`i'_1" if year==`i' & quarter==1
	replace time="`i'_2" if year==`i' & quarter==2
	replace time="`i'_3" if year==`i' & quarter==3
	replace time="`i'_4" if year==`i' & quarter==4
	
}

encode time, gen(Time)

xtset Partner Time

xtbalance, range(1,94)

gen lnvalue=ln(OBS_VALUE+1)

save "$data/5209_quarterly.dta", replace

**Pakistan==113

tempfile temp

synth lnvalue lnvalue(1) lnvalue(2) lnvalue(3) lnvalue(4) lnvalue(5) lnvalue(6) lnvalue(7) lnvalue(8) lnvalue(9) lnvalue(10) lnvalue(11) lnvalue(12) lnvalue(13) lnvalue(14) lnvalue(15) lnvalue(16) lnvalue(17) lnvalue(18) lnvalue(19) lnvalue(20) lnvalue(21) lnvalue(22) lnvalue(23) lnvalue(24) lnvalue(25) lnvalue(26) lnvalue(27) lnvalue(28) lnvalue(29) lnvalue(30) lnvalue(31) lnvalue(32) lnvalue(33) lnvalue(34) lnvalue(35) lnvalue(36) lnvalue(37) lnvalue(38) lnvalue(39), trunit(113) trperiod(43) resultsperiod(1(1)94) nested keep(`temp')

use `temp', clear

****Figure 3(a)
tw (line _Y_treated _time) (line _Y_synthetic _time), xline(43 52) xlabel(1  "2000" 9 "2002" 17 "2004" 25 "2006" 33 "2006" 41 "2010" 49 "2012" 57 "2014" 65 "2016" 73 "2018" 81 "2020" 89 "2022", grid) graphregion(color(white)) xtitle(Year) ytitle(Log in Trade Value (1000 USD)) legend(order (1 "Pakistan" 2 "Synthetic Pakistan"))

gr export "$fig/5209_trend1.png", replace

keep _Y_treated _Y_synthetic _time
drop if _time==.
rename _time year
rename _Y_treated  treat
rename _Y_synthetic counterfact
gen gap113=treat-counterfact
sort year

****Figure 3(b)
twoway (line gap113 year, lp(solid)lw(vthin)lcolor(black)), yline(0, lpattern(shortdash) lcolor(black)) xtitle(Year) graphregion(color(white)) ytitle(Gap in Trade Value) xline(43 52) xlabel(1  "2000" 9 "2002" 17 "2004" 25 "2006" 33 "2008" 41 "2010" 49 "2012" 57 "2014" 65 "2016" 73 "2018" 81 "2020" 89 "2022", grid)

gr export "$fig/5209_gap1.png", replace


***********

use "$data/5209_quarterly.dta", clear

tempfile temp

synth lnvalue lnvalue(1) lnvalue(2) lnvalue(3) lnvalue(4) lnvalue(5) lnvalue(6) lnvalue(7) lnvalue(8) lnvalue(9) lnvalue(10) lnvalue(11) lnvalue(12) lnvalue(13) lnvalue(14) lnvalue(15) lnvalue(16) lnvalue(17) lnvalue(18) lnvalue(19) lnvalue(20) lnvalue(21) lnvalue(22) lnvalue(23) lnvalue(24) lnvalue(25) lnvalue(26) lnvalue(27) lnvalue(28) lnvalue(29) lnvalue(30) lnvalue(31) lnvalue(32) lnvalue(33) lnvalue(34) lnvalue(35) lnvalue(36) lnvalue(37) lnvalue(38) lnvalue(39), trunit(113) trperiod(43) resultsperiod(1(1)94) nested keep(`temp')

use `temp', clear


*BD, CN, TR
keep _Co_Number _W_Weight
drop if _W_Weight==.
drop if _W_Weight==0
gen controls="."
replace controls="China" if _Co_Number==32
replace controls="Turkey" if _Co_Number==147

****Figure 3(c)
graph bar (asis) _W_Weight, over(controls) ytitle(Unit weights) graphregion(color(white)) xsize(8)

gr export "$fig/5209_weights1.png", replace

*************************

use "$data/5209_quarterly.dta", clear

local clist 2 21 26 32 45 50 63 68 72 86 113 142 146 147 149 151 154
foreach i of local clist{	
	preserve
	
	tempfile temp`i'
	synth lnvalue lnvalue(1) lnvalue(2) lnvalue(3) lnvalue(4) lnvalue(5) lnvalue(6) lnvalue(7) lnvalue(8) lnvalue(9) lnvalue(10) lnvalue(11) lnvalue(12) lnvalue(13) lnvalue(14) lnvalue(15) lnvalue(16) lnvalue(17) lnvalue(18) lnvalue(19) lnvalue(20) lnvalue(21) lnvalue(22) lnvalue(23) lnvalue(24) lnvalue(25) lnvalue(26) lnvalue(27) lnvalue(28) lnvalue(29) lnvalue(30) lnvalue(31) lnvalue(32) lnvalue(33) lnvalue(34) lnvalue(35) lnvalue(36) lnvalue(37) lnvalue(38) lnvalue(39), trunit(`i') trperiod(43) resultsperiod(1(1)94)  keep(`temp`i'')

	matrix country`i' = e(RMSPE)
	matrix rownames country`i'=`i'
	matlist country`i', names(rows)
 
	use `temp`i'', clear
	keep _Y_treated _Y_synthetic _time
 	drop if _time==.
	rename _time year
 	rename _Y_treated  treat`i'
 	rename _Y_synthetic counterfact`i'
 	gen gap`i'=treat`i'-counterfact`i'
 	sort year 
	tempfile gap_`i'
	save `gap_`i'', replace
	restore
	
}	


use `gap_2', clear
sort year 


local clist 21 26 32 45 50 63 68 72 86 113 142 146 147 149 151 154
foreach i of local clist {
		merge 1:1 year using `gap_`i''
		drop _merge 
		sort year 
}


****Figure 3(d)
#delimit;

twoway 
(line gap2 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap21 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap26 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap32 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap45 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap50 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap63 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap68 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap72 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap86 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap142 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap146 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap147 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap149 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap151 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap154 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap113 year,lp(solid)lw(thick)lcolor(black)), yline(0, lpattern(shortdash) lcolor(black)) ytitle(Gap in Trade Value) xline(43 52) xlabel(1  "2000" 9 "2002" 17 "2004" 25 "2006" 33 "2008" 41 "2010" 49 "2012" 57 "2014" 65 "2016" 73 "2018" 81 "2020" 89 "2022", grid) graphregion(color(white)) xtitle(Year) leg(off);

gr export "$fig/5209_placebo_gap1.png", replace;

#delimit cr

*Summary
preserve 
keep if year>41 & year<49
collapse (mean) gap* (firstnm) year
reshape long gap, i(year) j(id)
sort gap
gen rank=_n
gen PK=0
replace PK=1 if id==113
list gap id rank
save "$data/5209_placebo_2011.dta", replace
restore

preserve 
keep if year>49
collapse (mean) gap* (firstnm) year
reshape long gap, i(year) j(id)
sort gap
gen rank=_n
gen PK=0
replace PK=1 if id==113
list gap id rank
save "$data/5209_placebo_post.dta", replace
restore

*FECT

use "$data/5209_quarterly.dta", clear

gen D=0
replace D=1 if Time>=43 & Partner==113

fect lnvalue ,treat(D) unit(Partner) time(Time) method("ife") force("two-way") cv r(4) vartype(jackknife) se


mat list e(ATT)
mat list e(ATTs)
mat list e(coefs)

****Figure 6(c)
gr export "$fig/5209_fect.png", replace




**************************************Area harvested*******************************

use "$rd/seedcotton_unginned_areaharvest.dta", clear

xtset AreaCodeM49 Year
xtbalance, range(2000,2020)

*keep China, India, Pakistan, Tajikistan, Uzebkistan
*Pakistan id==586

*keep if  AreaCodeM49==159 | AreaCodeM49==356 | AreaCodeM49==586  |  AreaCodeM49==762  |  AreaCodeM49==860  |AreaCodeM49==764 | AreaCodeM49==360 | AreaCodeM49==144|AreaCodeM49==795

*log
gen lnvalue=ln(Value+1)

tempfile temp
synth lnvalue lnvalue(2000) lnvalue(2001) lnvalue(2002) lnvalue(2003) lnvalue(2004) lnvalue(2005) lnvalue(2006) lnvalue(2007) lnvalue(2008) lnvalue(2009), trunit(586) trperiod(2010) resultsperiod(2000(1)2020)  keep(`temp') 
use `temp', clear

****Figure 4(a)
tw (line _Y_treated _time) (line _Y_synthetic _time), xline(2010) xline(2012) graphregion(color(white)) xtitle(Year) ytitle(Log of Area Harvested) legend(order (1 "Pakistan" 2 "Synthetic Pakistan")) xline(2010) xline(2012) xlabel(2000 2002 2004 2006 2008 2010 2012 2014 2016 2018 2020)
gr export "$fig/areah_trend1.png", replace


keep _Y_treated _Y_synthetic _time
drop if _time==.
rename _time year
rename _Y_treated  treat
rename _Y_synthetic counterfact
gen gap586=treat-counterfact
sort year

****Figure 4(b)
twoway (line gap586 year,lp(solid)lw(vthin)lcolor(black)), yline(0, lpattern(shortdash) lcolor(black)) xline(2010) xline(2012) xlabel(2000 2002 2004 2006 2008 2010 2012 2014 2016 2018 2020) xtitle(Year) ytitle(Gap in Area Harvested) graphregion(color(white)) 

gr export "$fig/areah_gap1.png", replace


************

use "$rd/seedcotton_unginned_areaharvest.dta", clear

xtset AreaCodeM49 Year
xtbalance, range(2000,2020)


*Pakistan id==586

keep if  AreaCodeM49==159 | AreaCodeM49==356 | AreaCodeM49==586  |  AreaCodeM49==762  |  AreaCodeM49==860  |AreaCodeM49==764 | AreaCodeM49==360 | AreaCodeM49==144|AreaCodeM49==795

*log
gen lnvalue=ln(Value+1)

tempfile temp
synth lnvalue lnvalue(2000) lnvalue(2001) lnvalue(2002) lnvalue(2003) lnvalue(2004) lnvalue(2005) lnvalue(2006) lnvalue(2007) lnvalue(2008) lnvalue(2009), trunit(586) trperiod(2010) resultsperiod(2000(1)2020)  keep(`temp') 


use `temp', clear
drop if _W_Weight==.
drop if _W_Weight==0
gen controls="."
replace controls="China" if _Co_Number==159
replace controls="India" if _Co_Number==356
replace controls="Indonesia" if _Co_Number==360
replace controls="Tajikistan" if _Co_Number==762
replace controls="Thailand" if _Co_Number==764
replace controls="Turkmenistan" if _Co_Number==795
replace controls="Uzbekistan" if _Co_Number==860

****Figure 4(c)
graph bar (asis) _W_Weight, over(controls) ytitle(Unit weights) graphregion(color(white))

gr export "$fig/areah_weights1.png", replace


************************

use "$rd/seedcotton_unginned_areaharvest.dta", clear

xtset AreaCodeM49 Year
xtbalance, range(2000,2020)


*log
gen lnvalue=ln(Value+1)

   
local clist 4 8 12 24 28 31 32 36 50 68 72 76 100 104 108 116 120 140 144 148 156 158 159 170 180 188 192 204 214 218 222 231 268 270 288 308 320 324 332 340 356 360 364 368 376 384 398 404 408 410 417 418 450 454 466 484 504 508 516 524 558 562 566 586 600 604 608 624 646 659 670 686 704 706 710 716 748 760 762 764 768 788 792 795 800 818 834 840 854 860 862 887 894
foreach i of local clist{	
	preserve
	tempfile temp`i'
	
	synth lnvalue lnvalue(2001) lnvalue(2002) lnvalue(2003) lnvalue(2004) lnvalue(2005) lnvalue(2006) lnvalue(2007) lnvalue(2008) lnvalue(2009), trunit(`i') trperiod(2010) xline(2010) xline(2012)resultsperiod(2000(1)2020)  keep (`temp`i'') replace
	matrix country`i' = e(RMSPE)
	matrix rownames country`i'=`i'
	matlist country`i', names(rows)
 
	use `temp`i'', clear
	keep _Y_treated _Y_synthetic _time
 	drop if _time==.
	rename _time year
 	rename _Y_treated  treat`i'
 	rename _Y_synthetic counterfact`i'
 	gen gap`i'=treat`i'-counterfact`i'
 	sort year 
	tempfile gap_`i'
	save `gap_`i'', replace
	restore
	
}	


use `gap_4', clear
sort year 

local clist 8 12 24 28 31 32 36 50 68 72 76 100 104 108 116 120 140 144 148 156 158 159 170 180 188 192 204 214 218 222 231 268 270 288 308 320 324 332 340 356 360 364 368 376 384 398 404 408 410 417 418 450 454 466 484 504 508 516 524 558 562 566 586 600 604 608 624 646 659 670 686 704 706 710 716 748 760 762 764 768 788 792 795 800 818 834 840 854 860 862 887 894
foreach i of local clist {
		merge 1:1 year using `gap_`i''
		drop _merge 
		sort year 
}


****Figure 4(d)
#delimit;

twoway 
(line gap4 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap8 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap12 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap24 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap28 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap31 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap31 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap32 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap36 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap50 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap68 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap76 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap100 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap104 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap108 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap116 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap120 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap140 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap144 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap148 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap156 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap158 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap159 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap170 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap180 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap188 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap192 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap204 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap214 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap218 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap222 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap231 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap268 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap270 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap308 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap320 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap324 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap332 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap340 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap356 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap360 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap368 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap376 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap384 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap398 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap404 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap408 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap410 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap417 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap418 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap450 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap454 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap466 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap484 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap504 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap508 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap516 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap524 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap558 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap562 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap566 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap600 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap604 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap608 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap624 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap646 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap659 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap670 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap686 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap704 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap706 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap710 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap716 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap748 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap760 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap762 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap764 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap768 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap788 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap792 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap795 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap800 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap818 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap834 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap840 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap854 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap860 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap862 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap887 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap894 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap586 year,lp(solid)lw(thick)lcolor(black)), yline(0, lpattern(shortdash) lcolor(black)) ytitle(Gap in Area Harvested) xtitle(Year) legend(off) graphregion(color(white)) graphregion(color(white)) xline(2010) xline(2012) xlabel(2000 2002 2004 2006 2008 2010 2012 2014 2016 2018 2020);

gr export "$fig/areah_placebo_gap1.png", replace;

#delimit cr

*Summary
preserve 
keep if year>2010 & year<2012
collapse (mean) gap* (firstnm) year
reshape long gap, i(year) j(id)
sort gap
gen rank=_n
gen PK=0
replace PK=1 if id==586
list gap id rank
save "$data/areah_placebo_2011.dta", replace
restore

preserve 
keep if year>2012
collapse (mean) gap* (firstnm) year
reshape long gap, i(year) j(id)
sort gap
gen rank=_n
gen PK=0
replace PK=1 if id==586
list gap id rank
save "$data/areah_placebo_post.dta", replace
restore

*FECT

use "$rd/seedcotton_unginned_areaharvest.dta", clear

xtset AreaCodeM49 Year
xtbalance, range(2000,2020)

*log
gen lnvalue=ln(Value+1)

gen D=0
replace D=1 if Year>=2010 & AreaCodeM49==586

fect lnvalue ,treat(D) unit(AreaCodeM49) time(Year) method("ife") force("two-way") cv r(4) vartype(jackknife) se


mat list e(ATT)
mat list e(ATTs)
mat list e(coefs)

****Figure 6(d)
gr export "$fig/areah_fect1.png", replace




*****************************************Yield*************************************

use "$rd/seedcotton_unginned_yield.dta", clear

xtset AreaCodeM49 Year
xtbalance, range(2000,2020)
drop if AreaCodeM49==156

*keep China, India, Pakistan, Tajikistan, Uzebkistan
*Pakistan id==586

*keep if AreaCodeM49==159 | AreaCodeM49==356 | AreaCodeM49==586  |  AreaCodeM49==762  |  AreaCodeM49==860  


*log
gen lnvalue=ln(Value+1)

tempfile temp
synth lnvalue lnvalue(2000) lnvalue(2001) lnvalue(2002) lnvalue(2003) lnvalue(2004) lnvalue(2005) lnvalue(2006) lnvalue(2007) lnvalue(2008) lnvalue(2009), trunit(586) trperiod(2010) resultsperiod(2000(1)2020)  keep(`temp') 
use `temp', clear

****Figure 5(a)
tw (line _Y_treated _time) (line _Y_synthetic _time), xline(2010) xline(2012) xlabel(2000 2002 2004 2006 2008 2010 2012 2014 2016 2018 2020) graphregion(color(white)) xtitle(Year) ytitle(Log of Cotton Yield) legend(order (1 "Pakistan" 2 "Synthetic Pakistan"))

gr export "$fig/yield_trend1.png", replace

keep _Y_treated _Y_synthetic _time
drop if _time==.
rename _time year
rename _Y_treated  treat
rename _Y_synthetic counterfact
gen gap71=treat-counterfact
sort year

****Figure 5(b)
twoway (line gap71 year,lp(solid)lw(vthin)lcolor(black)), yline(0, lpattern(shortdash) lcolor(black)) xline(2010) xline(2012) xlabel(2000 2002 2004 2006 2008 2010 2012 2014 2016 2018 2020) xtitle(Year) ytitle(Gap in Cotton Yield) xline(2010) xline(2012) graphregion(color(white))

gr export "$fig/yield_gap1.png", replace


**************

use "$rd/seedcotton_unginned_yield.dta", clear

xtset AreaCodeM49 Year
xtbalance, range(2000,2020)

drop if AreaCodeM49==156

*keep China, India, Pakistan, Tajikistan, Uzebkistan
*Pakistan id==586

*keep if AreaCodeM49==159 | AreaCodeM49==356 | AreaCodeM49==586  |  AreaCodeM49==762  |  AreaCodeM49==860  


*log
gen lnvalue=ln(Value+1)

tempfile temp
synth lnvalue lnvalue(2000) lnvalue(2001) lnvalue(2002) lnvalue(2003) lnvalue(2004) lnvalue(2005) lnvalue(2006) lnvalue(2007) lnvalue(2008) lnvalue(2009), trunit(586) trperiod(2010) resultsperiod(2000(1)2020)  keep(`temp') 
use `temp', clear


drop if _W_Weight==.
drop if _W_Weight==0
gen controls="."
replace controls="Azerbaijan" if _Co_Number==31
replace controls="Ecuador" if _Co_Number==218
replace controls="Israel" if _Co_Number==376
replace controls="Morocco" if _Co_Number==504
replace controls="Nepal" if _Co_Number==524
replace controls="Zimbabwe" if _Co_Number==716
replace controls="Eswatini" if _Co_Number==748
replace controls="Syria" if _Co_Number==760
replace controls="Uganda" if _Co_Number==800

****Figure 5(c)
graph bar (asis) _W_Weight, over(controls) ytitle(Unit weights) graphregion(color(white)) xsize(7)

gr export "$fig/yield_weights1.png", replace

*******************

use "$rd/seedcotton_unginned_yield.dta", replace

xtset AreaCodeM49 Year
xtbalance, range(2000,2020)

drop if AreaCodeM49==156


*log
gen lnvalue=ln(Value+1)

local clist 4 8 12 24 28 31 32 36 50 68 72 76 100 104 108 116 120 140 148 159 170 180 188 204 218 222 231 270 288 308 320 324 332 340 356 360 364 368 376 384 398 404 408 417 418 450 454 466 484 504 508 524 558 562 566 586 600 604 608 624 659 686 704 706 710 716 748 760 762 764 768 788 792 795 800 818 834 840 854 860 862 887 894
foreach i of local clist{	
	preserve
	tempfile temp`i'
	
	synth lnvalue lnvalue(2000) lnvalue(2001) lnvalue(2002) lnvalue(2003) lnvalue(2004) lnvalue(2005) lnvalue(2006) lnvalue(2007) lnvalue(2008) lnvalue(2009), trunit(`i') trperiod(2010) resultsperiod(2000(1)2020)  keep (`temp`i'') replace
	matrix country`i' = e(RMSPE)
	matrix rownames country`i'=`i'
	matlist country`i', names(rows)
 
	use `temp`i'', clear
	keep _Y_treated _Y_synthetic _time
 	drop if _time==.
	rename _time year
 	rename _Y_treated  treat`i'
 	rename _Y_synthetic counterfact`i'
 	gen gap`i'=treat`i'-counterfact`i'
 	sort year 
	tempfile gap_`i'
	save `gap_`i'', replace
	restore
	
}	


use `gap_4', clear
sort year 

local clist 8 12 24 28 31 32 36 50 68 72 76 100 104 108 116 120 140 148 159 170 180 188 204 218 222 231 270 288 308 320 324 332 340 356 360 364 368 376 384 398 404 408 417 418 450 454 466 484 504 508 524 558 562 566 586 600 604 608 624 659 686 704 706 710 716 748 760 762 764 768 788 792 795 800 818 834 840 854 860 862 887 894
foreach i of local clist {
		merge 1:1 year using `gap_`i''
		drop _merge 
		sort year 
}


****Figure 5(d)
#delimit;


twoway 
(line gap4 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap8 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap12 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap24 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap28 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap31 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap31 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap32 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap36 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap50 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap68 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap76 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap100 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap104 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap108 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap116 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap120 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap140 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap148 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap159 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap170 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap180 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap188 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap204 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap218 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap222 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap231 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap270 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap308 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap320 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap324 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap332 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap340 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap356 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap360 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap368 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap376 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap384 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap398 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap404 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap408 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap417 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap418 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap450 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap454 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap466 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap484 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap504 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap508 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap524 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap558 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap562 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap566 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap600 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap604 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap608 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap624 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap659 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap686 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap704 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap706 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap710 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap716 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap748 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap760 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap762 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap764 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap768 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap788 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap792 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap795 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap800 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap818 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap834 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap840 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap854 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap860 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap862 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap887 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap894 year ,lp(solid)lw(vthin) lcolor(gray))
(line gap586 year,lp(solid)lw(thick)lcolor(black)), yline(0, lpattern(shortdash) lcolor(black)) ytitle(Gap in Cotton Yield) xtitle(Year)  legend(off) graphregion(color(white)) xline(2010) xline(2012) xlabel(2000 2002 2004 2006 2008 2010 2012 2014 2016 2018 2020);
gr export "$fig/yield_placebo_gap1.png", replace;

#delimit cr


*Summary
preserve 
keep if year>2010 & year<2012
collapse (mean) gap* (firstnm) year
reshape long gap, i(year) j(id)
sort gap
gen rank=_n
gen PK=0
replace PK=1 if id==586
list gap id rank
save "$data/yield_placebo_2011.dta", replace
restore

preserve 
keep if year>2012
collapse (mean) gap* (firstnm) year
reshape long gap, i(year) j(id)
sort gap
gen rank=_n
gen PK=0
replace PK=1 if id==586
list gap id rank
save "$data/yield_placebo_post.dta", replace
restore


**FECT

use "$rd/seedcotton_unginned_yield.dta", clear

xtset AreaCodeM49 Year
xtbalance, range(2000,2020)


*log
gen lnvalue=ln(Value+1)

gen D=0
replace D=1 if Year>=2010 & AreaCodeM49==586

fect lnvalue ,treat(D) unit(AreaCodeM49) time(Year) method("ife") force("two-way") cv r(4) vartype(jackknife) se


mat list e(ATT)
mat list e(ATTs)
mat list e(coefs)

****Figure 6(e)
gr export "$fig/yield_fect1.png", replace
