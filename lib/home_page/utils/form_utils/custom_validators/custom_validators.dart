abstract class CustomValidators {
  static String validateInt(String text) {
    if (int.tryParse(text) == null) {
      return 'Apenas números inteiros';
    }

    return null;
  }

  static String validateDouble(String text) {
    if (double.tryParse(text) == null) {
      return 'Apenas números reais';
    }

    return null;
  }
}