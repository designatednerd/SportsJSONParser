//
//  League.m
//  MLBJsonParser
//
//  Created by Transferred on 5/2/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

#import "League.h"
#import "Team.h"

static NSString * const kLeagueNameKey = @"league_name";
static NSString * const kLeagueTeamsKey = @"teams";

@implementation League

+(League *)leagueFromDictionary:(NSDictionary *)dictionary
{
    //Create a new league object
    League *league = [[League alloc] init];
    
    league.leagueName = [dictionary objectForKey:kLeagueNameKey];
    
    
    //Because the teams are an array of dictionaries, we have to first pull out the
    //array before we can parse them.
    NSArray *teamsArray = [dictionary objectForKey:kLeagueTeamsKey];
    
    //Create a mutable array so as we loop through all the teams, we can add them all to this array.
    NSMutableArray *mutableTeams = [NSMutableArray array];
    
    //A for-in loop loops through every object in a collection (NSArray or NSSet, usually).
    for (NSDictionary *teamDictionary in teamsArray) {
        Team *team = [Team teamFromDictionary:teamDictionary];
        [mutableTeams addObject:team];
    }
    
    //Now that we're done looping, we can just assign this to the league.
    //Note that when you assign an NSMutableArray object to an NSArray property, it automatically
    //makes the array non-mutable.
    league.teams = mutableTeams;
    
    
    //return the created object
    return league;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"%@\nTeams %@", self.leagueName, self.teams];
}

@end
