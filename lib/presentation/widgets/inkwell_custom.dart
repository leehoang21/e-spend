// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class InkWellCustom extends StatelessWidget {
  final GestureTapCallback? onTap;
  final Widget child;
  const InkWellCustom({
    super.key,
    this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.black.withOpacity(0.1),
      borderRadius: BorderRadius.circular(5),
      child: child,
    );
  }
}
