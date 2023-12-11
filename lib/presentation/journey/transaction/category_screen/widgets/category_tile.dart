import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/constants/string_constants.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../../../../common/constants/app_dimens.dart';
import '../../../../../data/models/category_model.dart';
import '../../../../themes/themes.dart';
import '../../../../widgets/image_app_widget/image_app.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    Key? key,
    required this.categoryModel,
    required this.isSubCategory,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  final void Function(CategoryModel) onTap;
  final bool isSubCategory;
  final CategoryModel categoryModel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final imagePath =
        "${StringConstants.imagePath}${categoryModel.name!.toLowerCase()}.png";
    return InkWell(
      onTap: () {
        onTap(categoryModel);
      },
      child: SizedBox(
        height: AppDimens.height_44,
        child: Row(
          children: [
            if (isSubCategory)
              SizedBox(
                width: AppDimens.space_18,
              ),
            SizedBox.square(
              dimension:
                  isSubCategory ? AppDimens.space_26 : AppDimens.space_36,
              child: AppImageWidget(
                path: imagePath,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: AppDimens.width_8,
            ),
            Text(
              translate(
                  "transaction_category_screen_${categoryModel.name!.toLowerCase()}"),
              style: TextStyle(
                  fontSize: AppDimens.space_14,
                  fontWeight: FontWeight.bold,
                  color: AppColor.ebonyClay),
            ),
            const Spacer(),
            if (isSelected)
              SizedBox.square(
                dimension: AppDimens.width_18,
                child: Assets.icons.check.svg(),
              )
          ],
        ),
      ),
    );
  }
}
