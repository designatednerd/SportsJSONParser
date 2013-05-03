//
//  Team.h
//  MLBJsonParser
//
//  Created by Transferred on 5/2/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Team : NSObject


+(Team *)teamFromDictionary:(NSDictionary *)dictionary;

@property (nonatomic, strong) NSString *teamName;
@property (nonatomic, strong) NSString *teamLocation;

@end
