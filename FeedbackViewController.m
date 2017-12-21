//
//  FeedbackViewController.m
//  FFT Form
//
//  Created by Welltime on 16/02/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import "FeedbackViewController.h"
#import "LoginViewController.h"
#import "PatientDetailsViewController.h"
#import "FeedbackTableViewCell.h"
#import "SettingsViewController.h"



@interface FeedbackViewController ()

@end

@implementation FeedbackViewController

bool checked_anonymous=YES;
bool checked_public=NO;

 UIAlertController  *alert;
@synthesize details_tv;

- (void)viewDidLoad {
    [super viewDidLoad];
   checked_anonymous=YES;
     self.patientType.delegate=self;
    
   
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
//                                   initWithTarget:self
//                                   action:@selector(dismissKeyboard)];
//    
//    [self.view addGestureRecognizer:tap];
    
    self.detailText=@"";
    self.details_tv.delegate=self;
    self.details_tv.editable=YES;
    self.textfield_email_addr.delegate=self;
//        self.question1.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
//    self.question2.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    self.myData=[[NSMutableArray alloc]initWithObjects:
                 @"Extremely likely",@"Likely",@"Neither likely nor unlikely",
                 @"Unlikely",@"Extremely unlikely",@"Dont Know"
                 , nil];
    self.myImages=[[NSMutableArray alloc]initWithObjects:
                 @"icon_extremely_likely.png",@"icon_likely.png",@"icon_neither.png",
                 @"icon_unhappy.png",@"icon_extremely_unlikely.png",@"icon_dont_know.png"
                 , nil];
    self.user_name=@"anonymous";
    self.user_mobile=@"anonymous";
    self.details_tv.placeholderColor = [UIColor grayColor];
    self.details_tv.placeholder = NSLocalizedString(@"Enter text here",);
[self.textfield_email_addr addRegx:@"[A-Z0-9a-z._%+-]{3,}+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}" withMsg:@"Enter valid email."];
    
    
    self.pastUrls = [[NSMutableArray alloc] initWithObjects:@"NHS",@"Denplan",@"Private",@"nhs",@"denplan",@"private",nil];
    self.autocompleteUrls = [[NSMutableArray alloc] init];
    
