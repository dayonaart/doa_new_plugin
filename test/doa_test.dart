import 'package:flutter_test/flutter_test.dart';
import 'package:doa/doa.dart';
import 'package:doa/doa_platform_interface.dart';
import 'package:doa/doa_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDoaPlatform
    with MockPlatformInterfaceMixin
    implements DoaPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DoaPlatform initialPlatform = DoaPlatform.instance;

  test('$MethodChannelDoa is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDoa>());
  });

  test('getPlatformVersion', () async {
    Doa doaPlugin = Doa();
    MockDoaPlatform fakePlatform = MockDoaPlatform();
    DoaPlatform.instance = fakePlatform;

    expect(await doaPlugin.getPlatformVersion(), '42');
  });
}
