//class model sebagai model prediksi ikan
class PrediksiIkan{
  //field2 yang akan disimpan dalam hal ini sebagai atribut dari class prediksi ikan
  final double kerapu;
  final double kuniran;
  final double nangka;
  //constructor standar
  PrediksiIkan({this.kerapu, this.kuniran, this.nangka});
  //constructor yang menerima json sebagai input
  PrediksiIkan.fromJson(Map<String, dynamic> json)
      : kerapu = double.parse(json['feeds'][0]['field3']),
        kuniran = double.parse(json['feeds'][0]['field2']),
        nangka = double.parse(json['feeds'][0]['field1']);

}