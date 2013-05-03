//
//  TeamsTableViewController.h
//  MLBJsonParser
//
//  Created by Transferred on 5/2/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamsTableViewController : UITableViewController

-(id)initWithTeams:(NSArray *)teams forLeagueNamed:(NSString *)leagueName;
@end
