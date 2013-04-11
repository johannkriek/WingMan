//
//  CreateRestaurantViewController.h
//  WingMan
//
//  Created by Johann Kriek on 13-04-10.
//  Copyright (c) 2013 Johann Kriek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface CreateRestaurantController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *RestaurantName;
@property (weak, nonatomic) IBOutlet UITextField *RestaurantAddress;
- (IBAction)CreateRestaurant:(id)sender;

@end
