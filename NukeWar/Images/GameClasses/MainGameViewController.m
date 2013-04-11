//
//  MainGameViewController.m
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-16.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainGameViewController.h"

@interface MainGameViewController (PrivateMethods)
-(void)showCommandCenter;
-(void)showCommandCenterFromTimer:(NSTimer *)_timer;
-(void)updateCommandCenter;
-(void)closeCommandCenter;
-(void)setCommandCenterText:(CommandStrings)commandString;
-(City *)getSmallestCity;
-(void)determineActionsAndResultsWithCause:(Cause)cause andPayload:(Payload)payload;
@end

@implementation MainGameViewController

@synthesize myMapScreen;
@synthesize myCommandCenter;
@synthesize delegate;
@synthesize myPushNotification;

#pragma mark - Touches captured on the main view controller
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (isCommandCenterActive) {
        if (isTargetActive) {
            [myMapScreen removeTarget];
            isTargetActive = NO;
            targetCity = nil;
        }
        UITouch *touch = [[event allTouches] anyObject];
        CGPoint touchPoint = [touch locationInView:myMapScreen];
        if (CGRectContainsPoint(myMapScreen.enemy1City1.cityImage.frame, touchPoint) && myMapScreen.enemy1City1.population != 0) {
            [myMapScreen addTargetAtFrame:CGRectMake(myMapScreen.enemy1City1.cityImage.frame.origin.x - 5,
                                                     myMapScreen.enemy1City1.cityImage.frame.origin.y - 5,
                                                     55, 55)];
            isTargetActive = YES;
            targetCity = myMapScreen.enemy1City1;
        } else if (CGRectContainsPoint(myMapScreen.enemy1City2.cityImage.frame, touchPoint) && myMapScreen.enemy1City2.population != 0) {
            [myMapScreen addTargetAtFrame:CGRectMake(myMapScreen.enemy1City2.cityImage.frame.origin.x - 5,
                                                     myMapScreen.enemy1City2.cityImage.frame.origin.y - 5,
                                                     55, 55)];
            isTargetActive = YES;
            targetCity = myMapScreen.enemy1City2;
        } else if (CGRectContainsPoint(myMapScreen.enemy1City3.cityImage.frame, touchPoint) && myMapScreen.enemy1City3.population != 0) {
            [myMapScreen addTargetAtFrame:CGRectMake(myMapScreen.enemy1City3.cityImage.frame.origin.x - 5,
                                                     myMapScreen.enemy1City3.cityImage.frame.origin.y - 5,
                                                     55, 55)];
            isTargetActive = YES;
            targetCity = myMapScreen.enemy1City3;
        } else if (CGRectContainsPoint(myMapScreen.enemy1City4.cityImage.frame, touchPoint) && myMapScreen.enemy1City4.population != 0) {
            [myMapScreen addTargetAtFrame:CGRectMake(myMapScreen.enemy1City4.cityImage.frame.origin.x - 5,
                                                     myMapScreen.enemy1City4.cityImage.frame.origin.y - 5,
                                                     55, 55)];
            isTargetActive = YES;
            targetCity = myMapScreen.enemy1City4;
        } else if (CGRectContainsPoint(myMapScreen.enemy1City5.cityImage.frame, touchPoint) && myMapScreen.enemy1City5.population != 0) {
            [myMapScreen addTargetAtFrame:CGRectMake(myMapScreen.enemy1City5.cityImage.frame.origin.x - 5,
                                                     myMapScreen.enemy1City5.cityImage.frame.origin.y - 5,
                                                     55, 55)];
            isTargetActive = YES;
            targetCity = myMapScreen.enemy1City5;
        } else if (CGRectContainsPoint(myMapScreen.enemy2City1.cityImage.frame, touchPoint) && myMapScreen.enemy2City1.population != 0) {
            [myMapScreen addTargetAtFrame:CGRectMake(myMapScreen.enemy2City1.cityImage.frame.origin.x - 5,
                                                     myMapScreen.enemy2City1.cityImage.frame.origin.y - 5,
                                                     55, 55)];
            isTargetActive = YES;
            targetCity = myMapScreen.enemy2City1;
        } else if (CGRectContainsPoint(myMapScreen.enemy2City2.cityImage.frame, touchPoint) && myMapScreen.enemy2City2.population != 0) {
            [myMapScreen addTargetAtFrame:CGRectMake(myMapScreen.enemy2City2.cityImage.frame.origin.x - 5,
                                                     myMapScreen.enemy2City2.cityImage.frame.origin.y - 5,
                                                     55, 55)];
            isTargetActive = YES;
            targetCity = myMapScreen.enemy2City2;
        } else if (CGRectContainsPoint(myMapScreen.enemy2City3.cityImage.frame, touchPoint) && myMapScreen.enemy2City3.population != 0) {
            [myMapScreen addTargetAtFrame:CGRectMake(myMapScreen.enemy2City3.cityImage.frame.origin.x - 5,
                                                     myMapScreen.enemy2City3.cityImage.frame.origin.y - 5,
                                                     55, 55)];
            isTargetActive = YES;
            targetCity = myMapScreen.enemy2City3;
        } else if (CGRectContainsPoint(myMapScreen.enemy2City4.cityImage.frame, touchPoint) && myMapScreen.enemy2City4.population != 0) {
            [myMapScreen addTargetAtFrame:CGRectMake(myMapScreen.enemy2City4.cityImage.frame.origin.x - 5,
                                                     myMapScreen.enemy2City4.cityImage.frame.origin.y - 5,
                                                     55, 55)];
            isTargetActive = YES;
            targetCity = myMapScreen.enemy2City4;
        } else if (CGRectContainsPoint(myMapScreen.enemy2City5.cityImage.frame, touchPoint) && myMapScreen.enemy2City5.population != 0) {
            [myMapScreen addTargetAtFrame:CGRectMake(myMapScreen.enemy2City5.cityImage.frame.origin.x - 5,
                                                     myMapScreen.enemy2City5.cityImage.frame.origin.y - 5,
                                                     55, 55)];
            isTargetActive = YES;
            targetCity = myMapScreen.enemy2City5;
        } else if (CGRectContainsPoint(myMapScreen.enemy3City1.cityImage.frame, touchPoint) && myMapScreen.enemy3City1.population != 0) {
            [myMapScreen addTargetAtFrame:CGRectMake(myMapScreen.enemy3City1.cityImage.frame.origin.x - 5,
                                                     myMapScreen.enemy3City1.cityImage.frame.origin.y - 5,
                                                     55, 55)];
            isTargetActive = YES;
            targetCity = myMapScreen.enemy3City1;
        } else if (CGRectContainsPoint(myMapScreen.enemy3City2.cityImage.frame, touchPoint) && myMapScreen.enemy3City2.population != 0) {
            [myMapScreen addTargetAtFrame:CGRectMake(myMapScreen.enemy3City2.cityImage.frame.origin.x - 5,
                                                     myMapScreen.enemy3City2.cityImage.frame.origin.y - 5,
                                                     55, 55)];
            isTargetActive = YES;
            targetCity = myMapScreen.enemy3City2;
        } else if (CGRectContainsPoint(myMapScreen.enemy3City3.cityImage.frame, touchPoint) && myMapScreen.enemy3City3.population != 0) {
            [myMapScreen addTargetAtFrame:CGRectMake(myMapScreen.enemy3City3.cityImage.frame.origin.x - 5,
                                                     myMapScreen.enemy3City3.cityImage.frame.origin.y - 5,
                                                     55, 55)];
            isTargetActive = YES;
            targetCity = myMapScreen.enemy3City3;
        } else if (CGRectContainsPoint(myMapScreen.enemy3City4.cityImage.frame, touchPoint) && myMapScreen.enemy3City4.population != 0) {
            [myMapScreen addTargetAtFrame:CGRectMake(myMapScreen.enemy3City4.cityImage.frame.origin.x - 5,
                                                     myMapScreen.enemy3City4.cityImage.frame.origin.y - 5,
                                                     55, 55)];
            isTargetActive = YES;
            targetCity = myMapScreen.enemy3City4;
        } else if (CGRectContainsPoint(myMapScreen.enemy3City5.cityImage.frame, touchPoint) && myMapScreen.enemy3City5.population != 0) {
            [myMapScreen addTargetAtFrame:CGRectMake(myMapScreen.enemy3City5.cityImage.frame.origin.x - 5,
                                                     myMapScreen.enemy3City5.cityImage.frame.origin.y - 5,
                                                     55, 55)];
            isTargetActive = YES;
            targetCity = myMapScreen.enemy3City5;
        } else if (CGRectContainsPoint(myMapScreen.enemy4City1.cityImage.frame, touchPoint) && myMapScreen.enemy4City1.population != 0) {
            [myMapScreen addTargetAtFrame:CGRectMake(myMapScreen.enemy4City1.cityImage.frame.origin.x - 5,
                                                     myMapScreen.enemy4City1.cityImage.frame.origin.y - 5,
                                                     55, 55)];
            isTargetActive = YES;
            targetCity = myMapScreen.enemy4City1;
        } else if (CGRectContainsPoint(myMapScreen.enemy4City2.cityImage.frame, touchPoint) && myMapScreen.enemy4City2.population != 0) {
            [myMapScreen addTargetAtFrame:CGRectMake(myMapScreen.enemy4City2.cityImage.frame.origin.x - 5,
                                                     myMapScreen.enemy4City2.cityImage.frame.origin.y - 5,
                                                     55, 55)];
            isTargetActive = YES;
            targetCity = myMapScreen.enemy4City2;
        } else if (CGRectContainsPoint(myMapScreen.enemy4City3.cityImage.frame, touchPoint) && myMapScreen.enemy4City3.population != 0) {
            [myMapScreen addTargetAtFrame:CGRectMake(myMapScreen.enemy4City3.cityImage.frame.origin.x - 5,
                                                     myMapScreen.enemy4City3.cityImage.frame.origin.y - 5,
                                                     55, 55)];
            isTargetActive = YES;
            targetCity = myMapScreen.enemy4City3;
        } else if (CGRectContainsPoint(myMapScreen.enemy4City4.cityImage.frame, touchPoint) && myMapScreen.enemy4City4.population != 0) {
            [myMapScreen addTargetAtFrame:CGRectMake(myMapScreen.enemy4City4.cityImage.frame.origin.x - 5,
                                                     myMapScreen.enemy4City4.cityImage.frame.origin.y - 5,
                                                     55, 55)];
            isTargetActive = YES;
            targetCity = myMapScreen.enemy4City4;
        } else if (CGRectContainsPoint(myMapScreen.enemy4City5.cityImage.frame, touchPoint) && myMapScreen.enemy4City5.population != 0) {
            [myMapScreen addTargetAtFrame:CGRectMake(myMapScreen.enemy4City5.cityImage.frame.origin.x - 5,
                                                     myMapScreen.enemy4City5.cityImage.frame.origin.y - 5,
                                                     55, 55)];
            isTargetActive = YES;
            targetCity = myMapScreen.enemy4City5;
        }
    }
}

