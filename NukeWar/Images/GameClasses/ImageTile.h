//
//  ImageTile.h
//  NukeWar
//
//  Created by Aaron Eisses on 13-03-06.
//
//

#import "LabelTile.h"

@interface ImageTile : LabelTile

@property (retain, nonatomic) CALayer *imageLayer;

- (id)initWithFrame:(CGRect)frame andImage:(NSString *)fileName andImageFrame:(CGRect)imageFrame andName:(NSString *)name andBackGroundColour:(UIColor *)bgColour andSelectColour:(UIColor *)selColour andText:(NSString *)text andTextColour:(UIColor *)textColor andTextFrame:(CGRect)textFrame;

@end
