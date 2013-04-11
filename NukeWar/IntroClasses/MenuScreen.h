//
//  MenuScreen.h
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-16.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "HeadAnimationLayer.h"
#import "LabelTile.h"

@protocol MenuScreenDelegate <NSObject>
-(void)playButtonPressed;
@end

@interface MenuScreen : UIView <TileDelegate>
{
    IBOutlet UIButton *playButton;
    IBOutlet UIImageView *backGroundImage;
    IBOutlet UILabel *titleLabel;
    LabelTile *tileButton, *optionsButton, *creditButton;
    id <MenuScreenDelegate> delegate;
}

@property (retain, nonatomic) IBOutlet UIButton *playButton;
@property (retain, nonatomic) IBOutlet UIImageView *backGroundImage;
@property (retain, nonatomic) IBOutlet UILabel *titleLabel;
@property (retain, nonatomic) id <MenuScreenDelegate> delegate;
@property (retain, nonatomic) LabelTile *tileButton;
@property (retain, nonatomic) LabelTile *optionsButton;
@property (retain, nonatomic) LabelTile *creditButton;

-(void)startHeadAnimation;
-(IBAction)touchPlayButton:(id)sender;

@end