#pragma mark - Command Center delegate
-(void)enemyButtonPressed:(int)enemy
{
    if (isTargetActive) {
        [myMapScreen removeTarget];
        isTargetActive = NO;
    }
    switch (enemy) {
        case 1:
            currentOpponent = [opponents objectAtIndex:0];
            if (currentOpponent.isAlive)
                myMapScreen.frame = CGRectMake(336, 180, myMapScreen.frame.size.width, myMapScreen.frame.size.height);
            break;
        case 2:
            currentOpponent = [opponents objectAtIndex:1];
            if (currentOpponent.isAlive)
            myMapScreen.frame = CGRectMake(-315, 180, myMapScreen.frame.size.width, myMapScreen.frame.size.height);
            break;
        case 3:
            currentOpponent = [opponents objectAtIndex:2];
            if (currentOpponent.isAlive)
                myMapScreen.frame = CGRectMake(336, -190, myMapScreen.frame.size.width, myMapScreen.frame.size.height);
            break;
        case 4:
            currentOpponent = [opponents objectAtIndex:3];
            if (currentOpponent.isAlive)
                myMapScreen.frame = CGRectMake(-325, -202, myMapScreen.frame.size.width, myMapScreen.frame.size.height);
            break;
        default:
            break;
    }
}

/*
-(City *)getSmallestCity
{
    City *returnCity = myMapScreen.city1;
    if (returnCity.population < myMapScreen.city2.population) {
        returnCity = myMapScreen.city2;
    }
    if (returnCity.population < myMapScreen.city3.population) {
        returnCity = myMapScreen.city3;
    }
    if (returnCity.population < myMapScreen.city4.population) {
        returnCity = myMapScreen.city4;
    }
    if (returnCity.population < myMapScreen.city5.population) {
        returnCity = myMapScreen.city5;
    }
    return returnCity;
}
*/

