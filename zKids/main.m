//
//  main.m
//  zKids
//
//  Created by Ivan Mochalov on 20.09.11.
//  Copyright 2011 iva-mochalov@yandex.ru. All rights reserved.
//

//#import <UIKit/UIKit.h>

int main(int argc, char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, @"UIApplication",@"ZKidsAppDelegate");
    [pool release];
    return retVal;
}
