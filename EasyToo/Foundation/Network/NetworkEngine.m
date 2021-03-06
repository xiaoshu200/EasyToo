#import "NetworkEngine.h"
#import "NetworkOperation.h"
#import "NSObject+PerformSelectorOnMainThreadWithMultiObject.h"

#pragma mark -
#pragma mark implement NetworkEngine
@implementation NetworkEngine
@synthesize operationQueue = _operationQueue;
@synthesize request2OperationDict = _request2OperationDict;
- (id)init
{
    return [self initWithMaxConcurrent:DEFAULT_MAX_CONCURRENT timeoutBySecond:DEFAULT_CONNECTION_TIMEOUT];
}

- (id)initWithMaxConcurrent:(int)maxConcurrent timeoutBySecond:(int)timeout
{
    self = [super init];
    if(self)
    {
        _operationQueue = [[NSOperationQueue alloc] init];
        [_operationQueue setMaxConcurrentOperationCount:maxConcurrent];
        
        _request2OperationDict = [NSMutableDictionary dictionary];
        [_request2OperationDict retain];
        
    }
    return self;
}

- (void)dealloc
{
    ReleaseAndNil(_operationQueue);
    ReleaseAndNil(_request2OperationDict);
    [super dealloc];
}

#pragma mark implement NetworkEngineProtocol
- (BOOL) addNetworkRequest:(NetworkRequest*)request
{
    id obj = [self.request2OperationDict objectForKey:request];
    if(obj!=nil)
    {
        return NO;
    }
    NetworkOperation* op = [[NetworkOperation alloc] initWithRequest:request delegate:self];
    [self.request2OperationDict setObject:op forKey:request];
    [self.operationQueue addOperation:op];
    [op release];
    return YES;
}
- (void) cancelNetworkRequest:(NetworkRequest*)request
{
    id obj = [self.request2OperationDict objectForKey:request];
    if([obj isKindOfClass:[NetworkOperation class]])
    {
        NetworkOperation* op = (NetworkOperation*)obj;
        [op cancel];
        op.delegate = nil;
        [self.request2OperationDict removeObjectForKey:request];
    }
}

#pragma mark implement NetworkEngineDelegate
- (void)onRequestFinish:(NetworkRequest*)request data:(NSData*)data
{
    [self.request2OperationDict removeObjectForKey:request];
    [self performSelectorOnMainThread:@selector(NotifyDelegateRequestFinish:data:) withObject:request withObject:data waitUntilDone:NO];
}


- (void)onRequestFail:(NetworkRequest*)request responseStatusCode:(int)statuscode
{
    [self.request2OperationDict removeObjectForKey:request];
    [self performSelectorOnMainThread:@selector(NotifyDelegateRequestFail:responseStatusCode:) withObject:request withObject:[NSNumber numberWithInt:statuscode]  waitUntilDone:NO];

}

- (void)onRequestProgress:(NetworkRequest*)request total:(long)total downloaded:(long)downloaded
{
    if(request.needProgress && [request.delegate respondsToSelector:@selector(onRequestProgress:total:downloaded:)])
    {
        [self performSelectorOnMainThread:@selector(NotifyDelegateRequestProgress:total:downloaded:) withObject:request withObject:[NSNumber numberWithLong:total] withObject:[NSNumber numberWithLong:downloaded] waitUntilDone:NO];
    }
}

- (void)onSendRequestProgress:(NetworkRequest*)request total:(long)total uploaded:(long)uploaded
{
    if([request.delegate respondsToSelector:@selector(NotifyDelegateSendRequestProgress:total:uploaded:)])
    {
        [self performSelectorOnMainThread:@selector(NNotifyDelegateSendRequestProgress:total:uploaded:) withObject:request withObject:[NSNumber numberWithLong:total] withObject:[NSNumber numberWithLong:uploaded] waitUntilDone:NO];
    }    
}

- (void)onReceiveResponse:(NetworkRequest*)request response:(NetworkResponse*)response
{
    if([request.delegate respondsToSelector:@selector(NotifyDelegateReceiveResponse:response:)])
    {
        [self performSelectorOnMainThread:@selector(NotifyDelegateReceiveResponse:response:) withObject:request withObject:response waitUntilDone:NO];
    }
}


- (void)NotifyDelegateRequestFinish:(NetworkRequest*)request data:(NSData*)data
{
    [request.delegate onRequestFinish:request data:data];
}
- (void)NotifyDelegateRequestFail:(NetworkRequest*)request responseStatusCode:(NSNumber*)statuscode
{
    [request.delegate onRequestFail:request responseStatusCode:[statuscode intValue]];
}
- (void)NotifyDelegateRequestProgress:(NetworkRequest*)request total:(NSNumber*)total downloaded:(NSNumber*)downloaded
{
    [request.delegate onRequestProgress:request total:[total longValue] downloaded:[downloaded longValue]];
}

- (void)NotifyDelegateSendRequestProgress:(NetworkRequest*)request total:(NSNumber*)total uploaded:(NSNumber*)uploaded
{
    [request.delegate onSendRequestProgress:request total:[total longValue] uploaded:[uploaded longValue]];
}

- (void)NotifyDelegateReceiveResponse:(NetworkRequest*)request response:(NetworkResponse*)response
{
    [request.delegate onReceiveResponse:request response:response];
} 
@end

