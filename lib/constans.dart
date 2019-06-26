//file yang berisi variable2 constan yang digunakan dalam aplikasi

//deskripsi apliaksi
const String DESKRIPSI = 'Buoyweather Station type II merupakan wahana apung untuk penelitian mengenai buoy laut yang dilakukan oleh Departemen Fisika ITS. Buoyweather Station type II digunakan untuk menopang peralatan peramalan cuaca maritim dan persebaran ikan.';

//api key
const String API_KEY = 'UY4GS7XUXXOYE3R0';

// domain data
const String DOMAIN_URL = 'www.thingspeak.com';

//enum status loading
enum LoadStatus{PREPARE, LOAD_CUACA_MARITIM, LOAD_PREDIKSI_CUACA_MARITIM, LOAD_PREDIKSI_IKAN, HAMPIR_SELESAI, DONE}

//macam cuaca
enum Cuaca{Cerah, Hujan, Berawan}

//macam arah angin
enum ArahAngin{Utara, Selatan, Timur, Barat}

//mengkonvert arah angin menjadi string
String arahAnginToString(ArahAngin arahAngin){
  switch(arahAngin){
    case ArahAngin.Barat: return "Barat";
    case ArahAngin.Selatan: return "Selatan";
    case ArahAngin.Timur: return "Timur";
    case ArahAngin.Utara: return "Utara";
  }
}

//mengkonvert cuaca dengan gambar sebagai tema
String cuacaToImagePath(Cuaca cuaca){
  switch(cuaca){
    case Cuaca.Berawan: return 'assets/images/100px-icon-berawan.png';
    case Cuaca.Cerah: return 'assets/images/100px-icon-cerah.png';
    case Cuaca.Hujan: return 'assets/images/100px-icon-hujan.png';
  }
}