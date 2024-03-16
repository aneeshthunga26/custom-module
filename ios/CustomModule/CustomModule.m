#import "CustomModule.h"
#import <React/RCTBridge.h>
#import "CustomModule-Swift.h"

@implementation CustomModule

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(openCustomScreen) {
    dispatch_async(dispatch_get_main_queue(), ^{
        CustomViewController *customVC = [[CustomViewController alloc] init];
        UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
        [rootViewController presentViewController:customVC animated:YES completion:nil];
    });
}

@end
