//
//  Person.h
//  Factory
//

#import "MemoryPayload.h"

@protocol LocationProtocol;

@interface Person : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *surname;
@property (nonatomic, readonly, weak) id<LocationProtocol> location;

- (void)moveToLocation:(id<LocationProtocol>)location;

@end
