import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/presentation/widgets/image_app_widget/image_app.dart';

import '../../../../../common/constants/app_dimens.dart';
import '../../../../../common/constants/layout_constants.dart';
import '../../../../../common/utils/pick_image_function.dart';
import '../../../../themes/themes.dart';
import '../bloc/add_photo/add_photo_bloc.dart';
import '../bloc/add_photo/add_photo_state.dart';
import '../create_transaction_constants.dart';
import 'add_photo_button.dart';

class InvoicePhotosWidget extends StatefulWidget {
  const InvoicePhotosWidget({super.key});

  @override
  State<InvoicePhotosWidget> createState() => _InvoicePhotosWidgetState();
}

class _InvoicePhotosWidgetState extends State<InvoicePhotosWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Assets.images.colorCamera.image(),
            SizedBox(
              width: AppDimens.width_20,
            ),
            Text(
              CreateTransactionConstants.invoicePhotos,
              style: ThemeText.caption
                  .copyWith(color: AppColor.tuna, fontWeight: FontWeight.w400),
            )
          ],
        ),
        SizedBox(
          height: AppDimens.height_8,
        ),
        BlocBuilder<AddPhotoBloc, AddPhotoState>(builder: (context, state) {
          final photos = state.photos;
          final length = photos.length;
          return GridView.count(
            crossAxisCount: 3,
            primary: false,
            shrinkWrap: true,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(length + 1, (index) {
              if (index == length) {
                return AddPhotoButton(
                  addPhoto: () {
                    _addPhoto(context);
                  },
                );
              } else {
                final photo = photos[index];
                return ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(LayoutConstants.roundedRadius),
                  ),
                  child: AppImageWidget(
                    path: photo.path,
                    fit: BoxFit.fill,
                    width: AppDimens.height_100,
                    height: AppDimens.height_100,
                  ),
                );
              }
            }),
          );
        })
      ],
    );
  }

  void _addPhoto(BuildContext context) {
    pickImageFuncion(
      context: context,
      camera: (_) {
        context.read<AddPhotoBloc>().openCamera();
      },
      gallery: (_) {
        context.read<AddPhotoBloc>().openGallery();
      },
    );
  }
}
