//
//  Syringe Framework
//  Copyright (C) 2012 Tomasz Cejner
//  See LICENSE for details.
//
//  This category adds autowire: method to NSObject, effectively to all classes.
//  autowire: method resolves all dependencies in current object.
//

#import "NSObject+SyringeExtras.h"
#import "BeanFactory.h"

@implementation NSObject (SyringeExtras)

- (void)autowire {
    [[BeanFactory sharedBeanFactory] wireDependenciesOf:self];
}
@end