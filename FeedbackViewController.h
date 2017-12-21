//
//  FeedbackViewController.h
//  FFT Form
//
//  Created by Welltime on 16/02/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCPlaceholderTextView.h"
#import "TextFieldValidator.h"

@interface FeedbackViewController : UIViewController<UITableViewDataSource,
UITableViewDelegate,UITextViewDelegate>
@property (strong, nonatomic) IBOutlet TextFieldValidator *textfield_email_addr;

@property (weak, nonatomic) IBOutlet UITextField *patientType;


@property (weak, nonatomic) IBOutlet UILabel *question1;
@property (weak, nonatomic) IBOutlet UILabel *question2;
@property (weak, nonatomic) UIPopoverController *popover_Controller;
@property(strong,nonatomic) NSMutableArray *myData;
@property(strong,nonatomic) NSMutableArray *myImages;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

- (IBAction)settings_click:(id)sender;

@property(strong,nonatomic) NSString *user_name;
@property(strong,nonatomic) NSString *user_mobile;
@property(strong,nonatomic) NSString *detailText;
@property (weak, nonatomic) IBOutlet UIButton *anonymous_checkbox;
@property (strong, nonatomic) IBOutlet GCPlaceholderTextView *details_tv;

@property (weak, nonatomic) IBOutlet UIButton *public_checkbox;

- (IBAction)anonymous_checkbox_click:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *autocompleteTableView;


- (IBAction)public_checkbox_click:(id)sender;
@property(strong,nonatomic) NSString *selectedItem;

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIView *view;
- (IBAction)submit_click:(id)sender;
- (IBAction)logout_click:(id)sender;

@property (nonatomic, retain) NSMutableArray *pastUrls;
@property (nonatomic, retain) NSMutableArray *autocompleteUrls;


@end
