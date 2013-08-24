
#import <Foundation/Foundation.h>
#import "NetworkRequest.h"
#import "NetworkEngineDelegate.h"
@interface NetworkOperation : NSOperation

@property (nonatomic,retain) NetworkRequest* request;
@property (nonatomic,assign) id<NetworkEngineDelegate> delegate;
@property (nonatomic,retain) NSMutableData* data;
@property (nonatomic,assign) long datalength;

@property (atomic,assign) BOOL bKeepRunLoop;

- (id)initWithRequest:(NetworkRequest*)req delegate:(id<NetworkEngineDelegate>)dele;
@end
