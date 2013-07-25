//
//  ViewController.m
//  commando
//
//  Created by PEARCE , SETH B on 6/24/13.
//  Copyright (c) 2013 PEARCE , SETH B. All rights reserved.
//

#import "ViewController.h"
#import "SBJson.h"
#import "MainController.h"

@interface NSURLRequest (DummyInterface)
+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString*)host;
+ (void)setAllowsAnyHTTPSCertificate:(BOOL)allow forHost:(NSString*)host;
@end

@implementation ViewController

@synthesize txtUsername;
@synthesize txtPassword;

- (void) alertStatus:(NSString *)msg :(NSString *)title
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    
    [alertView show];
}

/* round trip login*/
- (IBAction)loginClicked:(id)sender { 
    @try {
        
        if([[txtUsername text] isEqualToString:@""] || [[txtPassword text] isEqualToString:@""] ) {
            [self alertStatus:@"Please enter both Username and Password" :@"Login Failed!"];
        } else {
            
            NSArray *keys = [NSArray arrayWithObjects:@"user", @"pass", nil]; //2 arrays with key:value pairings
            NSArray *objects = [NSArray arrayWithObjects: [txtUsername text], [txtPassword text], nil];
            
            NSDictionary *questionDict = [NSDictionary dictionaryWithObjects:objects forKeys:keys]; //dictionary to hold the arrays.
            
            
            NSString *jsonRequest1 = [questionDict JSONRepresentation];
            
            
            NSString *post =[[NSString alloc] initWithFormat:@"user=%@&pass=%@",[txtUsername text],[txtPassword text]];
            NSLog(@"PostData: %@",post);
            
            NSURL *url=[NSURL URLWithString:@"https://quantdesk.lucenaresearch.com/lr/api/token"];
            //NSURL *url=[NSURL URLWithString:@"http://172.30.30.242:8080/LR-API/api/token"];
            NSData *requestData = [NSData dataWithBytes:[jsonRequest1 UTF8String] length:[jsonRequest1 length]];
            NSString *postLength = [NSString stringWithFormat:@"%d", [requestData length]];
            
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init]; //matched up to request headers in quantdesk
            [request setURL:url];
            [request setHTTPMethod:@"POST"];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [request setValue:@"application/json, text/javascript, */*; q=0.01" forHTTPHeaderField:@"Accept"];
            [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
            [request setValue:@"gzip,deflate,sdch" forHTTPHeaderField:@"Accept-Encoding"];
            [request setHTTPBody:requestData];
            
            [NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
            
            NSError *error = [[NSError alloc] init];
            NSHTTPURLResponse *response = nil;
            NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
            
            
            NSLog(@"Response code: %d", [response statusCode]);
            NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
            if ([response statusCode] >=200 && [response statusCode] <300)
            {
                
                NSLog(@"Response ==> %@", responseData);
                /* parse JSON into Obj-C for data object */
                SBJsonParser *jsonParser = [SBJsonParser new]; 
                NSDictionary *jsonData = (NSDictionary *) [jsonParser objectWithString:responseData error:nil];
                NSLog(@"jsonData%@",jsonData);
                NSInteger success = [(NSNumber *) [jsonData objectForKey:@"success"] integerValue];
                NSLog(@"Success?%d",success);
                if(jsonData > 0)
                {
                    NSLog(@"Login SUCCESS");
                    //[self alertStatus:@"Logged in Successfully." :@"Login Success!"];
                    [self performSegueWithIdentifier:@"mainScreenSegue" sender:self];
                    
                } else {
                    
                    NSString *error_msg = (NSString *) [jsonData objectForKey:@"error_message"];
                    [self alertStatus:error_msg :@"Login Failed!"];
                }
                
            } else {
                NSLog(@"Response ==> %@", responseData);
                //if (error) NSLog(@"Error: %@", error);
                [self alertStatus:@"Connection Failed" :@"Login Failed!"];
            }
        }
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Login Failed." :@"Login Failed!"];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.loginButton setBackgroundImage:[UIImage imageNamed:@"uiButton.png"] forState:UIControlStateNormal];
    [self.loginButton setBackgroundImage:[UIImage imageNamed:@"uiButtonHover.png"] forState:UIControlStateHighlighted];
    
    UIImage *fieldBGImage = [[UIImage imageNamed:@"textField3.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:5];
    self.txtUsername.borderStyle = UITextBorderStyleNone;
    [self.txtUsername setBackground:fieldBGImage];
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    
    self.txtUsername.leftView = paddingView;
    self.txtUsername.leftViewMode = UITextFieldViewModeAlways;
    
    self.txtPassword.borderStyle = UITextBorderStyleNone;
    [self.txtPassword setBackground:fieldBGImage];
    
    UIView *paddingView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 0)];
    
    self.txtPassword.leftView = paddingView2;
    self.txtPassword.leftViewMode = UITextFieldViewModeAlways;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
