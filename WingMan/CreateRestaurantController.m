//
//  CreateRestaurantViewController.m
//  WingMan
//
//  Created by Johann Kriek on 13-04-10.
//  Copyright (c) 2013 Johann Kriek. All rights reserved.
//

#import "CreateRestaurantController.h"
#import "CustomTypes.h"

@interface CreateRestaurantController ()

@end

@implementation CreateRestaurantController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(tap:)];
    
    tapRecognizer.cancelsTouchesInView = NO;
    
    [self.view addGestureRecognizer:tapRecognizer];

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

-(void)viewWillAppear:(BOOL)animated
{
    _RestaurantName.text = @"";
    _RestaurantAddress.text = @"";
}

- (IBAction)CreateRestaurant:(id)sender {
    BOOL valid = true;
    NSString *msg;
    if([_RestaurantName.text isEqualToString:@""])
    {
        msg = @"Must specify a name!";
        valid = false;
    }
    else if ([_RestaurantAddress.text isEqualToString:@""])
    {
        msg = @"Must specify a location!";
        valid = false;
    }
    else
    {
    CLGeocoder *geocoder;
    
    [geocoder geocodeAddressString:_RestaurantAddress.text completionHandler:^(NSArray* placemarks, NSError* error){
                     for (CLPlacemark* aPlacemark in placemarks)
                     {
                         NSString *loc = aPlacemark.locality;
                     }
                 }];
    }
    
    if (valid)
    {
    restaurant *_val;
    _val = [[restaurant alloc] init];
    _val.name = @"Bocados";
    
    _val.lat = 34.414;
    _val.lng = 24.134;
        
        //[self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Entry!"
                                                        message:msg
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        
        [alert show];
    }
    
}

-(void)tap:(UIGestureRecognizer *)gr
{
    [self.view endEditing:YES];
}
@end
