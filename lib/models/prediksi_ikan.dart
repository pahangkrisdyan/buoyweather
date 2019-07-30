class PrediksiIkan{
  final double kerapu;
  final double kuniran;
  final double nangka;
  PrediksiIkan({this.kerapu, this.kuniran, this.nangka});
  PrediksiIkan.fromJson(Map<String, dynamic> json)
      : kerapu = double.parse(json['field3']),
        kuniran = double.parse(json['field2']),
        nangka = double.parse(json['field1']);

}
