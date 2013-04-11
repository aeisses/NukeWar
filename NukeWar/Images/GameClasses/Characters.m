//
//  Characters.m
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-21.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Characters.h"

@implementation Characters

+(void)initializeCharacter
{
    // Load in the JSON file containing all the character speak
    
}

+(NSString *)nameToString:(Names)name
{
    switch (name) {
        case LaBamba:
            return @"La Bamba";
            break;
        case NicktheShark:
            return @"Nick the Shark";
            break;
        case Cristine:
            return @"Kristina Frendaz";
            break;
        case Stephen:
            return @"Stephen";
            break;
        case Ahmadinejad:
            return @"Ahmadinejad";
            break;
        case Netanyahu:
            return @"Netanyahu";
            break;
        case Poutine:
            return @"Had Poutine";
            break;
        case Chavez:
            return @"Chavez";
            break;
        case Merkel:
            return @"Merkel";
            break;
        case Karzai:
            return @"Karzai";
            break;
        case Un:
            return @"Un";
            break;
        case Mugabe:
            return @"Mugabe";
            break;
    }
    return @"";
}

+(int)getAttack:(Names)name
{
    int attack = 0;
    switch (name) {
        case LaBamba:
            attack = 0;
            break;
        case NicktheShark:
            attack = 0;
            break;
        case Cristine:
            attack = 0;
            break;
        case Stephen:
            attack = 0;
            break;
        case Ahmadinejad:
            attack = 0;
            break;
        case Netanyahu:
            attack = 0;
            break;
        case Poutine:
            attack = 0;
            break;
        case Chavez:
            attack = 0;
            break;
        case Merkel:
            attack = 0;
            break;
        case Karzai:
            attack = 0;
            break;
        case Un:
            attack = 0;
            break;
        case Mugabe:
            attack = 0;
            break;
    }
    return attack;
}

+(int)getPropaganda:(Names)name
{
    int attack = 0;
    switch (name) {
        case LaBamba:
            attack = 0;
            break;
        case NicktheShark:
            attack = 0;
            break;
        case Cristine:
            attack = 0;
            break;
        case Stephen:
            attack = 0;
            break;
        case Ahmadinejad:
            attack = 0;
            break;
        case Netanyahu:
            attack = 0;
            break;
        case Poutine:
            attack = 0;
            break;
        case Chavez:
            attack = 0;
            break;
        case Merkel:
            attack = 0;
            break;
        case Karzai:
            attack = 0;
            break;
        case Un:
            attack = 0;
            break;
        case Mugabe:
            attack = 0;
            break;
    }
    return attack;
}



+(NSString *)getPositiveTwitterSpeak:(Names)name
{
    NSString *returnString = @"";
    switch (name) {
        case LaBamba:
//            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case NicktheShark:
//            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Cristine:
//            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Stephen:
//            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Ahmadinejad:
//            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Netanyahu:
//            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Poutine:
//            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Chavez:
//            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Merkel:
//            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Karzai:
//            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Un:
//            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Mugabe:
//            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
    }
    return returnString;
}

+(NSString *)getDefensiveTwitterSpeak:(Names)name
{
    NSString *returnString = @"";
    switch (name) {
        case LaBamba:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case NicktheShark:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Cristine:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Stephen:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Ahmadinejad:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Netanyahu:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Poutine:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Chavez:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Merkel:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Karzai:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Un:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Mugabe:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
    }
    return returnString;
}

+(NSString *)getOffensiveTwitterSpeak:(Names)name
{
    NSString *returnString = @"";
    switch (name) {
        case LaBamba:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case NicktheShark:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Cristine:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Stephen:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Ahmadinejad:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Netanyahu:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Poutine:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Chavez:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Merkel:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Karzai:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Un:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Mugabe:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
    }
    return returnString;
}

+(NSString *)getNegativeTwitterSpeak:(Names)name
{
    NSString *returnString = @"";
    switch (name) {
        case LaBamba:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case NicktheShark:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Cristine:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Stephen:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Ahmadinejad:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Netanyahu:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Poutine:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Chavez:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Merkel:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Karzai:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Un:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Mugabe:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
    }
    return returnString;
}

+(NSString *)getWinningTwitterSpeak:(Names)name
{
    NSString *returnString = @"";
    switch (name) {
        case LaBamba:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case NicktheShark:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Cristine:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Stephen:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Ahmadinejad:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Netanyahu:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Poutine:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Chavez:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Merkel:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Karzai:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Un:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Mugabe:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
    }
    return returnString;
}

+(NSString *)getLosingTwitterSpeak:(Names)name
{
    NSString *returnString = @"";
    switch (name) {
        case LaBamba:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case NicktheShark:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Cristine:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Stephen:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Ahmadinejad:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Netanyahu:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Poutine:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Chavez:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Merkel:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Karzai:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Un:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
        case Mugabe:
            //            returnString = (NSString *)[obamaPositive objectAtIndex:[StandardUtils getRandomNumber:[obamaPositive count]]];
            break;
    }
    return returnString;
}

@end
