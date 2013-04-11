//
//  Action.m
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-21.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Action.h"

@interface Action (PrivateMethods)
-(int)calculatePropagandaGainForCity:(City *)one lossForCity:(City *)two atRate:(int)rate;
-(void)calculateBombHitAtRate:(int)rate;
@end

@implementation Action

@synthesize payload;
@synthesize m_population;
@synthesize t_population;
@synthesize target;
@synthesize origin;
@synthesize affect;
@synthesize cause;
@synthesize player;
@synthesize animationLayer;
@synthesize delegate;
@synthesize opponent;
@synthesize isFinalAction;

-(CGPoint)GetOriginPoint
{
    CGPoint location = CGPointMake([origin getX],[origin getY]);
    CGPoint returnPoint = CGPointMake(0,0);
    if (CGRectContainsPoint(CGRectMake(44,30,271,301), location)) { // Quadrant 1
        returnPoint = CGPointMake(179.5,180.5);
    } else if (CGRectContainsPoint(CGRectMake(55,414,271,334), location)) { // Quadrant 2
        returnPoint = CGPointMake(190.5,581);
    } else if (CGRectContainsPoint(CGRectMake(369,217,271,334), location)) { // Centre
        returnPoint = CGPointMake(504.5,384);
    } else if (CGRectContainsPoint(CGRectMake(713, 29, 271, 334), location)) { // Quadrant 3
        returnPoint = CGPointMake(848.5,196);
    } else if (CGRectContainsPoint(CGRectMake(689, 428, 321, 334), location)) { // Quadrant 4
        returnPoint = CGPointMake(849.5,595);
    }
    return returnPoint;
}

-(void)calculateBuild
{
    NSMutableArray *actionResultMArray = [[NSMutableArray alloc] initWithCapacity:0];
    [actionResultMArray addObject:@"Build was successful, created the following:"];
    // Add a build modifier here
    // Determine how many missels
    for (int i=0; i<arc4random()%5+1; i++) {
        switch (arc4random()%4) {
            case 0:
                [player addMisselWithSize:@"10 Mega Tons"];
                [actionResultMArray addObject:@"10 Mega Ton Missel"];
                break;
            case 1:
                [player addMisselWithSize:@"20 Mega Tons"];
                [actionResultMArray addObject:@"20 Mega Ton Missel"];
                break;
            case 2:
                [player addMisselWithSize:@"50 Mega Tons"];
                [actionResultMArray addObject:@"50 Mega Ton Missel"];
                break;
            case 3:
                [player addMisselWithSize:@"100 Mega Tons"];
                [actionResultMArray addObject:@"100 Mega Ton Missel"];
                break;
        }
    }
    // Determine how many warheads
    for (int i=0; i<arc4random()%5+1; i++) {
        switch (arc4random()%4) {
            case 0:
                [player addWarHeadWithSize:@"10 Mega Tons"];
                [actionResultMArray addObject:@"10 Mega Ton Warhead"];
                break;
            case 1:
                [player addWarHeadWithSize:@"20 Mega Tons"];
                [actionResultMArray addObject:@"20 Mega Ton Warhead"];
                break;
            case 2:
                [player addWarHeadWithSize:@"50 Mega Tons"];
                [actionResultMArray addObject:@"50 Mega Ton Warhead"];
                break;
            case 3:
                [player addWarHeadWithSize:@"100 Mega Tons"];
                [actionResultMArray addObject:@"100 Mega Ton Warhead"];
                break;
        }
    }
    // Determine how many jets
    for (int i=0; i<arc4random()%2+1; i++) {
        switch (arc4random()%2) {
            case 0:
                [player addJetWithSize:@"small"];
                [actionResultMArray addObject:@"Small Bomber"];
                break;
            case 1:
                [player addJetWithSize:@"large"];
                [actionResultMArray addObject:@"Large Bomber"];
                break;
        }
    }
    // Determine how many defences
    for (int i=0; i<arc4random()%2+1; i++) {
        switch (arc4random()%2) {
            case 0:
                [player addDefenceWithSize:@"small"];
                [actionResultMArray addObject:@"Missel Defence"];
                break;
            case 1:
                [player addDefenceWithSize:@"large"];
                [actionResultMArray addObject:@"Iron Dome"];
                break;
        }
    }
    player.actionArray = [NSArray arrayWithArray:actionResultMArray];
    [actionResultMArray release];
}

