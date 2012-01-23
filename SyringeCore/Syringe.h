#import "Injectable.h"
#import "NSObject+SyringeExtras.h"
#import "BeanFactory.h"

#define inject(X) [[BeanFactory sharedBeanFactory] getObjectOfClass:[X class]]
