class CurrencyConst{
  static const Map<String, String> _currencyNational= {
    "vn": "đ",
    "us": "\$"
  };

  String getCurrency({String national="vn"}){
    return _currencyNational[national]??"";
  }
}