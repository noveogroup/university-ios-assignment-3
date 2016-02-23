//
//  Factory.h
//  Factory
//

#import "LocationProtocol.h"


/**
 *  The particular class represents a simple factory in action.
 */
@interface Factory : NSObject <LocationProtocol>

/**
 *  Makes the receiver simulate process of production at duration of a month.
 */
- (void)simulateWorkingMonth;

@end
