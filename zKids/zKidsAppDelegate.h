//
//  zKidsAppDelegate.h
//  zKids
//
//  Created by Ivan Mochalov on 20.09.11.
//  Copyright 2011 iva-mochalov@yandex.ru. All rights reserved.
//

#import <UIKit/UIKit.h>

@class zKidsViewController;

@interface zKidsAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet zKidsViewController *viewController;

@end
