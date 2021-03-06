

#import "NetworkOperation.h"

@implementation NetworkOperation
@synthesize request = _request;
@synthesize data = _data;
@synthesize datalength = _datalength;
@synthesize delegate = _delegate;
@synthesize bKeepRunLoop = _bKeepRunLoop;

- (id)initWithRequest:(NetworkRequest*)req delegate:(id<NetworkEngineDelegate>)dele;
{
    if(req==nil)
        return nil;
    self = [super init];
    if(self)
    {
        self.request = req;
        self.delegate = dele;
        self.bKeepRunLoop = NO;
    }
    return self;
}

- (void)dealloc
{
    self.data = nil;
    self.request = nil;
    self.delegate = nil;
    [super dealloc];
}

- (void)main
{
    NSURLConnection* connection = [self.request getCurrentConnection];
    if(connection==nil)
        connection = [self.request makeURLConnectionWithDelegate:self];
    if(connection==nil)
    {//通知错误 TODO
        [self.delegate onRequestFail:self.request responseStatusCode:-1];
        return;
    }
    
    //[connection scheduleInRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    [connection start];
    self.bKeepRunLoop = YES;
    while(self.bKeepRunLoop)
    {
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];//每秒检查
    }
}

- (BOOL)checkIsCancelled:(NSURLConnection*)connection
{
    if([self isCancelled])
    {//一定时NetworkEngine取消的，所以不用通知
        [connection cancel];
        return YES;
    }
    return NO;
}

#pragma mark -
#pragma mark NSURLConnection回调
#pragma mark - NSUrlConnectionDelegate
-(void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse*)response
{  
    if([self checkIsCancelled:connection])
        return;
    
    self.data = [NSMutableData data];
    self.datalength = [response expectedContentLength];//NSURLResponseUnknownLength
    
    int statusCode = ((NSHTTPURLResponse*)response).statusCode;
    if(statusCode>=400)
    {
        [connection cancel];
        [self.delegate onRequestFail:self.request responseStatusCode:statusCode];
        return;
    }
    
    NetworkResponse* res = [NetworkResponse responseWithCode:((NSHTTPURLResponse*)response).statusCode headers:((NSHTTPURLResponse*)response).allHeaderFields];
    [self.delegate onReceiveResponse:self.request response:res];
}

//发送进度回调
- (void)connection:(NSURLConnection *)connection didSendBodyData:(NSInteger)bytesWritten totalBytesWritten:(NSInteger)totalBytesWritten totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite
{
    if([self checkIsCancelled:connection])
        return;
    [self.delegate onSendRequestProgress:self.request total:totalBytesExpectedToWrite uploaded:totalBytesWritten];
}

-(void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)data
{
    if([self checkIsCancelled:connection])
        return;
    
    [self.data appendData:data];
    
    if(self.datalength!=NSURLResponseUnknownLength)
    {//通知进度
        [self.delegate onRequestProgress:self.request total:self.datalength downloaded:[self.data length]];
    }

}

-(void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error
{
    self.bKeepRunLoop = NO;
    
    if([self checkIsCancelled:connection])
        return;
    
    //通知上层http返回失败
    [self.delegate onRequestFail:self.request responseStatusCode:[error code]];//TODO 这里的errorcode是什么？？
    
}

-(void)connectionDidFinishLoading:(NSURLConnection*)connection
{
    self.bKeepRunLoop = NO;
    
    if([self checkIsCancelled:connection])
        return;
    
    //通知上层http返回成功
    [self.delegate onRequestFinish:self.request data:self.data];

}

@end
