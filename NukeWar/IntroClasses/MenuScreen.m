//
//  MenuScreen.m
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-16.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MenuScreen.h"

@implementation MenuScreen

@synthesize playButton;
@synthesize delegate;
@synthesize backGroundImage, titleLabel;
@synthesize tileButton, optionsButton, creditButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        tileButton = [[LabelTile alloc] initWithFrame:CGRectMake(25, 15, 100, 80)
                                              andText:@"Play"
                                              andName:@"Play"
                                          andBGColour:[Colours getButtonColourWithAlpha:1.0]
                                      andSelectColour:[Colours getTextColourWithAlpha:1.0]
                                        andTextColour:[Colours getTextColourWithAlpha:1.0]
                                         andTextFrame:CGRectMake(10,50,100,25)];

        tileButton.delegate = self;
        [self addSubview:tileButton];
        tileButton.hidden = YES;
        
        optionsButton = [[LabelTile alloc] initWithFrame:CGRectMake(25, 110, 100, 80)
                                                 andText:@"Options"
                                                 andName:@"Options"
                                             andBGColour:[Colours getButtonColourWithAlpha:1.0]
                                         andSelectColour:[Colours getTextColourWithAlpha:1.0]
                                           andTextColour:[Colours getTextColourWithAlpha:1.0]
                                            andTextFrame:CGRectMake(10,50,100,25)];

        optionsButton.delegate = self;
        [self addSubview:optionsButton];
        optionsButton.hidden = YES;
        
        creditButton = [[LabelTile alloc] initWithFrame:CGRectMake(25, 205, 100, 80)
                                                andText:@"Credits"
                                                andName:@"Credits"
                                            andBGColour:[Colours getButtonColourWithAlpha:1.0]
                                        andSelectColour:[Colours getTextColourWithAlpha:1.0]
                                          andTextColour:[Colours getTextColourWithAlpha:1.0]
                                           andTextFrame:CGRectMake(10,50,100,25)];

        creditButton.delegate = self;
        [self addSubview:creditButton];
        creditButton.hidden = YES;
    }
    return self;
}

-(void)startHeadAnimation
{
    NSMutableArray *pointArray = [[NSMutableArray alloc] initWithCapacity:90];
    float deltaX = 1374/90;
    for (int i=0; i<90; i++) {
        [pointArray insertObject:[NSValue valueWithCGPoint:CGPointMake(1024 - deltaX*i,384)] atIndex:i];
    }
    HeadAnimationLayer *funAnimation = [[HeadAnimationLayer alloc] initWithFile:@"riding missile" andMovementArray:(NSArray *)pointArray];
    [funAnimation startAnimation:90 repeatCount:HUGE_VAL withReverse:NO];
    [self.layer addSublayer:funAnimation];
}

-(void)tilePressed:(NSString*)buttonName
{
    if ([buttonName isEqualToString:@"Play"]) {
        [self.layer removeAllAnimations];
        [delegate playButtonPressed];
    } else if ([buttonName isEqualToString:@"Options"]) {
        CALayer *options = [[CALayer alloc] init];
        options.frame = CGRectMake(300,100,300,300);
        UIColor *uicolor = [[UIColor alloc] initWithRed:(float)93/255 green:(float)129/255 blue:(float)155/255 alpha:1.0];
        CGColorRef color = [uicolor CGColor];
        [options setBackgroundColor:color];
        [uicolor release];
        options.borderWidth = (float)10;
        options.cornerRadius = (float)10;
        uicolor = [[UIColor alloc] initWithRed:(float)94/255 green:(float)105/255 blue:(float)45/255 alpha:1.0];
        color = [uicolor CGColor];
        options.borderColor = color;
        [uicolor release];
        [self.layer addSublayer:options];
        
    } else if ([buttonName isEqualToString:@"Credits"]) {
        
    }
}

-(IBAction)touchPlayButton:(id)sender
{
    [self.layer removeAllAnimations];
    [delegate playButtonPressed];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)dealloc
{
    [playButton release]; playButton = nil;
    [tileButton release]; tileButton = nil;
    [creditButton release]; creditButton = nil;
    [optionsButton release]; optionsButton = nil;
    [backGroundImage release]; backGroundImage = nil;
    [titleLabel release]; titleLabel = nil;
    delegate = nil;
    [super dealloc];
}
@end
