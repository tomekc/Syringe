
// Bean factory

#import <Foundation/Foundation.h>
#import "SRBeanCache.h"


@class SRClasspathScanner;


@interface BeanFactory : NSObject
{
    SRBeanCache *beanCache;
    SRClasspathScanner *classpathScanner;
}

// Return singleton instance of bean factory
+ (BeanFactory *)sharedBeanFactory;

// Alias to sharedBeanFactory, use to bootstrap entire machinery in advance if you prefer.
+ (void)bootstrap;

- (void)wireDependenciesOf:(id)_obj;

- (id)getObjectOfType:(NSString *)className;

- (id)getObjectOfClass:(Class)_class;


@end