import 'package:flutter/material.dart';

List<Widget> gap({required Iterable<Widget> children, double gap = 24}) =>
    children
        .expand((item) sync* {
          yield SizedBox(
            height: gap,
          );
          yield item;
        })
        .skip(1)
        .toList();
