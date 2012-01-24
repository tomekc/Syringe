//
//  Created by tomek on 20.01.2012.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SRClasspathScanner.h"
#import "Syringe.h"
#import <objc/runtime.h>



@implementation SRClasspathScanner

@synthesize injectableClasses;

- (void)listIvarsOf:(Class)_class {

    unsigned int  count;
    Ivar *ivars = class_copyIvarList(_class, &count);
    if (count > 0) {
        for (int j=0; j<count; j++) {
            Ivar var = ivars[j];


            NSLog(@"ivar %s %s", ivar_getName(var), ivar_getTypeEncoding(var));
            
        }
        
        
        free(ivars);
    }

}


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