//
//  Created by tomek on 22.01.2012.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface Engine : NSObject <Injectable> {

    int rpm;
    BOOL started;

}
@property(nonatomic) int rpm;
@property(nonatomic) BOOL started;


@end