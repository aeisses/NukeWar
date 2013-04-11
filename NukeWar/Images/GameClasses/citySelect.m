//
//  citySelect.m
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-21.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "citySelect.h"

@implementation citySelect

@synthesize target;

-(id)initWithFile:(NSString *)fileName andImage:(UIImage *)image andFrame:(CGRect)frame
{
    if (self = [super init]) {
        target = [[SSImageAnimationLayer alloc] initWithFile:fileName andImage:image andFrame:frame];
        [target setImage:@"selectCity"];
    }
    return self;
}

-(void)showAnimationAtFrame:(CGRect)frame
{
    target.frame = frame;
    [target startAnimation:animationFrame repeatCount:10000 withReverse:YES withDelegate:NO];
}

-(void)removeAnimation
{
    [target stopAnimation];
}

-(void)dealloc
{
    [target release];
    [super dealloc];
}

@end
