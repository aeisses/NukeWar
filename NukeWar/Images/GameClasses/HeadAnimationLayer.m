//
//  HeadAnimationLayer.m
//  RatherOddJourney
//
//  Created by Aaron Eisses on 12-02-03.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HeadAnimationLayer.h"

@implementation HeadAnimationLayer

@synthesize countingIndex;
@synthesize myDelegate;

-(id)initWithFile:(NSString *)_fileName andMovementArray:(NSArray *)i_pointArray
{
    if (self = [super init])
    {
        pointArray = [[NSArray alloc] initWithArray:i_pointArray];
        NSString *fileName = [[NSString alloc] initWithString:_fileName];
        NSString *imageString;
        imageString = [[NSString alloc] initWithFormat:@"%@",[[NSBundle mainBundle] pathForResource:fileName ofType:@"png"]];
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:imageString];
        [imageString release];
        [fileName release];
        self.contents = (id)image.CGImage;
        CGPoint startingPoint = [[pointArray objectAtIndex:0] CGPointValue];
//        int scale = 0;
//        if ([self respondsToSelector:@selector(setContentsScale:)])
///        {
//            scale = [[UIScreen mainScreen] scale];
//        }
//        self.frame = CGRectMake(startingPoint.x, startingPoint.y, CGImageGetWidth(image.CGImage)/scale, CGImageGetHeight(image.CGImage)/scale);
        self.frame = CGRectMake(startingPoint.x, startingPoint.y, CGImageGetWidth(image.CGImage), CGImageGetHeight(image.CGImage));
        [image release];
    }
    return self;
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self removeAllAnimations];
}

+ (BOOL)needsDisplayForKey:(NSString *)key;
{
    return [key isEqualToString:@"countingIndex"];
}

+ (id < CAAction >)defaultActionForKey:(NSString *)aKey;
{
    if ([aKey isEqualToString:@"contentsRect"] || [aKey isEqualToString:@"position"] || [aKey isEqualToString:@"bounds"])
        return (id < CAAction >)[NSNull null];
    
    return [super defaultActionForKey:aKey];
}

-(void)startAnimation:(int)frames repeatCount:(int)_repeatCount withReverse:(BOOL)isReverse
{
        CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"countingIndex"];
    
        anim.fromValue = [NSNumber numberWithInt:1]; // initial frame
        anim.toValue = [NSNumber numberWithInt:frames]; // last frame + 1
    
        anim.duration = (float)frames/30; // from the first frame to the 6th one in 1 second
//        anim.duration = (float)frames;
        anim.repeatCount = _repeatCount; // just keep repeating it
//        anim.delegate = self;
        anim.autoreverses = isReverse;
    
        [self addAnimation:anim forKey:@"CharacterAnimation"]; // start
}

-(void)display;
{
    unsigned int countingSampleIndex = ((HeadAnimationLayer*)[self presentationLayer]).countingIndex;
    
    if (countingSampleIndex) {    
        CGPoint startingPoint = [[pointArray objectAtIndex:countingSampleIndex] CGPointValue];
        self.frame = CGRectMake(startingPoint.x, startingPoint.y, self.frame.size.width, self.frame.size.height);
    }
}

-(void)dealloc
{
    myDelegate = nil;
    [pointArray release];
    [super dealloc];
}
@end
