import 'dart:math';

class Formulas {
  //neurophysiology
  static double goldman(
      double temp,
      double pK,
      double pNa,
      double pCl,
      double kOut,
      double kIn,
      double naOut,
      double naIn,
      double clOut,
      double clIn) {
    double secondPart = (((pK * kOut) + (pNa * naOut) + (pCl * clIn)) /
        ((pK * kIn) + (pNa * naIn) + (pCl * clOut)));
    return ((8.314472 * temp) / (96.4853329)) * log(secondPart);
  }

  static double nernst(double ionOut, double ionIn, double temp) {
    return ((8.3145 * temp / (96.485)) * log((ionOut) / ionIn));
  }

  static double ohmsLaw(double v, double r) {
    return v / r;
  }

  static double lengthConstant(double rM, double rA) {
    return sqrt(rM / rA);
  }

  static double timeConstant(double rM, double cM) {
    return rM / cM;
  }

  //Circulation & ventilation
  static double cardiacOutput(double hr, double sv) {
    return hr * sv;
  }

  static double strokeVolume(double edv, double esv) {
    return edv - esv;
  }

  static double oxygenTransport(
      double fh, double vs, double cao2, double cvo2) {
    return fh * vs * (cao2 - cvo2);
  }

  static double carbonTransport(
      double fh, double vs, double caco2, double cvco2) {
    return fh * vs * (caco2 - cvco2);
  }

  static double oxygenPerPulsebeat(double vs, double cao2, double cvo2) {
    return vs * (cao2 - cvo2);
  }

  static double map1(double sp, double dp) {
    return ((sp + 2 * dp) / 3);
  }

  static double map2(double sv, double hr, double tpr) {
    return sv * hr * tpr;
  }

  //kidneyphysiology
  static double filtration(double gfr, double p) {
    return gfr * p;
  }

  static double excretion(double v, double u) {
    return v * u;
  }

  static double gfrInulin(double u, double v, double p) {
    return (u * v) / p;
  }

  static double plasmaClearance(double u, double v, double p) {
    return (u * v) / p;
  }

  //bloodphysiology
}
