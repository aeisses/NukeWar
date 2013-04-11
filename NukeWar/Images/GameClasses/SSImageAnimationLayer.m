//
//  SSImageAnimationLayer.m
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-21.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SSImageAnimationLayer.h"
#import "StringUtils.h"

@implementation SSImageAnimationLayer

@synthesize sampleIndex;
@synthesize imageKey;
@synthesize myDelegate;

-(id)initWithFile:(NSString *)fileName andImage:(UIImage *)image andFrame:(CGRect)frame
{
    if (self = [super init]) {
        self.frame = frame;
        startingRect = frame;
        self.contents = (id)image.CGImage;
        imageWidth = CGImageGetWidth(image.CGImage);
        imageHeight = CGImageGetHeight(image.CGImage);
        
        NSDictionary *plistData;   
        NSString *localizedPath = [[NSString alloc] initWithFormat:@"%@",[[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"]];
        plistData = [[NSDictionary alloc] initWithContentsOfFile:localizedPath];
        [localizedPath release];
        myPlist = [[NSDictionary alloc] initWithDictionary:(NSDictionary *)[plistData objectForKey:@"frames"]];
        [plistData release];
        isRotation = NO;
    }
    return self;
}

-(id)initWithFile:(NSString *)_fileName andMovementArray:(NSArray *)i_pointArray
{
    if (self = [super init])
    {
        movementArray = [[NSArray alloc] initWithArray:i_pointArray];
        NSString *fileName = [[NSString alloc] initWithString:_fileName];
        NSString *imageString;
        imageString = [[NSString alloc] initWithFormat:@"%@",[[NSBundle mainBundle] pathForResource:fileName ofType:@"png"]];
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:imageString];
        [imageString release];
        [fileName release];
        self.contents = (id)image.CGImage;
        startingPoint = [[movementArray objectAtIndex:([movementArray count] - 1)] CGPointValue];
        float width = CGImageGetWidth(image.CGImage);
        float height = CGImageGetHeight(image.CGImage);
        startingRect = CGRectMake(startingPoint.x-(width/2), startingPoint.y-height/2, CGImageGetWidth(image.CGImage), CGImageGetHeight(image.CGImage));
        self.frame = startingRect;
        self.position = CGPointMake(startingPoint.x-(width/2), startingPoint.y-height/2);
        [image release];
        isRotation = NO;
    }
    return self;
}

-(void)setImage:(NSString *)imageName
{
    imageKey = [[NSString alloc] initWithString:imageName];
    NSString *dictKey = [[NSString alloc] initWithFormat:@"%@1.png",imageName];
    NSDictionary *tempDictionary = [[NSDictionary alloc] initWithDictionary:(NSDictionary *)[myPlist objectForKey:dictKey]];
    CGRect locationFrame = [(NSString *)[tempDictionary objectForKey:@"frame"] stringToRect];
    [tempDictionary release];
    CGSize normalizedSize = CGSizeMake( locationFrame.size.width/imageWidth, locationFrame.size.height/imageHeight ); 
    self.contentsRect = CGRectMake(locationFrame.origin.x/imageWidth,
                                   locationFrame.origin.y/imageHeight,
                                   normalizedSize.width, normalizedSize.height);
    [dictKey release];
}

-(void)startAnimation:(int)i_frames repeatCount:(int)_repeatCount withReverse:(BOOL)isReverse withDelegate:(BOOL)isDelegate
{
    startingPoint = self.frame.origin;

    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"sampleIndex"];
    
    anim.fromValue = [NSNumber numberWithInt:1]; // initial frame
    anim.toValue = [NSNumber numberWithInt:i_frames + 1]; // last frame + 1
    
    anim.duration = (float)i_frames/30; // from the first frame to the 6th one in 1 second
    anim.repeatCount = _repeatCount; // just keep repeating it
    if (isDelegate) anim.delegate = self;
    anim.autoreverses = isReverse;
 //   startingRect = self.frame;
    
    [self addAnimation:anim forKey:@"CharacterAnimation"]; // start
}

-(void)startMovementAnimation:(int)i_frames repeatCount:(int)_repeatCount withReverse:(BOOL)isReverse andRotation:(BOOL)rotation forRevolutions:(float)rev
{
    startingPoint = self.position;
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"movementIndex"];
    
    anim.fromValue = [NSNumber numberWithInt:1]; // initial frame
    anim.toValue = [NSNumber numberWithInt:i_frames]; // last frame + 1
    
    anim.duration = (float)i_frames/30; // from the first frame to the 6th one in 1 second
    frames = i_frames;
    anim.repeatCount = _repeatCount; // just keep repeating it
    anim.delegate = self;
    anim.autoreverses = isReverse;
    isRotation = rotation;
    revolutions = rev;
    rotationArray = nil;
    [self addAnimation:anim forKey:@"MovementAnimation"]; // start
}

