//
//  zPazzleView.m
//  zKids
//
//  Created by Ivan Mochalov on 29.09.11.
//  Copyright 2011 iva-mochalov@yandex.ru. All rights reserved.
//

#import "zPazzleView.h"

@implementation ZPazzleView

@synthesize background;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGRect frame = [self frame];
    
    UIImage *img = [self background];
    if (img != nil) [img drawInRect:frame];
}

@end
