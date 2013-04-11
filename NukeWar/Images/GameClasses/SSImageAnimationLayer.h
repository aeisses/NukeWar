//
//  SSImageAnimationLayer.h
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-21.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "SSImageLayer.h"

@protocol SSImageAnimationLayerDelegate <NSObject>
-(void)animationCompleted;
@end

@interface SSImageAnimationLayer : CALayer
{
    float imageWidth;
    float imageHeight;
    NSDictionary *myPlist;
    unsigned int sampleIndex;
    CGRect startingRect;
    CGPoint startingPoint;
    NSString *imageKey;
    id <SSImageAnimationLayerDelegate> myDelegate;
    NSArray *movementArray;
    NSArray *rotationArray;
    BOOL isRotation;
    float revolutions;
    int frames;
}

@property (readwrite, nonatomic) unsigned int sampleIndex;
@property (retain, nonatomic) NSString *imageKey;
@property (retain, nonatomic) id <SSImageAnimationLayerDelegate> myDelegate;
@property (readwrite, nonatomic) unsigned int movementIndex;

-(id)initWithFile:(NSString *)fileName andImage:(UIImage *)image andFrame:(CGRect)frame;
-(id)initWithFile:(NSString *)_fileName andMovementArray:(NSArray *)i_pointArray;
-(void)setImage:(NSString *)imageName;
-(void)startAnimation:(int)i_frames repeatCount:(int)_repeatCount withReverse:(BOOL)isReverse withDelegate:(BOOL)isDelegate;
-(void)startMovementAnimation:(int)i_frames repeatCount:(int)_repeatCount withReverse:(BOOL)isReverse andRotation:(BOOL)rotation forRevolutions:(float)rev;
-(void)startMovementAnimation:(NSArray *)i_movementArray withDelegate:(BOOL)isDelegate;
-(void)startAnimation:(int)i_frames repeatCount:(int)_repeatCount withReverse:(BOOL)isReverse andRotation:(BOOL)rotation;
-(void)startMovementAnimation:(int)i_frames repeatCount:(int)_repeatCount withReverse:(BOOL)isReverse andRotation:(BOOL)rotation forArray:(NSArray *)i_rotationArray;
-(void)stopAnimation;

@end
