//TODO make bonus holder
import 'package:flutter/cupertino.dart';
import 'package:solitaire/widgets/cards/card_bounus.dart';
import 'package:solitaire/widgets/cards/card_empty.dart';
import 'package:solitaire/widgets/holders/card_holder.dart';

class BonusHolder extends CardHolder {
  BonusHolder({
    super.key,
  });

  @override
  State<CardHolder> createState() => _BonusHolderState();
}

class _BonusHolderState extends CardHolderState<BonusHolder> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: widget.cardList.isEmpty
            ? const CardEmpty()
            : const CardBonus(idCode: 0));
  }
}
