//
//  IntroScreen.m
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-16.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "IntroScreen.h"

@implementation IntroScreen

@synthesize labelOne;
@synthesize labelTwo;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)clearLabels
{
    labelOne.text = @"";
    lableTwo.text = @"";
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
    [labelOne release]; labelOne = nil;
    [labelTwo release]; labelTwo = nil;
    [super dealloc];
}
@end
