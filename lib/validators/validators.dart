import 'package:cpfcnpj/cpfcnpj.dart';

class Validators {

  static const PASSWORD_LENGTH = 6;

  static String emailValidator(String text) {
    return requiredValidator(text) ??
        (!text.contains('@') ? 'E-mail Inválido' : null);
  }

  static String passwordValidator(String text) {
    return text.isEmpty ? 'Informe a senha' : (text.length < PASSWORD_LENGTH ? 'A senha deve conter mais de $PASSWORD_LENGTH caracteres' : null);
  }

  static String lengthValidator(String text, int length) {
    return requiredValidator(text) ??
        (text.length < length ? 'Tamanho inválido' : null);
  }

  static String requiredValidator(String text) {
    return text.isEmpty ? 'Campo Obrigatório' : null;
  }

  static String cpfValidator(String text) {
    if(text.length > 13) {
      if(CPF.isValid(text)) {
        return null;
      } else {
        return 'CPF inválido';
      }
    }
    return null;
  }

}