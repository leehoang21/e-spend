name: idolise
description: A new Flutter project.

publish_to: "none" # Remove this line if you wish to publish to pub.dev
version: 1.0.0+3

environment:
  sdk: ">=3.0.5 <4.0.0"

dependencies:
  flutter:
    sdk: flutter
  #ui
  cupertino_icons: ^1.0.2
  flutter_svg: ^2.0.7
  cached_network_image: ^3.2.3
  flutter_cache_manager: ^3.3.1
  photo_manager: ^2.7.1
  like_button: ^2.0.5
  fluttertoast: ^8.2.2
  popover: ^0.2.8+2
  preload_page_view: ^0.2.0
  #loading
  shimmer: ^3.0.0
  flutter_spinkit: ^5.2.0
  percent_indicator: ^4.2.3
  #utils
  tuple: ^2.0.2
  flutter_translate:
  flutter_bloc: ^8.1.3
  flutter_screenutil: ^5.8.4
  equatable: ^2.0.5
  get_it: ^7.6.0
  logger: ^2.0.1
  intl:
  injectable: ^2.1.2
  auto_route: 7.4.0
  json_annotation: ^4.8.1
  either_dart: ^1.0.0
  nb_utils: ^6.0.6
  freezed_annotation: ^2.4.1
  visibility_detector: ^0.4.0+2
  permission_handler: ^10.0.0
  
  # //network
  dio: ^5.2.1+1
  retrofit_generator: ^7.0.1+1
  http: ^0.13.6
  #  //storage
  get_storage: ^2.1.1
  path_provider: ^2.1.1
  path: ^1.8.3

  # //input
  image_picker: ^1.0.4
  pin_code_fields: ^8.0.1
  file_picker: ^5.3.3
  datepicker_dropdown: ^0.0.7+5
  extended_text_field: ^12.1.0
  # // video
  deepar_flutter:
    git:
      url: https://github.com/dinhbk59/deepar-flutter-plugin
  ffmpeg_kit_flutter:
  easy_audio_trimmer:
  video_player: ^2.7.1
  chewie: ^1.7.1
  audioplayers:
  
  #firebase
  cloud_firestore: ^4.8.5
  firebase_messaging: ^14.7.3
  firebase_core: ^2.21.0
  flutter_mentions:
    git:
      url: https://github.com/dinhbk59/flutter_mentions.git

  # social signin
  google_sign_in: ^6.1.5
  flutter_facebook_auth: ^5.0.11
  sign_in_with_apple: ^5.0.0
  firebase_auth: ^4.10.0
  pull_to_refresh_flutter3: ^2.0.2
  share_plus: ^7.1.0
  timeago: ^3.5.0
  smooth_video_progress: ^0.0.4
  firebase_storage: ^11.2.8

  # deeplink
  appsflyer_sdk: ^6.12.2
  emoji_picker_flutter: ^1.6.2
  in_app_purchase: ^3.1.11
  in_app_purchase_android: ^0.3.0+13
  in_app_purchase_storekit: ^0.3.6+7
  #
  url_launcher: ^6.1.14
  # background service
  flutter_background_service:
  flutter_background_service_ios: ^5.0.0
  flutter_background_service_android: ^6.2.0
  flutter_local_notifications: ^14.1.1
  firebase_analytics: ^10.7.0
 
  
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints:
  injectable_generator: ^2.1.6
  build_runner: ^2.4.5
  auto_route_generator: ^7.1.1
  json_serializable: ^6.7.0
  flutter_launcher_icons: 0.13.1
  flutter_gen_runner: ^5.3.1
  freezed: ^2.4.1
  
flutter_launcher_icons:
  image_path_android: "assets/images/icon_app.png"
  image_path_ios: "assets/images/icon_app.png"
  android: true # can specify file name here e.g. "ic_launcher"
  ios: true # can specify file name here e.g. "My-Launcher-Icon"
  adaptive_icon_background: "assets/images/icon_app.png" # only available for Android 8.0 devices and above
  adaptive_icon_foreground: "assets/images/icon_app.png" # only available for Android 8.0 devices and above
  min_sdk_android: 21 # android min sdk min:16, default 21
  remove_alpha_ios: true
  background_color_ios: "#ffffff"

flutter_icons:
  android: true
  ios: true
  image_path: "assets/images/icon_app.png"

flutter:
  uses-material-design: true

  # To add assets to your application, add an assets section, like this:
  assets:
    - assets/icons/
    - assets/images/
    - assets/i18n/

  # An image asset can refer to one or more resolution-specific "variants", see
  # https://flutter.dev/assets-and-images/#resolution-aware

  # For details regarding adding assets from package dependencies, see
  # https://flutter.dev/assets-and-images/#from-packages

  # To add custom fonts to your application, add a fonts section here,
  # in this "flutter" section. Each entry in this list should have a
  # "family" key with the font family name, and a "fonts" key with a
  # list giving the asset and other descriptors for the font. For
  # example:
  fonts:
    - family: AdobeClean
      fonts:
        - asset: assets/fonts/adobe_clean/AdobeCleanLight.otf
          weight: 300
        - asset: assets/fonts/adobe_clean/AdobeCleanRegular.otf
          weight: 400
        - asset: assets/fonts/adobe_clean/AdobeCleanBoldSemi.otf
          weight: 600
        - asset: assets/fonts/adobe_clean/AdobeCleanBold.otf
          weight: 700
    - family: NordiquePro
      fonts:
        - asset: assets\fonts\nordique_pro\NordiquePro-Bold.otf
          weight: 700
        - asset: assets\fonts\nordique_pro\NordiquePro-Light.otf
          weight: 300
        - asset: assets\fonts\nordique_pro\NordiquePro-Regular.otf
          weight: 400
        - asset: assets\fonts\nordique_pro\NordiquePro-Semibold.otf
          weight: 600
  # For details regarding fonts from package dependencies,
  # see https://flutter.dev/custom-fonts/#from-packages

flutter_gen:
  output: lib/common/assets

  integrations:
    flutter_svg: true
