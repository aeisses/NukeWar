//
//  CommandCenter.h
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-16.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Light.h"
#import "ItemImage.h"
#import "Player.h"
#import "FaceSymbol.h"

#define lightImageWidth 25
#define lightImageHeight 25
#define itemImageWidth 130
#define itemImageHeight 130
#define playerImageWidth 220
#define playerImageHeight 220
#define faceImageWidth 50
#define faceImageHeight 50

@protocol CommandCenterDelegate <NSObject>
-(void)enemyButtonPressed:(int)enemy;
-(void)nukeWarButtonPressed;
@end

@interface CommandCenter : UIView
{
    IBOutlet UIImageView *backGroundImage;
    
    IBOutlet UIButton *nukeWarButton;
    IBOutlet UITextView *commandCenterTextView;
    
    IBOutlet UIButton *buildButton;
    IBOutlet UIButton *propagandaButton;
    
    Player *enemyOneImage;
    Player *enemyTwoImage;
    Player *enemyThreeImage;
    Player *enemyFourImage;
    
    IBOutlet UIButton *enemyOneButton;
    IBOutlet UIButton *enemyTwoButton;
    IBOutlet UIButton *enemyThreeButton;
    IBOutlet UIButton *enemyFourButton;
    
    IBOutlet UIButton *enemyOneModButton;
    IBOutlet UIButton *enemyTwoModButton;
    IBOutlet UIButton *enemyThreeModButton;
    IBOutlet UIButton *enemyFourModButton;
    FaceSymbol *enemyOneFace;
    FaceSymbol *enemyTwoFace;
    FaceSymbol *enemyThreeFace;
    FaceSymbol *enemyFourFace;
    
    ItemImage *missileImage;
    ItemImage *warheadImage;
    ItemImage *jetImage;
    ItemImage *defenseImage;
    
    Light *missile10MegTonImage;
    Light *missile20MegTonImage;
    Light *missile50MegTonImage;
    Light *missile100MegTonImage;
    
    Light *warhead10MegTonImage;
    Light *warhead20MegTonImage;
    Light *warhead50MegTonImage;
    Light *warhead100MegTonImage;
    
    Light *jetSmallImage;
    Light *jetLargeImage;

    Light *defenseSmallImage;
    Light *defenseLargeImage;
 
    IBOutlet UIButton *missile10MegTonButton;
    IBOutlet UIButton *missile20MegTonButton;
    IBOutlet UIButton *missile50MegTonButton;
    IBOutlet UIButton *missile100MegTonButton;
    
    IBOutlet UIButton *warhead10MegTonButton;
    IBOutlet UIButton *warhead20MegTonButton;
    IBOutlet UIButton *warhead50MegTonButton;
    IBOutlet UIButton *warhead100MegTonButton;
    
    IBOutlet UIButton *jetSmallButton;
    IBOutlet UIButton *jetLargeButton;
    
    IBOutlet UIButton *defenseSmallButton;
    IBOutlet UIButton *defenseLargeButton;
    
    Player *player;
    NSArray *opponents;
    
    id <CommandCenterDelegate> delegate;
}

@property (retain, nonatomic) id <CommandCenterDelegate> delegate;
@property (retain, nonatomic) Light *missile10MegTonImage;
@property (retain, nonatomic) Light *missile20MegTonImage;
@property (retain, nonatomic) Light *missile50MegTonImage;
@property (retain, nonatomic) Light *missile100MegTonImage;
@property (retain, nonatomic) Light *warhead10MegTonImage;
@property (retain, nonatomic) Light *warhead20MegTonImage;
@property (retain, nonatomic) Light *warhead50MegTonImage;
@property (retain, nonatomic) Light *warhead100MegTonImage;
@property (retain, nonatomic) Light *jetSmallImage;
@property (retain, nonatomic) Light *jetLargeImage;
@property (retain, nonatomic) Light *defenseSmallImage;
@property (retain, nonatomic) Light *defenseLargeImage;
@property (retain, nonatomic) IBOutlet UIButton *missile10MegTonButton;
@property (retain, nonatomic) IBOutlet UIButton *missile20MegTonButton;
@property (retain, nonatomic) IBOutlet UIButton *missile50MegTonButton;
@property (retain, nonatomic) IBOutlet UIButton *missile100MegTonButton;
@property (retain, nonatomic) IBOutlet UIButton *warhead10MegTonButton;
@property (retain, nonatomic) IBOutlet UIButton *warhead20MegTonButton;
@property (retain, nonatomic) IBOutlet UIButton *warhead50MegTonButton;
@property (retain, nonatomic) IBOutlet UIButton *warhead100MegTonButton;
@property (retain, nonatomic) IBOutlet UIButton *jetSmallButton;
@property (retain, nonatomic) IBOutlet UIButton *jetLargeButton;
@property (retain, nonatomic) IBOutlet UIButton *defenseSmallButton;
@property (retain, nonatomic) IBOutlet UIButton *defenseLargeButton;
@property (retain, nonatomic) IBOutlet UITextView *commandCenterTextView;
@property (retain, nonatomic) IBOutlet UIButton *buildButton;
@property (retain, nonatomic) IBOutlet UIButton *propagandaButton;

-(void)setupCommandCenterWithOpponents:(NSArray *)_opponents andPlayer:(Player *)_player;
-(void)update;
-(void)resetAllButtons;
-(IBAction)touchFaceButton:(id)sender;
-(IBAction)touchEnemyButton:(id)sender;
-(IBAction)touchMissileButton:(id)sender;
-(IBAction)touchWarHeadButton:(id)sender;
-(IBAction)touchJetsButton:(id)sender;
-(IBAction)touchDefenseButton:(id)sender;
-(IBAction)touchBuildButton:(id)sender;
-(IBAction)touchPropagandaButton:(id)sender;
-(IBAction)touchNukeWarButton:(id)sender;

@end
