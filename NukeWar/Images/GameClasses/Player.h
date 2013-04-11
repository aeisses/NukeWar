//
//  Player.h
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-19.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSImageLayer.h"
#import "Characters.h"
#import "FaceSymbol.h"
#import "Missel.h"
#import "Jet.h"
#import "Defence.h"
#import "WarHead.h"
#import "ImageTile.h"

@interface Player : NSObject
{
//    SSImageLayer *playerImage;
    CALayer *playerImage;
    SSImageLayer *selectedImage;
    BOOL isAlive;
    NSString *type;
    NSDictionary *relationships;
    NSString *currentEnemy;
    BOOL wasLastActionBuild;
    BOOL isStockPilling;
    BOOL isSmallDefenceDeployed;
    BOOL isLargeDefenceDeployed;
}

//@property (retain, nonatomic) SSImageLayer *playerImage;
@property (readwrite) BOOL isAlive;
@property (readwrite) BOOL wasLastActionBuild;
@property (retain, nonatomic) ImageTile *imageView;
@property (retain, nonatomic) CALayer *playerImage;
@property (retain, nonatomic) NSString *type;
@property (retain, nonatomic) NSString *name;
@property (retain, nonatomic) NSMutableArray *missels;
@property (retain, nonatomic) NSMutableArray *warHeads;
@property (retain, nonatomic) NSMutableArray *jets;
@property (retain, nonatomic) NSMutableArray *defences;
@property (retain, nonatomic) NSArray *actionArray;
@property (readwrite) int currentMisselLoadRemaining;
@property (readwrite) int currentJetLoadRemaining;
@property (readwrite) BOOL isJetScrambled;
@property (readwrite) BOOL isMisselReady;
@property (readwrite) BOOL isStockPilling;
@property (readwrite) int location;
@property (readwrite) BOOL isSmallDefenceDeployed;
@property (readwrite) BOOL isLargeDefenceDeployed;

-(id)initWithFile:(NSString *)fileName andImage:(UIImage *)image andFrame:(CGRect)frame ofType:(NSString *)_type;
-(id)initWithLayer:(ImageTile *)imageView ofType:(NSString *)_type;
-(void)setPlayerRelationships:(NSDictionary *)_relationships;
-(void)update;
-(BOOL)isDeliverySystemActive;
-(void)setFrame:(CGRect)frame;
-(void)increaseRelationToPlayer:(NSString *)playerName;
-(void)decreaseRelationToPlayer:(NSString *)playerName;
-(void)decreaseRelationToPlayerToZero:(NSString *)playerName;
-(FaceSymbol *)getRelationShipToPlayer:(NSString *)playerName;
-(void)addMisselWithSize:(NSString *)misselSize;
-(void)addWarHeadWithSize:(NSString *)warHeadSize;
-(void)addJetWithSize:(NSString *)jetsSize;
-(void)addDefenceWithSize:(NSString *)defenceSize;
-(void)removeMisselWithSize:(NSString *)misselSize;
-(void)removeWarHeadWithSize:(NSString *)warHeadSize;
-(void)removeJetWithSize:(NSString *)jetsSize;
-(void)removeDefenceWithSize:(NSString *)defenceSize;
-(void)determinePayloadRemaining:(int)payload;
-(int)getLargestWarHead:(int)max_size;
-(int)getAction;
-(NSString *)getWorstRelationShip;
-(BOOL)equals:(id)object;
-(NSString *)actionArrayToString;
-(void)removePlayerFromRelationships:(NSString *)p_type;

@end