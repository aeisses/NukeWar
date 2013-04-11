//
//  Action.h
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-21.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "City.h"
#import "SSImageAnimationLayer.h"
#import "HeadAnimationLayer.h"
#import "SoundUtils.h"

#define quadrant1Point CGPointMake(256,174)
#define quadrant2Point CGPointMake(768,174)
#define quadrant3Point CGPointMake(256,558)
#define quadrant4Point CGPointMake(768,558)
#define centrePoint CGPointMake(512,384)

typedef enum {
    zero,
    ten,
    twenty,
    fifty,
    hundred
} Payload;

typedef enum {
    jetsmall,
    jetlarge,
    propaganda,
    build,
    missile10megton,
    missile20megton,
    missile50megton,
    missile100megton,
    warhead10megton,
    warhead20megton,
    warhead50megton,
    warhead100megton,
    defensesmall,
    defenselarge
} Cause;

typedef enum {
    jetfueled,
    jetshotdown,
    built,
    citizengained,
    citizenlost,
    missilereadied,
    bombsucess,
    bombfailed,
    smalldefensedeployed,
    largedefensedeployed,
    none
} Affect;

@protocol ActionDelegate <NSObject>
-(void)ActionAnimationCompleted:(NSObject*)action;
-(void)ActionResultAnimationCompleted;
@end

@interface Action : NSObject <SSImageAnimationLayerDelegate>
{
    Payload payload;
    int m_population;
    int t_population;
    City *target;
    City *origin;
    Player *player;
    Affect affect;
    Cause cause;
    SSImageAnimationLayer *animationLayer;
    id <ActionDelegate> delegate;
    BOOL isShowResult;
    Player *opponent;
    BOOL isFinalAction;
}

@property (assign) Payload payload;
@property (assign) int m_population;
@property (assign) int t_population;
@property (retain, nonatomic) City *target;
@property (retain, nonatomic) City *origin;
@property (assign) Affect affect;
@property (assign) Cause cause;
@property (retain, nonatomic) Player *player;
@property (retain, nonatomic) SSImageAnimationLayer *animationLayer;
@property (retain, nonatomic) id <ActionDelegate> delegate;
@property (retain, nonatomic) Player *opponent;
@property (assign) BOOL isFinalAction;

-(id)initActionWithCause:(Cause)i_cause Payload:(Payload)i_playload Target:(City *)i_target Origin:(City *)i_origin Player:(Player *)i_player Opponent:(Player *)i_player;
-(void)showAction;
-(void)determineAffect;
-(BOOL)showResult;

@end
