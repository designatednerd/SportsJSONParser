//
//  SportTableViewController.m
//  MLBJsonParser
//
//  Created by Transferred on 5/2/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

#import "SportsTableViewController.h"
#import "Sport.h"
#import "LeaguesTableViewController.h"

@interface SportsTableViewController ()
@property (nonatomic, strong) NSArray *sports;
@end

@implementation SportsTableViewController

-(id)initWithSports:(NSArray *)sports
{
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        self.sports = sports;
        self.title = @"Sports!";
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
    return self.sports.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    //Get the row sport
    Sport *rowSport = self.sports[indexPath.row];
    
    cell.textLabel.text = rowSport.organizationName;
    cell.detailTextLabel.text = rowSport.game;
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Get the sport at the selected row
    Sport *rowSport = self.sports[indexPath.row];
    
    //Use it to create a league table view controller
    LeaguesTableViewController *leagueTVC = [[LeaguesTableViewController alloc] initWithLeagues:rowSport.leagues forOrganizationNamed:rowSport.organizationName];
    
    //Push the navigation controller for the leagues
    [self.navigationController pushViewController:leagueTVC animated:YES];    
}

@end
