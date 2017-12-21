//
//  Questions2ViewController.m
//  FFT Form
//
//  Created by Welltime on 22/01/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import "Questions2ViewController.h"

@interface Questions2ViewController ()

@end

@implementation Questions2ViewController
bool anonymous_checked=NO;
bool public_checked=NO;


- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.contentView
//                                                                      attribute:NSLayoutAttributeLeading
//                                                                      relatedBy:0
//                                                                         toItem:self.view
//                                                                      attribute:NSLayoutAttributeLeft
//                                                                     multiplier:1.0
//                                                                       constant:0];
//    [self.view addConstraint:leftConstraint];
//    
//    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.contentView
//                                                                       attribute:NSLayoutAttributeTrailing
//                                                                       relatedBy:0
//                                                                          toItem:self.view
//                                                                       attribute:NSLayoutAttributeRight
//                                                                      multiplier:1.0
//                                                                        constant:0];
//    [self.view addConstraint:rightConstraint];

    
    self.myData = [[NSMutableArray alloc]initWithObjects:
                   @"Extremely likely",@"Likely",@"Neither likely nor unlikely",
                   @"Unlikely",@"Extremely unlikely",@"Dont Know"
                   , nil];
    
    
    [self checkTheBox];
    // Do any additional setup after loading the view
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section{
    return self.myData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath{
    NSString *cellIdent = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdent];
    
    if(cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdent];
[cell.textLabel setFont:[UIFont systemFontOfSize:14]];
    cell.textLabel.text = [self.myData objectAtIndex:indexPath.row];
    
    
    
    if([self.selectedItem isEqualToString:[self.myData objectAtIndex:indexPath.row]]) { cell.accessoryType = UITableViewCellAccessoryCheckmark; } else { cell.accessoryType = UITableViewCellAccessoryNone; }
    
    return cell;
    
    
    
    
    
}

// Default is 1 if not implemented
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:
(NSInteger)section{
    NSString *headerTitle;
    if (section==0) {
        headerTitle = @"Select one option";
       
    }
    return headerTitle;
}


#pragma mark - TableView delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if(cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.selectedItem=[self.myData objectAtIndex:indexPath.row];
        NSLog(@"selected item:%@",self.selectedItem);
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        
    }
    [tableView reloadData];
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)anonymous_checkbox_click:(id)sender {
    
    if(!anonymous_checked)
    {
        [self.anonymous_checkbox setImage:[UIImage imageNamed:@"checkbox.png"] forState:UIControlStateNormal];
        anonymous_checked=YES;
    }
    else if(anonymous_checked)
    {[self.anonymous_checkbox setImage:[UIImage imageNamed:@"checkboxSelected2.png"] forState:UIControlStateNormal];
        anonymous_checked=NO;}
    
   

    
    
    
    
}

-(void) checkTheBox{
    if(!anonymous_checked)
    {
        [self.anonymous_checkbox setImage:[UIImage imageNamed:@"checkbox.png"] forState:UIControlStateNormal];
        anonymous_checked=YES;
    }
    else if(anonymous_checked)
    {[self.anonymous_checkbox setImage:[UIImage imageNamed:@"checkboxSelected2.png"] forState:UIControlStateNormal];
        anonymous_checked=NO;}
    if(!public_checked)
    {
        [self.public_checkbox setImage:[UIImage imageNamed:@"checkbox.png"] forState:UIControlStateNormal];
        public_checked=YES;
    }
    else if(public_checked)
    {[self.public_checkbox setImage:[UIImage imageNamed:@"checkboxSelected2.png"] forState:UIControlStateNormal];
        public_checked=NO;}

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UILabel *myLabel = [[UILabel alloc] init];
    myLabel.frame = CGRectMake(8,3, 330, 15);
    
    myLabel.font = [UIFont boldSystemFontOfSize:14];
    myLabel.backgroundColor=[UIColor colorWithRed:255/256.0 green:165/256.0 blue:0/256.0 alpha:1.0];
    myLabel.textColor=[UIColor colorWithRed:255/256.0 green:255/256.0 blue:255/256.0 alpha:1.0];
    myLabel.text = [self tableView:tableView titleForHeaderInSection:section];
    
    //myLabel.backgroundColor=[UIColor colorWithRed:255/256.0 green:182/256.0 blue:193/256.0 alpha:1.0];
    UIView *headerView = [[UIView alloc] init];
    
    
    headerView.backgroundColor=[UIColor colorWithRed:255/256.0 green:165/256.0 blue:0/256.0 alpha:1.0];
    
    [headerView addSubview:myLabel];
    
    return headerView;
}

- (IBAction)public_checkbox_click:(id)sender {
    if(!public_checked)
    {
        [self.public_checkbox setImage:[UIImage imageNamed:@"checkbox.png"] forState:UIControlStateNormal];
        public_checked=YES;
    }
    else if(public_checked)
    {[self.public_checkbox setImage:[UIImage imageNamed:@"checkboxSelected2.png"] forState:UIControlStateNormal];
        public_checked=NO;}
}
@end
