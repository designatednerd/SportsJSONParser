//
//  Sport.m
//  MLBJsonParser
//
//  Created by Transferred on 5/2/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

#import "Sport.h"
#import "League.h"

@implementation Sport

static NSString * const kSportGameKey = @"game";
static NSString * const kSportOrganizationNameKey = @"organization_name";
static NSString * const kSportFoundedKey = @"founded";
static NSString * const kSportLeaguesKey = @"leagues";


+(Sport *)sportFromDictionary:(NSDictionary *)dictionary
{
    //Create the sport object
    Sport *sport = [[Sport alloc] init];
    
    sport.game = [dictionary objectForKey:kSportGameKey];
    sport.organizationName = [dictionary objectForKey:kSportOrganizationNameKey];
    sport.foundingYear = [dictionary objectForKey:kSportFoundedKey];
    
    //Because leagues are in an array, we have to pull out the array before we can parse them.
    NSArray *leaguesArray = [dictionary objectForKey:kSportLeaguesKey];
    
    //Create a mutable dictionary so we can add leagues as we loop through.
    NSMutableArray *mutableLeagues = [NSMutableArray array];
    
    //Use a for-in loop to loop through the objects in the Array. 
    for (NSDictionary *leagueDictionary in leaguesArray) {
        League *league = [League leagueFromDictionary:leagueDictionary];
        [mutableLeagues addObject:league];
    }
    
    //Now that we're done looping, we can just assign this to the sport object.
    //Note that when you assign an NSMutableArray object to an NSArray property, it automatically
    //makes the array non-mutable.
    sport.leagues = mutableLeagues;
    
    
    //return the parsed object.
    return sport;
}


@end