-(Action *)determineAction:(Player *)t_player
{
    Cause cause = build; Payload payload = zero;
    int warheadSize = 0;
    if (t_player.isJetScrambled) {
        warheadSize = [t_player getLargestWarHead:t_player.currentJetLoadRemaining];
    } else if (t_player.isMisselReady) {
        warheadSize = [t_player getLargestWarHead:t_player.currentMisselLoadRemaining];
    } else {
        warheadSize = [t_player getAction];
    }
    
    switch (warheadSize) {
        case 0:
            cause = build;
            payload = zero;
            break;
        case 1:
            cause = propaganda;
            payload = zero;
            break;
        case 2:
            cause = defensesmall;
            payload = zero;
            break;
        case 3:
            cause = defenselarge;
            payload = zero;
            break;
        case 4:
            cause = jetsmall;
            payload = zero;
            break;
        case 5:
            cause = jetlarge;
            payload = zero;
            break;
        case 6:
            cause = missile10megton;
            payload = ten;
            break;
        case 7:
            cause = missile20megton;
            payload = twenty;
            break;
        case 8:
            cause = missile50megton;
            payload = fifty;
            break;
        case 9:
            cause = missile100megton;
            payload = hundred;
            break;
        case 10:
            cause = warhead10megton;
            payload = ten;
            break;
        case 20:
            cause = warhead20megton;
            payload = twenty;
            break;
        case 50:
            cause = warhead50megton;
            payload = fifty;
            break;
        case 100:
            cause = warhead100megton;
            payload = hundred;
            break;
    }
    Player *opponent = [self getPlayerFromName:[t_player getWorstRelationShip]];
    City *myTargetCity = nil;
    if (cause == propaganda) {
        myTargetCity = [myMapScreen getLargestCityForQuadrant:opponent.location];
    } else {
        switch (payload) {
            case twenty:
            case fifty:
                myTargetCity = [myMapScreen getRandomCityForQuadrant:opponent.location];
                break;
            case hundred:
                myTargetCity = [myMapScreen getLargestCityForQuadrant:opponent.location];
                break;
            case zero:
            case ten:
            default:
                myTargetCity = [myMapScreen getSmallestCityForQuadrant:opponent.location];
                break;
        }
    }
    Action *returnAction = [[Action alloc] initActionWithCause:cause Payload:payload Target:myTargetCity Origin:[myMapScreen getSmallestCityForQuadrant:t_player.location] Player:t_player Opponent:opponent];
    if (t_player.wasLastActionBuild && returnAction.cause == build) {
        t_player.isStockPilling = YES;
    }
    return [returnAction autorelease];
}

-(Player *)getPlayerFromName:(NSString *)s_playerName
{
    Player *returnPlayer = nil;
    if ([s_playerName isEqualToString:@"you"])
    {
        returnPlayer = player;
    } else {
        for (int i=0; i<[opponents count]; i++) {
            Player *tempPlayer = (Player *)[opponents objectAtIndex:i];
            if ([tempPlayer.type isEqualToString:s_playerName]) {
                returnPlayer = tempPlayer;
                break;
            }
        }
    }
    return returnPlayer;
}

