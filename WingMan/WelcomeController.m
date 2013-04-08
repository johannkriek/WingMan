//
//  ViewController.m
//  WingMan
//
//  Created by Johann Kriek on 13-04-04.
//  Copyright (c) 2013 Johann Kriek. All rights reserved.
//

#import "WelcomeController.h"

@interface WelcomeController ()

@end

@implementation WelcomeController

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

- (IBAction)Login:(id)sender {
    [self performSegueWithIdentifier:@"segWelcomeToLogin" sender:self];
}

- (IBAction)Register:(id)sender {
    [self performSegueWithIdentifier:@"segWelcomeToRegister" sender:self];
}

@end
