//
//  DDLogSwift.h
//  CrushBootstrap
//
//  Created by mwermuth on 20/08/14.
//  Copyright (c) 2014 Crush & Lovely. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDLogSwift : NSObject

+ (void) logError:(NSString *)message;
+ (void) logWarn:(NSString *)message;
+ (void) logInfo:(NSString *)message;
+ (void) logDebug:(NSString *)message;
+ (void) logVerbose:(NSString *)message;

@end
