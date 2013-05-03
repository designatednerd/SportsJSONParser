//
//  LeagueTableViewController.m
//  MLBJsonParser
//
//  Created by Transferred on 5/2/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

#import "LeaguesTableViewController.h"
#import "League.h"
#import "TeamsTableViewController.h"

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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.leagues.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    League *rowLeague = self.leagues[indexPath.row];
    
    cell.textLabel.text = rowLeague.leagueName;
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    League *rowLeague = self.leagues[indexPath.row];
    TeamsTableViewController *teamsTVC = [[TeamsTableViewController alloc] initWithTeams:rowLeague.teams forLeagueNamed:rowLeague.leagueName];
    [self.navigationController pushViewController:teamsTVC animated:YES];
}

@end
