import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'doa_method_channel.dart';

abstract class DoaPlatform extends PlatformInterface {
  /// Constructs a DoaPlatform.
  DoaPlatform() : super(token: _token);

  static final Object _token = Object();

  static DoaPlatform _instance = MethodChannelDoa();

  /// The default instance of [DoaPlatform] to use.
  ///
  /// Defaults to [MethodChannelDoa].
  static DoaPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DoaPlatform] when
  /// they register themselves.
  static set instance(DoaPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
