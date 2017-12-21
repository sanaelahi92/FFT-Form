//
//  LoginViewController.h
//  FFT Form
//
//  Created by Welltime on 22/01/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController< UITextFieldDelegate>



@property (weak, nonatomic) IBOutlet UIButton *login_btn;


- (IBAction)login_click:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *username;

@property (weak, nonatomic) IBOutlet UITextField *password;


@end
