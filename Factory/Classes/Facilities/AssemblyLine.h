//
//  AssemblyLine.h
//  Factory
//

#import "LocationProtocol.h"

@class FinishedProduct;

@interface AssemblyLine : NSObject <LocationProtocol>

@property (nonatomic, getter = latitude) float latitude;
@property (nonatomic, getter = longitude) float longitude;

- (FinishedProduct *)processRawMaterials:(NSSet *)rawMaterials;

@end