-(void)determineActionsAndResultsWithCause:(Cause)cause andPayload:(Payload)payload
{
    NSMutableArray *actions = [[NSMutableArray alloc] initWithCapacity:5];
    // Determine the actions for for each player

    // Set your action
    if (player.isAlive) {
        Action *myAction = [[Action alloc] initActionWithCause:cause Payload:payload Target:targetCity Origin:[myMapScreen getSmallestCityForQuadrant:5] Player:player Opponent:currentOpponent];
        [actions addObject:myAction];
        [myAction release];
    }
    
    // What we need to do here is the actions for the other players
    for (int i=0; i<[opponents count]; i++) {
        Player *myOpponent = [opponents objectAtIndex:i];
        if (myOpponent.isAlive) {
            [actions addObject:[self determineAction:[opponents objectAtIndex:i]]];
        }
    }
    // End of the above work
    playerActions = [[NSMutableArray alloc] initWithArray:actions];
    [actions release];
    
    // Shufle the player actions here
    
    if (isTargetActive) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [myMapScreen removeTarget];
        });
        isTargetActive = NO;
    }

    dispatch_async(dispatch_get_main_queue(), ^{
        [self closeCommandCenter];
    });
    dispatch_async(dispatch_get_main_queue(), ^{
        [self executeNextPlayerActions];
    });
}

-(void)ActionAnimationCompleted:(NSObject *)action
{
    [(Action*)action determineAffect];
    if ([(Action*)action showResult]) {
        [self.view.layer addSublayer:((Action*)action).animationLayer];
        [UIView animateWithDuration:0.4 animations:^{
            myPushNotification.frame = CGRectMake(0,-50,1024,50);
        } completion:^(BOOL finished) {
            myPushNotification.mainLabel.text = [((Action *)action).player actionArrayToString];
            [UIView animateWithDuration:0.4 animations:^{
                myPushNotification.frame = CGRectMake(0,0,1024,50);
            }];
        }];
    } else {
        [self performSelector:@selector(executeNextPlayerActions) withObject:nil afterDelay:0.5];
        [UIView animateWithDuration:0.4 animations:^{
            myPushNotification.frame = CGRectMake(0,-50,1024,50);
        }];
    }
}

-(void)ActionResultAnimationCompleted
{
    [myMapScreen updateCities];
    [self performSelector:@selector(executeNextPlayerActions) withObject:nil afterDelay:0.5];
    [UIView animateWithDuration:0.4 animations:^{
        myPushNotification.frame = CGRectMake(0,-50,1024,50);
    }];
}

-(Player *)getRandomOpponent:(NSString *)s_playerName
{
    NSMutableArray *randomPlayers = [NSMutableArray arrayWithCapacity:5];
    if (![s_playerName isEqualToString:@"you"] && player.isAlive) {
        [randomPlayers addObject:player];
    }
    for (int i=0; i<[opponents count]; i++) {
        Player *tempPlayer = [opponents objectAtIndex:i];
        if (![tempPlayer.type isEqualToString:playerName] && tempPlayer.isAlive) {
            [randomPlayers addObject:[opponents objectAtIndex:i]];
        }
        [tempPlayer release];
    }
    return [randomPlayers objectAtIndex:arc4random()%randomPlayers.count];
}

-(void)emptyAllMissels:(Player *)input_player
{
    // Need to loop through all the remaining missels.
    NSMutableArray *tempWarHeads = [[NSMutableArray alloc] initWithArray:input_player.warHeads copyItems:YES];
    NSMutableArray *tempMissiles = [[NSMutableArray alloc] initWithArray:input_player.missels copyItems:YES];
    NSArray *warHeadCounter = [[NSArray alloc] initWithObjects:@"100 Mega Tons",@"50 Mega Tons",@"20 Mega Tons",@"10 Mega Tons",nil];
    NSArray *missileCounter = [[NSArray alloc] initWithObjects:@"100 Mega Tons",@"50 Mega Tons",@"20 Mega Tons",@"10 Mega Tons",nil];
    for (int i=0; i<missileCounter.count; i++) {
        Missel *missile = [[Missel alloc] initWithName:[missileCounter objectAtIndex:i]];
        for (int j=i; j<warHeadCounter.count; j++) {
            WarHead *warHead = [[WarHead alloc] initWithName:[warHeadCounter objectAtIndex:j]];
            while ([tempMissiles containsObject:missile]) {
                if ([tempWarHeads containsObject:warHead]) {
                    Cause cause = missile10megton;
                    switch (i) {
                        case 0:
                            cause = warhead100megton;
                            break;
                        case 1:
                            cause = warhead50megton;
                            break;
                        case 2:
                            cause = warhead20megton;
                            break;
                        case 3:
                            cause = warhead10megton;
                            break;
                        default:
                            cause = warhead10megton;
                            break;
                    }
                    Payload payload = zero;
                    switch (j) {
                        case 0:
                            payload = hundred;
                            break;
                        case 1:
                            payload = fifty;
                            break;
                        case 2:
                            payload = twenty;
                            break;
                        case 3:
                            payload = ten;
                            break;
                        default:
                            payload = zero;
                            break;
                    }
                    Player *randOpp = [self getRandomOpponent:input_player.type];
                    Action *returnAction = [[Action alloc] initActionWithCause:cause
                                                                       Payload:payload
                                                                        Target:[myMapScreen getRandomCityForQuadrant:randOpp.location]
                                                                        Origin:[myMapScreen getRandomCityForQuadrant:input_player.location]
                                                                        Player:input_player
                                                                      Opponent:randOpp];
                    returnAction.isFinalAction = YES;
                    [playerActions addObject:returnAction];
                    [tempWarHeads removeObjectAtIndex:[tempWarHeads indexOfObject:warHead]];
                }
                [tempMissiles removeObjectAtIndex:[tempMissiles indexOfObject:missile]];
            }
            [warHead release];
        }
        [missile release];
    }
    [warHeadCounter release];
    [missileCounter release];
    [tempMissiles release];
    [tempWarHeads release];
}

