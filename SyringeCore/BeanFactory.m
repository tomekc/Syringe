//
//  Created by tomek on 20.01.2012.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <objc/runtime.h>
#import "BeanFactory.h"
#import "SRClasspathScanner.h"
#import "Syringe.h"


@implementation BeanFactory

static BeanFactory *sharedSRBeanFactoryInstance = nil;

+ (BeanFactory *)sharedBeanFactory {
    @synchronized (self) {
        if (sharedSRBeanFactoryInstance == nil) {
            sharedSRBeanFactoryInstance = [[self alloc] init];
        }
        return sharedSRBeanFactoryInstance;
    }
}

+ (void)bootstrap {
    [BeanFactory sharedBeanFactory];
}

- (void)initializeBeans {
    NSLog(@"Syringe is bootstrapping..");
    [classpathScanner scanSclasses];

    NSLog(@"Eagerly initializing all annotated classes..");
    // eagerly initialize all objects
    for (NSString *name in classpathScanner.injectableClasses) {
        [beanCache getObjectOfType:name];
    }

    NSLog(@"Wiring all dependencies..");
    // now connect all dependencies
    for (NSString *name in classpathScanner.injectableClasses) {
        [self wireDependenciesOf:[beanCache getObjectOfType:name]];
    }

    NSLog(@"Post initialization..");
    NSArray *classNames = [beanCache allCachedObjects];
    for (NSString *name in classNames) {
        id object = [beanCache lookupByName:name];
        if ([object conformsToProtocol:@protocol(InitializingBean)]) {
            [object afterPropertiesSet];
        }
    }
    
    NSLog(@"Syringe startup complete.");
}


- (NSString *)getClassNameOfIvar:(Ivar)var {
    const char *ivarType = ivar_getTypeEncoding(var);
    if (strlen(ivarType) > 3 && ivarType[0] == '@' && ivarType[1] == '"') {
        return [NSString stringWithCString:ivarType + 2 length:strlen(ivarType) - 3];
    } else {
        return nil;
    }
}

- (void)wireDependenciesOf:(id)_obj {
    unsigned int count;
    Ivar *ivars = class_copyIvarList([_obj class], &count);
    if (count > 0) {
        for (int j = 0; j < count; j++) {
            Ivar var = ivars[j];
            NSString *typename = [self getClassNameOfIvar:var];
            id object = [beanCache lookupByName:typename];
            if (object) {
                object_setIvar(_obj, var, object);
            }
        }
        free(ivars);
    }


}

- (id)init {
    self = [super init];
    if (self) {
        beanCache = [[SRBeanCache alloc] init];
        classpathScanner = [[SRClasspathScanner alloc] init];
        [self initializeBeans];
    }

    return self;
}

- (id)getObjectOfType:(NSString *)className {
    return [beanCache getObjectOfType:className];
}

- (id)getObjectOfClass:(Class)_class {
    return [beanCache getObjectOfClass:_class];
}

- (void)dealloc {
    [beanCache release];
    [classpathScanner release];
    [super dealloc];
}


@end