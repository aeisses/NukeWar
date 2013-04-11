//
//  HeadAnimationLayer.h
//  RatherOddJourney
//
//  Created by Aaron Eisses on 12-02-03.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@protocol HeadAnimationLayerDelegate <NSObject>
-(void)animationFinished;
@end

@interface HeadAnimationLayer : CALayer
{
    unsigned int countingIndex;
    NSArray *pointArray;
    
    id <HeadAnimationLayerDelegate> myDelegate;
}

@property (readwrite, nonatomic) unsigned int countingIndex;
@property (retain, nonatomic) id <HeadAnimationLayerDelegate> myDelegate;

-(id)initWithFile:(NSString *)_fileName andMovementArray:(NSArray *)i_pointArray;
-(void)startAnimation:(int)frames repeatCount:(int)_repeatCount withReverse:(BOOL)isReverse;

@end
