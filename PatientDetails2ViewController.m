//
//  PatientDetails2ViewController.m
//  FFT Form
//
//  Created by Welltime on 11/02/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import "PatientDetails2ViewController.h"
#import "SimpleTableCell.h"
@interface PatientDetails2ViewController ()

@end

@implementation PatientDetails2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.labelQuestion1.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    self.labelQuestion2.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    self.labelQuestion3.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    self.labelQuestion4.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    
    self.genderArray = [[NSMutableArray alloc]initWithObjects:
                        @"Female",@"Male",@"Prefer not to say",
                        nil];
    self.ageArray=[[NSMutableArray alloc]initWithObjects:
                   @"Under 16",@"16-19",@"20-25",@"26-34",@"35-44",@"45-54",@"55-64",@"65 plus",@"Prefer not to say",nil];
    
    self.ethnicGroupArray0=[[NSMutableArray alloc]initWithObjects:
                            @"Scotish",@"Other British",@"Irish",@"Write",nil];
    self.ethnicGroupArray1=[[NSMutableArray alloc]initWithObjects:
                            @"Indian",@"Pakistani",@"Bangladeshi",@"Chinese",@"Write",nil];
    self.ethnicGroupArray3=[[NSMutableArray alloc]initWithObjects:
                            @"African",@"Caribbean",@"Write",nil];
    //@"Write",@"Write"," ",nil];
    
    self.disabledPersonArray=[[NSMutableArray alloc]initWithObjects:
                              @"Yes",@"No",@"Prefer not to say",nil];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.scrollView layoutIfNeeded];
    self.scrollView.contentSize=self.contentView.bounds.size;
}

#pragma mark - Table View Data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section{
    int count=0;
    if (tableView.tag == 1) {
        count=3;
    }
    else if (tableView.tag == 2) {
        count=9;
    }
    else if (tableView.tag == 3) {
        
        switch (section) {
            case 0: return 4;
            case 1: return 5;
            case 2: return 1;
            case 3: return 3;
            case 4: return 1;
            case 5: return 1;
        }
        
    }
    else if (tableView.tag == 4) {
        count=3;
    }
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath{
    NSString *cellIdent = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdent];
    
    if(cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdent];
    [cell.textLabel setFont:[UIFont systemFontOfSize:14]];
    if(tableView.tag == 1)
        
    {cell.textLabel.text = [self.genderArray objectAtIndex:indexPath.row];
        if([self.selectedGender isEqualToString:[self.genderArray objectAtIndex:indexPath.row]]) { cell.accessoryType = UITableViewCellAccessoryCheckmark; } else { cell.accessoryType = UITableViewCellAccessoryNone; }}
    
    else if (tableView.tag == 2)
    {cell.textLabel.text = [self.ageArray objectAtIndex:indexPath.row];
        if([self.selectedAge isEqualToString:[self.ageArray objectAtIndex:indexPath.row]]) { cell.accessoryType = UITableViewCellAccessoryCheckmark; } else { cell.accessoryType = UITableViewCellAccessoryNone; }
    }
    else if (tableView.tag == 4)
    {cell.textLabel.text = [self.disabledPersonArray objectAtIndex:indexPath.row];
        if([self.selectedDisability isEqualToString:[self.disabledPersonArray objectAtIndex:indexPath.row]]) { cell.accessoryType = UITableViewCellAccessoryCheckmark; } else { cell.accessoryType = UITableViewCellAccessoryNone; }
    }
    else if (tableView.tag == 3)
    {if(indexPath.section==0)
    { cell.textLabel.text = [self.ethnicGroupArray0 objectAtIndex:indexPath.row];
        if([self.selectedEthinicGroup isEqualToString:[self.ethnicGroupArray0 objectAtIndex:indexPath.row]]) { cell.accessoryType = UITableViewCellAccessoryCheckmark; } else { cell.accessoryType = UITableViewCellAccessoryNone; }}
        
    else if(indexPath.section==1)
    { cell.textLabel.text = [self.ethnicGroupArray1 objectAtIndex:indexPath.row];
        if([self.selectedEthinicGroup isEqualToString:[self.ethnicGroupArray1 objectAtIndex:indexPath.row]]) { cell.accessoryType = UITableViewCellAccessoryCheckmark; } else { cell.accessoryType = UITableViewCellAccessoryNone; }
    }
        
    else if(indexPath.section==3)
    { cell.textLabel.text = [self.ethnicGroupArray3 objectAtIndex:indexPath.row];
        if([self.selectedEthinicGroup isEqualToString:[self.ethnicGroupArray3 objectAtIndex:indexPath.row]]) { cell.accessoryType = UITableViewCellAccessoryCheckmark; } else { cell.accessoryType = UITableViewCellAccessoryNone; }
    }
    else if(indexPath.section==2)
    {
       cell.textLabel.text = @"Other";
        
    }
    else if(indexPath.section==4)
    { cell.textLabel.text = @"Other";
        
    }
        
    else if(indexPath.section==5)
    { cell.textLabel.text = @"Other";
        
    }
        
    }
    
    
    
    
    
    return cell;
    
    
    
    
    
}

// Default is 1 if not implemented
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView.tag == 3) {
        return 6;
    }
    else
        return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:
(NSInteger)section{
    NSString *headerTitle;
    if (tableView.tag == 3)
    {
        
        if (section==0) {
            headerTitle = @"White";
            
        }
        
        else if (section==1) {
            headerTitle = @"Asian";
            
        }
        else if (section==2) {
            headerTitle = @"Multiple ethnic background";
            
        }
        else if (section==3) {
            headerTitle = @"Black";
            
        }
        
        else if (section==4) {
            headerTitle = @"Other background";
            
        }
        
        else if (section==5) {
            headerTitle = @"Prefer not to say";
            
        }
    }
    else if (tableView.tag == 1)
    {headerTitle = @"Select an option";
    }
    else if (tableView.tag == 2)
    {headerTitle = @"Select an option";
    }
    else if (tableView.tag == 4)
    {headerTitle = @"Select an option";
    }
    
    return headerTitle;
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

#pragma mark - TableView delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if(cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        if (tableView.tag == 1)
            self.selectedGender=[self.genderArray objectAtIndex:indexPath.row];
        else if (tableView.tag == 2)
            self.selectedAge=[self.ageArray objectAtIndex:indexPath.row];
        else if (tableView.tag == 3)
        {
            if(indexPath.section==0)
            {
                self.selectedEthinicGroup=[self.ethnicGroupArray0 objectAtIndex:indexPath.row];
            }
            else if(indexPath.section==1)
            {
                self.selectedEthinicGroup=[self.ethnicGroupArray1 objectAtIndex:indexPath.row];
            }
            else if(indexPath.section==3)
            {
                self.selectedEthinicGroup=[self.ethnicGroupArray3 objectAtIndex:indexPath.row];
            }
            
            
        }
        else if (tableView.tag == 4)
        {self.selectedDisability=[self.disabledPersonArray objectAtIndex:indexPath.row];
        }
        
        
        //        NSLog(@"selected item:%@",self.selectedItem);
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        
    }
    [tableView reloadData];
    //    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