-(void)executeNextPlayerActions
{
    if ([playerActions count] > 0) {
        Action *thisAction = [(Action *)[playerActions objectAtIndex:([playerActions count] - 1)] retain];
        [playerActions removeLastObject];
        if ([self isPlayerDead:thisAction.player.type] && !thisAction.isFinalAction) {
            [self executeNextPlayerActions];
        } else {
            thisAction.delegate = self;
            [thisAction showAction];
            [self.view.layer addSublayer:thisAction.animationLayer];
            myPushNotification.mainLabel.text = [thisAction.player actionArrayToString];
            myPushNotification.hidden = NO;
            [UIView animateWithDuration:0.4 animations:^{
                myPushNotification.frame = CGRectMake(0,0,1024,50);
            }];
        }
    } else {
        if ([self isGameOver]) {
            [delegate gameOver:playerName withScore:finalScore];
        } else if ([playerActions count] > 0) {
            Action *thisAction = [(Action *)[playerActions objectAtIndex:([playerActions count] - 1)] retain];
            [playerActions removeLastObject];
            thisAction.delegate = self;
            [thisAction showAction];
            [self.view.layer addSublayer:thisAction.animationLayer];
            myPushNotification.mainLabel.text = [thisAction.player actionArrayToString];
            myPushNotification.hidden = NO;
            [UIView animateWithDuration:0.4 animations:^{
                myPushNotification.frame = CGRectMake(0,0,1024,50);
            }];
        } else {
            if (player.isStockPilling && player.isAlive) {
                for (int i=0; i<[opponents count]; i++) {
                    [(Player *)[opponents objectAtIndex:i] decreaseRelationToPlayerToZero:player.type];
                }
            }
            for (int i=0; i<[opponents count]; i++) {
                Player *opponent = [opponents objectAtIndex:i];
                if (opponent.isStockPilling && opponent.isAlive) {
                    [player decreaseRelationToPlayer:opponent.type];
                    for (int j=0; j<[opponents count]; j++) {
                        if ([[opponents objectAtIndex:j] equals:opponent]) {
                            [(Player *)[opponents objectAtIndex:i] decreaseRelationToPlayerToZero:opponent.type];
                        }
                    }
                }
            }
            if (player.isAlive) {
                [self updateCommandCenter];
                [self showCommandCenter];
                isCommandCenterActive = YES;
            } else
                [self determineActionsAndResultsWithCause:missile10megton andPayload:zero];
        }
    }
}

-(void)removePlayer:(NSString *)i_player
{
    [player removePlayerFromRelationships:i_player];
    for (int i=0; i<[opponents count]; i++) {
        Player *temp = [opponents objectAtIndex:i];
        [temp removePlayerFromRelationships:i_player];
    }
}

