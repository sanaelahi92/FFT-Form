

#import "PatientDetailsViewController.h"
#import "SimpleTableCell.h"
#import "FeedbackViewController.h"

@interface PatientDetailsViewController ()

@end

@implementation PatientDetailsViewController
UIAlertController  *alert;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectedGender=nil;
    self.selectedDisability=nil;
    self.selectedAge=nil;
    self.selectedEthinicGroup=nil;
    
    self.textEdited=NO;
    self.tag=0;
//   self.labelQuestion1.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];

    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.contentView
                                                                      attribute:NSLayoutAttributeLeading
                                                                      relatedBy:0
                                                                         toItem:self.myView
                                                                      attribute:NSLayoutAttributeLeft
                                                                     multiplier:1.0
                                                                       constant:0];
    [self.view addConstraint:leftConstraint];
    
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.contentView
                                                                       attribute:NSLayoutAttributeTrailing
                                                                       relatedBy:0
                                                                          toItem:self.myView
                                                                       attribute:NSLayoutAttributeRight
                                                                      multiplier:1.0
                                                                        constant:0];
    [self.view addConstraint:rightConstraint];
    
//    self.labelQuestion2.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
//    self.labelQuestion3.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
//    self.labelQuestion4.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    
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
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{ self.selectedEthinicGroup=textField.text;
    self.tag=textField.tag;
    self.textEdited=YES;
    [self.tableView3 reloadData];
    [textField resignFirstResponder];
     NSLog(self.selectedEthinicGroup);
    return YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {  [alertView dismissWithClickedButtonIndex:0 animated:NO];
        if(alertView.tag!=13)
        {FeedbackViewController *vc = [[FeedbackViewController alloc] init];
        
      
        
            [self presentViewController:vc animated:YES completion:nil];}

       
        //Code for OK button
    }
    if (buttonIndex == 1)
    {
   
        //Code for download button
    }
}
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{   self.selectedEthinicGroup=textField.text;
//    NSLog(self.selectedEthinicGroup);
//     //[self.tableView3 reloadData];
//     return YES;
//}
-(UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        
    {
        cell.textLabel.text = [self.genderArray objectAtIndex:indexPath.row];
     if([self.selectedGender isEqualToString:[self.genderArray objectAtIndex:indexPath.row]]) { cell.accessoryType = UITableViewCellAccessoryCheckmark; } else { cell.accessoryType = UITableViewCellAccessoryNone; }}
    
    else if (tableView.tag == 2)
        {
            cell.textLabel.text = [self.ageArray objectAtIndex:indexPath.row];
        if([self.selectedAge isEqualToString:[self.ageArray objectAtIndex:indexPath.row]]) { cell.accessoryType = UITableViewCellAccessoryCheckmark; } else { cell.accessoryType = UITableViewCellAccessoryNone; }
        }
    else if (tableView.tag == 4)
         {
             cell.textLabel.text = [self.disabledPersonArray objectAtIndex:indexPath.row];
         if([self.selectedDisability isEqualToString:[self.disabledPersonArray objectAtIndex:indexPath.row]]) { cell.accessoryType = UITableViewCellAccessoryCheckmark; } else { cell.accessoryType = UITableViewCellAccessoryNone; }
         }
    else if (tableView.tag == 3)
    {if(indexPath.section==0)
    {   if([[self.ethnicGroupArray0 objectAtIndex:indexPath.row] isEqualToString:@"Write"])
        {static NSString *simpleTableIdentifier = @"SimpleTableCell";
        SimpleTableCell *cell2 = (SimpleTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell2 == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
            cell2 = [nib objectAtIndex:0];
        }
            
        cell2.question3textField.tag=6;
            cell2.question3textField.delegate=self;
            if(self.textEdited && self.tag==6)
                cell2.question3textField.text=self.selectedEthinicGroup;
            else
                cell2.question3textField.text=@"";
           cell2.accessoryType = UITableViewCellAccessoryNone;
            [cell2 setBackgroundColor:[self colorWithHexString:@"F5F3E6"]];
            [cell2.contentView setBackgroundColor:[self colorWithHexString:@"F5F3E6"]];
        return cell2;}
        else
        {
        cell.textLabel.text = [self.ethnicGroupArray0 objectAtIndex:indexPath.row];
            if([self.selectedEthinicGroup isEqualToString:[self.ethnicGroupArray0 objectAtIndex:indexPath.row]]&& (!self.textEdited)) { cell.accessoryType = UITableViewCellAccessoryCheckmark; } else { cell.accessoryType = UITableViewCellAccessoryNone; }}}
        
       else if(indexPath.section==1)
       {if([[self.ethnicGroupArray1 objectAtIndex:indexPath.row] isEqualToString:@"Write"])
       {static NSString *simpleTableIdentifier = @"SimpleTableCell";
           SimpleTableCell *cell2 = (SimpleTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
           if (cell2 == nil)
           {
               NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
               cell2 = [nib objectAtIndex:0];
           }
           cell2.question3textField.tag=1;
           cell2.question3textField.delegate=self;
           if(self.textEdited && self.tag==1)
               cell2.question3textField.text=self.selectedEthinicGroup;
           else
           cell2.question3textField.text=@"";
           cell2.accessoryType = UITableViewCellAccessoryNone;
           [cell2 setBackgroundColor:[self colorWithHexString:@"F5F3E6"]];
           [cell2 setBackgroundColor:[self colorWithHexString:@"F5F3E6"]];
           [cell2.contentView setBackgroundColor:[self colorWithHexString:@"F5F3E6"]];
           return cell2;}
            
            else
            
            { cell.textLabel.text = [self.ethnicGroupArray1 objectAtIndex:indexPath.row];
                if([self.selectedEthinicGroup isEqualToString:[self.ethnicGroupArray1 objectAtIndex:indexPath.row]]&& (!self.textEdited)) { cell.accessoryType = UITableViewCellAccessoryCheckmark; } else { cell.accessoryType = UITableViewCellAccessoryNone; }}
         }
        
       else if(indexPath.section==3)
       {   if([[self.ethnicGroupArray3 objectAtIndex:indexPath.row] isEqualToString:@"Write"])
       {static NSString *simpleTableIdentifier = @"SimpleTableCell";
           SimpleTableCell *cell2 = (SimpleTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
           if (cell2 == nil)
           {
               NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
               cell2 = [nib objectAtIndex:0];
           }
           cell2.question3textField.tag=3;
           cell2.question3textField.delegate=self;
           if(self.textEdited && self.tag==3)
              cell2.question3textField.text=self.selectedEthinicGroup;
           else
           cell2.question3textField.text=@"";
           cell2.accessoryType = UITableViewCellAccessoryNone;
           [cell2 setBackgroundColor:[self colorWithHexString:@"F5F3E6"]];
           [cell2.contentView setBackgroundColor:[self colorWithHexString:@"F5F3E6"]];
           return cell2;}
           
        else{
           cell.textLabel.text = [self.ethnicGroupArray3 objectAtIndex:indexPath.row];
           if([self.selectedEthinicGroup isEqualToString:[self.ethnicGroupArray3 objectAtIndex:indexPath.row]]&&(!self.textEdited)) { cell.accessoryType = UITableViewCellAccessoryCheckmark; } else { cell.accessoryType = UITableViewCellAccessoryNone; }}
       }
       else if(indexPath.section==2)
       {
           static NSString *simpleTableIdentifier = @"SimpleTableCell";
           SimpleTableCell *cell2 = (SimpleTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
           if (cell2 == nil)
           {
               NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
               cell2 = [nib objectAtIndex:0];
           }
           cell2.question3textField.tag=2;
           cell2.question3textField.delegate=self;
           if(self.textEdited && self.tag==2)
               cell2.question3textField.text=self.selectedEthinicGroup;
           else
               cell2.question3textField.text=@"";
           cell2.accessoryType = UITableViewCellAccessoryNone;
           [cell2 setBackgroundColor:[self colorWithHexString:@"F5F3E6"]];
           [cell2.contentView setBackgroundColor:[self colorWithHexString:@"F5F3E6"]];
           return cell2;
         
       }
       else if(indexPath.section==4)
       { static NSString *simpleTableIdentifier = @"SimpleTableCell";
           SimpleTableCell *cell2 = (SimpleTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
           if (cell2 == nil)
           {
               NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
               cell2 = [nib objectAtIndex:0];
           }
           cell2.question3textField.tag=4;
           cell2.question3textField.delegate=self;
           if(self.textEdited && self.tag==4)
               cell2.question3textField.text=self.selectedEthinicGroup;
           else
               cell2.question3textField.text=@"";
           cell2.accessoryType = UITableViewCellAccessoryNone;
           [cell2 setBackgroundColor:[self colorWithHexString:@"F5F3E6"]];
           [cell2.contentView setBackgroundColor:[self colorWithHexString:@"F5F3E6"]];
           return cell2;
           
       }
        
       else if(indexPath.section==5)
       { cell.textLabel.text = @"Prefer not to say";
           if([self.selectedEthinicGroup isEqualToString:@"Prefer not to say"]&& (!self.textEdited)) { cell.accessoryType = UITableViewCellAccessoryCheckmark; } else { cell.accessoryType = UITableViewCellAccessoryNone; }}
           
       
        
        }
    [cell setBackgroundColor:[self colorWithHexString:@"F5F3E6"]];
    
    [cell.contentView setBackgroundColor:[self colorWithHexString:@"F5F3E6"]];
   
    
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
     myLabel.backgroundColor=[UIColor colorWithRed:51/256.0 green:153/256.0 blue:204/256.0 alpha:1.0];
    myLabel.textColor=[UIColor colorWithRed:255/256.0 green:255/256.0 blue:255/256.0 alpha:1.0];
    myLabel.text = [self tableView:tableView titleForHeaderInSection:section];
    
    //myLabel.backgroundColor=[UIColor colorWithRed:255/256.0 green:182/256.0 blue:193/256.0 alpha:1.0];
    UIView *headerView = [[UIView alloc] init];
    
    
     headerView.backgroundColor=[UIColor colorWithRed:51/256.0 green:153/256.0 blue:204/256.0 alpha:1.0];
    
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
          else if(indexPath.section==5)
          {
              self.selectedEthinicGroup=@"Prefer not to say";
          }
          
      }
      else if (tableView.tag == 4)
      {self.selectedDisability=[self.disabledPersonArray objectAtIndex:indexPath.row];
      }
        
        self.textEdited=NO;
//        NSLog(@"selected item:%@",self.selectedItem);
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        
    }
    [tableView reloadData];
    //    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.myScrollView layoutIfNeeded];
    self.myScrollView.contentSize=self.contentView.bounds.size;
}

//- (IBAction)back_click:(id)sender {
//    
//    FeedbackViewController *vc = [[FeedbackViewController alloc] init];
//    
//    
//    [self presentViewController:vc animated:YES completion:nil];
//}
- (IBAction)backbutton_click:(id)sender {
    
        FeedbackViewController *vc = [[FeedbackViewController alloc] init];
    
    
        [self presentViewController:vc animated:YES completion:nil];

}

- (IBAction)send_click:(id)sender {
    
    if(!self.selectedAge || !self.selectedDisability || !self.selectedEthinicGroup || !self.selectedGender){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Data"
                                                        message:@"Please fill all the required fields..."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil,nil];
        alert.tag=13;
        [alert show] ;
        return;}
    
    else if([self.selectedGender isEqualToString:@""]||[self.selectedDisability isEqualToString:@""]||[self.selectedAge isEqualToString:@""]||[self.selectedEthinicGroup isEqualToString:@""])
    { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Data"
                                                      message:@"Please provide feedback to all required questions..."
                                                     delegate:self
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil,nil];
        [alert show] ;
        return;}
    
    
    alert = [UIAlertController alertControllerWithTitle:@"Loading Services \n\n" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center = CGPointMake(130.5, 65.5);
    spinner.color = [UIColor blackColor];
    [spinner startAnimating];
    [alert.view addSubview:spinner];
    
    
    [self presentViewController:alert animated:YES completion:nil];
    
        
        NSURL *url = [NSURL URLWithString:@"http://217.199.168.86/PatientConnections/OnlineServices/RestServices.svc/InsertFFTAnswers"];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
        [request setHTTPMethod:@"POST"];
        [request setHTTPShouldHandleCookies:NO];
        
        NSString *username=[[NSUserDefaults standardUserDefaults] objectForKey:@"UserName"];
    NSString *password=[[NSUserDefaults standardUserDefaults] objectForKey:@"Password"];
        NSString *authStr = [NSString stringWithFormat:@"%@:%@", username, password];
        NSData *authData = [authStr dataUsingEncoding:NSASCIIStringEncoding];
        NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed]];
        
        
        
    NSLog(@"user_email:%@",self.user_email);
    NSLog(@"user_name:%@",self.user_name);
        NSDictionary* jsonDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                         self.satisfactionDescription,@"satisfactionDescription",
                                    self.commentsForPractice, @"commentsForPractice",self.isAnonymous,@"isAnonymous",self.allowPublishing,
                                    @"allowPublishing",self.selectedAge,@"age",self.selectedGender,@"gender",self.selectedEthinicGroup,@"ethnicGroup",self.selectedDisability,@"disabled",self.user_name,@"patientName",self.user_email,@"email",self.user_mobile,@"mobile",self.patient_Type,@"customerType",
                                        nil];
    
    for (id key in jsonDictionary) {
        NSLog(@"key: %@, value: %@ \n", key, [jsonDictionary objectForKey:key]);
    }

