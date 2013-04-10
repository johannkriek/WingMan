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
    }
    else if ([defaults objectForKey:@"price"] == nil)
    {
        valid = false;
    }
    else if ([defaults objectForKey:@"restaurant"] == nil)
    {
        valid = false;
    }
    else if ([defaults objectForKey:@"daysofweek"] != nil)
    {
        valid = false;
        
        NSMutableArray *tempDaysOfWeek = [[NSMutableArray alloc] init];
        tempDaysOfWeek = [defaults objectForKey:@"daysofweek"];
    
        for (int i=0; i<tempDaysOfWeek.count; i++) {
            if ([tempDaysOfWeek[i] isEqual:@"1"])
            {
                valid = true;
                break;
            }
        }
    }
    else
    {
        valid = false;
    }
    
    if (valid)
    {
        msg = @"YES!";
    }
    else
    {
        msg = @"NO!";
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"IS VALID?"
                                                    message:msg
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
    [defaults removeObjectForKey:@"picture"];
    [defaults removeObjectForKey:@"price"];
    [defaults removeObjectForKey:@"restaurant"];
    [defaults removeObjectForKey:@"daysofweek"];
    
    _Price.text = @"";
    _Picture.image = nil;
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
    
    [defaults setObject:image forKey:key];
    [defaults synchronize];
}

// Price has been entered
-(void)tap:(UIGestureRecognizer *)gr
{
    [self.view endEditing:YES];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *key = @"price"; // the key for the data
    
    [defaults setObject:_Price.text forKey:key];
    [defaults synchronize];
}
@end












