// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../presentation/themes/theme_color.dart';

class LoaderWidget extends StatelessWidget {
  final double? size;
  const LoaderWidget({
    Key? key,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Center(
        child: SpinKitCubeGrid(
          color: AppColor.blue,
          size: size ?? 25,
        ),
      ),
    );
  }
}
