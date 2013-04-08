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

BOOL daysOfWeek[7];

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (int i = 0; i < 7; i++) {
        daysOfWeek[i] = FALSE;
    }

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
        daysOfWeek[indexPath.row] = TRUE;
    }
    else
        if (selectedCell.accessoryType == UITableViewCellAccessoryCheckmark)
        {
            selectedCell.accessoryType = UITableViewCellAccessoryNone;
            daysOfWeek[indexPath.row] = FALSE;
        }
    //Do something
}

@end
