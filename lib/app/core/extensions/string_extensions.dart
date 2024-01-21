import 'package:flutter/services.dart';

extension StringRawDataError on String {
  bool get hasRawErrorOrNotFound =>
      toLowerCase().contains("error") ||
      toLowerCase().contains("not found") ||
      toLowerCase().contains("no value") ||
      toLowerCase().contains("unauthorized access") ||
      this == "{}" ||
      contains('{"responseMessage":"-1"}');

  bool matches(MethodCall call) =>
      call.arguments.toString().toLowerCase().contains(toLowerCase());
}
