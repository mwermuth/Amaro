//
//  main.m
//  CrushBootstrap
//
//  Created by Tim Clem on 3/2/14.
//  Copyright (c) 2014 Crush & Lovely. All rights reserved.
//

#if HAS_POD(PixateFreestyle)
#import <PixateFreestyle/PixateFreestyle.h>
#endif

#import <UIKit/UIKit.h>
#import "CRBSAppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        #if HAS_POD(PixateFreestyle)
        [PixateFreestyle initializePixateFreestyle];
        #endif

        return UIApplicationMain(argc, argv, nil, NSStringFromClass([CRBSAppDelegate class]));
    }
}
