//
//  LeagueTableViewController.m
//  SportsJSONParser
//
//  Created by Ellen Shapiro on 5/2/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

#import "LeaguesTableViewController.h"
#import "League.h"
#import "Team.h"

@interface LeaguesTableViewController ()
@property (nonatomic, strong) NSArray *leagues;
@end

@implementation LeaguesTableViewController

-(id)initWithLeagues:(NSArray *)leagues forOrganizationNamed:(NSString *)organizationName
{
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        self.leagues = leagues;
        self.title = organizationName;
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
    return self.leagues.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    League *sectionLeague = self.leagues[section];
    return sectionLeague.teams.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }

    League *sectionLeague = self.leagues[indexPath.section];
    Team *rowTeam = sectionLeague.teams[indexPath.row];
    
    cell.textLabel.text = rowTeam.teamName;
    cell.detailTextLabel.text = rowTeam.teamLocation;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    League *sectionLeague = self.leagues[section];
    return sectionLeague.leagueName;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    League *sectionLeague = self.leagues[indexPath.section];
    Team *rowTeam = sectionLeague.teams[indexPath.row];
    
    NSLog(@"Selected %@ in %@", rowTeam.teamName, rowTeam.teamLocation);
}

@end
