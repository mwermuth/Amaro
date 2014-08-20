//
//  DDLogSwift.m
//  CrushBootstrap
//
//  Created by mwermuth on 20/08/14.
//  Copyright (c) 2014 Crush & Lovely. All rights reserved.
//

#import "DDLogSwift.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

#if Debug
    static const int ddLogLevel = LOG_LEVEL_VERBOSE;
#else
    static const int ddLogLevel = LOG_LEVEL_WARN;
#endif


@implementation DDLogSwift

+ (void) logError:(NSString *)message {
    DDLogError(message);
}

+ (void) logWarn:(NSString *)message {
    DDLogWarn(message);
}

+ (void) logInfo:(NSString *)message {
    DDLogInfo(message);
}

+ (void) logDebug:(NSString *)message {
    DDLogDebug(message);
}

+ (void) logVerbose:(NSString *)message {
    DDLogInfo(message);
}

@end
