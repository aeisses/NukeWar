//
//  TextTile.h
//  NukeWar
//
//  Created by Aaron Eisses on 13-03-06.
//
//

#import "Tile.h"

@interface LabelTile : Tile

@property (retain, nonatomic) UILabel *label;

- (id)initWithFrame:(CGRect)frame andText:(NSString *)text andName:(NSString*)name andBGColour:(UIColor *)bgColour andSelectColour:(UIColor *)selectColour andTextColour:(UIColor *)textColour andTextFrame:(CGRect)textFrame;

@end
