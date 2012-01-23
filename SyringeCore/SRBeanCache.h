//
//  Created by tomek on 21.01.2012.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface SRBeanCache : NSObject {

    NSMutableDictionary *cache;

}

- (id)createInstanceOf:(NSString *)clasName;

- (id)getObjectOfType:(NSString *)clasName;

- (id)getObjectOfClass:(Class)klaz;

- (NSArray *)allCachedObjects;

- (id)lookupByName:(NSString *)className;


@end