-(BOOL)isPlayerDead:(NSString *)p_type
{
    if ([p_type isEqualToString:@"you"]) {
        if (myMapScreen.city1.isCityDestroyed &&
            myMapScreen.city2.isCityDestroyed &&
            myMapScreen.city3.isCityDestroyed &&
            myMapScreen.city4.isCityDestroyed &&
            myMapScreen.city5.isCityDestroyed) return YES;
    } else if ([p_type isEqualToString:@"enemy1"]) {
        if (myMapScreen.enemy1City1.isCityDestroyed &&
            myMapScreen.enemy1City2.isCityDestroyed &&
            myMapScreen.enemy1City3.isCityDestroyed &&
            myMapScreen.enemy1City4.isCityDestroyed &&
            myMapScreen.enemy1City5.isCityDestroyed) return YES;
    } else if ([p_type isEqualToString:@"enemy2"]) {
        if (myMapScreen.enemy2City1.isCityDestroyed &&
            myMapScreen.enemy2City2.isCityDestroyed &&
            myMapScreen.enemy2City3.isCityDestroyed &&
            myMapScreen.enemy2City4.isCityDestroyed &&
            myMapScreen.enemy2City5.isCityDestroyed) return YES;
    } else if ([p_type isEqualToString:@"enemy3"]) {
        if (myMapScreen.enemy3City1.isCityDestroyed &&
            myMapScreen.enemy3City2.isCityDestroyed &&
            myMapScreen.enemy3City3.isCityDestroyed &&
            myMapScreen.enemy3City4.isCityDestroyed &&
            myMapScreen.enemy3City5.isCityDestroyed) return YES;
    } else if ([p_type isEqualToString:@"enemy4"]) {
        if (myMapScreen.enemy4City1.isCityDestroyed &&
            myMapScreen.enemy4City2.isCityDestroyed &&
            myMapScreen.enemy4City3.isCityDestroyed &&
            myMapScreen.enemy4City4.isCityDestroyed &&
            myMapScreen.enemy4City5.isCityDestroyed) return YES;
    }
    return NO;
}
-(BOOL)isGameOver
{
    int deadPlayerCount = 0;
    if ([self isPlayerDead:player.type]) {
        if (player.isAlive) {
            player.isAlive = NO;
            [self emptyAllMissels:player];
            [self removePlayer:player.type];
        }
        deadPlayerCount++;
    }
    if ([self isPlayerDead:((Player *)[opponents objectAtIndex:0]).type]) {
        Player *opponent = [opponents objectAtIndex:0];
        if (opponent.isAlive) {
            opponent.isAlive = NO;
            [self emptyAllMissels:opponent];
            [self removePlayer:opponent.type];
        }
        deadPlayerCount++;
    }
    if ([self isPlayerDead:((Player *)[opponents objectAtIndex:1]).type]) {
        Player *opponent = [opponents objectAtIndex:1];
        if (opponent.isAlive) {
            opponent.isAlive = NO;
            [self emptyAllMissels:opponent];
            [self removePlayer:opponent.type];
        }
        deadPlayerCount++;
    }
    if ([self isPlayerDead:((Player *)[opponents objectAtIndex:2]).type]) {
        Player *opponent = [opponents objectAtIndex:2];
        if (opponent.isAlive) {
            opponent.isAlive = NO;
            [self emptyAllMissels:opponent];
            [self removePlayer:opponent.type];
        }
        deadPlayerCount++;
    }
    if ([self isPlayerDead:((Player *)[opponents objectAtIndex:3]).type]) {
        Player *opponent = [opponents objectAtIndex:3];
        if (opponent.isAlive) {
            opponent.isAlive = NO;
            [self emptyAllMissels:opponent];
            [self removePlayer:opponent.type];
        }
        deadPlayerCount++;
    }
    if (deadPlayerCount >= 4) {
        if (player.isAlive) {
            playerName = player.type;
            finalScore = myMapScreen.city1.population + myMapScreen.city2.population + myMapScreen.city3.population + myMapScreen.city4.population + myMapScreen.city5.population;
        } else if (((Player *)[opponents objectAtIndex:0]).isAlive) {
            playerName = ((Player *)[opponents objectAtIndex:0]).type;
            finalScore = myMapScreen.enemy1City1.population + myMapScreen.enemy1City2.population + myMapScreen.enemy1City3.population + myMapScreen.enemy1City4.population + myMapScreen.enemy1City5.population;
        } else if (((Player *)[opponents objectAtIndex:1]).isAlive) {
            playerName = ((Player *)[opponents objectAtIndex:1]).type;
            finalScore = myMapScreen.enemy2City1.population + myMapScreen.enemy2City2.population + myMapScreen.enemy2City3.population + myMapScreen.enemy2City4.population + myMapScreen.enemy2City5.population;
        } else if (((Player *)[opponents objectAtIndex:2]).isAlive) {
            playerName = ((Player *)[opponents objectAtIndex:2]).type;
            finalScore = myMapScreen.enemy3City1.population + myMapScreen.enemy3City2.population + myMapScreen.enemy3City3.population + myMapScreen.enemy3City4.population + myMapScreen.enemy3City5.population;
        } else if (((Player *)[opponents objectAtIndex:3]).isAlive) {
            playerName = ((Player *)[opponents objectAtIndex:3]).type;
            finalScore = myMapScreen.enemy4City1.population + myMapScreen.enemy4City2.population + myMapScreen.enemy4City3.population + myMapScreen.enemy4City4.population + myMapScreen.enemy4City5.population;
        }
        return YES;
    }
    return NO;
}

-(void)closeCommandCenter
{
    myMapScreen.frame = CGRectMake(0, 0, myMapScreen.frame.size.width, myMapScreen.frame.size.height);
    [myCommandCenter removeFromSuperview];
    isCommandCenterActive = NO;
}

-(void)setCommandCenterText:(CommandStrings)commandString
{
    dispatch_async(dispatch_get_main_queue(), ^{
        myCommandCenter.commandCenterTextView.text = [NSString stringWithString:[CommandCenterText getCommandString:commandString]];
    });
}

-(void)nukeWarButtonPressed
{
    if (myCommandCenter.propagandaButton.selected) {
        if (isTargetActive) {
            [self determineActionsAndResultsWithCause:propaganda andPayload:zero];
        } else {
            [self setCommandCenterText:selecttarget];
        }
    } else if (myCommandCenter.warhead10MegTonButton.selected) {
        if (isTargetActive) {
            [self determineActionsAndResultsWithCause:warhead10megton andPayload:ten];
        } else {
            [self setCommandCenterText:selecttarget];
        }
    } else if (myCommandCenter.warhead20MegTonButton.selected) {
        if (isTargetActive) {
            [self determineActionsAndResultsWithCause:warhead20megton andPayload:twenty];
        } else {
            [self setCommandCenterText:selecttarget];
        }
    } else if (myCommandCenter.warhead50MegTonButton.selected) {
        if (isTargetActive) {
            [self determineActionsAndResultsWithCause:warhead50megton andPayload:fifty];
        } else {
            [self setCommandCenterText:selecttarget];
        }
    } else if (myCommandCenter.warhead100MegTonButton.selected) {
        if (isTargetActive) {
            [self determineActionsAndResultsWithCause:warhead100megton andPayload:hundred];
        } else {
            [self setCommandCenterText:selecttarget];
        }
    } else if (myCommandCenter.buildButton.selected) {
        [self determineActionsAndResultsWithCause:build andPayload:zero];
    } else if (myCommandCenter.missile10MegTonButton.selected) {
        [self determineActionsAndResultsWithCause:missile10megton andPayload:ten];
    } else if (myCommandCenter.missile20MegTonButton.selected) {
        [self determineActionsAndResultsWithCause:missile20megton andPayload:twenty];
    } else if (myCommandCenter.missile50MegTonButton.selected) {
        [self determineActionsAndResultsWithCause:missile50megton andPayload:fifty];
    } else if (myCommandCenter.missile100MegTonButton.selected) {
        [self determineActionsAndResultsWithCause:missile100megton andPayload:hundred];
    } else if (myCommandCenter.jetSmallButton.selected) {
        [self determineActionsAndResultsWithCause:jetsmall andPayload:zero];
    } else if (myCommandCenter.jetLargeButton.selected) {
        [self determineActionsAndResultsWithCause:jetlarge andPayload:zero];
    } else if (myCommandCenter.defenseSmallButton.selected) {
        [self determineActionsAndResultsWithCause:defensesmall andPayload:zero];
    } else if (myCommandCenter.defenseLargeButton.selected) {
        [self determineActionsAndResultsWithCause:defenselarge andPayload:zero];
    }
}

