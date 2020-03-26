import 'package:flutter/material.dart';

//navigationbar
const kNavigationGap = 30;
const kNavigationPadding = EdgeInsets.symmetric(horizontal: 12, vertical: 5);

//string variables for the abreviations strings/text
//neurophysiology
String abreGoldman =
    'Vm (Membrane Potential)\nR (Gas Constant)\nT (Temperature in Kelvin)\nz (Ion Valens)\nF (Faradays Constant)\np (Permeability)';
String abreNernst =
    'E (Nernst Potential)\nR (Gas Constant)\nT (Temperature in Kelvin)\nz (Ion Valens)\nF (Faradays Constant)';
String abreOhms = 'I (Current)\nV (Voltage)\nR (Resistance)';
String abreLengthConstant =
    'λ (Length Constant)\nRm (Membrane Resistance)\nRa (Serial Resistance)';
String abreTimeConstant =
    'τ (Time Constant)\nRm (Membrane Resistance)\nCm (Membrane Capacitance)';
//circulation & ventilation
String abreCardiacOutput = 'HR = heart rate\nSV = stroke volume';
String abreStrokeVolume =
    'EDV = End Diastolic Volume\nESV = End Systolic Volume';
String abreOxygenTransport =
    'fH (Heart Rate)\nVs (Stroke Volume)\nCaO2 (Arterial Oxygen Concentration)\nCvO2 (Venous Oxygen Concentration)';
String abreCO2Transport =
    'fH (Heart Rate)\nVs (Stroke Volume)\nCaCO2 (Arterial Oxygen Concentration)\nCvCO2 (Venous Oxygen Concentration)';
String abreOxygenPerPulsebeat =
    'Vs (Stroke Volume)\nCaO2 (Arterial Oxygen Concentration)\nCvO2 (Venous Oxygen Concentration)';
String abreMAP1 = 'SP (Systolic Pressure)\nDP (Diastolic Pressure)';
String abreMAP2 =
    'SV (Stroke Volume)\nHR (Heart Rate)\nTPR (Total Peripheral Resistance)';
//kidneyphysiology
String abreFiltration =
    'F (Filtration)\nGFR (Glomerular Filtration Rate)\nP (Plasma Concentration)';
String abreExcretion = 'E (Excretion)\nV (Urine Flow)\nU (Urine Concentration)';
String abreGFR =
    'U (Urine Concentration)\nV (Urine Flow)\nP (Plasma Concentration)';
String abrePlasmaClearance =
    'c (Plasma Clearance)\nU (Urine Concentration)\nV (Urine Flow)\nP (Plasma Concentration)';
//bloodphysiology
String abreOxygenSaturation = '';
//toxicology
String abreHalfLife = 'Kel (elimination rate constant)';
String abrePhWeakAcid = 'pKa (dissociation constant\nHA = weak acid)';
String abrePhWeakBase = 'pKa (dissociation constant\nBA = weak base)';

//Solutes Transport
String abreFick =
    'J (net-rate of diffusion to region with lowest concentration per second through each unit of area)\n\nD (diffusioncoefficient, a proportionalityfactor that depends on temperature and permeability)\n\nC1 and 2 (concentration of solution in region with high concentration (C1), and region with low concentration (C2). Unit mM)\n\nX (distance between region with high- and low-concentration. Unit nanometres)';
String abreOsmotiskTryk =
    'π (osmotic pressure)\n\nR (gasconstant)\n\nT (temperature in Kelvin)\n\nC (concentration of solutes)';
String abreOsmoseRate =
    'Or (osmotictransport-rate of water per unit area)\n\nK (proportionalityconstant, that depends on temperature and osmotic permeability)\n\nπ1 and 2 (osmotic pressure on each side of the membrane, π1- π2 is the pressure difference)\n\nX (distance between the two pressures)';
