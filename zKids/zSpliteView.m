//
//  zSpliteView.m
//  zKids
//
//  Created by Ivan Mochalov on 26.09.11.
//  Copyright 2011 iva-mochalov@yandex.ru. All rights reserved.
//

#import "zSpliteView.h"

int _counter = 0;

static inline double radians (double degrees) {return degrees * M_PI/180;}

@implementation ZSpliteView

- (id)initWithImages:(CGRect)frame :(UIImage *)left :(UIImage *)right
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        [left retain];
        _left = left;
        [right retain];
        _right = right;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGRect frame = [self frame];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    /*CGContextSetLineWidth(ctx, 4.0);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor); 
    CGContextMoveToPoint(ctx, 10.0f, 10.0f); 
    CGContextAddLineToPoint(ctx, 20.0f, 20.0f); 
    CGContextStrokePath(ctx);*/
    CGContextSetFillColorWithColor(ctx, [[UIColor colorWithRed:0.6 green:0.4 blue:0.3 alpha:1.0] CGColor]);
    CGContextFillRect(ctx, frame);
    
    CGFloat xLeft = frame.size.width / 2 - [_left size].width / 2;
    CGFloat yLeft = frame.size.height / 4 - [_left size].height / 2;
    //UIImage *rotatedLeft = [self reverseImageByScalingToSize:CGSizeMake([_left size].height, [_right size].width) :_left];
    //UIImage *rotatedLeft = [self rotate:_left :UIImageOrientationRight];
    UIImage *rotatedLeft = _left;
    [rotatedLeft drawAtPoint:CGPointMake(xLeft, yLeft)];
    
    CGFloat xRight = frame.size.width / 2 - [_left size].width / 2;
    CGFloat yRight = frame.size.height * 3 / 4 - [_left size].height / 2;
    //UIImage *rotatedRight = [self reverseImageByScalingToSize:CGSizeMake([_right size].height, [_right size].width) :_right];
    //UIImage *rotatedRight = [self rotate:_right :UIImageOrientationRight];
    UIImage *rotatedRight = _right;
    [rotatedRight drawAtPoint:CGPointMake(xRight, yRight)];
    
    NSLog(@"%d", _counter++);
}

- (UIImage*) rotate:(UIImage*)src :(UIImageOrientation)orientation
{
    UIGraphicsBeginImageContext(src.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (orientation == UIImageOrientationRight) {
        CGContextRotateCTM (context, radians(90));
    } else if (orientation == UIImageOrientationLeft) {
        CGContextRotateCTM (context, radians(-90));
    } else if (orientation == UIImageOrientationDown) {
        // NOTHING
    } else if (orientation == UIImageOrientationUp) {
        CGContextRotateCTM (context, radians(90));
    }
    
    [src drawAtPoint:CGPointMake(0, 0)];
    
    return UIGraphicsGetImageFromCurrentImageContext();
}

-(UIImage*)reverseImageByScalingToSize:(CGSize)targetSize:(UIImage*)anImage
{
    UIImage* sourceImage = anImage; 
    CGFloat targetWidth = targetSize.height;
    CGFloat targetHeight = targetSize.width;
    
    CGImageRef imageRef = [sourceImage CGImage];
    CGBitmapInfo bitmapInfo = CGImageGetBitmapInfo(imageRef);
    CGColorSpaceRef colorSpaceInfo = CGImageGetColorSpace(imageRef);
    
    if (bitmapInfo == kCGImageAlphaNone) 
    {
        bitmapInfo = kCGImageAlphaNoneSkipLast;
    }
    
    CGContextRef bitmap;
    
    if (sourceImage.imageOrientation == UIImageOrientationUp || sourceImage.imageOrientation == UIImageOrientationDown) 
    {
        bitmap = CGBitmapContextCreate(NULL, targetHeight, targetWidth, 
                                       CGImageGetBitsPerComponent(imageRef), 
                                       CGImageGetBytesPerRow(imageRef), 
                                       colorSpaceInfo, 
                                       bitmapInfo);
    } 
    else 
    {
        bitmap = CGBitmapContextCreate(NULL, targetWidth, targetHeight, 
                                       CGImageGetBitsPerComponent(imageRef), 
                                       CGImageGetBytesPerRow(imageRef), 
                                       colorSpaceInfo, 
                                       bitmapInfo);
    }       
    
    
    if (sourceImage.imageOrientation == UIImageOrientationRight) 
    {
        CGContextRotateCTM (bitmap, radians(90));
        CGContextTranslateCTM (bitmap, 0, -targetHeight);
    } 
    else if (sourceImage.imageOrientation == UIImageOrientationLeft) 
    {
        CGContextRotateCTM (bitmap, radians(-90));
        CGContextTranslateCTM (bitmap, -targetWidth, 0);
    } 
    else if (sourceImage.imageOrientation == UIImageOrientationDown) 
    {
        // NOTHING
    } 
    else if (sourceImage.imageOrientation == UIImageOrientationUp)
    {
        CGContextRotateCTM (bitmap, radians(90));
        CGContextTranslateCTM (bitmap, 0, -targetHeight);
    }
    
    CGContextDrawImage(bitmap, CGRectMake(0, 0, targetWidth, targetHeight), imageRef);
    CGImageRef ref = CGBitmapContextCreateImage(bitmap);
    UIImage* newImage = [UIImage imageWithCGImage:ref];
    
    CGContextRelease(bitmap);
    CGImageRelease(ref);
    
    return newImage; 
}

- (void)dealloc
{
    [_left release];
    [_right release];
    
    [super dealloc];
}

@end
