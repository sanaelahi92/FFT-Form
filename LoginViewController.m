//
//  LoginViewController.m
//  FFT Form
//
//  Created by Welltime on 22/01/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import "LoginViewController.h"
#import "PatientDetailsViewController.h"
#import "FeedbackViewController.h"
#import "QuestionsFeedbackViewController.h"
#import "NSData+Base64.h"
#import "SettingsViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    bool value=[[NSUserDefaults standardUserDefaults] boolForKey:@"ENABLE_EQUALITY_FORM"];
    [self.login_btn setBackgroundColor:[UIColor colorWithRed:36/256.0 green:123/256.0 blue:160/256.0 alpha:1.0]];
    NSLog(@"VALUE IS : %@", (value) ? @"YES" : @"NO");
  
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}


- (void)viewWillAppear:(BOOL)animated
{
    CGSize size = CGSizeMake(320, 445); // size of view in popover
    self.contentSizeForViewInPopover = size;
    [super viewWillAppear:animated];
}
- (IBAction)login_click:(id)sender {
    if([self.username.text isEqualToString:@""]||[self.password.text isEqualToString:@""]){
 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Data"
                                                      message:@"Please fill all the required fields first "
                                                     delegate:self
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil,nil];
        [alert show] ;
        return;}
    
    NSString *username=self.username.text;
    NSString *password=self.password.text;
    
    @try{
        
       
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];

        
        
        NSString* url = @"http://217.199.168.86/PatientConnections/OnlineServices/RestServices.svc/GetOrganizationAccessKey";
        
                                   NSString *authStr = [NSString stringWithFormat:@"%@:%@", username, password];
                                   NSData *authData = [authStr dataUsingEncoding:NSASCIIStringEncoding];
                                   NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed]];
                                   
       
        [request setURL:[NSURL URLWithString:url ]];
                                   
        [request setHTTPMethod:@"GET"];
         [request setValue:authValue forHTTPHeaderField:@"Authorization"];
        
        NSURLResponse *requestResponse;
        NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
        
        
        
NSString *requestReply = [[NSString alloc] initWithBytes:[requestHandler bytes] length:[requestHandler length] encoding:NSASCIIStringEncoding]; NSLog(@"requestReply: %@", requestReply);
       
        if([requestReply isEqualToString:@""])
        {UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Network Connectivity Problem"
                                                         message:@"Please check ur internet connection and try again.."
                                                        delegate:self
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil,nil];
            [alert show] ;
            return;}
        
        
         else if(([requestReply containsString:@"404"]|| [requestReply containsString:@"500"]) &&([requestReply containsString:@"<html>"]||[requestReply containsString:@"<HTML>"]||
              [requestReply containsString:@"<Html>"]                                          ))
            
         { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Network Connectivity Problem"
                                                           message:@"Please check ur internet connection and try again.."
                                                          delegate:self
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil,nil];
             [alert show] ;
             return;}
        else if([requestReply containsString:@"<html>"]|| [requestReply containsString:@"<HTML>"]||
           [requestReply containsString:@"<Html>"]||
           [requestReply containsString:@"<body>"]||
           [requestReply containsString:@"<Body>"]||
           [requestReply containsString:@"<BODY>"])
        { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Unauthenticated User"
                                                          message:@"Invalid username or password "
                                                         delegate:self
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil,nil];
            [alert show] ;
            return;}
        else
        
        {   NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            [defaults setObject:username forKey:@"UserName"];
            [defaults setObject:password forKey:@"Password"];
            
            FeedbackViewController *vc = [[FeedbackViewController alloc] init];
        
        
            [self presentViewController:vc animated:YES completion:nil];}
     
       
        
    }
    @catch(NSException *e)
    { UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Connection Error"
                                
                                                          message:@"Please check your internet connection and try again  "
                                
                                                         delegate:nil
                                
                                                cancelButtonTitle:@"Ok"
                                
                                                otherButtonTitles:nil];
        [alertView show];}
//

//    FeedbackViewController *vc = [[FeedbackViewController alloc] init];
//    
//    
//    [self presentViewController:vc animated:YES completion:nil];}


}
@end