-(int)calculatePropagandaGainForCity:(City *)one lossForCity:(City *)two atRate:(int)rate
{
    int cityDiff = abs(origin.population - target.population);
    if (cityDiff == 0) cityDiff = 1;
    int cityChange = arc4random()%cityDiff + 100/rate;
    if ((two.population - cityChange) <= 0) {
        cityChange = (int)two.population/2;
    }
    if (cityChange == 0) cityChange = 1;
    two.population = two.population - cityChange;
    one.population = one.population + cityChange;
    return cityChange;
}

-(void)calculateBombHitAtRate:(int)rate
{
    if (arc4random()%5 != 0) {
        affect = bombsucess;
        int damage = 0;
        switch (rate) {
            case 10:
                damage = ((arc4random()%6) + 1);
                break;
            case 20:
                damage = ((arc4random()%8) + 3);
                break;
            case 50:
                damage = ((arc4random()%15) + 6);
                break;
            case 100:
                damage = ((arc4random()%20) + 16);
                break;
        }
        target.population = target.population - damage;
        [target updateCity];
        player.actionArray = [NSArray arrayWithObjects:[NSString stringWithFormat:@"Bomb was a hit and killed %i people!",damage], nil];
        [opponent decreaseRelationToPlayer:player.type];
    } else {
        affect = bombfailed;
        player.actionArray = [NSArray arrayWithObjects:@"Bomb Failed!", nil];
    }
}

-(void)animationCompleted
{
    // Move to the next action here....
    [animationLayer removeFromSuperlayer];
    [animationLayer release];
    if (isShowResult) {
        [delegate ActionResultAnimationCompleted];
    } else {
        [delegate ActionAnimationCompleted:self];
    }
    //
}

