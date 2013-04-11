//
//  ButtonImage.h
//  NukeWar
//
//  Created by Aaron Eisses on 13-03-05.
//
//

#import <QuartzCore/QuartzCore.h>
#import "Colours.h"

@interface ButtonImage : CALayer

-(id)initWithImage:(NSString *)fileName isSelected:(BOOL)isSelected andFrame:(CGRect)frame;

@end