#pragma mark - MainGameViewController private methods
-(void)showCommandCenter
{
    [self.view addSubview:myCommandCenter];
    myMapScreen.frame = CGRectMake(0, -30, myMapScreen.frame.size.width, myMapScreen.frame.size.height);
    isCommandCenterActive = YES;
}

-(void)showCommandCenterFromTimer:(NSTimer *)_timer
{
    [_timer invalidate];
    [self showCommandCenter];
    myCommandCenter.commandCenterTextView.text = @"Welcome to Nuke War!\nPlease select an action.";
}

-(void)updateCommandCenter
{
    [myCommandCenter resetAllButtons];
    // TODO: This is where we need to determine what is avaible to the user
    // Determine from the user which actions are avaiable
    NSMutableString *textString = [[NSMutableString alloc] initWithCapacity:0];
    for (int i=0; i<[player.actionArray count]; i++) {
        [textString appendString:[player.actionArray objectAtIndex:i]];
        [textString appendString:@"\n"];
    }
    myCommandCenter.commandCenterTextView.text = textString;
    [textString release];
    for (int i=0; i<[player.missels count]; i++) {
        switch ([[player.missels objectAtIndex:i] getCapacity]) {
            case 10:
                myCommandCenter.missile10MegTonImage.selected = YES;
                break;
            case 20:
                myCommandCenter.missile20MegTonImage.selected = YES;
                break;
            case 50:
                myCommandCenter.missile50MegTonImage.selected = YES;
                break;
            case 100:
                myCommandCenter.missile100MegTonImage.selected = YES;
                break;
        }
    }
    for (int i=0; i<[player.warHeads count]; i++) {
        switch ([[player.warHeads objectAtIndex:i] getCapacity]) {
            case 10:
                myCommandCenter.warhead10MegTonImage.selected = YES;
                break;
            case 20:
                myCommandCenter.warhead20MegTonImage.selected = YES;
                break;
            case 50:
                myCommandCenter.warhead50MegTonImage.selected = YES;
                break;
            case 100:
                myCommandCenter.warhead100MegTonImage.selected = YES;
                break;
        }
    }
    for (int i=0; i<[player.jets count]; i++) {
        switch ([[player.jets objectAtIndex:i] getCapacity]) {
            case 1:
                myCommandCenter.jetSmallImage.selected = YES;
                break;
            case 2:
                myCommandCenter.jetLargeImage.selected = YES;
                break;
        }
    }
    for (int i=0; i<[player.defences count]; i++) {
        switch ([[player.defences objectAtIndex:i] getCapacity]) {
            case 1:
                myCommandCenter.defenseSmallImage.selected = YES;
                break;
            case 2:
                myCommandCenter.defenseLargeImage.selected = YES;
                break;
        }
    }
    [myCommandCenter update];
}

