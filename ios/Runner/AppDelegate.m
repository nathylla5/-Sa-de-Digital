#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
import GoogleMaps;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    GMSServices.provideAPIKey("AIzaSyDTKKwohXn7zQcft5Lr1ERevsMk710D6Z0");
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
