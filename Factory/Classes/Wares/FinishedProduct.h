//
//  FinishedProduct.h
//  Factory
//

#import "MemoryPayload.h"
#import "WareProtocol.h"

@interface FinishedProduct : MemoryPayload
    <WareProtocol>

- (id)init;
- (id)initWithRawMaterials:(NSSet *)rawMaterials;

@end