//    self.autocompleteTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 80, 320, 120) style:UITableViewStylePlain];
    self.autocompleteTableView.delegate = self;
    self.autocompleteTableView.dataSource = self;
    self.autocompleteTableView.scrollEnabled = YES;
    self.autocompleteTableView.tag=5;
   self.autocompleteTableView.hidden = YES;
           [self checkTheBox];
    // Do any additional setup after loading the view from its nib.
}
-(void)dismissKeyboard {
    [self.textfield_email_addr resignFirstResponder];
    [self.details_tv resignFirstResponder];
    [self.patientType resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section{
    if(tableView.tag==5)
    {return self.autocompleteUrls.count;}
    return self.myData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath{
    if(tableView.tag==5)
    { UITableViewCell *cell = nil;
        static NSString *AutoCompleteRowIdentifier = @"AutoCompleteRowIdentifier";
        cell = [tableView dequeueReusableCellWithIdentifier:AutoCompleteRowIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]
                     initWithStyle:UITableViewCellStyleDefault reuseIdentifier:AutoCompleteRowIdentifier];
        }
        
        cell.textLabel.text = [self.autocompleteUrls objectAtIndex:indexPath.row];
        return cell;
}
    
    static NSString *simpleTableIdentifier = @"FeedbackTableViewCell";
    FeedbackTableViewCell *cell2 = (FeedbackTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell2 == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"FeedbackTableViewCell" owner:self options:nil];
        cell2 = [nib objectAtIndex:0];
    }
[cell2 setBackgroundColor:[self colorWithHexString:@"F5F3E6"]];
    
    //////
//    NSString *cellIdent = @"cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdent];
//    
//    if(cell == nil)
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdent];
//    
    [cell2.label setFont:[UIFont systemFontOfSize:14]];
    cell2.label.text = [self.myData objectAtIndex:indexPath.row];
    [cell2.contentView setBackgroundColor:[self colorWithHexString:@"F5F3E6"]];

    
    UIImage *picture = [UIImage imageNamed:[self.myImages objectAtIndex:indexPath.row]];
  
    [cell2.imageView setImage:picture];
     
    
    if([self.selectedItem isEqualToString:[self.myData objectAtIndex:indexPath.row]]) { cell2.accessoryType = UITableViewCellAccessoryCheckmark; } else { cell2.accessoryType = UITableViewCellAccessoryNone; }
    
    return cell2;
    
    
    
    
    
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{return 80;}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:
(NSInteger)section{
    NSString *headerTitle;
    if (section==0 && tableView.tag!=5) {
        headerTitle = @"Select one option";
        
    }
    return headerTitle;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(tableView.tag==5)
    { UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
        self.patientType.text = selectedCell.textLabel.text;
        self.autocompleteTableView.hidden=YES;return;}
    
    
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

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if(tableView.tag==5){UIView *headerView = [[UIView alloc] init]; return headerView;}
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

-(void) checkTheBox{
    if(!checked_anonymous)
    {
        [self.anonymous_checkbox setImage:[UIImage imageNamed:@"checkbox.png"] forState:UIControlStateNormal];
       

        checked_anonymous=YES;
    }
    else if(checked_anonymous)
    {[self.anonymous_checkbox setImage:[UIImage imageNamed:@"checkboxSelected2.png"] forState: UIControlStateNormal];  checked_anonymous=NO;
      
    
    }
    if(!checked_public)
    {
        [self.public_checkbox setImage:[UIImage imageNamed:@"checkbox.png"] forState:UIControlStateNormal];
        checked_public=YES;
    }
    else if(checked_public)
    {[self.public_checkbox setImage:[UIImage imageNamed:@"checkboxSelected2.png"] forState:UIControlStateNormal];
        checked_public=NO;}


}



- (IBAction)anonymous_checkbox_click:(id)sender {
    if(!checked_anonymous)
    {
        [self.anonymous_checkbox setImage:[UIImage imageNamed:@"checkbox.png"] forState:UIControlStateNormal];
        NSLog(checked_anonymous?@"checked_anonymous:YES":@"checked_anonymous:NO");
        checked_anonymous=YES;
        
                UIAlertController *alertController = [UIAlertController
                                                      alertControllerWithTitle:@"Enter Details"                                              message:@"Please fill the required fields ..."
                                                      preferredStyle:UIAlertControllerStyleAlert];
        
                [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
                 {
                     textField.placeholder = NSLocalizedString(@"First Name Last Name", @"Name");
                 }];
        
                [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
                 {
                     textField.placeholder = NSLocalizedString(@"Mobile No", @"Mobile");
        
                 }];
                UIAlertAction *okAction = [UIAlertAction
                                           actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                                           style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction *action)
                                           {
                                               UITextField *name = alertController.textFields.firstObject;
                                               UITextField *mobile = alertController.textFields.lastObject;
                                               if(![name.text isEqualToString:@""])
                                               self.user_name=name.text;
                                            
                                               if(![mobile.text isEqualToString:@""])
                                                self.user_mobile=mobile.text;
                                               NSLog(self.user_mobile);
        
                                           }];
                [alertController addAction:okAction];
                [self presentViewController:alertController animated:YES completion:nil];
        
        
    }
    else if(checked_anonymous)
    {[self.anonymous_checkbox setImage:[UIImage imageNamed:@"checkboxSelected2.png"] forState:UIControlStateNormal];
        self.user_name=@"anonymous";
        self.user_mobile=@"anonymous";
        NSLog(checked_anonymous?@"checked_anonymous:YES":@"checked_anonymous:NO");
        checked_anonymous=NO;
         }
    
    
}
- (IBAction)public_checkbox_click:(id)sender {
    if(!checked_public)
    {
        [self.public_checkbox setImage:[UIImage imageNamed:@"checkbox.png"] forState:UIControlStateNormal];
        NSLog(checked_public?@"checked_public:YES":@"checked_public:NO");
        checked_public=YES;
        
    }
    else if(checked_public)
    {[self.public_checkbox setImage:[UIImage imageNamed:@"checkboxSelected2.png"] forState:UIControlStateNormal];
        NSLog(checked_public?@"checked_public:YES":@"checked_public:NO");
        checked_public=NO;}
}

