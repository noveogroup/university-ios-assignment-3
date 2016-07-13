//
//  Factory.h
//  Factory
//

#import "LocationProtocol.h"

@class Warehouse;

@interface Factory : NSObject <LocationProtocol>

- (void)simulateWorkingMonth;

@end
