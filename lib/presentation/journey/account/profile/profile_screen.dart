import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/data/models/user_model.dart';
import 'package:flutter_e_spend/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/constants/app_dimens.dart';
import '../../../../common/utils/pick_image_function.dart';
import '../../../widgets/button_widget/text_button_widget.dart';
import '../../../widgets/image_app_widget/image_app.dart';
import '../../../widgets/scaffold_wdiget/scaffold_widget.dart';
import '../../../widgets/text_field_widget/text_field_widget.dart';
import 'cubit/profile_cubit.dart';
import 'profile_screen_contant.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final TextEditingController _emailController;

  late final TextEditingController _userNameController;
  late final UserModel user;

  @override
  void initState() {
    _emailController = TextEditingController();
    _userNameController = TextEditingController();
    user = context.read<ProfileCubit>().hiveConfig.user ?? UserModel();
    _emailController.text = user.email ?? '';
    _userNameController.text = user.userName ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appbar: AppBarWidget(
        title: ProfileScreenContant.title,
      ),
      body: ValueListenableBuilder<Box>(
        valueListenable:
            context.read<ProfileCubit>().hiveConfig.appBox.listenable(),
        builder: (context, box, widget) {
          return Column(
            children: [
              SizedBox(
                height: AppDimens.height_12,
              ),
              GestureDetector(
                onTap: () async {
                  await _pickImage(context);
                },
                child: SizedBox(
                  width: 80.w,
                  height: 80.w,
                  child: ClipOval(
                      child: AppImageWidget(
                    fit: BoxFit.fill,
                    path: context.watch<ProfileCubit>().state.avatar?.path ??
                        user.avatar,
                    defultImage: Assets.images.defaultAvatar.image(),
                  )),
                ),
              ),
              SizedBox(
                height: AppDimens.height_32,
              ),
              TextFieldWidget(
                enabled: false,
                controller: TextEditingController(text: user.phoneNumber),
              ),
              SizedBox(
                height: AppDimens.height_12,
              ),
              TextFieldWidget(
                controller: _userNameController,
                hintText: ProfileScreenContant.hintUserName,
              ),
              SizedBox(
                height: AppDimens.height_12,
              ),
              TextFieldWidget(
                controller: _emailController,
                hintText: ProfileScreenContant.hintEmail,
              ),
              SizedBox(
                height: AppDimens.height_16,
              ),
              TextButtonWidget(
                onPressed: () async {
                  context.read<ProfileCubit>().update(
                          user: user.copyWith(
                        email: _emailController.text,
                        userName: _userNameController.text,
                      ));
                },
                title: ProfileScreenContant.title,
              ),
              const Spacer(),
            ],
          );
        },
      ),
    );
  }

  Future<void> _pickImage(BuildContext context) async {
    await pickImageFuncion(
        context: context,
        gallery: (_) async {
          await context.read<ProfileCubit>().addAvatar(ImageSource.gallery);
        },
        camera: (context) async {
          await context.read<ProfileCubit>().addAvatar(ImageSource.camera);
        });
  }
}
