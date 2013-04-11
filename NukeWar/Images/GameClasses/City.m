//
//  City.m
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-18.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "City.h"

@implementation City

@synthesize population;
@synthesize cityImage;
@synthesize isCityDestroyed;

-(id)initWithFile:(NSString *)fileName andImage:(UIImage *)image andFrame:(CGRect)frame
{
    if (self = [super init]) {
        // Set the initial city size
//        population = (arc4random() % 25) + 15;
        population = (arc4random() % 5);
        cityImage = [[SSImageLayer alloc] initWithFile:fileName andImage:image andFrame:frame];
        [self updateCity];
        isCityDestroyed = NO;
    }
    return self;
}

-(void)updateCity
{
    if (population <= 0) {
        population = 0;
        isCityDestroyed = YES;
        [cityImage setImage:@"cityZero"];
    } else if (population <= 3) {
        [cityImage setImage:@"cityOne"];
    } else if (population <= 10) {
        [cityImage setImage:@"cityTwo"];
    } else if (population <= 25) {
        [cityImage setImage:@"cityThree"];
    } else if (population <= 60) {
        [cityImage setImage:@"cityFour"];
    } else {
        [cityImage setImage:@"cityFive"];
    }
}

-(int)returnOwnerQuadrent
{
    int quadrent = 0;
    if (cityImage.frame.origin.x < 512 && cityImage.frame.origin.y < 384) quadrent = 1;
    else if (cityImage.frame.origin.x < 512 && cityImage.frame.origin.y > 384) quadrent = 3;
    else if (cityImage.frame.origin.x > 512 && cityImage.frame.origin.y < 384) quadrent = 2;
    else if (cityImage.frame.origin.x > 512 && cityImage.frame.origin.y > 384) quadrent = 4;
    return quadrent;
}

-(int)getX
{
    return (int)(cityImage.frame.origin.x + cityImage.frame.size.width/2);
}

-(int)getY
{
    return (int)(cityImage.frame.origin.y + cityImage.frame.size.height/2);
}

-(void)dealloc
{
    [cityImage release]; cityImage = nil;
    [super dealloc];
}

@end
