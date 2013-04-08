//
//  AddRestaurantController.m
//  WingMan
//
//  Created by Johann Kriek on 13-04-04.
//  Copyright (c) 2013 Johann Kriek. All rights reserved.
//

#import "AddRestaurantController.h"

@interface AddRestaurantController ()

@end

@implementation AddRestaurantController

NSMutableArray *listOfItems;
NSArray *searchResults;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //Initialize the array.
    listOfItems = [[NSMutableArray alloc] init];
    
    //Add items
    listOfItems = [NSMutableArray arrayWithObjects: @"Moxies", @"Earls", @"Original Joes", @"Brewsters", @"Beer Brothers", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)AddRestaurant:(id)sender {
    //[self performSegueWithIdentifier:@"segAddRestaurantToAddSpecial" sender:self];
 
    [self addItemToTable:@"Boston Pizza"];
}

// Add item to table results
-(void)addItemToTable:(NSString *)val
{
    [listOfItems addObject:@"Boston Pizza"];
    
    [_restaurantTable reloadData];
}

// Remove item from table results
-(void)removeItemFromTable:(NSString *)val
{
    [listOfItems addObject:@"Boston Pizza"];
    
    [_restaurantTable reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
        return [listOfItems count];
        
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    
    // Set up the cell...
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = [searchResults objectAtIndex:indexPath.row];
    } else {
        cell.textLabel.text = [listOfItems objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF contains[cd] %@",
                                    searchText];
    
    searchResults = [listOfItems filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

@end
