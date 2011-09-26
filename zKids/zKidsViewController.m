//
//  zKidsViewController.m
//  zKids
//
//  Created by Ivan Mochalov on 20.09.11.
//  Copyright 2011 iva-mochalov@yandex.ru. All rights reserved.
//

#import "zKidsViewController.h"
#import "zSpliteView.h"

@implementation ZKidsViewController

- (void)viewDidLoad
{
    CGRect frame = [[UIScreen mainScreen] applicationFrame];
    UIImage *leftImg = [UIImage imageNamed:@"background.png"];
    UIImage *rightImg = [UIImage imageNamed:@"background.png"];
    
    ZSpliteView *view = [[ZSpliteView alloc]initWithImages:frame :leftImg :rightImg];
    [self setView: view];
    [view release];
}


- (void)dealloc
{
    
    [super dealloc];
}

@end
