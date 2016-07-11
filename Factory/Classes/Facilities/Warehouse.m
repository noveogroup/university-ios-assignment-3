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

@property (nonatomic) NSMutableDictionary *wares;

@end

@implementation Warehouse

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
    if (!_wares) {
        _wares = [[NSMutableDictionary alloc] init];
    }

    return _wares;
}

#pragma mark - LocationProtocol implementation

- (float)latitude
{
    return _latitude;
}

- (float)longitude
{
    return _longitude;
}

#pragma mark - WarehouseProtocol implementation

- (void)putWare:(id<WareProtocol>)ware
{
    [self.wares setValue:ware forKey:[ware uniqueIdentifier]];
}

- (NSSet *)shipWaresOfCount:(NSUInteger)count
                      error:(NSError **)error
{
    if (count <= [self.wares count]) {
        NSMutableSet *const mutableShipment = [[NSMutableSet alloc] init];
        
        for (NSUInteger index = 0; index < count; ++index) {
            id key = [[self.wares allKeys] objectAtIndex:index];
            [mutableShipment addObject:[self.wares objectForKey:key]];
        }
        for (id<WareProtocol> ware in mutableShipment) {
            [self.wares removeObjectForKey:[ware uniqueIdentifier]];
        }

        return [mutableShipment copy];
    }

    if (!!error) {
        NSDictionary *const userInfo =
            [[NSDictionary alloc] initWithObjectsAndKeys:
                @"There is not enough wares in the warehouse",
                kWarehouseErrorDescription,
             nil];
        (*error) = [NSError errorWithDomain:WarehouseErrorDomain
                                       code:WarehouseErrorCodeNotEnoughWares
                                   userInfo:userInfo];
    }

    return nil;
}

@end
