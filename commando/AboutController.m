//
//  AboutController.m
//  commando
//
//  Created by PEARCE , SETH B on 7/17/13.
//  Copyright (c) 2013 PEARCE , SETH B. All rights reserved.
//

#import "AboutController.h"

@interface AboutController ()

@end

@implementation AboutController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.closeButton setBackgroundImage:[[UIImage imageNamed:@"button2.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:2] forState:UIControlStateNormal];
    [self.closeButton setBackgroundImage:[[UIImage imageNamed:@"buttonGradient.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:2]  forState:UIControlStateHighlighted];
    
    [self.registerButton setBackgroundImage:[UIImage imageNamed:@"uiButton.png"] forState:UIControlStateNormal];
    [self.registerButton setBackgroundImage:[UIImage imageNamed:@"uiButtonHover.png"] forState:UIControlStateHighlighted];
    
    UIImage *fieldBGImage = [[UIImage imageNamed:@"textField3.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:5];
    self.txtFirstName.borderStyle = UITextBorderStyleNone;
    [self.txtFirstName setBackground:fieldBGImage];
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 0)];
    self.txtFirstName.leftView = paddingView;
    self.txtFirstName.leftViewMode = UITextFieldViewModeAlways;
    
    self.txtLastName.borderStyle = UITextBorderStyleNone;
    [self.txtLastName setBackground:fieldBGImage];
    UIView *paddingView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 0)];
    self.txtLastName.leftView = paddingView2;
    self.txtLastName.leftViewMode = UITextFieldViewModeAlways;
    
    self.txtEmail.borderStyle = UITextBorderStyleNone;
    [self.txtEmail setBackground:fieldBGImage];
    UIView *paddingView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 0)];
    self.txtEmail.leftView = paddingView3;
    self.txtEmail.leftViewMode = UITextFieldViewModeAlways;
    
    self.txtPassword.borderStyle = UITextBorderStyleNone;
    [self.txtPassword setBackground:fieldBGImage];
    UIView *paddingView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 0)];
    self.txtPassword.leftView = paddingView4;
    self.txtPassword.leftViewMode = UITextFieldViewModeAlways;
    
    self.txtPasswordConfirm.borderStyle = UITextBorderStyleNone;
    [self.txtPasswordConfirm setBackground:fieldBGImage];
    UIView *paddingView5 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 0)];
    self.txtPasswordConfirm.leftView = paddingView5;
    self.txtPasswordConfirm.leftViewMode = UITextFieldViewModeAlways;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