-(void)startMovementAnimation:(NSArray *)i_movementArray withDelegate:(BOOL)isDelegate
{
    movementArray = [[NSArray alloc] initWithArray:i_movementArray];
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"movementIndex"];
        
    anim.fromValue = [NSNumber numberWithInt:0];
    anim.toValue = [NSNumber numberWithInt:[movementArray count]];
    if (isDelegate) anim.delegate = self; 
    anim.duration = (float)[movementArray count]/30;
    anim.repeatCount = 1;
    
    rotationArray = nil;

//    isMovementNegative = _isNegative;
//    isMovementHorizontal = isHorizontal;
        //    anim.delegate = self;
//    anim.autoreverses = isReverse;
        
    [self addAnimation:anim forKey:@"MovementAnimation"];
}

-(void)startMovementAnimation:(int)i_frames repeatCount:(int)_repeatCount withReverse:(BOOL)isReverse andRotation:(BOOL)rotation forArray:(NSArray *)i_rotationArray
{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"movementIndex"];
    
    anim.fromValue = [NSNumber numberWithInt:1]; // initial frame
    anim.toValue = [NSNumber numberWithInt:i_frames]; // last frame + 1
    
    anim.duration = (float)i_frames/30; // from the first frame to the 6th one in 1 second
    anim.repeatCount = _repeatCount; // just keep repeating it
    anim.delegate = self;
    anim.autoreverses = isReverse;
    isRotation = rotation;
    rotationArray = i_rotationArray;
    [self addAnimation:anim forKey:@"CharacterAnimation"]; // start
    
    /*    if (isRotation) {
     CABasicAnimation *rota = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
     rota.duration = (float)frames/30;
     anim.repeatCount = _repeatCount;
     rota.fromValue = [NSNumber numberWithFloat: 0];
     rota.toValue = [NSNumber numberWithFloat: 2 * M_PI ];
     [self addAnimation:rota forKey:@"Rotation"]; // start
     }
     */
}

-(void)startAnimation:(int)i_frames repeatCount:(int)_repeatCount withReverse:(BOOL)isReverse andRotation:(BOOL)rotation
{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"sampleIndex"];
    
    anim.fromValue = [NSNumber numberWithInt:1]; // initial frame
    anim.toValue = [NSNumber numberWithInt:i_frames]; // last frame + 1
    
    anim.duration = (float)i_frames/30; // from the first frame to the 6th one in 1 second
    anim.repeatCount = _repeatCount; // just keep repeating it
    anim.delegate = self;
    anim.autoreverses = isReverse;
    isRotation = rotation;
    [self addAnimation:anim forKey:@"CharacterAnimation"]; // start

    rotationArray = nil;
/*    if (isRotation) {
        CABasicAnimation *rota = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        rota.duration = (float)frames/30;
        anim.repeatCount = _repeatCount;
        rota.fromValue = [NSNumber numberWithFloat: 0];
        rota.toValue = [NSNumber numberWithFloat: 2 * M_PI ];
        [self addAnimation:rota forKey:@"Rotation"]; // start
    }
*/
}

