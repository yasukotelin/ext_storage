#import "ExtStoragePlugin.h"
#import <ext_storage/ext_storage-Swift.h>

@implementation ExtStoragePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftExtStoragePlugin registerWithRegistrar:registrar];
}
@end
