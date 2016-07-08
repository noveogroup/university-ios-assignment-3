//
//  main.m
//  Factory
//

#import "Factory.h"

int main(int argc, char * argv[])
{
    NSAutoreleasePool *const pool = [[NSAutoreleasePool alloc] init];
    {
        Factory *const factory = [[[Factory alloc] init] autorelease];
        [factory simulateWorkingMonth];
    }
    [pool release];

    return 0;
}
