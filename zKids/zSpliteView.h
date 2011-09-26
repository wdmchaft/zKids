//
//  zSpliteView.h
//  zKids
//
//  Created by Ivan Mochalov on 26.09.11.
//  Copyright 2011 iva-mochalov@yandex.ru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZSpliteView : UIView {
    @private UIImage *_left;
    @private UIImage *_right;
}

- (id)initWithImages:(CGRect) frame: (UIImage *)left: (UIImage *)right;

- (UIImage*) rotate:(UIImage*)src :(UIImageOrientation)orientation;

- (UIImage*)reverseImageByScalingToSize:(CGSize)targetSize:(UIImage*)anImage;

@end
