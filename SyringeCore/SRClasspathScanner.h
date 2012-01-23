//
//  Created by tomek on 20.01.2012.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface SRClasspathScanner : NSObject {

    NSMutableArray *injectableClasses;

}


@property(nonatomic, readonly) NSMutableArray *injectableClasses;

- (BOOL)isInjectableClass:(Class)c;

- (void)scanSclasses;
@end