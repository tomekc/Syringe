//
//  Syringe Framework
//  Copyright (C) 2012 Tomasz Cejner
//  See LICENSE for details.
//



#import "SRClasspathScanner.h"
#import "Syringe.h"
#import <objc/runtime.h>



@implementation SRClasspathScanner

@synthesize injectableClasses;


- (NSString *)nameOfClass:(Class)c {
    return [NSString stringWithCString:class_getName(c) encoding:NSUTF8StringEncoding];
}

- (BOOL)isInjectableClass:(Class)c {
    return class_conformsToProtocol(c, @protocol(Injectable));
}

- (void)scanSclasses {

    if (injectableClasses) {
        [injectableClasses release];
    }

    injectableClasses= [[NSMutableArray alloc] initWithCapacity:64];

    int numClasses = objc_getClassList(NULL, 0);
    Class *classes = NULL;


    if (numClasses > 0) {
        @autoreleasepool {
            classes = (__unsafe_unretained Class *) malloc(sizeof(Class) * numClasses);
            numClasses = objc_getClassList(classes, numClasses);
            for (int i = 0; i < numClasses; i++) {
                Class c = classes[i];
                if ([self isInjectableClass:c]) {
                    [injectableClasses addObject:[self nameOfClass:c]];
                }
            }
            free(classes);
        }
    }

}



- (void)dealloc
{
    [injectableClasses release];
	[super dealloc];
}


@end