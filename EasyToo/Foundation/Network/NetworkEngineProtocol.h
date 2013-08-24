
#import <Foundation/Foundation.h>
@class NetworkRequest;
@protocol NetworkEngineProtocol <NSObject> 
@required
- (BOOL) addNetworkRequest:(NetworkRequest*)request;
- (void) cancelNetworkRequest:(NetworkRequest*)request;
@end
