//
//  MainGameViewController.h
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-16.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapScreen.h"
#import "CommandCenter.h"
#import "CommandCenterText.h"
#import "Action.h"
#import "Player.h"
#import "pushNotification.h"

@protocol MainGameViewControllerDelegate <NSObject>
-(void)gameOver:(NSString *)PlayerName withScore:(int)Score;
@end

@interface MainGameViewController : UIViewController <CommandCenterDelegate, ActionDelegate>
{
    MapScreen *myMapScreen;
    CommandCenter *myCommandCenter;
    BOOL isCommandCenterActive;
    BOOL isTargetActive;
    NSMutableArray *playerActions;
    City *targetCity;
    NSArray *opponents;
    Player *player;
    id <MainGameViewControllerDelegate> delegate;
    Player *currentOpponent;
    pushNotification *myPushNotification;
    NSString *playerName;
    int finalScore;
}

@property (retain, nonatomic) MapScreen *myMapScreen;
@property (retain, nonatomic) CommandCenter *myCommandCenter;
@property (retain, nonatomic) pushNotification *myPushNotification;
@property (retain, nonatomic) id <MainGameViewControllerDelegate> delegate;

-(void)setPlayers:(NSArray *)players;

@end
