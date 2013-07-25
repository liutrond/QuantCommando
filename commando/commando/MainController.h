//
//  MainController.h
//  commando
//
//  Created by PEARCE , SETH B on 7/16/13.
//  Copyright (c) 2013 PEARCE , SETH B. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomAlertView.h"

@interface MainController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *DayButton;
@property (strong, nonatomic) IBOutlet UIButton *WeekButton;
@property (strong, nonatomic) IBOutlet UIButton *Week2Button;
@property (strong, nonatomic) IBOutlet UIButton *MonthButton;
@property (strong, nonatomic) IBOutlet UIButton *MonthLButton;
@property (strong, nonatomic) IBOutlet UIButton *Month3LButton;
@property (strong, nonatomic) IBOutlet UIButton *Month6LButton;
@property (strong, nonatomic) IBOutlet UIButton *YearButton;

@property (weak, nonatomic) IBOutlet UIButton *TutorialButton;
@property (weak, nonatomic) IBOutlet UIButton *AboutButton;
@property (weak, nonatomic) IBOutlet UIButton *LogoutButton;


//this action calls the tutorial message
- (IBAction)callAlert:(id)sender;
- (IBAction)LookbackButtonPressed:(id)sender;
- (IBAction)ForecastButtonPressed:(id)sender;


@end