#pragma mark - MainGameViewController pre made methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)setPlayers:(NSArray *)_opponents
{
    opponents = [[NSArray alloc] initWithArray:_opponents];
    player = [[Player alloc] initWithFile:nil andImage:nil andFrame:CGRectMake(0, 0, 0, 0) ofType:@"you"];
    player.name = @"You";
    player.location = 5;
    [player addMisselWithSize:@"10 Mega Tons"];
    [player addWarHeadWithSize:@"10 Mega Tons"];
    NSArray *keyArray = [[NSArray alloc] initWithObjects:((Player *)[opponents objectAtIndex:0]).type,((Player *)[opponents objectAtIndex:1]).type,((Player *)[opponents objectAtIndex:2]).type,((Player *)[opponents objectAtIndex:3]).type,nil];

    currentOpponent = nil;
    
    // Set relationships for players
    NSString *faceImageFN = [[NSString alloc] initWithString:@"facesSheet"];
    NSString *faceString = [[NSString alloc] initWithFormat:@"%@",[[NSBundle mainBundle] pathForResource:faceImageFN ofType:@"png"]];
    UIImage *faceImage = [[UIImage alloc] initWithContentsOfFile:faceString];
    FaceSymbol *face1 = [[FaceSymbol alloc] initWithFile:faceImageFN andImage:faceImage andFrame:CGRectMake(175, 25, 50, 50)];
    FaceSymbol *face2 = [[FaceSymbol alloc] initWithFile:faceImageFN andImage:faceImage andFrame:CGRectMake(949, 25, 50, 50)];
    FaceSymbol *face3 = [[FaceSymbol alloc] initWithFile:faceImageFN andImage:faceImage andFrame:CGRectMake(175, 543, 50, 50)];
    FaceSymbol *face4 = [[FaceSymbol alloc] initWithFile:faceImageFN andImage:faceImage andFrame:CGRectMake(949, 543, 50, 50)];
    NSArray *faceArray = [[NSArray alloc] initWithObjects:face1, face2, face3, face4, nil];
    [face1 release]; [face2 release]; [face3 release]; [face4 release];
    [faceImage release];
    [player setPlayerRelationships:[NSDictionary dictionaryWithObjects:faceArray forKeys:keyArray]];
    [faceArray release]; [faceString release]; [faceImageFN release]; [keyArray release];
    
    keyArray = [[NSArray alloc] initWithObjects:((Player *)[opponents objectAtIndex:1]).type,((Player *)[opponents objectAtIndex:2]).type,((Player *)[opponents objectAtIndex:3]).type,player.type, nil];
    face1 = [[FaceSymbol alloc] init];
    face2 = [[FaceSymbol alloc] init];
    face3 = [[FaceSymbol alloc] init];
    face4 = [[FaceSymbol alloc] init];
    faceArray = [[NSArray alloc] initWithObjects:face1, face2, face3, face4, nil];
    [[opponents objectAtIndex:0] setPlayerRelationships:[NSDictionary dictionaryWithObjects:faceArray forKeys:keyArray]];
    [face1 release]; [face2 release]; [face3 release]; [face4 release];
    [keyArray release];
    [faceArray release];
    
    keyArray = [[NSArray alloc] initWithObjects:((Player *)[opponents objectAtIndex:0]).type,((Player *)[opponents objectAtIndex:2]).type,((Player *)[opponents objectAtIndex:3]).type,player.type,nil];
    face1 = [[FaceSymbol alloc] init];
    face2 = [[FaceSymbol alloc] init];
    face3 = [[FaceSymbol alloc] init];
    face4 = [[FaceSymbol alloc] init];
    faceArray = [[NSArray alloc] initWithObjects:face1, face2, face3, face4, nil];
    [[opponents objectAtIndex:1] setPlayerRelationships:[NSDictionary dictionaryWithObjects:faceArray forKeys:keyArray]];
    [face1 release]; [face2 release]; [face3 release]; [face4 release];
    [keyArray release];
    [faceArray release];
    
    keyArray = [[NSArray alloc] initWithObjects:((Player *)[opponents objectAtIndex:0]).type, ((Player *)[opponents objectAtIndex:1]).type, ((Player *)[opponents objectAtIndex:3]).type, player.type, nil];
    face1 = [[FaceSymbol alloc] init];
    face2 = [[FaceSymbol alloc] init];
    face3 = [[FaceSymbol alloc] init];
    face4 = [[FaceSymbol alloc] init];
    faceArray = [[NSArray alloc] initWithObjects:face1, face2, face3, face4, nil];
    [[opponents objectAtIndex:2] setPlayerRelationships:[NSDictionary dictionaryWithObjects:faceArray forKeys:keyArray]];
    [face1 release]; [face2 release]; [face3 release]; [face4 release];
    [keyArray release];
    [faceArray release];
    
    keyArray = [[NSArray alloc] initWithObjects:((Player *)[opponents objectAtIndex:0]).type, ((Player *)[opponents objectAtIndex:1]).type, ((Player *)[opponents objectAtIndex:2]).type, player.type, nil];
    face1 = [[FaceSymbol alloc] init];
    face2 = [[FaceSymbol alloc] init];
    face3 = [[FaceSymbol alloc] init];
    face4 = [[FaceSymbol alloc] init];
    faceArray = [[NSArray alloc] initWithObjects:face1, face2, face3, face4, nil];
    [[opponents objectAtIndex:3] setPlayerRelationships:[NSDictionary dictionaryWithObjects:faceArray forKeys:keyArray]];
    [face1 release]; [face2 release]; [face3 release]; [face4 release];
    [keyArray release];
    [faceArray release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    isCommandCenterActive = NO;
    isTargetActive = NO;
    
    NSArray *nibObjects = [[NSArray alloc] initWithArray:[[NSBundle mainBundle] loadNibNamed:@"MapScreen" owner:self options:nil]];
    myMapScreen = [[nibObjects objectAtIndex:0] retain];
    [nibObjects release];
    [myMapScreen createCities];
    [self.view addSubview:myMapScreen];

//    dispatch_queue_t setupQueue = dispatch_queue_create("setup command center", NULL);
//    dispatch_async(setupQueue, ^{
        nibObjects = [[NSArray alloc] initWithArray:[[NSBundle mainBundle] loadNibNamed:@"CommandCenter" owner:self options:nil]];
        myCommandCenter = [[nibObjects objectAtIndex:0] retain];
        myCommandCenter.delegate = self;
        [nibObjects release];
//        dispatch_async(dispatch_get_main_queue(), ^{
            [myCommandCenter setupCommandCenterWithOpponents:opponents andPlayer:player];
            [self updateCommandCenter];
//        });
//    });
    
    nibObjects = [[NSArray alloc] initWithArray:[[NSBundle mainBundle] loadNibNamed:@"pushNotification" owner:self options:nil]];
    myPushNotification = [[nibObjects objectAtIndex:0] retain];
    myPushNotification.frame = CGRectMake(0,-50,1024,50);
    myPushNotification.hidden = YES;
    [self.view addSubview:myPushNotification];
    [nibObjects release];
    
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(showCommandCenterFromTimer:) userInfo:nil repeats:NO];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [myMapScreen release]; myMapScreen = nil;
    [myCommandCenter release]; myCommandCenter = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

-(void)dealloc
{
    [myMapScreen release]; myMapScreen = nil;
    [myCommandCenter release]; myCommandCenter = nil;
    [myPushNotification release]; myPushNotification = nil;
    delegate = nil;
    [super dealloc];
}
@end
