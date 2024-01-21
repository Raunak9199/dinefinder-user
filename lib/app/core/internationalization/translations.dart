import 'package:dinefinder_user/app/core/internationalization/strings.dart';
import 'package:dinefinder_user/app/users/modules/auth/data/internationalization/strings.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          ...AuthStrings().en_US,
          ...AppCoreStrings().en_US,
          // ...
        },
      };
}
