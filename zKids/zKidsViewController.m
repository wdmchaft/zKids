//
//  zKidsViewController.m
//  zKids
//
//  Created by Ivan Mochalov on 20.09.11.
//  Copyright 2011 iva-mochalov@yandex.ru. All rights reserved.
//

#import "zKidsViewController.h"
#import "zSpliteView.h"
#import "zPazzleView.h"

@implementation ZKidsViewController

- (void)viewDidLoad
{
    CGRect frame = [[UIScreen mainScreen] applicationFrame];
    UIImage *leftImg = [UIImage imageNamed:@"background.png"];
    //UIImage *rightImg = [UIImage imageNamed:@"background.png"];
    
    //ZSpliteView *view = [[ZSpliteView alloc]initWithImages:frame :leftImg :rightImg];
    ZPazzleView *view = [[ZPazzleView alloc]initWithFrame:frame];
    [view setBackground:leftImg];
    [self setView: view];
    [view release];
}

-(void)viewDidAppear:(BOOL)animated
{
    AVAudioPlayer *player = [self soundNamed:@"sound.mp3"];
    [player setNumberOfLoops:-1];
    [player play];
}

- (AVAudioPlayer *) soundNamed:(NSString *)name {
    NSString * path;
    AVAudioPlayer * snd;
    NSError * err;
    
    path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:name];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSURL * url = [NSURL fileURLWithPath:path];
        snd = [[[AVAudioPlayer alloc] initWithContentsOfURL:url 
                                                      error:&err] autorelease];
        if (! snd) {
            NSLog(@"Sound named '%@' had error %@", name, [err localizedDescription]);
        } else {
            [snd prepareToPlay];
        }
    } else {
        NSLog(@"Sound file '%@' doesn't exist at '%@'", name, path);
    }
    
    return snd;
}


- (void)dealloc
{
    
    [super dealloc];
}

@end
