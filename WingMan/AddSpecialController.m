//
//  AddSpecialController.m
//  WingMan
//
//  Created by Johann Kriek on 13-04-04.
//  Copyright (c) 2013 Johann Kriek. All rights reserved.
//

#import "AddSpecialController.h"

@interface AddSpecialController ()

@end

@implementation AddSpecialController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
            initWithTarget:self action:@selector(tap:)];
    
    tapRecognizer.cancelsTouchesInView = NO;
    
    [self.view addGestureRecognizer:tapRecognizer];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults removeObjectForKey:@"picture"];
    [defaults removeObjectForKey:@"price"];
    [defaults removeObjectForKey:@"restaurant"];
    [defaults removeObjectForKey:@"daysofweek"];
    
    _Price.text = @"";
    _Picture.image = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)AddSpecial:(id)sender {
    NSString *msg;
    BOOL valid = true;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ([defaults objectForKey:@"picture"] == nil)
    {
        valid = false;
        msg = @"Picture is required!";
    }
    else if ([defaults objectForKey:@"price"] == nil)
    {
        valid = false;
        msg = @"Price is required!";
    }
    else if ([defaults objectForKey:@"restaurant"] == nil)
    {
        valid = false;
        msg = @"Restaurant required!";
    }
    else if ([defaults objectForKey:@"daysofweek"] != nil)
    {
        valid = false;
        msg = @"Days of week required!";
        
        NSMutableArray *tempDaysOfWeek = [[NSMutableArray alloc] init];
        tempDaysOfWeek = [defaults objectForKey:@"daysofweek"];
    
        for (int i=0; i<tempDaysOfWeek.count && !valid; i++) {
            if ([tempDaysOfWeek[i] isEqual:@"1"])
            {
                valid = true;
                break;
            }
        }
    }
    else
    {
        msg = @"Days of week required!";
        valid = false;
    }
    

    
    if (valid)
    {
        [defaults removeObjectForKey:@"picture"];
        [defaults removeObjectForKey:@"price"];
        [defaults removeObjectForKey:@"restaurant"];
        [defaults removeObjectForKey:@"daysofweek"];
    
        _Price.text = @"";
        _Picture.image = nil;
        _PictureButton.titleLabel.text = @"Take a Picture";
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

// Take picture
- (IBAction)AddImage:(id)sender {
    _takePictureButton.titleLabel.text = @"";
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        [imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    
    [imagePickerController setDelegate:self];
    
    [self presentModalViewController:imagePickerController animated:YES];
     
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissModalViewControllerAnimated:YES];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [_Picture setImage:image];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *key = @"picture"; // the key for the data
    
    [defaults setObject:UIImagePNGRepresentation(image) forKey:key];
    [defaults synchronize];
    
    _PictureButton.titleLabel.text = @"";
}

// Price has been entered
-(void)tap:(UIGestureRecognizer *)gr
{
    [self.view endEditing:YES];
}

- (IBAction)PriceEntered:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *key = @"price"; // the key for the data
    
    if ([_Price.text isEqualToString:@""])
    {
        [defaults removeObjectForKey:@"price"];
    }
    else
    {
        [defaults setObject:_Price.text forKey:key];
        [defaults synchronize];
    }
}
@end












