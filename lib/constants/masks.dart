import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

abstract class Masks {
  static final cpf = MaskTextInputFormatter(mask: '###.###.###-##', filter: { "#": RegExp(r'[0-9]') });
  static final cep = MaskTextInputFormatter(mask: '#####-###', filter: { "#": RegExp(r'[0-9]') });
}