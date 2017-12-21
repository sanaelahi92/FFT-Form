//
//  Questions2ViewController.h
//  FFT Form
//
//  Created by Welltime on 22/01/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Questions2ViewController  : UIViewController<UITableViewDataSource,
UITableViewDelegate>


@property(strong,nonatomic) NSMutableArray *myData;

@property(strong,nonatomic) NSString *selectedItem;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
- (IBAction)anonymous_checkbox_click:(id)sender;
- (IBAction)public_checkbox_click:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *anonymous_checkbox;
@property (weak, nonatomic) IBOutlet UIButton *public_checkbox;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIView *view;

@end
