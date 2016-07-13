//
//  main.m
//  Factory
//

#import "Factory.h"

int main(int argc, char * argv[])
{
    NSAutoreleasePool *const pool = [[NSAutoreleasePool alloc] init];
    {
        Factory *const factory = [[Factory alloc] init];
        [factory simulateWorkingMonth];
        [factory release];
    }
    [pool release];

    while(1) {
        sleep(1);
    }
    return 0;
}
