//
//  MapScreenViewItem.m
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-23.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MapScreenViewItem.h"

@implementation MapScreenViewItem

@synthesize animationLayer;

-(id)initWithFile:(NSString *)fileName andImage:(UIImage *)image andFrame:(CGRect)frame
{
    if (self = [super init]) {
        animationLayer = [[SSImageAnimationLayer alloc] initWithFile:fileName andImage:image andFrame:frame];
    }
    return self;
}

-(void)dealloc
{
    [animationLayer release]; animationLayer = nil;
    [super dealloc];
}

@end
