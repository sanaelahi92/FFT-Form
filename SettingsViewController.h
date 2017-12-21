//
//  SettingsViewController.h
//  FFT Form
//
//  Created by Welltime on 03/04/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController
- (IBAction)toggle_changed:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *toggle_button;

@end
