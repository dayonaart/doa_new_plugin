import 'package:doa/doa_lib/run_doa.dart';
import 'package:flutter/material.dart';

import 'doa_platform_interface.dart';

class Doa {
  Future<String?> getPlatformVersion() {
    return DoaPlatform.instance.getPlatformVersion();
  }

  Future<void> runDoa(BuildContext context,
      {@required void Function(String)? callback}) async {
    await openDoa(context, callback: callback);
  }
}
