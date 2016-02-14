//
//  AppDelegate.m
//  ToDoList
//
//  Created by ITHS on 2016-02-12.
//  Copyright © 2016 Kozue Wendén. All rights reserved.
//

#import "AppDelegate.h"
#import "ToDoListTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

-(ToDoListTableViewController*)listController{
    return (ToDoListTableViewController*)self.window.rootViewController;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self.listController save];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    //[self.listController load];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)save{
     NSUserDefaults *settings =[NSUserDefaults standardUserDefaults];
     [settings setObject:self.listController.list forKey:@"array"];
     [settings synchronize];
}

-(void)load{
    NSUserDefaults *settings =[NSUserDefaults standardUserDefaults];
    NSMutableArray *test = [[NSMutableArray alloc]init];
    
    NSDictionary *userDefault = @{@"array": test};
    //[userDefault setObject:[[NSMutableArray alloc]init] forKey:@"array"];
    [settings registerDefaults:userDefault];
   
    
    NSMutableArray *array;
    array = [settings objectForKey:@"array"];
    self.listController.list = array;
}

@end
