//
//  AppDelegate.m
//  ContactsApp
//
//  Created by alvaro sebastian leon romero on 1/9/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {

}

+(NSString*)getUrlFromPlistFileWithKey:(NSString*)dictKey{

    NSBundle * bundle = [NSBundle mainBundle];
    NSString * ruta = [bundle pathForResource:@"urls" ofType:@"plist"];
    NSDictionary * url = [[NSDictionary alloc]initWithContentsOfFile:ruta];

    return [url valueForKey:dictKey];

}

+ (MBProgressHUD *)showGlobalProgressHUDWithTitle:(NSString *)title {
    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.labelText = title;
    return hud;
}

+ (void)dismissGlobalHUD {
    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
    [MBProgressHUD hideHUDForView:window animated:YES ];
    [MBProgressHUD hideAllHUDsForView:window animated:YES];
    
}

@end