- (IBAction)settings_click:(id)sender {
    NSLog(@"settings pressed");
    
    SettingsViewController* content = [[SettingsViewController alloc] init];
    UIPopoverController* aPopover = [[UIPopoverController alloc]
                                     initWithContentViewController:content];
    aPopover.delegate = self.view;
    
    // Store the popover in a custom property for later use.
    
    self.popover_Controller = aPopover;
    CGSize size = CGSizeMake(400, 120);
    self.popover_Controller.popoverContentSize=size;
    
    
        [self.popover_Controller presentPopoverFromBarButtonItem:sender
                                        permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
    

}





- (IBAction)submit_click:(id)sender {
     if(![self.textfield_email_addr validate])
     { return;}
    
    bool enabled=[[NSUserDefaults standardUserDefaults] boolForKey:@"ENABLE_EQUALITY_FORM"];
    if([self.detailText  isEqualToString:@""] ||[self.patientType.text  isEqualToString:@""])
    { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Data"
                                                      message:@"Please fill all the required fields first "
                                                     delegate:self
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil,nil];
        [alert show] ;
        return;}
    NSString *customerType=self.patientType.text;
    if([customerType isEqualToString:@"nhs"])
    {customerType=@"NHS";
    
    }
    else if([customerType isEqualToString:@"denplan"])
    {customerType=@"Denplan";
        }
    
    else if([customerType isEqualToString:@"private"])
    {customerType=@"Private";
    }

    
    if(enabled)
    {
        PatientDetailsViewController *vc = [[PatientDetailsViewController alloc] init];
        
        vc.satisfactionDescription=self.selectedItem;
        vc.commentsForPractice=self.detailText;
        vc.user_name=self.user_name;
        vc.patient_Type=customerType;
        if(![self.textfield_email_addr.text isEqualToString:@""])
        { vc.user_email=self.textfield_email_addr.text;}
        else
        {vc.user_email=@"";}
        vc.user_mobile=self.user_mobile;
        if(checked_anonymous)
            vc.isAnonymous=@"true";
        else
            vc.isAnonymous=@"false";
        if(checked_public)
            vc.allowPublishing=@"true";
        else
            vc.allowPublishing=@"false";
        
        [self presentViewController:vc animated:YES completion:nil];
    }
    else{
        alert = [UIAlertController alertControllerWithTitle:@"Loading Services \n\n" message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        
        UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        spinner.center = CGPointMake(130.5, 65.5);
        spinner.color = [UIColor blackColor];
        [spinner startAnimating];
        [alert.view addSubview:spinner];
        
        
        [self presentViewController:alert animated:YES completion:nil];
//        self.detailText=self.details_textfield.text;
        
        
        NSURL *url = [NSURL URLWithString:@"http://217.199.168.86/PatientConnections/OnlineServices/RestServices.svc/InsertFFTAnswers"];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
        [request setHTTPMethod:@"POST"];
        [request setHTTPShouldHandleCookies:NO];
        
        NSString *username=[[NSUserDefaults standardUserDefaults] objectForKey:@"UserName"];
        NSString *password=[[NSUserDefaults standardUserDefaults] objectForKey:@"Password"];
        NSString *authStr = [NSString stringWithFormat:@"%@:%@", username, password];
        NSData *authData = [authStr dataUsingEncoding:NSASCIIStringEncoding];
        NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed]];
        
        
        
        
        
//        NSDictionary* jsonDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
//                                        @"satisfactionDescription",self.selectedItem,
//                                        @"commentsForPractice",detailText,@"isAnonymous",(checked_anonymous)?@"true":@"false",@"allowPublishing",(checked_public)?@"true":@"false",@"patientName",self.user_name,@"mobile",self.user_mobile,@"email",self.textfield_email_addr.text,
//                                        nil];
        NSDictionary* jsonDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                        self.selectedItem,@"satisfactionDescription",self.detailText,@"commentsForPractice",(checked_anonymous)?@"true":@"false",@"isAnonymous",(checked_public)?@"true":@"false",@"allowPublishing",self.user_name,@"patientName",self.user_mobile,@"mobile",self.textfield_email_addr.text,@"email",customerType,@"customerType",
                                        nil];
        
        
        
        
        for (id key in jsonDictionary) {
            NSLog(@"key: %@, value: %@ \n", key, [jsonDictionary objectForKey:key]);
        }
    
        NSError *error;
        NSData* jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary
                                                           options:NSJSONWritingPrettyPrinted error:&error];
        
        [request setValue:authValue forHTTPHeaderField:@"Authorization"];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        // should check for and handle errors here but we aren't
        [request setHTTPBody:jsonData];
        
        
        
        
        
        
        
        
