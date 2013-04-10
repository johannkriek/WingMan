//
//  DaysOfWeekController.m
//  WingMan
//
//  Created by Johann Kriek on 13-04-07.
//  Copyright (c) 2013 Johann Kriek. All rights reserved.
//

#import "DaysOfWeekController.h"

@interface DaysOfWeekController ()

@end

@implementation DaysOfWeekController

NSMutableArray *daysOfWeek;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Initialize the array.
    daysOfWeek = [[NSMutableArray alloc] init];
    
    //Add items
    daysOfWeek = [NSMutableArray arrayWithObjects: @"0", @"0", @"0", @"0", @"0", @"0", @"0", nil];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (selectedCell.accessoryType == UITableViewCellAccessoryNone)
    {
        selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        [daysOfWeek setObject:@"1" atIndexedSubscript:indexPath.row];
    }
    else
        if (selectedCell.accessoryType == UITableViewCellAccessoryCheckmark)
        {
            selectedCell.accessoryType = UITableViewCellAccessoryNone;

            [daysOfWeek setObject:@"0" atIndexedSubscript:indexPath.row];
        }
    //Do something
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray *tempDaysOfWeek = [[NSMutableArray alloc] init];
    tempDaysOfWeek = [defaults objectForKey:@"daysofweek"];
    
    if ([defaults objectForKey:@"daysofweek"] != nil)
    {
        UITableViewCell *currentCell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    
        if ([tempDaysOfWeek[indexPath.row] isEqual: @"1"])
        {
            currentCell.accessoryType = UITableViewCellAccessoryCheckmark;
            [daysOfWeek setObject:@"1" atIndexedSubscript:indexPath.row];
        }
        else
        {
            currentCell.accessoryType = UITableViewCellAccessoryNone;
            [daysOfWeek setObject:@"0" atIndexedSubscript:indexPath.row];
        }
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if (self.isMovingFromParentViewController) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

        NSString *key = @"daysofweek"; // the key for the data
        
        [defaults setObject:daysOfWeek forKey:key];
        [defaults synchronize];
    }
}

@end
