//TODO make bonus holder
import 'package:flutter/cupertino.dart';
import 'package:solitaire/widgets/cards/card_bounus.dart';
import 'package:solitaire/widgets/cards/card_empty.dart';
import 'package:solitaire/widgets/holders/card_holder.dart';

class BonusHolder extends CardHolder {
  BonusHolder({super.key, super.active = false, required super.onChanged});
  @override
  Widget build(BuildContext context) {
    return Container(
        child:
            cardList.isEmpty ? const CardEmpty() : const CardBonus(idCode: 0));
  }
}
