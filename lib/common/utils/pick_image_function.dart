import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/di/di.dart';

import '../../presentation/widgets/pick_image/cubit/pick_image_cubit.dart';
import '../../presentation/widgets/pick_image/pick_image_widget.dart';

Future<Either<File, String>?> pickImageFuncion({
  required BuildContext context,
  required Function(BuildContext context) camera,
  required Function(BuildContext context) gallery,
}) async {
  return await showCupertinoModalPopup<Either<File, String>?>(
    context: context,
    builder: (_) {
      return BlocProvider(
        create: (_) => getIt.get<PickImageCubit>(),
        child: BlocBuilder<PickImageCubit, PickImageState>(
          builder: (context, state) {
            return PickImageWidget(
              camera: ((context) => camera(context)),
              gallery: ((context) => gallery(context)),
            );
          },
        ),
      );
    },
  );
}
