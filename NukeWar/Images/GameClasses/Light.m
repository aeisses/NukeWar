//
//  Light.m
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-20.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Light.h"

@implementation Light

@synthesize selected;
@synthesize lightImage;

-(id)initWithFile:(NSString *)fileName andImage:(UIImage *)image andFrame:(CGRect)frame
{
    if (self = [super init]) {
        // Set the initial city size
        selected = NO;
        lightImage = [[SSImageLayer alloc] initWithFile:fileName andImage:image andFrame:frame];
        [self update];
    }
    return self;
}

-(void)update
{
    if (selected) {
        [lightImage setImage:@"lightGreen"];
    } else {
        [lightImage setImage:@"lightRed"];
    }
}

-(void)dealloc
{
    [lightImage release];
    [super dealloc];
}
@end