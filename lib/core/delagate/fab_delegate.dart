import 'package:advance_math/advance_math.dart' hide Matrix4;
import 'package:flutter/material.dart';
import 'package:spendytracking/styles/app_size_default.dart';

class FlowFABDelegate extends FlowDelegate {
  final Animation<double> animation;

  FlowFABDelegate({required this.animation}) : super(repaint: animation);
  @override
  void paintChildren(FlowPaintingContext context) {
    final lengthChild = context.childCount;
    final sizeParents = context.size;
    final xStart = sizeParents.width / 2.4;
    final yStart = sizeParents.height / 1.28;
    for (int i = 0; i < lengthChild; i++) {
      final rad = _calculateRadian(lengthList: lengthChild, index: i);
      final x = xStart - AppSizeDefault.sizeButton * (i == 1 ? 0 : cos(rad));
      final y = yStart - AppSizeDefault.sizeButton * sin(rad);
      context.paintChild(i, transform: Matrix4.identity()..translate(x, y));
    }
  }

  double _calculateRadian({required int lengthList, int index = 0}) {
    isPermanentButton(int index) => index == lengthList - 1;
    final animate = isPermanentButton(index) ? 0 : animation.value;
    if (index == 0) {
      return index * ((2 * pi / lengthList)) - asin(animate);
    }
    if (index == 1) {
      return index * ((2 * pi / lengthList)) + 2 * asin(animate);
    }
    if (index == 2) {
      return index * ((2 * pi / lengthList)) + asin(animate);
    }

    return index * ((2 * pi / lengthList)) + asin(animate);
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return false;
  }
}
