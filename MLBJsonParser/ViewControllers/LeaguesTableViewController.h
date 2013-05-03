//
//  LeagueTableViewController.h
//  MLBJsonParser
//
//  Created by Transferred on 5/2/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeaguesTableViewController : UITableViewController

-(id)initWithLeagues:(NSArray *)leagues forOrganizationNamed:(NSString *)organizationName;

@end
