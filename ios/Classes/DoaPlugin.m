#import "DoaPlugin.h"
#if __has_include(<doa/doa-Swift.h>)
#import <doa/doa-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "doa-Swift.h"
#endif

@implementation DoaPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDoaPlugin registerWithRegistrar:registrar];
}
@end
