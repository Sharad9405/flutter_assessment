class FontEnum {
  final String _type;

  const FontEnum._(this._type);

  @override
  String toString() {
    return _type.toString();
  }

  static const FontEnum Gilroy = FontEnum._("Gilroy");
  static const FontEnum Manrope = FontEnum._("Manrope");

  static const FontEnum GRegular = FontEnum._("Gilroy-Regular");
  static const FontEnum GMedium = FontEnum._("Gilroy-Medium");
  static const FontEnum GBold = FontEnum._("Gilroy-Bold");
  static const FontEnum GExtraBold = FontEnum._("Gilroy-ExtraBold");
  static const FontEnum MRegular = FontEnum._("Manrope-Regular");
  static const FontEnum MMedium = FontEnum._("Manrope-Medium");
  static const FontEnum mBold = FontEnum._("Manrope-Bold");

}