//
//  QuestionsViewController.h
//  FFT Form
//
//  Created by Welltime on 22/01/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionsViewController : UIViewController<UITableViewDataSource,
UITableViewDelegate>


@property(strong,nonatomic) NSMutableArray *myData;

@property (weak, nonatomic) IBOutlet UITableView *myTableView;


@property(strong,nonatomic) NSString *selectedItem;