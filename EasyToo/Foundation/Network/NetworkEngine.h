#import <Foundation/Foundation.h>
#import "NetworkEngineProtocol.h"
#import "NetworkEngineDelegate.h"

#define DEFAULT_MAX_CONCURRENT 3
#define DEFAULT_CONNECTION_TIMEOUT 15

#define ReleaseAndNil(x) [x release];x=nil;


@interface NetworkEngine : NSObject<NetworkEngineProtocol,NetworkEngineDelegate>

@property (nonatomic,retain) NSOperationQueue* operationQueue;
@property (atomic,retain) NSMutableDictionary* request2OperationDict;
- (id)initWithMaxConcurrent:(int)maxConcurrent timeoutBySecond:(int)timeout;

@end
