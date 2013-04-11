//
//  Characters.h
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-21.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StandardUtils.h"

typedef enum {
    LaBamba, // Barak Obama
    NicktheShark, // Nicolas Sarkozy
    Cristine, // Cristina Fernández de Kirchner
    Stephen, // Steven Harper
    Ahmadinejad, // Mahmoud Ahmadinejad
    Netanyahu, // Benjamin Netanyahu
    Poutine, // Vladimir Putin
    Chavez, // Hugo Chávez
    Merkel, // Angela Merkel
    Karzai, // Hamid Karzai
    Un, // Kim Jong Un
    Mugabe // Robert Mugabe
} Names;

@interface Characters : NSObject

+(NSString *)nameToString:(Names)name;
+(int)getAttack:(Names)name;
+(int)getPropaganda:(Names)name;
+(NSString *)getPositiveTwitterSpeak:(Names)name;
+(NSString *)getDefensiveTwitterSpeak:(Names)name;
+(NSString *)getOffensiveTwitterSpeak:(Names)name;
+(NSString *)getNegativeTwitterSpeak:(Names)name;
+(NSString *)getWinningTwitterSpeak:(Names)name;
+(NSString *)getLosingTwitterSpeak:(Names)name;

@end
