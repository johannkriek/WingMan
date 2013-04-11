//
//  AddRestaurantController.h
//  WingMan
//
//  Created by Johann Kriek on 13-04-04.
//  Copyright (c) 2013 Johann Kriek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddRestaurantController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *restaurantTable;
-(void)addItemToTable:(NSString*)val;
-(void)removeItemFromTable:(NSString*)val;
-(IBAction)AddRestaurant:(id)sender;
@end

