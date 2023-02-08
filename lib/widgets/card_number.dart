import 'package:solitaire/widgets/card_unit.dart';

class CardNumber extends CardUnit {
  final int number;
  final String shape;

  const CardNumber(this.number, this.shape, super.idCode, super.typeCode,
      {super.key});
}