-(void)showAction
{
    switch (cause) {
        case jetsmall:
        case jetlarge:
        {
            CGPoint originPt = [self GetOriginPoint];
            NSMutableArray *pointArray = [[NSMutableArray alloc] initWithCapacity:90];
            for (int i=0; i<90; i++) {
                int j = i+1;
                float x = (float)(originPt.x + 90 * cos(j*4 * M_PI/180));
                float y = (float)originPt.y + 90 * sin(j*4 * M_PI/180);
                [pointArray insertObject:[NSValue valueWithCGPoint:CGPointMake(x,y)] atIndex:i];
            }
            animationLayer = [[SSImageAnimationLayer alloc] initWithFile:@"jet"
                                                        andMovementArray:(NSArray *)pointArray];
            animationLayer.myDelegate = self;
            [animationLayer startMovementAnimation:90 repeatCount:2 withReverse:NO andRotation:YES forRevolutions:1];
            [pointArray release];
            player.actionArray = [NSArray arrayWithObject:[NSString stringWithFormat:@"%@ scrambles a fighter in preperation for destruction!",player.name]];
        }
            break;
        case propaganda:
        {
            NSString *antenaImageFileName = [[NSString alloc] initWithString:@"antena"];
            NSString *imageString = [[NSString alloc] initWithFormat:@"%@",[[NSBundle mainBundle] pathForResource:antenaImageFileName ofType:@"png"]];
            UIImage *image = [[UIImage alloc] initWithContentsOfFile:imageString];
            [imageString release];
            CGPoint originPt = [self GetOriginPoint];
            CGRect frame = CGRectMake(originPt.x-38,originPt.y-38,76,75);
            animationLayer = [[SSImageAnimationLayer alloc] initWithFile:antenaImageFileName
                                                                                   andImage:image
                                                                                   andFrame:frame];
            animationLayer.myDelegate = self;
            [animationLayer setImage:@"antena"];
            [animationLayer startAnimation:11 repeatCount:5 withReverse:NO withDelegate:YES];
            [image release];
            [antenaImageFileName release];
            player.actionArray = [NSArray arrayWithObject:[NSString stringWithFormat:@"%@ uses propganda lies on %@!",player.name,opponent.name]];
        }
            break;
        case build:
        {
            [SoundUtils playFactorySound];
            NSString *factoryImageFileName = [[NSString alloc] initWithString:@"factory"];
            NSString *imageString = [[NSString alloc] initWithFormat:@"%@",[[NSBundle mainBundle] pathForResource:factoryImageFileName ofType:@"png"]];
            UIImage *image = [[UIImage alloc] initWithContentsOfFile:imageString];
            [imageString release];
            CGPoint originPt = [self GetOriginPoint];
            CGRect frame = CGRectMake(originPt.x-42,originPt.y-31,85,62);
            animationLayer = [[SSImageAnimationLayer alloc] initWithFile:factoryImageFileName
                                                                andImage:image
                                                                andFrame:frame];
            animationLayer.myDelegate = self;
            [animationLayer setImage:@"factory"];
            [animationLayer startAnimation:18 repeatCount:5 withReverse:NO withDelegate:YES];
            [image release];
            [factoryImageFileName release];
            player.actionArray = [NSArray arrayWithObject:[NSString stringWithFormat:@"%@ build weapons of war!",player.name]];
        }
            break;
        case missile10megton:
        case missile20megton:
        case missile50megton:
        case missile100megton:
        {            
            NSString *missileImageFileName = [[NSString alloc] initWithString:@"missile"];
            NSString *imageString = [[NSString alloc] initWithFormat:@"%@",[[NSBundle mainBundle] pathForResource:missileImageFileName ofType:@"png"]];
            UIImage *image = [[UIImage alloc] initWithContentsOfFile:imageString];
            [imageString release];
            CGPoint originPt = [self GetOriginPoint];
            CGRect frame = CGRectMake(originPt.x-16,originPt.y-45,33,90);
            animationLayer = [[SSImageAnimationLayer alloc] initWithFile:missileImageFileName
                                                                andImage:image
                                                                andFrame:frame];
            animationLayer.myDelegate = self;
            [animationLayer setImage:@"missile"];
            [animationLayer startAnimation:32 repeatCount:1 withReverse:NO withDelegate:YES];
            [image release];
            [missileImageFileName release];
            player.actionArray = [NSArray arrayWithObject:[NSString stringWithFormat:@"%@ prepares a missile as a show of strength and power!",player.name]];
        }
            break;
        case warhead10megton:
        case warhead20megton:
        case warhead50megton:
        case warhead100megton:
        {
            NSMutableArray *pointArray = [[NSMutableArray alloc] initWithCapacity:90];
            NSMutableArray *rotationArray = [[NSMutableArray alloc] initWithCapacity:90];
            CGPoint originPt = [self GetOriginPoint];
            if (player.isJetScrambled) {
                float deltaX = (float)(originPt.x - [target getX])/44;
                float deltaY = (float)(originPt.y - [target getY])/44;
                float theta = (float)atanf(deltaY/deltaX);
                if (deltaX > 0 && deltaY > 0) {
                    theta = (float)theta + M_PI/2;
                } else if (deltaX < 0 && deltaY > 0) {
                    theta = (float)theta - M_PI/2;
                } else if (deltaX < 0 && deltaY < 0) {
                    theta = (float)theta - M_PI/2;
                } else if (deltaX > 0 && deltaY < 0) {
                    theta = (float)theta + M_PI/2;
                }
                for (int i=0; i<90; i++) {
                    if (i < 45) {
                        float x = (float)i*deltaX;
                        float y = (float)i*deltaY;
                        [pointArray insertObject:[NSValue valueWithCGPoint:CGPointMake((float)originPt.x-x,(float)originPt.y-y)] atIndex:i];
                        [rotationArray insertObject:[NSNumber numberWithFloat:theta] atIndex:i];
                    } else {
                        float x = (float)(i-45)*deltaX;
                        float y = (float)(i-45)*deltaY;
                        [pointArray insertObject:[NSValue valueWithCGPoint:CGPointMake((float)[target getX]+x,(float)[target getY]+y)] atIndex:i];
                        [rotationArray insertObject:[NSNumber numberWithFloat:(float)(theta+M_PI)] atIndex:i];
                    }
                }
                animationLayer = [[SSImageAnimationLayer alloc] initWithFile:@"jet"
                                                            andMovementArray:(NSArray *)pointArray];
                animationLayer.myDelegate = self;
                [animationLayer startMovementAnimation:90 repeatCount:1 withReverse:NO andRotation:YES forArray:rotationArray];
                [pointArray release];
                player.actionArray = [NSArray arrayWithObject:[NSString stringWithFormat:@"%@ sends death with a fighter to %@",player.name,opponent.name]];
            } else {
                // TODO: Can look at this later and make it better
/*              float finalX = (float)[target getX] - originPt.x;
                float finalY = (float)[target getY] - originPt.y;
                float v = 1000;
                float g = 9.80665;
                float theta = 0;
                if (finalX < 0) {
                    theta = (float)atanf(powf(v,2) + sqrtf(powf(v,4)-g*(g*powf(finalX,2)+2*finalY*powf(v,2)))/g*finalX);
                } else {
                    theta = (float)atanf(powf(v,2) + sqrtf(powf(v,4)+g*(g*powf(finalX,2)+2*finalY*powf(v,2)))/g*finalX);
                }
                theta = 0.785398163;
                float deltaX = (float)finalX/90;
                for (int i=0; i<90; i++) {
                    float x = (float)i*deltaX;
                    float y = (float)originPt.y + (x*tanf(theta))-((g*powf(x,2))/(2*powf(v*cosf(theta),2)));
                    [pointArray insertObject:[NSValue valueWithCGPoint:CGPointMake(originPt.x + x, y)] atIndex:i];
                }
                NSLog(@"PointArray: %@",pointArray);
 */
//              float height = distance*2;

                float deltaX = (float)(originPt.x - [target getX]);
                float deltaY = (float)(originPt.y - [target getY]);
                float b = (float)90;
                float a = (float)sqrtf(deltaX*deltaX + deltaY*deltaY)/2;
                float h = (float)originPt.x - deltaX/2;
                float k = (float)originPt.y - deltaY/2;
                float theta = atanf((deltaY/2)/(deltaX/2));
                for (int i=0; i<90; i++) {
                    float j = (float)originPt.x > [target getX] ? -M_PI/90*i : M_PI + M_PI/90*i;
                    float x = a*cos(j)*cos(theta) - b*sin(j)*sin(theta) + h;
                    float y = a*cos(j)*sin(theta) + b*sin(j)*cos(theta) + k;
                    [pointArray insertObject:[NSValue valueWithCGPoint:CGPointMake(x,y)] atIndex:i];
                }
            
                animationLayer = [[SSImageAnimationLayer alloc] initWithFile:@"ArcherMissile"
                                                            andMovementArray:(NSArray *)pointArray];
                animationLayer.myDelegate = self;
                [animationLayer startMovementAnimation:90 repeatCount:1 withReverse:NO andRotation:YES forRevolutions:(float)originPt.x > [target getX] ? -0.5 : 0.5];
                [pointArray release];
                player.actionArray = [NSArray arrayWithObject:[NSString stringWithFormat:@"%@ sends death with a missel to %@",player.name,opponent.name]];
            }
        }
            break;
        case defensesmall:
        case defenselarge:
        {
            NSString *defenseImageFileName = [[NSString alloc] initWithString:@"defence"];
            NSString *imageString = [[NSString alloc] initWithFormat:@"%@",[[NSBundle mainBundle] pathForResource:defenseImageFileName ofType:@"png"]];
            UIImage *image = [[UIImage alloc] initWithContentsOfFile:imageString];
            [imageString release];
            CGPoint originPt = [self GetOriginPoint];
            CGRect frame = CGRectMake(originPt.x-50,originPt.y-51,100,103);
            animationLayer = [[SSImageAnimationLayer alloc] initWithFile:defenseImageFileName
                                                                andImage:image
                                                                andFrame:frame];
            animationLayer.myDelegate = self;
            [animationLayer setImage:@"defence"];
            [animationLayer startAnimation:18 repeatCount:2 withReverse:NO withDelegate:YES];
            [image release];
            [defenseImageFileName release];
            player.actionArray = [NSArray arrayWithObject:[NSString stringWithFormat:@"%@ readies defences in preperation of a attack!",player.name]];
        }
            break;
    }
}

