//
//  Player.m
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-19.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Player.h"

@implementation Player

@synthesize playerImage, imageView, isAlive;
@synthesize type, missels, warHeads, jets, defences;
@synthesize currentJetLoadRemaining, currentMisselLoadRemaining, isJetScrambled, isMisselReady;
@synthesize location, wasLastActionBuild, isStockPilling;
@synthesize isSmallDefenceDeployed, isLargeDefenceDeployed, name;

-(id)initWithFile:(NSString *)fileName andImage:(UIImage *)image andFrame:(CGRect)frame ofType:(NSString *)_type
{
    if (self = [super init]) {
        type = [[NSString alloc] initWithString:_type];
        // Set the initial city size
        if (fileName != nil) {
//            playerImage = [[SSImageLayer alloc] initWithFile:fileName andImage:image andFrame:frame];
            [self update];
        }
        missels = [[NSMutableArray alloc] initWithCapacity:0];
        warHeads = [[NSMutableArray alloc] initWithCapacity:0];
        jets = [[NSMutableArray alloc] initWithCapacity:0];
        defences = [[NSMutableArray alloc] initWithCapacity:0];
        isAlive = YES;
        wasLastActionBuild = NO;
        currentJetLoadRemaining = 0;
        currentMisselLoadRemaining = 0;
        isJetScrambled = NO;
        isMisselReady = NO;
        isStockPilling = NO;
        isSmallDefenceDeployed = NO;
        isLargeDefenceDeployed = NO;
        location = 0;
        currentEnemy = nil;
        name = @"";
    }
    return self;
}

-(id)initWithLayer:(ImageTile *)myView ofType:(NSString *)_type
{
    if (self = [super init]) {
        type = [[NSString alloc] initWithString:_type];
        // Set the initial city size
        imageView = myView;
//        playerImage = layer;//[[SSImageLayer alloc] initWithFile:fileName andImage:image andFrame:frame];
//            [self update];
//        }
        missels = [[NSMutableArray alloc] initWithCapacity:0];
        warHeads = [[NSMutableArray alloc] initWithCapacity:0];
        jets = [[NSMutableArray alloc] initWithCapacity:0];
        defences = [[NSMutableArray alloc] initWithCapacity:0];
        isAlive = YES;
        wasLastActionBuild = NO;
        currentJetLoadRemaining = 0;
        currentMisselLoadRemaining = 0;
        isJetScrambled = NO;
        isMisselReady = NO;
        isStockPilling = NO;
        isSmallDefenceDeployed = NO;
        isLargeDefenceDeployed = NO;
        location = 0;
        currentEnemy = nil;
        name = @"";
    }
    return self;
}

-(NSString *)getWorstRelationShip
{
//    if (currentEnemy == nil) {
        NSString *keys;
        for (keys in relationships) {
            if (currentEnemy == nil) {
                currentEnemy = keys;
            } else {
                FaceSymbol *newFace = [relationships objectForKey:keys];
                FaceSymbol *oldFace = [relationships objectForKey:currentEnemy];
                if ([newFace isLessThan:oldFace]) {
                    currentEnemy = keys;
                }
            }
        }
//    }
    return currentEnemy;
}

-(void)setPlayerRelationships:(NSDictionary *)_relationships
{
    relationships = [_relationships retain];
}

-(void)removePlayerFromRelationships:(NSString *)p_type
{
    NSMutableDictionary *tempDic = [[NSMutableDictionary alloc] initWithDictionary:relationships];
    [tempDic removeObjectForKey:p_type];
    [relationships release];
    relationships = [[NSDictionary alloc] initWithDictionary:tempDic];
    [tempDic release];
    currentEnemy = nil;
}

-(void)update
{
//    [playerImage setImage:type];
}

-(BOOL)isDeliverySystemActive
{
    return false;
}

-(void)setFrame:(CGRect)frame
{
//   playerImage.frame = frame;
    imageView.frame = frame;
}

-(void)increaseRelationToPlayer:(NSString *)playerName
{
    [(FaceSymbol *)[relationships objectForKey:playerName] changeIncrease];
}

-(void)decreaseRelationToPlayer:(NSString *)playerName
{
    [(FaceSymbol *)[relationships objectForKey:playerName] changeDecrease];
}

-(void)decreaseRelationToPlayerToZero:(NSString *)playerName
{
    [(FaceSymbol *)[relationships objectForKey:playerName] setToAngry];
}

-(FaceSymbol *)getRelationShipToPlayer:(NSString *)playerName
{
    return (FaceSymbol *)[relationships objectForKey:playerName];
}

-(void)addMisselWithSize:(NSString *)misselSize
{
    Missel *missel = [[Missel alloc] initWithName:misselSize];
    [self.missels addObject:missel];
    [missel release];
}

-(void)addWarHeadWithSize:(NSString *)warHeadSize
{
    WarHead *warhead = [[WarHead alloc] initWithName:warHeadSize];
    [self.warHeads addObject:warhead];
    [warhead release];
}

-(void)addJetWithSize:(NSString *)jetsSize
{
    Jet *jet = [[Jet alloc] initWithName:jetsSize];
    [self.jets addObject:jet];
    [jet release];
}

-(void)addDefenceWithSize:(NSString *)defenceSize
{
    Defence *defence = [[Defence alloc] initWithName:defenceSize];
    [self.defences addObject:defence];
    [defence release];
}

-(void)removeMisselWithSize:(NSString *)misselSize
{
    Missel *missel = [[Missel alloc] initWithName:misselSize];
    if ([self.missels containsObject:missel]) {
        [self.missels removeObjectAtIndex:[self.missels indexOfObject:missel]];
    }
    [missel release];
}

