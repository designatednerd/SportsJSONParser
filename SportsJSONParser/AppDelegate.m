//
//  AppDelegate.m
//  SportsJSONParser
//
//  Created by Ellen Shapiro on 5/2/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

#import "AppDelegate.h"
#import "SportsTableViewController.h"
#import "Sport.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //Create the window object to take up the entire bounds of the screen.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    NSArray *sportsDictionaryArray = [self arrayFromJSONFile];
    
    //Uncomment this and comment previous line out to see demonstration of loading same data from a plist.
//    NSArray *sportsDictionaryArray = [self arrayFromPlistFile];
    
    //Create a mutable array to go through the list of dictionaries we're getting back
    NSMutableArray *sportsMutableArray = [NSMutableArray array];
    for (NSDictionary *sportDictionary in sportsDictionaryArray) {
        Sport *sport = [Sport sportFromDictionary:sportDictionary];
        [sportsMutableArray addObject:sport];
    }
    
    //Create a tableview controller using the array of sport objects we've just created.
    SportsTableViewController *sportsTVC = [[SportsTableViewController alloc] initWithSports:sportsMutableArray];
    
    //Create a navigation controller with the sports TVC
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:sportsTVC];
    
    
    //Add the nav controller as the window's root view controller, then make the window visible.
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    return YES;
}


#pragma mark - Data loaders
-(NSArray *)arrayFromPlistFile
{
    //Bring in the JSON from the file.
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"sports" ofType:@"plist"];
    
    //Plists can be returned simply as an array with contents of file (note: if you know your
    //lowest-level object is a dictionary, you should set this up to return an NSDictionary and
    //use [NSDictionary dictionaryWithContentsOfFile:filePath] instead.     
    return [NSArray arrayWithContentsOfFile:filePath];
}

-(NSArray *)arrayFromJSONFile
{
    //Bring in the JSON from the file.
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"sports" ofType:@"json"];
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    
    //We can cast this to an array since we know for sure this is an array at the top level -
    //NSJSONSerialization normally returns an id and you have to check whether it's an array
    //or a dictionary.
    NSError *error = nil;
    NSArray *sportsDictionaryArray = [NSJSONSerialization JSONObjectWithData:fileData options:kNilOptions error:&error];
    
    if (error != nil) {
        //something failed in reading the json, log the error so we can figure out what went wrong.
        NSLog(@"JSON error: %@", error);
    }
    
    return sportsDictionaryArray;
}

#pragma mark - Data converters
-(NSString *)documentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

-(void)writeObjectToPlistFile:(id)dictionaryOrArrayToWrite
{
    //Get the path to write the file to
    NSString *plistPath = [[self documentsDirectory] stringByAppendingPathComponent:@"fromDictionary.plist"];
    
    //Log to be able to find the simulator file.
    NSLog(@"Plist path = %@", plistPath);

    //Write directly to file.
    [dictionaryOrArrayToWrite writeToFile:plistPath atomically: YES];
}

-(void)writeDictionaryToJSONFile:(id)dictionaryOrArrayToWrite
{
    NSError *error = nil;
    
    //Serialize the array or dictionary to a JSON object.
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionaryOrArrayToWrite options:NSJSONWritingPrettyPrinted error:&error];
    
    if (!error) {
        //Get the path to write the file to
        NSString *jsonPath = [[self documentsDirectory] stringByAppendingPathComponent:@"fromDictionary.json"];
        
        //Log to be able to find the simulator file
        NSLog(@"JSON path = %@", jsonPath);
        
        //Write serialized data to file.
        [jsonData writeToFile:jsonPath atomically:YES];
    } else {
        NSLog(@"Error serializing JSON: %@", error.localizedDescription);
    }
}

@end