-(void)determineAffect
{
    switch (cause) {
        case jetsmall:
        {
            affect = jetfueled;
            player.isJetScrambled = YES;
            player.isMisselReady = NO;
            player.actionArray = [NSArray arrayWithObject:@"A Jet capable of carrying a payload of 50 Mega Tons!"];
            player.currentJetLoadRemaining = 50;
            [player removeJetWithSize:@"small"];
            player.wasLastActionBuild = NO;
            player.isStockPilling = NO;
        }
            break;
        case jetlarge:
        {
            affect = jetfueled;
            player.isJetScrambled = YES;
            player.isMisselReady = NO;
            player.actionArray = [NSArray arrayWithObject:@"A Jet capable of carrying a payload of 100 Mega Tons!"];
            player.currentJetLoadRemaining = 100;
            [player removeJetWithSize:@"large"];
            player.wasLastActionBuild = NO;
            player.isStockPilling = NO;
        }
            break;
        case propaganda:
        {
            // Let say there is a 33% chance propaganda works
            player.isJetScrambled = NO;
            player.isMisselReady = NO;
            if (target.population <= 0)
            {
                affect = none;
                return;
            } else {
                if (arc4random()%3 != 0) {
                    // Sucessfull
                    affect = citizengained;
                    int populationChange = [self calculatePropagandaGainForCity:origin lossForCity:target atRate:50];
                    //    if (actionResultArray != nil) {
                    //        [actionResultArray release];
                    //    }
                    player.actionArray = [NSArray arrayWithObjects:
                                          [NSString stringWithFormat:@"Propaganda Worked!"],
                                          [NSString stringWithFormat:@"Population Gain of %i",populationChange], nil];
                } else {
                    // Failed
                    affect = citizenlost;
                    int populationChange = [self calculatePropagandaGainForCity:target lossForCity:origin atRate:25];
                    //    if (actionResultArray != nil) {
                    //        [actionResultArray release];
                    //    }
                    player.actionArray = [NSArray arrayWithObjects:
                                          [NSString stringWithFormat:@"Propaganda Failed!"],
                                          [NSString stringWithFormat:@"Population Lose of %i",populationChange], nil];
                }
            }
            player.wasLastActionBuild = NO;
            player.isStockPilling = NO;
        }
            break;
        case build:
        {
            affect = built;
            player.isJetScrambled = NO;
            player.isMisselReady = NO;
            // Determine the result of the build
            [self calculateBuild];
            if (player.wasLastActionBuild) {
                player.isStockPilling = YES;
            } else {
                player.isStockPilling = NO;
            }
            player.wasLastActionBuild = YES;
        }
            break;
        case missile10megton:
        {
            affect = missilereadied;
            player.isJetScrambled = NO;
            player.isMisselReady = YES;
            player.currentMisselLoadRemaining = 10;
            player.actionArray = [NSArray arrayWithObject:@"10 Mega Ton missel has been readied on the launch pad!"];
            [player removeMisselWithSize:@"10 Mega Tons"];
            player.wasLastActionBuild = NO;
            player.isStockPilling = NO;
        }
            break;
        case missile20megton:
        {
            affect = missilereadied;
            player.isJetScrambled = NO;
            player.isMisselReady = YES;
            player.currentMisselLoadRemaining = 20;
            player.actionArray = [NSArray arrayWithObject:@"20 Mega Ton missel has been readied on the launch pad!"];
            [player removeMisselWithSize:@"20 Mega Tons"];
            player.wasLastActionBuild = NO;
            player.isStockPilling = NO;
        }
            break;
        case missile50megton:
        {
            affect = missilereadied;
            player.isJetScrambled = NO;
            player.isMisselReady = YES;
            player.currentMisselLoadRemaining = 50;
            player.actionArray = [NSArray arrayWithObject:@"50 Mega Ton missel has been readied on the launch pad!"];
            [player removeMisselWithSize:@"50 Mega Tons"];
            player.wasLastActionBuild = NO;
            player.isStockPilling = NO;
        }
            break;
        case missile100megton:
        {
            affect = missilereadied;
            player.isJetScrambled = NO;
            player.isMisselReady = YES;
            player.currentMisselLoadRemaining = 100;
            player.actionArray = [NSArray arrayWithObject:@"100 Mega Ton missel has been readied on the launch pad!"];
            [player removeMisselWithSize:@"100 Mega Tons"];
            player.wasLastActionBuild = NO;
            player.isStockPilling = NO;
        }
            break;
        case warhead10megton:
        {
            if ((player.isJetScrambled || player.isMisselReady) && opponent.isLargeDefenceDeployed) {
                player.actionArray = [NSArray arrayWithObject:@"Defence have shot your Jet!"];
                [player determinePayloadRemaining:100];
            } else if (player.isMisselReady && opponent.isSmallDefenceDeployed) {
                player.actionArray = [NSArray arrayWithObject:@"Defence have shot your Missel!"];
                [player determinePayloadRemaining:100];
            } else {
                [self calculateBombHitAtRate:10];
                [player determinePayloadRemaining:10];
            }
            player.isMisselReady = NO;
            [player removeWarHeadWithSize:@"10 Mega Tons"];
            player.wasLastActionBuild = NO;
            player.isStockPilling = NO;
        }
            break;
        case warhead20megton:
        {
            if ((player.isJetScrambled || player.isMisselReady) && opponent.isLargeDefenceDeployed) {
                player.actionArray = [NSArray arrayWithObject:@"Defence have shot your Jet!"];
                [player determinePayloadRemaining:100];
            } else if (player.isMisselReady && opponent.isSmallDefenceDeployed) {
                player.actionArray = [NSArray arrayWithObject:@"Defence have shot your Missel!"];
                [player determinePayloadRemaining:100];
            } else {
                [self calculateBombHitAtRate:20];
                [player determinePayloadRemaining:20];
            }
            player.isMisselReady = NO;
            [player removeWarHeadWithSize:@"20 Mega Tons"];
            player.wasLastActionBuild = NO;
            player.isStockPilling = NO;
        }
            break;
        case warhead50megton:
        {
            if ((player.isJetScrambled || player.isMisselReady) && opponent.isLargeDefenceDeployed) {
                player.actionArray = [NSArray arrayWithObject:@"Defence have shot your Jet!"];
                [player determinePayloadRemaining:100];
            } else if (player.isMisselReady && opponent.isSmallDefenceDeployed) {
                player.actionArray = [NSArray arrayWithObject:@"Defence have shot your Missel!"];
                [player determinePayloadRemaining:100];
            } else {
                [self calculateBombHitAtRate:50];
                [player determinePayloadRemaining:50];
            }
            player.isMisselReady = NO;
            [player removeWarHeadWithSize:@"50 Mega Tons"];
            player.wasLastActionBuild = NO;
            player.isStockPilling = NO;
        }
            break;
        case warhead100megton:
        {
            if ((player.isJetScrambled || player.isMisselReady) && opponent.isLargeDefenceDeployed) {
                player.actionArray = [NSArray arrayWithObject:@"Defence have shot your Jet!"];
                [player determinePayloadRemaining:100];
            } else if (player.isMisselReady && opponent.isSmallDefenceDeployed) {
                player.actionArray = [NSArray arrayWithObject:@"Defence have shot your Missel!"];
                [player determinePayloadRemaining:100];
            } else {
                [self calculateBombHitAtRate:100];
                [player determinePayloadRemaining:100];
            }
            player.isMisselReady = NO;
            [player removeWarHeadWithSize:@"100 Mega Tons"];
            player.wasLastActionBuild = NO;
            player.isStockPilling = NO;
        }
            break;
        case defensesmall:
        {
            affect = smalldefensedeployed;
            player.isJetScrambled = NO;
            player.isMisselReady = NO;
            [player removeDefenceWithSize:@"small"];
            player.wasLastActionBuild = NO;
            player.isStockPilling = NO;
        }
            break;
        case defenselarge:
        {
            affect = largedefensedeployed;
            player.isJetScrambled = NO;
            player.isMisselReady = NO;
            [player removeDefenceWithSize:@"large"];
            player.wasLastActionBuild = NO;
            player.isStockPilling = NO;
        }
            break;
    }
}

