import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/app_dimens.dart';
import '../../../widgets/image_app_widget/image_app.dart';

class SettingsItem extends StatelessWidget {
  final dynamic icons;
  final String? iconDefault;
  final String title;
  final TextStyle? titleStyle;
  final String? subtitle;
  final TextStyle? subtitleStyle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final int? titleMaxLine;
  final int? subtitleMaxLine;
  final TextOverflow? overflow;

  const SettingsItem(
      {super.key,
      this.iconDefault,
      required this.icons,
      required this.title,
      this.titleStyle,
      this.subtitle,
      this.subtitleStyle,
      this.backgroundColor,
      this.trailing,
      this.onTap,
      this.titleMaxLine,
      this.subtitleMaxLine,
      this.overflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: ListTile(
        onTap: onTap,
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(500.r),
            child: icons is IconData
                ? Icon(
                    icons,
                    size: AppDimens.space_30,
                    color: Theme.of(context).appBarTheme.backgroundColor,
                  )
                : icons is Widget
                    ? icons
                    : AppImageWidget(
                        path: icons.toString(),
                        height: AppDimens.space_30,
                        width: AppDimens.space_30,
                        defultImage: AppImageWidget(
                          path: iconDefault,
                          height: AppDimens.space_30,
                          width: AppDimens.space_30,
                        ),
                      ),
          ),
        ),
        title: Text(
          title,
          style: titleStyle ?? const TextStyle(fontWeight: FontWeight.bold),
          maxLines: titleMaxLine,
          overflow: titleMaxLine != null ? overflow : null,
        ),
        subtitle: (subtitle != null)
            ? Text(
                subtitle!,
                style: subtitleStyle ?? Theme.of(context).textTheme.bodyMedium!,
                maxLines: subtitleMaxLine,
                overflow:
                    subtitleMaxLine != null ? TextOverflow.ellipsis : null,
              )
            : null,
        trailing:
            (trailing != null) ? trailing : const Icon(Icons.navigate_next),
      ),
    );
  }
}
