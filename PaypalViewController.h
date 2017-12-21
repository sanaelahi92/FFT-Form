//
//  PaypalViewController.h
//  FFT Form
//
//  Created by Welltime on 13/04/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayPalMobile.h"

@interface PaypalViewController : UIViewController<PayPalFuturePaymentDelegate>

- (IBAction)obtainConsent:(id)sender;

@end