//        [NSURLConnection connectionWithRequest:request delegate:self];
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
             {
                 [alert dismissViewControllerAnimated:YES completion:nil];
                 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Submission Error"
                                                                 message:@"Sorry!..Server is down at the moment.Data cannot be submitted :("
                                                                delegate:self
                                                       cancelButtonTitle:@"OK"
                                                       otherButtonTitles:nil,nil];
                 [alert show] ;
                 return;}
             
         }];
        
        
    }
    

    
}

- (IBAction)logout_click:(id)sender {
    NSLog(@"logout");
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"login"];
    [self presentViewController:vc animated:YES completion:nil];
    
    

}


////////// ************** textView Methods *************/////////////
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    NSLog(@"textViewShouldBeginEditing:");
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    NSLog(@"textViewDidBeginEditing:");
    textView.backgroundColor = [UIColor whiteColor]; 
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    NSLog(@"textViewShouldEndEditing:");
    textView.backgroundColor = [UIColor whiteColor];
    return YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    NSLog(@"textViewDidEndEditing:");
    self.detailText=textView.text;
}

- (void)textViewDidChange:(UITextView *)textView{
    NSLog(@"textViewDidChange:");
   
}

- (void)textViewDidChangeSelection:(UITextView *)textView{
    NSLog(@"textViewDidChangeSelection:");
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSCharacterSet *doneButtonCharacterSet = [NSCharacterSet newlineCharacterSet];
    NSRange replacementTextRange = [text rangeOfCharacterFromSet:doneButtonCharacterSet];
    NSUInteger location = replacementTextRange.location;
    
    if (textView.text.length + text.length > 140){
        if (location != NSNotFound){
            [textView resignFirstResponder];
           
        }
        return NO;
    }
    else if (location != NSNotFound){
        [textView resignFirstResponder];
        
        return NO;
    }
    
    return YES;
}


////////

- (void)searchAutocompleteEntriesWithSubstring:(NSString *)substring {
    
    // Put anything that starts with this substring into the autocompleteUrls array
    // The items in this array is what will show up in the table view
    [self.autocompleteUrls removeAllObjects];
    for(NSString *curString in self.pastUrls) {
        NSRange substringRange = [curString rangeOfString:substring];
        if (substringRange.location == 0) {
            [self.autocompleteUrls addObject:curString];
        }
    }
    [self.autocompleteTableView reloadData];
}


#pragma mark UITextFieldDelegate methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if(textField.tag==6)
    { self.autocompleteTableView.hidden = NO;
        NSLog(@"Change characters in Range");
    NSString *substring = [NSString stringWithString:textField.text];
    substring = [substring stringByReplacingCharactersInRange:range withString:string];
        [self searchAutocompleteEntriesWithSubstring:substring];}
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
   
    if(textField.tag==6){self.autocompleteTableView.hidden=YES;}
    return YES;
}

@end
