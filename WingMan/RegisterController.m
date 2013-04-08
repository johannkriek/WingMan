//
//  RegisterController.m
//  WingMan
//
//  Created by Johann Kriek on 13-04-04.
//  Copyright (c) 2013 Johann Kriek. All rights reserved.
//

#import "RegisterController.h"

@interface RegisterController ()

@end

@implementation RegisterController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Register:(id)sender {
    [self performSegueWithIdentifier:@"segRegisterToTab" sender:self];
}
@end
