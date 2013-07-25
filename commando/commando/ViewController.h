//
//  ViewController.h
//  commando
//
//  Created by PEARCE , SETH B on 6/24/13.
//  Copyright (c) 2013 PEARCE , SETH B. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *txtUsername;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;


- (IBAction)loginClicked:(id)sender;
@end
