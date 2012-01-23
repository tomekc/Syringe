//
//  Created by tomek on 22.01.2012.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class Engine;
@class Dashboard;


@interface Car : NSObject <Injectable,InitializingBean> {

    Engine *engine;
    Dashboard *dashboard;

}


- (void)start;

- (void)showStatus;

@end