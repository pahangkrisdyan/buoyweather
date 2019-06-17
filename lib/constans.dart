enum Cuaca{Cerah, Hujan, Berawan}
enum ArahAngin{Utara, Selatan, Timur, Barat}

String arahAnginToString(ArahAngin arahAngin){
  switch(arahAngin){
    case ArahAngin.Barat: return "Barat";
    case ArahAngin.Selatan: return "Selatan";
    case ArahAngin.Timur: return "Timur";
    case ArahAngin.Utara: return "Utara";
  }
}

String cuacaToImagePath(Cuaca cuaca){
  switch(cuaca){
    case Cuaca.Berawan: return 'assets/images/100px-icon-berawan.png';
    case Cuaca.Cerah: return 'assets/images/100px-icon-cerah.png';
    case Cuaca.Hujan: return 'assets/images/100px-icon-hujan.png';
  }
}