//
        NSError *error;
        NSData* jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary
                                                           options:NSJSONWritingPrettyPrinted error:&error];
        
        [request setValue:authValue forHTTPHeaderField:@"Authorization"];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        // should check for and handle errors here but we aren't
        [request setHTTPBody:jsonData];
        
        
        
        
        
        
        
        
       
        [NSURLConnection sendAsynchronousRequest:request
                                           queue:[NSOperationQueue mainQueue]
                               completionHandler:^(NSURLResponse *response,
                                                   NSData *data, NSError *connectionError)
         {
             if (data.length > 0 && connectionError == nil)
             {[alert dismissViewControllerAnimated:YES completion:nil];
                 
                 NSString *requestReply = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSASCIIStringEncoding];
                 NSLog(@"requestReply: %@", requestReply);
                 
                 if([requestReply containsString:@"true"])
                     
                 {UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Submission Confirmation"
                                                                  message:@"Data submitted successfully "
                                                                 delegate:self
                                                        cancelButtonTitle:@"OK"
                                                        otherButtonTitles:nil,nil];
                     [alert show] ;
                     return;}
                 else
                 {UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Submission Error"
                                                                  message:@"Sorry!..Server is down at the moment.Data cannot be submitted :("
                                                                 delegate:self
                                                        cancelButtonTitle:@"OK"
                                                        otherButtonTitles:nil,nil];
                     [alert show] ;
                     return;}
                 
                 
                 
             }
             else
             {[alert dismissViewControllerAnimated:YES completion:nil];
                 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Submission Error"
                                                              message:@"Sorry!..Server is down at the moment.Data cannot be submitted :("
                                                             delegate:self
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil,nil];
                 [alert show] ;
                 return;}

         }];
        
        
    }
    
   
    
    

@end