-(NSArray *)getMovementArray:(CGPoint)startPoint andEndPoint:(CGPoint)endPoint
{
    NSMutableArray *returnArray = [NSMutableArray arrayWithCapacity:60];
    float deltaX = (float)(endPoint.x - startPoint.x)/60;
    float deltaY = (float)(endPoint.y - startPoint.y)/60;
    for (int i=0; i<60; i++) {
        [returnArray insertObject:[NSValue valueWithCGPoint:CGPointMake(startPoint.x + deltaX*i,startPoint.y + deltaY*i)] atIndex:i];
    }
    return returnArray;
}

-(BOOL)showResult
{
    switch (affect) {
        case jetfueled:
            return NO;
            break;
        case jetshotdown:
            break;
        case citizengained:
        {
            NSString *citySelectImageFileName = [[NSString alloc] initWithString:@"Aaron"];
            NSString *imageString = [[NSString alloc] initWithFormat:@"%@",[[NSBundle mainBundle] pathForResource:citySelectImageFileName ofType:@"png"]];
            UIImage *image = [[UIImage alloc] initWithContentsOfFile:imageString];
            [imageString release];
            CGRect frame = CGRectMake([target getX]-55/2,[target getY]-90/2,55,90);
            animationLayer = [[SSImageAnimationLayer alloc] initWithFile:citySelectImageFileName
                                                                andImage:image
                                                                andFrame:frame];
            animationLayer.myDelegate = self;
            [animationLayer setImage:@"Aaron"];
            NSMutableArray *pointArray = [[NSMutableArray alloc] initWithCapacity:90];
            float deltaX = (float)([target getX] - [origin getX])/90;
            float deltaY = (float)([target getY] - [origin getY])/90;
            for (int i=0; i<90; i++) {
                int j = i+1;
                [pointArray insertObject:[NSValue valueWithCGPoint:CGPointMake([target getX]-deltaX*j,[target getY]-deltaY*j)] atIndex:i];
            }
            [animationLayer startAnimation:48 repeatCount:HUGE_VAL withReverse:NO withDelegate:NO];
            [animationLayer startMovementAnimation:pointArray withDelegate:YES];
            [pointArray release];

            // We need to determine what ememy the cizitzens were lost two.
            isShowResult = YES;
            return YES;
        }
            break;
        case citizenlost:
        {
            NSString *citySelectImageFileName = [[NSString alloc] initWithString:@"Aaron"];
            NSString *imageString = [[NSString alloc] initWithFormat:@"%@",[[NSBundle mainBundle] pathForResource:citySelectImageFileName ofType:@"png"]];
            UIImage *image = [[UIImage alloc] initWithContentsOfFile:imageString];
            [imageString release];
            CGRect frame = CGRectMake([origin getX]-55/2,[origin getY]-90/2,55,90);
            animationLayer = [[SSImageAnimationLayer alloc] initWithFile:citySelectImageFileName
                                                                andImage:image
                                                                andFrame:frame];
            animationLayer.myDelegate = self;
            [animationLayer setImage:@"Aaron"];
            NSMutableArray *pointArray = [[NSMutableArray alloc] initWithCapacity:90];
            float deltaX = (float)([origin getX] - [target getX])/90;
            float deltaY = (float)([origin getY] - [target getY])/90;
            for (int i=0; i<90; i++) {
                [pointArray insertObject:[NSValue valueWithCGPoint:CGPointMake([origin getX]-deltaX*i,[origin getY]-deltaY*i)] atIndex:i];
            }
            [animationLayer startAnimation:48 repeatCount:HUGE_VAL withReverse:NO withDelegate:NO];
            [animationLayer startMovementAnimation:pointArray withDelegate:YES];
            [pointArray release];
            isShowResult = YES;
            return YES;
        }
            break;
        case missilereadied:
            return NO;
            break;
        case bombsucess:
        {
            [SoundUtils playExplosionSound];
            NSString *explosionImageFileName = [[NSString alloc] initWithString:@"explosion"];
            NSString *imageString = [[NSString alloc] initWithFormat:@"%@",[[NSBundle mainBundle] pathForResource:explosionImageFileName ofType:@"png"]];
            UIImage *image = [[UIImage alloc] initWithContentsOfFile:imageString];
            [imageString release];
            CGRect frame = CGRectMake([target getX]-50,[target getY]-54,100,107);
            animationLayer = [[SSImageAnimationLayer alloc] initWithFile:explosionImageFileName
                                                                andImage:image
                                                                andFrame:frame];
            animationLayer.myDelegate = self;
            [animationLayer setImage:@"explosion"];
            [animationLayer startAnimation:28 repeatCount:1 withReverse:NO withDelegate:YES];
            [image release];
            [explosionImageFileName release];
            isShowResult = YES;
            return YES;
        }
            break;
        case bombfailed:
        case smalldefensedeployed:
        case largedefensedeployed:
        case built:
        case none:
            return NO;
            break;
    }
    return NO;
}

// This will contain all the information for all the actions
-(id)initActionWithCause:(Cause)i_cause Payload:(Payload)i_playload Target:(City *)i_target Origin:(City *)i_origin Player:(Player *)i_player Opponent:(Player *)i_opponent
{
    if (self = [super init]) {
        cause = i_cause;
        payload = i_playload;
        m_population = i_origin.population;
        t_population = i_target.population;
        target = [i_target retain];
        origin = [i_origin retain];
        player = [i_player retain];
        opponent = [i_opponent retain];
        if (cause == defensesmall) {
            player.isSmallDefenceDeployed = YES;
        } else {
            player.isSmallDefenceDeployed = NO;
        }
        if (cause == defenselarge) {
            player.isLargeDefenceDeployed = YES;
        } else {
            player.isLargeDefenceDeployed = NO;
        }
        isFinalAction = NO;
    }
    return self;
}

-(void)dealloc
{
    [target release]; target = nil;
    [origin release]; origin = nil;
    [player release]; player = nil;
    [opponent release]; opponent = nil;
    delegate = nil;
    [super dealloc];
}

@end
