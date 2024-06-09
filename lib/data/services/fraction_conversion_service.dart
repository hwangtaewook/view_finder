import 'package:injectable/injectable.dart';

@Singleton()
class FractionConversionService {
  num convert(String? fractionString) {
    if (fractionString == null) return 1;
    List<String> parts = fractionString.split('/');
    int numerator = int.parse(parts[0]);
    int denominator = int.parse(parts[1]);
    return numerator / denominator;
  }
}
