//
//  TermsController.m
//  commando
//
//  Created by PEARCE , SETH B on 7/17/13.
//  Copyright (c) 2013 PEARCE , SETH B. All rights reserved.
//

#import "TermsController.h"

@interface TermsController ()

@end

@implementation TermsController

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
    [self.acceptButton setBackgroundImage:[UIImage imageNamed:@"uiButton.png"] forState:UIControlStateNormal];
    [self.acceptButton setBackgroundImage:[UIImage imageNamed:@"uiButtonHover.png"] forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
