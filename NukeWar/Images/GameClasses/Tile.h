//
//  Tile.h
//  NukeWar
//
//  Created by Aaron Eisses on 13-03-03.
//
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Colours.h"

@protocol TileDelegate <NSObject>
-(void)tilePressed:(NSString *)buttonName;
@end

@interface Tile : UIView
{
    BOOL isCheckButton;
}

@property (retain, nonatomic) NSString *name;
@property (retain, nonatomic) id <TileDelegate> delegate;
@property (readonly) BOOL selected;
@property (readwrite) BOOL enabled;
@property (retain, nonatomic) UIColor *selectColour;
@property (retain, nonatomic) UIColor *backgroundColour;

-(id)initWithFrame:(CGRect)frame andName:(NSString*)name andBGColour:(UIColor *)bgColour andSelectColour:(UIColor *)selColour;

@end
