import 'package:injectable/injectable.dart';

@Singleton()
class FractionConversionService {
  num convert(String? fractionString) {
    if (fractionString == null) {
      return 1;
    }
    if (!fractionString.contains('/')) {
      return num.tryParse(fractionString) ?? 0;
    }
    List<String> parts = fractionString.split('/');
    int numerator = int.tryParse(parts[0]) ?? 0;
    int denominator = int.tryParse(parts[1]) ?? 1;
    return numerator / denominator;
  }
}
