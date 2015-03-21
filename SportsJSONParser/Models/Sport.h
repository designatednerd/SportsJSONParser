//
//  Sport.h
//  SportsJSONParser
//
//  Created by Ellen Shapiro on 5/2/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sport : NSObject

+(Sport *)sportFromDictionary:(NSDictionary *)dictionary;

@property (nonatomic, strong) NSString *game;
@property (nonatomic, strong) NSString *organizationName;
@property (nonatomic, strong) NSArray *leagues;
@property (nonatomic, strong) NSString *foundingYear;

@end
