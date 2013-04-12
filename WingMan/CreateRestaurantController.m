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
    
    _RestaurantName.text = @"";
    _RestaurantAddress.text = @"";
    _RestaurantWebsite.text = @"";

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
   
        [self.view setUserInteractionEnabled:NO];
        //_Activity.hidden = false;
        [_Activity startAnimating];  
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];;
    
        [geocoder geocodeAddressString:_RestaurantAddress.text
                     completionHandler:^(NSArray* placemarks, NSError* error){
                         for (CLPlacemark* aPlacemark in placemarks)
                         {
                             
                             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Seach Results"
                                                                             message:@"Restaurant Found!"
                                                                            delegate:nil
                                                                   cancelButtonTitle:@"OK"
                                                                   otherButtonTitles:nil];
                             
                             restaurant *_val;
                             _val = [[restaurant alloc] init];
                             _val.name = _RestaurantName.text;
                             
                             
                             
                             _val.lat = aPlacemark.location.coordinate.latitude;
                             _val.lng = aPlacemark.location.coordinate.longitude;

                             annotation *a = [[annotation alloc] initWithTitle:_RestaurantName.text andCoordinate:aPlacemark.location.coordinate];
                             
                             [_Map removeAnnotations:_Map.annotations];
                             [_Map setCenterCoordinate:a.coordinate animated:true];
                             
                             MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.02);
                             MKCoordinateRegion region = MKCoordinateRegionMake(a.coordinate, span);
                             
                             [_Map setRegion:region animated:true];
                             [_Map addAnnotation:a];
                             
                             //Thomas add restaurant to database here
                             
                             _RestaurantName.text = @"";
                             _RestaurantAddress.text = @"";
                             _RestaurantWebsite.text = @"";
                             
                             [_Activity stopAnimating];
                             //_Activity.hidden = true;
                             [self.view setUserInteractionEnabled:YES];
                             
                             [alert show];
                             
                             break;
                         }
                     }];
    }
    
    if (valid)
    {
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
