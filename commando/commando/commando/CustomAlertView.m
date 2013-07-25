//
//  CustomAlertView.m
//  commando
//
//  Created by PEARCE , SETH B on 7/19/13.
//  Copyright (c) 2013 PEARCE , SETH B. All rights reserved.
//

#import "CustomAlertView.h"

@implementation CustomAlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Override poit for custom drawing of component
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    //returns a reference to the current view's graphics context, allowing you to make changes to its state.
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //Create Base Shape
    CGRect activeBounds = self.bounds;
    CGFloat cornerRadius = 0.0f;
    CGFloat inset = 0.0f;
    CGFloat originX = activeBounds.origin.x + inset;
    CGFloat originY = activeBounds.origin.y + inset;
    CGFloat width = activeBounds.size.width - (inset*2.0f);
    CGFloat height = activeBounds.size.height - (inset*2.0f);
    CGRect bPathFrame = CGRectMake(originX, originY, width, height);
    CGPathRef path = [UIBezierPath bezierPathWithRoundedRect:bPathFrame cornerRadius:cornerRadius].CGPath;
    
    //add fill and outer shadow
    CGContextAddPath(context, path);
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:188.0f/255.0f green:110.0f/255.0f blue:16.0f/255.0f alpha:1.0f].CGColor);
    CGContextSetShadowWithColor(context, CGSizeMake(0.0f, 1.0f), 6.0f, [UIColor colorWithRed:0.0f/255.0f green:255.0f/255.0f blue:0.0f/255.0f alpha:1.0f].CGColor);
    CGContextDrawPath(context, kCGPathFill);
    
    //clip the context
    CGContextSaveGState(context); //Save Context State Before Clipping To "path"
    CGContextAddPath(context, path);
    CGContextClip(context);

    //draw gradient
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    size_t count = 2;
    //CGFloat locations[3] = {0.0f, 0.75f, 1.0f};
    CGFloat components[12] =
    {
        //70.0f/255.0f, 70.0f/255.0f, 70.0f/255.0f, 1.0f,     //1
        45.0f/255.0f, 45.0f/255.0f, 45.0f/255.0f, 1.0f,     //2
        20.0f/255.0f, 20.0f/255.0f, 20.0f/255.0f, 1.0f      //3
    };
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, NULL, count);
    CGPoint startPoint = CGPointMake(activeBounds.size.width * 0.5f, 0.0f);
    CGPoint endPoint = CGPointMake(activeBounds.size.width * 0.5f, activeBounds.size.height);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(gradient);
    
    //draw inner shadow
    CGContextAddPath(context, path);
    CGContextSetLineWidth(context, 3.0f);
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:210.0f/255.0f green:210.0f/255.0f blue:210.0f/255.0f alpha:1.0f].CGColor);
    CGContextSetShadowWithColor(context, CGSizeMake(0.0f, 0.0f), 6.0f, [UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:1.0f].CGColor);
    CGContextDrawPath(context, kCGPathStroke);
    
    //redraw path to avoid pixelation
    CGContextRestoreGState(context); //Restore First Context State Before Clipping "path"
    CGContextAddPath(context, path);
    CGContextSetLineWidth(context, 3.0f);
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:210.0f/255.0f green:210.0f/255.0f blue:210.0f/255.0f alpha:1.0f].CGColor);
    CGContextSetShadowWithColor(context, CGSizeMake(0.0f, 0.0f), 0.0f, [UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:0.1f].CGColor);
    CGContextDrawPath(context, kCGPathStroke);
    
}


- (void)layoutSubviews
{
    for (UIView *subview in self.subviews){ //Fast Enumeration
        if ([subview isMemberOfClass:[UIImageView class]]) {
            subview.hidden = YES; //Hide UIImageView Containing Blue Background
        }
        if ([subview isMemberOfClass:[UILabel class]]) { //Point to UILabels To Change Text
            UILabel *label = (UILabel*)subview; //Cast From UIView to UILabel
            label.textColor = [UIColor colorWithRed:210.0f/255.0f green:210.0f/255.0f blue:210.0f/255.0f alpha:1.0f];
            label.shadowColor = [UIColor blackColor];
            label.shadowOffset = CGSizeMake(0.0f, 1.0f);
        }
    }
}

@end
