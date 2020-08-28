#import "FlutterSignalStrengthPlugin.h"
#if __has_include(<flutter_signal_strength/flutter_signal_strength-Swift.h>)
#import <flutter_signal_strength/flutter_signal_strength-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_signal_strength-Swift.h"
#endif

@implementation FlutterSignalStrengthPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterSignalStrengthPlugin registerWithRegistrar:registrar];
}
@end
