//
//  Created by tomek on 22.01.2012.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class Engine;


@interface Dashboard : NSObject  <Injectable>
{

    Engine *engine;

}

- (void)display;
@end