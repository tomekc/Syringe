//
//  Created by tomek on 21.01.2012.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSObject+SyringeExtras.h"
#import "BeanFactory.h"

@implementation NSObject (SyringeExtras)

- (void)autowire {
    NSLog(@"Autowiring");
    [[BeanFactory sharedBeanFactory] wireDependenciesOf:self];
}
@end