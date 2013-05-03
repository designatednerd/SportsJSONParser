//
//  AppDelegate.m
//  MLBJsonParser
//
//  Created by Transferred on 5/2/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

#import "AppDelegate.h"
#import "SportsTableViewController.h"
#import "Sport.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    //Create the window object to take up the entire bounds of the screen.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //Bring in the JSON from the file.
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"sports" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
    
    //We can cast this to an array since we know for sure this is an array at the top level -
    //NSJSONSerialization normally returns an id and you have to check whether it's an array
    //or a dictionary.
    NSError *error = nil;
    NSArray *sportsDictionaryArray = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    
    if (error != nil) {
        //something failed in reading the json, log the error so we can figure out what went wrong.
        NSLog(@"JSON error: %@", error);
    }
    
    //Create a mutable array to go through the list of dictionaries we're getting back
    NSMutableArray *sportsMutableArray = [NSMutableArray array];
    for (NSDictionary *sportDictionary in sportsDictionaryArray) {
        Sport *sport = [Sport sportFromDictionary:sportDictionary];
        [sportsMutableArray addObject:sport];
    }
    
    //Create a tableview controller using the array of sport objects we've used so far.
    SportsTableViewController *sportsTVC = [[SportsTableViewController alloc] initWithSports:sportsMutableArray];
    
    //Create a navication controller with the sports TVC
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:sportsTVC];
    
    
    //Add the nav controller as the window's root view controller, then make the window visible.
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
