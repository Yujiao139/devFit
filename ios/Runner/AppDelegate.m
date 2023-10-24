#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"


@import FirebaseCore;
@import UIKit;




@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [FIRApp configure];
    return YES;
 // [GeneratedPluginRegistrant registerWithRegistry:self];
 


}



@end
