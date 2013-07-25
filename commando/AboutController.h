//
//  AboutController.h
//  commando
//
//  Created by PEARCE , SETH B on 7/17/13.
//  Copyright (c) 2013 PEARCE , SETH B. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UITextField *txtFirstName;
@property (weak, nonatomic) IBOutlet UITextField *txtLastName;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtPasswordConfirm;

@end
