//
//  Transporter.h
//  Factory
//

#import "Person.h"

/**
 *  The class represents a simple transporter.
 */
@interface Transporter : Person

/**
 *  Returns the transported cargo.
 */
@property (nonatomic, strong) id cargo;

@end
