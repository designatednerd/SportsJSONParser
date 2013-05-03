//
//  Team.m
//  MLBJsonParser
//
//  Created by Transferred on 5/2/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

#import "Team.h"

@implementation Team

static NSString * const kTeamNameKey = @"team_name";
static NSString * const kTeamLocationKey = @"team_location";

+(Team *)teamFromDictionary:(NSDictionary *)dictionary
{
    //Create a team object
    Team *team = [[Team alloc] init];
    
    //Use the defined keys to read in the team data from the dictionary
    team.teamName = [dictionary objectForKey:kTeamNameKey];
    team.teamLocation = [dictionary objectForKey:kTeamLocationKey];
    
    //Return the team object.
    return team;
}


@end