-(void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag
{
    [myDelegate animationCompleted];
}

-(void)stopAnimation
{
    [self removeAnimationForKey:@"CharacterAnimation"];
    [self removeAnimationForKey:@"MovementAnimation"];
}

-(void)display
{
    unsigned int currentSampleIndex = ((SSImageAnimationLayer*)[self presentationLayer]).sampleIndex;
    unsigned int movementSampleIndex = ((SSImageAnimationLayer*)[self presentationLayer]).movementIndex;

    if (currentSampleIndex) {
        NSString *dictKey = [[NSString alloc] initWithFormat:@"%@%i.png",imageKey,currentSampleIndex];
        NSDictionary *tempDictionary = [[NSDictionary alloc] initWithDictionary:(NSDictionary *)[myPlist objectForKey:dictKey]];
        CGRect myPlistRect = [(NSString *)[tempDictionary objectForKey:@"frame"] stringToRect];
        CGRect m_frame = [(NSString *)[tempDictionary objectForKey:@"sourceColorRect"] stringToRect];
        [dictKey release];
        [tempDictionary release];
        
        CGRect myTempRect = CGRectMake(myPlistRect.origin.x/CGImageGetWidth((CGImageRef)self.contents), 
                                       myPlistRect.origin.y/CGImageGetHeight((CGImageRef)self.contents), 
                                       myPlistRect.size.width/CGImageGetWidth((CGImageRef)self.contents),
                                       myPlistRect.size.height/CGImageGetHeight((CGImageRef)self.contents));
        
        self.contentsRect = myTempRect;
        if (movementSampleIndex) {
            CGPoint nextPoint = [[movementArray objectAtIndex:movementSampleIndex] CGPointValue];
            self.frame = CGRectMake(nextPoint.x-self.frame.size.width/2, nextPoint.y-self.frame.size.height/2, self.frame.size.width, self.frame.size.height);
            startingPoint.x = nextPoint.x-startingRect.size.width/2;
            startingPoint.y = nextPoint.y-startingRect.size.height/2;
            //        if (isRotation) {
            //            CATransform3D current = self.transform;
            //            self.transform = CATransform3DRotate(current, 4*M_PI/180, 0.0, 0.0, 1.0);
            //        }
        }

        self.frame = CGRectMake(startingPoint.x+m_frame.origin.x,
                                startingPoint.y+m_frame.origin.y,
                                m_frame.size.width,
                                m_frame.size.height);
//        }
    } else if (movementSampleIndex) {
        if (isRotation) {
            CGPoint nextPoint = [[movementArray objectAtIndex:movementSampleIndex] CGPointValue];
            self.position = CGPointMake(nextPoint.x-startingRect.size.width/2, nextPoint.y-startingRect.size.height/2);
            if (rotationArray != nil) {
                self.transform = CATransform3DMakeRotation((float)[[rotationArray objectAtIndex:movementSampleIndex] floatValue], 0.0, 0.0, 1.0);
            } else {
                self.transform = CATransform3DMakeRotation((float)revolutions*2*M_PI/frames*movementSampleIndex, 0.0, 0.0, 1.0);
            }
        } else {
            CGPoint nextPoint = [[movementArray objectAtIndex:movementSampleIndex] CGPointValue];
//            self.position = CGPointMake(nextPoint.x-self.frame.size.width/2, nextPoint.y-self.frame.size.height/2);
            self.frame = CGRectMake(nextPoint.x-self.frame.size.width/2, nextPoint.y-self.frame.size.height/2, self.frame.size.width, self.frame.size.height);
        }
    }
}

+ (BOOL)needsDisplayForKey:(NSString *)key;
{
    return [key isEqualToString:@"sampleIndex"] || [key isEqualToString:@"movementIndex"];
}

// De-activate the built in animation
+(id < CAAction >)defaultActionForKey:(NSString *)aKey;
{
    if ([aKey isEqualToString:@"contentsRect"] || [aKey isEqualToString:@"position"] || [aKey isEqualToString:@"bounds"] || [aKey isEqualToString:@"contents"] || [aKey isEqualToString:@"transform"])
        return (id < CAAction >)[NSNull null];
    
    return [super defaultActionForKey:aKey];
}

-(void)dealloc
{
    [imageKey release]; imageKey = nil;
    [super dealloc];
}

@end
