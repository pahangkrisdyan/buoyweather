class PrediksiIkan{
  final double kerapu;
  final double kuniran;
  final double nangka;
  PrediksiIkan({this.kerapu, this.kuniran, this.nangka});
  PrediksiIkan.fromJson(Map<String, dynamic> json)
      : kerapu = double.parse(json['feeds'][0]['field1']),
        kuniran = double.parse(json['feeds'][0]['field2']),
        nangka = double.parse(json['feeds'][0]['field3']);

}