import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Formatters {
  // static MaskTextInputFormatter phoneFormatter = MaskTextInputFormatter(
  //     mask: '##-###-##-##', filter: {'#': RegExp(r'[\+0-9]')}, type: MaskAutoCompletionType.lazy);

  static MaskTextInputFormatter phoneFormatter() => MaskTextInputFormatter(
      mask: '+### (##) ###-##-##',
      filter: {'#': RegExp(r'[\+0-9]')},
      type: MaskAutoCompletionType.lazy,
      initialText: '998');
}
