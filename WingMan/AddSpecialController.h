//
//  AddSpecialController.h
//  WingMan
//
//  Created by Johann Kriek on 13-04-04.
//  Copyright (c) 2013 Johann Kriek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddSpecialController : UITableViewController
- (IBAction)AddSpecial:(id)sender;
- (IBAction)AddImage:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *Picture;

@end
