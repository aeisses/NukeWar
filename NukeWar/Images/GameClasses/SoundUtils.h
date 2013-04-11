//On
//  SoundUtils.h
//  NukeWar
//
//  Created by Aaron Eisses on 13-03-30.
//
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <AVFoundation/AVAudioPlayer.h>
#import <AudioToolbox/AudioToolbox.h>

@interface SoundUtils : NSObject
{
    BOOL isSoundOn;
}

+(void)playExplosionSound;
+(void)playJetSound;
+(void)playFactorySound;

@end
