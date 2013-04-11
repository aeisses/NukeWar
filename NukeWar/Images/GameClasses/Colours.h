//
//  Colours.h
//  NukeWar
//
//  Created by Aaron Eisses on 13-03-05.
//
//

#import <UIKit/UIKit.h>

@interface Colours : NSObject

+(UIColor*)getTextColourWithAlpha:(float)alpha;
+(UIColor*)getBackGroundColourWithAlpha:(float)alpha;
+(UIColor*)getButtonColourWithAlpha:(float)alpha;
+(UIColor*)getShadowColourWithAlpha:(float)alpha;
+(UIColor*)getCharacterBackgroundColor:(float)alpha;

@end