-(void)removeWarHeadWithSize:(NSString *)warHeadSize
{
    WarHead *warHead = [[WarHead alloc] initWithName:warHeadSize];
    if ([self.warHeads containsObject:warHead]) {
        [self.warHeads removeObjectAtIndex:[self.warHeads indexOfObject:warHead]];
    }
    [warHead release];
}

-(void)removeJetWithSize:(NSString *)jetsSize
{
    Jet *jet = [[Jet alloc] initWithName:jetsSize];
    if ([self.jets containsObject:jet]) {
        [self.jets removeObjectAtIndex:[self.jets indexOfObject:jet]];
    }
    [jet release];
}

-(void)removeDefenceWithSize:(NSString *)defenceSize
{
    Defence *defence = [[Defence alloc] initWithName:defenceSize];
    if ([self.defences containsObject:defence]) {
        [self.defences removeObjectAtIndex:[self.defences indexOfObject:defence]];
    }
    [defence release];
}

-(void)determinePayloadRemaining:(int)payload
{
    if (isJetScrambled) {
        currentJetLoadRemaining -= payload;
        NSMutableArray *newArray = [[NSMutableArray alloc] initWithArray:self.actionArray];
        if (currentJetLoadRemaining <= 0) {
            isJetScrambled = NO;
            [newArray addObject:@"Your Jet has been used up."];
        } else {
            [newArray addObject:[NSString stringWithFormat:@"Your Jet has a remaining payload capacity of %i",currentJetLoadRemaining]];
        }
        self.actionArray = newArray;
        [newArray release];
    } else {
        isMisselReady = NO;
        currentMisselLoadRemaining = 0;
//        NSMutableArray *newArray = [[NSMutableArray alloc] initWithArray:self.actionArray];
//        if (currentMisselLoadRemaining <= 0) {
//            [newArray addObject:@"Your Missel has been used up."];
//        } else {
//            [newArray addObject:[NSString stringWithFormat:@"Your Missel has a remaining payload capacity of %i",currentMisselLoadRemaining]];
 //       }
//        self.actionArray = newArray;
    }
}

-(int)getLargestWarHead:(int)max_size
{
    int returnValue = 0;
    if (max_size >= 100) {
        WarHead *warHead = [[WarHead alloc] initWithName:@"100 Mega Tons"];
        if ([self.warHeads containsObject:warHead]) {
            returnValue = 100;
        }
        [warHead release];
    }
    if ( max_size >= 50) {
        WarHead *warHead = [[WarHead alloc] initWithName:@"50 Mega Tons"];
        if ([self.warHeads containsObject:warHead]) {
            returnValue = 50;
        }
        [warHead release];
    }
    if ( max_size >= 20) {
        WarHead *warHead = [[WarHead alloc] initWithName:@"20 Mega Tons"];
        if ([self.warHeads containsObject:warHead]) {
            returnValue = 20;
        }
        [warHead release];
    }
    if ( max_size >= 10) {
        WarHead *warHead = [[WarHead alloc] initWithName:@"10 Mega Tons"];
        if ([self.warHeads containsObject:warHead]) {
            returnValue = 10;
        }
        [warHead release];
    }
    return returnValue;
}

-(int)getAction
{
    int value = arc4random()%8;
    switch (value) {
        case 2:
        {
            Defence *defence = [[Defence alloc] initWithName:@"small"];
            if (![self.defences containsObject:defence]) {
                value = 0;
            }
            [defence release];
        }
            break;
        case 3:
        {
            Defence *defence = [[Defence alloc] initWithName:@"large"];
            if (![self.defences containsObject:defence]) {
                value = 0;
            }
            [defence release];
        }
            break;
        case 4:
        {
            Jet *jet = [[Jet alloc] initWithName:@"small"];
            if (![self.jets containsObject:jet]) {
                value = 1;
            }
            [jet release];
        }
            break;
        case 5:
        {
            Jet *jet = [[Jet alloc] initWithName:@"large"];
            if (![self.jets containsObject:jet]) {
                value = 1;
            }
            [jet release];
        }
            break;
        case 6:
        case 7:
        {
            WarHead *warHead = [[WarHead alloc] initWithName:@"100 Mega Tons"];
            if (![self.warHeads containsObject:warHead]) {
                WarHead *warHead1 = [[WarHead alloc] initWithName:@"50 Mega Tons"];
                if (![self.warHeads containsObject:warHead1]) {
                    WarHead *warHead2 = [[WarHead alloc] initWithName:@"20 Mega Tons"];
                    if (![self.warHeads containsObject:warHead2]) {
                        WarHead *warHead3 = [[WarHead alloc] initWithName:@"10 Mega Tons"];
                        if (![self.warHeads containsObject:warHead3]) {
                            value = 1;
                        } else {
                            value = 6;
                        }
                        [warHead3 release];
                    } else {
                        value = 7;
                    }
                    [warHead2 release];
                } else {
                    value = 8;
                }
                [warHead1 release];
            } else {
                value = 9;
            }
            [warHead release];
        }
            break;
    }
    return value;
}

-(BOOL)equals:(id)object
{
    Player *player = (id)object;
    return [type isEqualToString:player.type];
}

-(NSString *)actionArrayToString
{
    NSMutableString *textString = [NSMutableString stringWithCapacity:0];
    for (int i=0; i<[_actionArray count]; i++) {
        [textString appendString:[_actionArray objectAtIndex:i]];
        [textString appendString:@"\n"];
    }
    return textString;
}

-(void)dealloc
{
    [playerImage release];
    [type release];
    if (relationships != nil) [relationships release];
    [missels release];
    [warHeads release];
    [jets release];
    [defences release];
    [super dealloc];
}

@end
