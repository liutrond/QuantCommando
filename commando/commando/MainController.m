//
//  MainController.m
//  commando
//
//  Created by PEARCE , SETH B on 7/16/13.
//  Copyright (c) 2013 PEARCE , SETH B. All rights reserved.
//

#import "MainController.h"
#import "CustomAlertView.h"

@interface MainController ()

@end

@implementation MainController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.DayButton setBackgroundImage:[[UIImage imageNamed:@"button2.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:5] forState:UIControlStateNormal];
    [self.DayButton setBackgroundImage:[[UIImage imageNamed:@"buttonGradient.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:2]  forState:UIControlStateHighlighted];
    self.DayButton.highlighted = YES;
    
    [self.WeekButton setBackgroundImage:[[UIImage imageNamed:@"button2.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:5] forState:UIControlStateNormal];
    [self.WeekButton setBackgroundImage:[[UIImage imageNamed:@"buttonGradient.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:2]  forState:UIControlStateHighlighted];
    
    [self.Week2Button setBackgroundImage:[[UIImage imageNamed:@"button2.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:5] forState:UIControlStateNormal];
    [self.Week2Button setBackgroundImage:[[UIImage imageNamed:@"buttonGradient.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:2]  forState:UIControlStateHighlighted];
    
    [self.MonthButton setBackgroundImage:[[UIImage imageNamed:@"button2.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:5] forState:UIControlStateNormal];
    [self.MonthButton setBackgroundImage:[[UIImage imageNamed:@"buttonGradient.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:2]  forState:UIControlStateHighlighted];
    
    [self.MonthLButton setBackgroundImage:[[UIImage imageNamed:@"button2.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:2] forState:UIControlStateNormal];
    [self.MonthLButton setBackgroundImage:[[UIImage imageNamed:@"buttonGradient.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:2]  forState:UIControlStateHighlighted];
    
    [self.Month3LButton setBackgroundImage:[[UIImage imageNamed:@"button2.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:2] forState:UIControlStateNormal];
    [self.Month3LButton setBackgroundImage:[[UIImage imageNamed:@"buttonGradient.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:2]  forState:UIControlStateHighlighted];
    
    [self.Month6LButton setBackgroundImage:[[UIImage imageNamed:@"button2.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:2] forState:UIControlStateNormal];
    [self.Month6LButton setBackgroundImage:[[UIImage imageNamed:@"buttonGradient.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:2]  forState:UIControlStateHighlighted];
    
    [self.YearButton setBackgroundImage:[[UIImage imageNamed:@"button2.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:2] forState:UIControlStateNormal];
    [self.YearButton setBackgroundImage:[[UIImage imageNamed:@"buttonGradient.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:2]  forState:UIControlStateHighlighted];
    
    [self.TutorialButton setBackgroundImage:[[UIImage imageNamed:@"button2.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:2] forState:UIControlStateNormal];
    [self.TutorialButton setBackgroundImage:[[UIImage imageNamed:@"buttonGradient.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:2]  forState:UIControlStateHighlighted];
    
    [self.AboutButton setBackgroundImage:[[UIImage imageNamed:@"button2.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:2] forState:UIControlStateNormal];
    [self.AboutButton setBackgroundImage:[[UIImage imageNamed:@"buttonGradient.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:2]  forState:UIControlStateHighlighted];
    
    [self.LogoutButton setBackgroundImage:[[UIImage imageNamed:@"button2.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:2] forState:UIControlStateNormal];
    [self.LogoutButton setBackgroundImage:[[UIImage imageNamed:@"buttonGradient.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:2]  forState:UIControlStateHighlighted];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)callAlert:(id)sender {
    CustomAlertView *customAlertView = [[CustomAlertView alloc] initWithTitle:@"How to Use QuantCommando"
                                                                      message:@"The QuantCommando application allows a user to experience a glimpse of the forecasting power of the QuantDesk Software. To add a stock to your trial portfolio, first use the search field on the left to locate your desired stock symbol and then select OK. Your selected stock should then appear in the table below the search bar to the left."
                                                                     delegate:self
                                                            cancelButtonTitle:@"OKAY"
                                                            otherButtonTitles:nil];
    

    [customAlertView show];
    
}

- (IBAction)LookbackButtonPressed:(id)sender {
    
    UIButton *buttonPressed = (UIButton*)sender;
    NSArray *buttons = [NSArray arrayWithObjects: _MonthLButton, _Month3LButton, _Month6LButton, _YearButton, nil];
    bool buttonIsHighlighted = NO;
    
    // Check if a button is already highlighted
    for (UIButton *button in buttons) {
        
        if (button.highlighted) {
            
            buttonIsHighlighted = YES;
        }
    }
    
    // If a button is highlighted, un-highlight all except the one pressed
    // If no button is highlighted, just highlight the right one
    if (buttonIsHighlighted) {
        
        for (UIButton *button in buttons) {
            
            if (buttonPressed == button) {
                
                buttonIsHighlighted = YES;
                
            } else {
                
                button.highlighted = NO;
            }
        }
        
    } else {
        
        buttonPressed.highlighted = YES;
    }
}

- (IBAction)ForecastButtonPressed:(id)sender {
    
    UIButton *buttonPressed = (UIButton*)sender;
    NSArray *buttons = [NSArray arrayWithObjects: self.DayButton, self.WeekButton, self.Week2Button, self.MonthButton, nil];
    //bool buttonIsHighlighted = NO;
    
    // If a button is highlighted, un-highlight all except the one pressed
    // If no button is highlighted, just highlight the right one

        for (UIButton *button in buttons) {
            if (buttonPressed == button) {
                buttonPressed.highlighted = YES;
            } else {
                button.highlighted = NO;
            }
        }

        
}



@end
