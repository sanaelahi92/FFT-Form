//
//  PatientDetailsViewController.h
//  FFT Form
//
//  Created by Welltime on 09/02/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPOrientation.h"
@interface PatientDetailsViewController : UIViewController<UITableViewDataSource,
UITableViewDelegate,UITextFieldDelegate,UIAlertViewDelegate>
{GPOrientation *_gpOrientation;}
@property(strong,nonatomic) NSMutableArray *genderArray;
@property(strong,nonatomic) NSMutableArray *ageArray;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property(strong,nonatomic) NSMutableArray *disabledPersonArray;

@property (strong, nonatomic) IBOutlet UIView *myView;

@property (strong, nonatomic) NSString *satisfactionDescription;
@property (strong, nonatomic) NSString *commentsForPractice;
@property (strong, nonatomic) NSString *isAnonymous;
@property (strong, nonatomic) NSString *user_name;
@property (strong, nonatomic) NSString *user_email;
@property (strong, nonatomic) NSString *user_mobile;
@property (strong, nonatomic) NSString *patient_Type;
@property (strong, nonatomic) NSString *allowPublishing;
- (IBAction)backbutton_click:(id)sender;

- (IBAction)send_click:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *labelQuestion1;
@property (weak, nonatomic) IBOutlet UILabel *labelQuestion3;
@property (weak, nonatomic) IBOutlet UILabel *labelQuestion2;
@property (weak, nonatomic) IBOutlet UILabel *labelQuestion4;
@property (weak, nonatomic) UITextField *whiteTextField;
@property (weak, nonatomic) UITextField *asianTextField;
@property (weak, nonatomic) UITextField *multipleEthinicTextField;
@property (weak, nonatomic) UITextField *blackTextField;
@property (weak, nonatomic) UITextField *otherBackgroundTextField;
@property (weak, nonatomic) UITextField *preferedNotToSayTextField;
@property (strong, nonatomic) IBOutlet UIView *Potrait;
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;

@property (weak, nonatomic) IBOutlet UITableView *tableView3;

@property (strong, nonatomic)UIView *_currentView;

@property(strong,nonatomic) NSMutableArray *ethnicGroupArray0;
@property(strong,nonatomic) NSMutableArray *ethnicGroupArray1;
@property(strong,nonatomic) NSMutableArray *ethnicGroupArray3;
@property(strong,nonatomic) NSString *selectedGender;
@property(strong,nonatomic) NSString *selectedAge;
@property(strong,nonatomic) NSString *selectedDisability;
@property(strong,nonatomic) NSString *selectedEthinicGroup;

@property(nonatomic) BOOL *textEdited;
@property(nonatomic) NSInteger *tag;


@end
