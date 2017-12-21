//
//  PatientDetails2ViewController.h
//  FFT Form
//
//  Created by Welltime on 11/02/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientDetails2ViewController : UIViewController<UITableViewDataSource,
UITableViewDelegate>
@property(strong,nonatomic) NSMutableArray *genderArray;
@property(strong,nonatomic) NSMutableArray *ageArray;
@property(strong,nonatomic) NSMutableArray *disabledPersonArray;
@property (weak, nonatomic) UITextField *whiteTextField;
@property (weak, nonatomic) UITextField *asianTextField;
@property (weak, nonatomic) UITextField *multipleEthinicTextField;
@property (weak, nonatomic) UITextField *blackTextField;
@property (weak, nonatomic) UITextField *otherBackgroundTextField;
@property (weak, nonatomic) UITextField *preferedNotToSayTextField;
@property (weak, nonatomic) IBOutlet UILabel *labelQuestion1;
@property (weak, nonatomic) IBOutlet UILabel *labelQuestion2;
@property (weak, nonatomic) IBOutlet UILabel *labelQuestion3;
@property (weak, nonatomic) IBOutlet UILabel *labelQuestion4;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIView *contentView;

@property(strong,nonatomic) NSMutableArray *ethnicGroupArray0;
@property(strong,nonatomic) NSMutableArray *ethnicGroupArray1;
@property(strong,nonatomic) NSMutableArray *ethnicGroupArray3;
@property(strong,nonatomic) NSString *selectedGender;
@property(strong,nonatomic) NSString *selectedAge;
@property(strong,nonatomic) NSString *selectedDisability;
@property(strong,nonatomic) NSString *selectedEthinicGroup;

@end
