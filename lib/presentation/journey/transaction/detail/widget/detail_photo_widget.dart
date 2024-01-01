import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/constants/app_dimens.dart';
import '../../../../../common/constants/layout_constants.dart';
import '../../../../widgets/image_app_widget/image_app.dart';
import '../bloc/detail_transaction_bloc.dart';

class DetailPhotoWidget extends StatefulWidget {
  const DetailPhotoWidget({super.key});

  @override
  State<DetailPhotoWidget> createState() => _DetailPhotoWidgetState();
}

class _DetailPhotoWidgetState extends State<DetailPhotoWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailTransactionBloc, DetailTransactionState>(
        builder: (context, state) {
      final photos = state.data.photos;
      final length = photos.length;
      return GridView.count(
        crossAxisCount: 3,
        primary: false,
        shrinkWrap: true,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.w,
        children: List.generate(length, (index) {
          final photo = photos[index];
          return ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(LayoutConstants.roundedRadius),
            ),
            child: AppImageWidget(
              path: photo,
              fit: BoxFit.fill,
              width: AppDimens.height_100,
              height: AppDimens.height_100,
            ),
          );
        }),
      );
    });
  }
}
