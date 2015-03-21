//
//  League.h
//  SportsJSONParser
//
//  Created by Ellen Shapiro on 5/2/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface League : NSObject

+(League *)leagueFromDictionary:(NSDictionary *)dictionary;

@property (nonatomic, strong) NSString *leagueName;
@property (nonatomic, strong) NSArray *teams;

@end
