//
//  Created by tomek on 21.01.2012.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SRBeanCache.h"
#import <objc/objc-runtime.h>


@implementation SRBeanCache

- (id)init {
    self = [super init];
    if (self) {

        cache = [[NSMutableDictionary alloc] initWithCapacity:128];

    }
    return self;
}


- (void)cacheInstance:(id)instance ofType:(NSString *)clasName {
    if (instance != nil) {
        [cache setObject:instance forKey:clasName];
    }
}

- (id)createInstanceOf:(NSString *)clasName {
    Class klaz = objc_getClass([clasName cString]);
    if (klaz != nil) {
        id instance = class_createInstance(klaz, 0);
        return [instance init];
    } else {
        return nil;
    }
}

- (id)getObjectOfType:(NSString *)clasName {
    id cached = [cache objectForKey:clasName];
    if (cached == nil) {
        NSLog(@"Initializing instance of class %@", clasName);
        id instance = [self createInstanceOf:clasName];
        [self cacheInstance:instance ofType:clasName];
        return instance;
    } else {
        return cached;
    }
}

- (id)getObjectOfClass:(Class)klaz
{
    NSString *name = [NSString stringWithCString:class_getName(klaz)];
    return [self getObjectOfType:name];
}

- (NSArray *)allCachedObjects
{
    return [cache allKeys];
}

- (id)lookupByName:(NSString *)className
{
    return [cache objectForKey:className];
}

- (void)dealloc {
    // dealloc my objects here
    [cache release];
    [super dealloc];
}


@end