//
//  zKidsAppDelegate.h
//  zKids
//
//  Created by Ivan Mochalov on 20.09.11.
//  Copyright 2011 iva-mochalov@yandex.ru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "zKidsViewController.h"

@interface ZKidsAppDelegate : NSObject <UIApplicationDelegate> {

@private
    UIWindow *_window;

    ZKidsViewController *_rootController;
}

@end
