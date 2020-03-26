import 'package:flutter/material.dart';

//values from textfields:
//values for Goldman
TextEditingController kExtra = TextEditingController();
TextEditingController kIntra = TextEditingController();
TextEditingController naExtra = TextEditingController();
TextEditingController naIntra = TextEditingController();
TextEditingController clExtra = TextEditingController();
TextEditingController clIntra = TextEditingController();
TextEditingController kPerm = TextEditingController();
TextEditingController naPerm = TextEditingController();
TextEditingController clPerm = TextEditingController();
TextEditingController vmTemp = TextEditingController();
//values for Nernst
TextEditingController ionExtra = TextEditingController();
TextEditingController ionIntra = TextEditingController();
TextEditingController nernstTemp = TextEditingController();
//values for ohms law
TextEditingController voltageOL = TextEditingController();
TextEditingController resistanceOL = TextEditingController();
//values for length constant
TextEditingController rmLC = TextEditingController();
TextEditingController raLC = TextEditingController();
//values for time constant
TextEditingController rmTC = TextEditingController();
TextEditingController cmTC = TextEditingController();
//local value for result
//value for Goldman
double resultGoldman = 0.0;
//value for Nernst
double resultNernst = 0.0;
//value for ohms law
double resultOL = 0.0;
//value for length constant
double resultLC = 0.0;
//value for time constant
double resultTC = 0.0;

//values for Cardiac output
TextEditingController heartRateCO = TextEditingController();
TextEditingController strokeVolumeCO = TextEditingController();
//Values for stroke volume
TextEditingController diastolicVolumeSV = TextEditingController();
TextEditingController systolicVolumeSV = TextEditingController();
//Values for oxygen transport
TextEditingController heartRateOT = TextEditingController();
TextEditingController strokeVolumeOT = TextEditingController();
TextEditingController caO2OT = TextEditingController();
TextEditingController cvO2OT = TextEditingController();
//Values for CO2 transport
TextEditingController heartRateCT = TextEditingController();
TextEditingController strokeVolumeCT = TextEditingController();
TextEditingController caCO2CT = TextEditingController();
TextEditingController cvCO2CT = TextEditingController();
//Values for oxygen per pulsebeat
TextEditingController strokeVolumeOPP = TextEditingController();
TextEditingController caO2OPP = TextEditingController();
TextEditingController cvO2OPP = TextEditingController();
//Values for MAP1
TextEditingController systolicPressureMAP1 = TextEditingController();
TextEditingController diastolicPressureMAP1 = TextEditingController();
//Values for MAP2
TextEditingController strokeVolumeMAP2 = TextEditingController();
TextEditingController heartRateMAP2 = TextEditingController();
TextEditingController tprMAP2 = TextEditingController();
//local value for result
//value for cardiac output
double resultCO = 0.0;
//value for stroke volume
double resultSV = 0.0;
//value for oxygen transport
double resultOT = 0.0;
//value for co2 transport
double resultCT = 0.0;
//value for oxygen per pulsebeat
double resultOPP = 0.0;
//value for MAP1
double resultMAP1 = 0.0;
//value for MAP2
double resultMAP2 = 0.0;

//BLOOOD
//values from textfields:
//values for oxygen saturation
TextEditingController partialPressureOS = TextEditingController();
TextEditingController oxygenSaturationOS = TextEditingController();
TextEditingController nValueOS = TextEditingController();
//local value for result
//value for oxygen saturation
double resultOS = 0.0;

//values from textfields:
//values for filtration
TextEditingController gfrF = TextEditingController();
TextEditingController plasmaConcF = TextEditingController();
//values for excretion
TextEditingController urineFlowE = TextEditingController();
TextEditingController urineConcE = TextEditingController();
//values for GFR - with inulin
TextEditingController urineConcGFR = TextEditingController();
TextEditingController urineFlowGFR = TextEditingController();
TextEditingController plasmaConcGFR = TextEditingController();
//values for plasma clearance
TextEditingController urineConcPC = TextEditingController();
TextEditingController urineFlowPC = TextEditingController();
TextEditingController plasmaConcPC = TextEditingController();
//local value for result
//value for filtration
double resultF = 0.0;
//value for excretion
double resultE = 0.0;
//value for GFR- with inulin
double resultGFR = 0.0;
//value for plasma clearance
double resultPC = 0.0;

//Toxicology
//halflife
TextEditingController kEl = TextEditingController();
double halfLifeResult = 0.0;
//chemical distribution
TextEditingController dose = TextEditingController();
TextEditingController plasmaConcentration = TextEditingController();
double chemicalResult = 0.0;
//pH weak acid
TextEditingController pKaWeakAcid = TextEditingController();
TextEditingController aWeakAcid = TextEditingController();
TextEditingController haWeakAcid = TextEditingController();
double phWeakAcidResult = 0.0;
//pH weak base
TextEditingController pKaWeakBase = TextEditingController();
TextEditingController aWeakBase = TextEditingController();
TextEditingController haWeakBase = TextEditingController();
double phWeakBaseResult = 0.0;


//Transport of Solutes and Water
//Ficks law
TextEditingController kDiffusion = TextEditingController();
TextEditingController kHoejKoncentration = TextEditingController();
TextEditingController kLavKoncentration = TextEditingController();
TextEditingController kAfstand = TextEditingController();
double fickResult = 0.0;
//osmotisk tryk
TextEditingController kTemperatur = TextEditingController();
TextEditingController kKoncentrationOploest = TextEditingController();
double osmoticPressureResult = 0.0;
//osmoserate
TextEditingController kProportionalityConstant = TextEditingController();
TextEditingController kOsmoticPressureC1 = TextEditingController();
TextEditingController kOsmoticPressureC2 = TextEditingController();
TextEditingController kOsmoticDistance = TextEditingController();
double osmoseRateResult = 0.0;