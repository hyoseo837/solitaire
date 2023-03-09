import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:solitaire/widgets/holders/card_holder.dart';

class TargetHolder extends CardHolder {
  TargetHolder({super.key, super.active, required super.onChanged});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
