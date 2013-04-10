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

@implementation restaurant
@synthesize name, lat, lng;
@end

@implementation AddRestaurantController

//NSMutableArray *listOfItems;
NSArray *searchResults;

NSMutableArray *restaurants;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    //Initalize list of restaurants
    restaurant *_val;
    _val = [[restaurant alloc] init];
    _val.name = @"Moxies";
    _val.lat = 34.414;
    _val.lng = 24.134;
    
    restaurant *_val2;
    _val2 = [[restaurant alloc] init];
    _val2.name = @"Earls";
    _val2.lat = 34.414;
    _val2.lng = 24.134;
    
    restaurant *_val3;
    _val3 = [[restaurant alloc] init];
    _val3.name = @"Boston Pizza";
    _val3.lat = 34.414;
    _val3.lng = 24.134;
    
    restaurants = [NSMutableArray arrayWithObjects: _val, _val2, _val3, nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)AddRestaurant:(id)sender {

}

// Add item to table results
-(void)addItemToTable:(NSString *)val
{
    /*
    restaurant *_val;
    _val.name = @"Moxies";
    _val.lat = 34.414;
    _val.lng = 24.134;
    
    [_restaurantTable reloadData];
     */
}

// Remove item from table results
-(void)removeItemFromTable:(NSString *)val
{
    [_restaurantTable reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
        return [restaurants count];
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
        cell.textLabel.text = [[searchResults objectAtIndex:indexPath.row] name];
    } else {
        cell.textLabel.text = [[restaurants objectAtIndex:indexPath.row] name];
    }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"restaurant"] != nil)
    {
        NSString *storedVal = [defaults objectForKey:@"restaurant"];

        if ([storedVal isEqual: cell.textLabel.text])
        {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        else
        {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }
    
    return cell;
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name contains[cd] %@", searchText];
    
    searchResults = [restaurants filteredArrayUsingPredicate:predicate];
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


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    // Chose to use the NSUSerDefautls to store values between views, think quick and dirty global variables array
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *storedVal = selectedCell.textLabel.text;
    NSString *key = @"restaurant"; // the key for the data
    
    if (selectedCell.accessoryType == UITableViewCellAccessoryNone)
    {
        selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
        [defaults setObject:storedVal forKey:key];
    }
    else
        if (selectedCell.accessoryType == UITableViewCellAccessoryCheckmark)
        {
            selectedCell.accessoryType = UITableViewCellAccessoryNone;
            [defaults setObject:@"" forKey:key];
        }
    
    [defaults synchronize];
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
