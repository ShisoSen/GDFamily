//
//  AppDelegate.m
//  GDFamily
//
//  Created by Sicong Qian on 15/6/15.
//  Copyright © 2015年 silverup.co. All rights reserved.
//

#import "AppDelegate.h"
#import "RootVC.h"
#import "LeftVC.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    ViewController *vc = [[ViewController alloc]init];
    vc.view.backgroundColor = [UIColor redColor];
    LeftVC *left = [[LeftVC alloc]init];
    GDFSlideController *leftCenter = [[GDFSlideController alloc]initWithLeftViewController:vc centerViewController:left];
    leftCenter.LeftViewInitialOffset = -120;
    leftCenter.enablePanGesture = NO;
    RootVC *center = [[RootVC alloc]init];
    center.childCenter = left;
    GDFSlideController *rootVC = [[GDFSlideController alloc]initWithLeftViewController:leftCenter centerViewController:center];
    rootVC.LeftViewInitialOffset = -60;
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:rootVC];
    [nav setNavigationBarHidden:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.window.rootViewController = nav;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
