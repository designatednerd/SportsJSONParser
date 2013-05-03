//
//  TeamsTableViewController.m
//  MLBJsonParser
//
//  Created by Transferred on 5/2/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

#import "TeamsTableViewController.h"
#import "Team.h"

@interface TeamsTableViewController ()
@property (nonatomic, strong) NSArray *teams;
@end

@implementation TeamsTableViewController

-(id)initWithTeams:(NSArray *)teams forLeagueNamed:(NSString *)leagueName
{
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        self.teams = teams;
        self.title = leagueName;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.teams.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    Team *rowTeam = self.teams[indexPath.row];
    
    cell.textLabel.text = rowTeam.teamName;
    cell.detailTextLabel.text = rowTeam.teamLocation;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Team *rowTeam = self.teams[indexPath.row];
    NSLog(@"Selected %@", rowTeam.teamName);
}

@end
