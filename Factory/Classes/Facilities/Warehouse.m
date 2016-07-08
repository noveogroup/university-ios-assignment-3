//
//  Warehouse.m
//  Factory
//

#import "Warehouse.h"
#import "WareProtocol.h"

static NSString *const WarehouseErrorDomain = @"WarehouseErrorDomain";
static NSString *const kWarehouseErrorDescription = @"WarehouseErrorDescription";

static const NSInteger WarehouseErrorCodeNotEnoughWares = -1;

@interface Warehouse ()

@property (nonatomic, retain) NSMutableDictionary *wares;

@end

@implementation Warehouse

@synthesize capacity = capacity_;
@synthesize latitude = latitude_;
@synthesize longitude = longitude_;

@synthesize wares = wares_;

#pragma mark - Getters

- (BOOL)isEmpty
{
    return ![self.wares count];
}

- (BOOL)isFull
{
    return [self.wares count] == [self capacity];
}

- (NSMutableDictionary *)wares
{
    if (!wares_) {
        wares_ = [[NSMutableDictionary alloc] init];
    }

    return wares_;
}

#pragma mark - Deallocation

- (void)dealloc
{
    [wares_ release];
    wares_ = nil;
    
    [super dealloc];
}

#pragma mark - LocationProtocol implementation

- (float)latitude
{
    return latitude_;
}

- (float)longitude
{
    return longitude_;
}

#pragma mark - WarehouseProtocol implementation

- (void)putWare:(id<WareProtocol>)ware
{
    [self.wares setValue:ware forKey:[ware uniqueIdentifier]];
}

- (NSSet *)shipWaresOfCount:(NSUInteger)count
                      error:(NSError **)error NS_RETURNS_RETAINED {
    if (count <= [self.wares count]) {
        NSMutableSet *const mutableShipment = [[NSMutableSet alloc] init];
        for (NSUInteger index = 0; index < count; ++index) {
            id key = [self.wares allKeys][index];
            [mutableShipment addObject:self.wares[key]];
        }
        for (id<WareProtocol> ware in mutableShipment) {
            [self.wares removeObjectForKey:[ware uniqueIdentifier]];
        }

        NSSet *set = [mutableShipment copy];
        [mutableShipment release];

        return set;
    }

    if (!!error) {
        NSDictionary *const userInfo =
                @{kWarehouseErrorDescription :
                        @"There is not enough wares in the warehouse"};
        (*error) = [NSError errorWithDomain:WarehouseErrorDomain
                                       code:WarehouseErrorCodeNotEnoughWares
                                   userInfo:userInfo];
    }

    return nil;
}

@end
