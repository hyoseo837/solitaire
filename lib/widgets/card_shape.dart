import 'package:solitaire/widgets/card_unit.dart';

class CardShape extends CardUnit {
  final int shapeId;

  const CardShape(this.shapeId,
      {super.key, required super.idCode, required super.typeCode});
}
