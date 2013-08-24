
#import "NetworkRequest.h"
#import "NetworkEngine.h"
#import "NSMutableDictionary+Addition.h"

#define TCUTF8DataFromString(str) [str dataUsingEncoding:NSUTF8StringEncoding]
@interface NetworkRequest (Private)

- (id)initWithUrl:(NSString*)url method:(NSString*)method data:(NSDictionary*)data cookie:(NSDictionary*)cookie header:(NSDictionary*)header priority:(NETWORK_REQUEST_PRIORITY)priority delegate:(id<NetworkEngineDelegate>)delegate version:(int)version;
+ (NSString*)encodeURL:(NSString *)string;

@end;
@implementation NetworkRequest (Private)
- (id)initWithUrl:(NSString*)url method:(NSString*)method data:(NSDictionary*)data cookie:(NSDictionary*)cookie header:(NSDictionary*)header priority:(NETWORK_REQUEST_PRIORITY)priority delegate:(id<NetworkEngineDelegate>)delegate version:(int)version
{
    if(url==nil || method==nil)
    {
        return nil;
    }
    self = [super init];
    if(self)
    {
        self.url = url;
        self.method = method;
        self.dataDict = [NSMutableDictionary dictionaryWithDictionary:data];
        //self.dataDict = [[[NSMutableDictionary alloc] initWithCapacity:1] autorelease];
        //_dataDict = [[NSMutableDictionary alloc] initWithCapacity:1];
        self.cookieDict = [NSMutableDictionary dictionaryWithDictionary:cookie];
        self.headerDict = [NSMutableDictionary dictionaryWithDictionary:header];;
        self.priority = priority; 
        self.delegate = delegate;
        self.protocolVersion = version;
        self.needProgress = NO;
    }
    
    return self;
}

+ (NSString*)encodeURL:(NSString *)string
{
    CFStringRef str = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)string, NULL, CFSTR(":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`"), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
	NSString *newString = [NSMakeCollectable(str) autorelease];//NSMakeCollectable(str);//
	if (newString) {
		return newString;
	}
	return string;
}
@end

@implementation NetworkRequest
@synthesize url = _url;
@synthesize method = _method;
@synthesize dataDict = _dataDict;
@synthesize postFormat = _postFormat; 
@synthesize binaryDataArray = _binaryDataArray;
@synthesize fileDataArray = _fileDataArray;
@synthesize cookieDict = _cookieDict;
@synthesize headerDict = _headerDict;
@synthesize priority = _priority;
@synthesize delegate = _delegate;
@synthesize protocolVersion = _protocolVersion;

@synthesize urlConnection = _urlConnection;
@synthesize needProgress = _needProgress;

- (id)initWithUrl:(NSString*)url method:(NSString*)method delegate:(id<NetworkEngineDelegate>)delegate version:(int)version
{
    return [self initWithUrl:url method:method  data:nil delegate:delegate version:version];
}
- (id)initWithUrl:(NSString*)url method:(NSString*)method priority:(NETWORK_REQUEST_PRIORITY)priority delegate:(id<NetworkEngineDelegate>)delegate version:(int)version
{
    return [self initWithUrl:url method:method data:nil priority:priority delegate:delegate version:version];
}

- (id)initWithUrl:(NSString*)url method:(NSString*)method data:(NSDictionary*)data delegate:(id<NetworkEngineDelegate>)delegate version:(int)version
{
    return [self initWithUrl:url method:method data:data cookie:nil header:nil priority:NORMAL_NETWORK_REQUEST_PRIORITY delegate:delegate version:version];
}
- (id)initWithUrl:(NSString*)url method:(NSString*)method data:(NSDictionary*)data priority:(NETWORK_REQUEST_PRIORITY)priority delegate:(id<NetworkEngineDelegate>)delegate version:(int)version
{
    return [self initWithUrl:url method:method data:data cookie:nil header:nil priority:priority delegate:delegate version:version];
}


- (void)dealloc
{
    ReleaseAndNil(_url);
    ReleaseAndNil(_method);
    ReleaseAndNil(_dataDict);
    ReleaseAndNil(_binaryDataArray);
    ReleaseAndNil(_fileDataArray);
    ReleaseAndNil(_cookieDict);
    ReleaseAndNil(_headerDict);
    ReleaseAndNil(_urlConnection);
    self.delegate = nil;
    [super dealloc];
}

- (NSURLConnection*)getCurrentConnection
{
    return self.urlConnection;
}
- (NSURLConnection*)makeURLConnectionWithDelegate:(id)urlConnectionDelegate;
{
    ReleaseAndNil(_urlConnection);
    
    //NSString* turl = self.url;
    //LOGA(@"Req url = %@",turl);
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:DEFAULT_CONNECTION_TIMEOUT];
    [request setHTTPMethod:self.method];
    if(self.headerDict!=nil)
    {
        for(id key in self.headerDict.keyEnumerator)
        {
            id value = [self.headerDict objectForKey:key];
            if([key isKindOfClass:[NSString class]] && [value isKindOfClass:[NSString class]])
            {
                [request setValue:key forHTTPHeaderField:value];
            }
        }
    }
    
    //TODO cookie自动存储稍晚补上
    if(self.cookieDict!=nil)
    {
        NSString *cookieHeader = nil;
        for(id key in self.cookieDict.keyEnumerator)
        {
            id value = [self.cookieDict objectForKey:key];
            if([key isKindOfClass:[NSString class]] && [value isKindOfClass:[NSString class]])
            {
                if (cookieHeader==nil) {
                    cookieHeader = [NSString stringWithFormat: @"%@=%@",key,value];
                } else {
                    cookieHeader = [NSString stringWithFormat: @"%@; %@=%@",cookieHeader,key,value];
                }
            }
        }
        if(cookieHeader!=nil && [cookieHeader length]>0)
        {
            [request setValue:@"Cookie" forHTTPHeaderField:cookieHeader];
        }
    }

    BOOL isOnlyStringKeyValue = (self.dataDict!=nil && (self.binaryDataArray==nil||self.binaryDataArray.count==0) && (self.fileDataArray==nil||self.fileDataArray.count==0));
    if(isOnlyStringKeyValue)
    {
        NSString* dataString = nil;
        for(id key in self.dataDict.keyEnumerator)
        {
            id value = [self.dataDict objectForKey:key];
            if([key isKindOfClass:[NSString class]] && [value isKindOfClass:[NSString class]])
            {
                NSString* encodedKey = nil;
                NSString* encodedVal = nil;
                encodedKey = [NetworkRequest encodeURL:key];
                encodedVal = [NetworkRequest encodeURL:value];
                if(dataString==nil)
                {
                    dataString = [NSString stringWithFormat: @"%@=%@",encodedKey,encodedVal];                    
                }
                else
                {
                    dataString = [NSString stringWithFormat: @"%@&%@=%@",dataString,encodedKey,encodedVal];        
                }
            }
        }
        
        if(dataString!=nil && [dataString length]!=0)
        {
            if([self.method isEqualToString:HTTP_POST])
            {
                NSString *charset = (NSString *)CFStringConvertEncodingToIANACharSetName(CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
                [request setValue:[NSString stringWithFormat:@"application/x-www-form-urlencoded; charset=%@",charset] forHTTPHeaderField:@"Content-Type"];
                [request setHTTPBody:TCUTF8DataFromString(dataString)];
            }else//get
            {
                NSString* newGetUrl = nil;
                NSString* encodedDataString = dataString;//[NetworkRequest encodeURL:dataString];//
                if([self.url rangeOfString:@"?"].location == NSNotFound)
                {
                    newGetUrl = [NSString stringWithFormat:@"%@?%@",self.url,encodedDataString];
                    
                }
                else
                {
                    newGetUrl = [NSString stringWithFormat:@"%@&%@",self.url,encodedDataString];
                    
                }
                [request setURL:[NSURL URLWithString:newGetUrl]];
            }
        }

    }else{
        //有二进制数据，即使设置方法为HttpGet，也会强制修改为HttpPost
        self.method = HTTP_POST;
        
        NSString *charset = (NSString *)CFStringConvertEncodingToIANACharSetName(CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
        
        //http头中boundary设置
        NSString *stringBoundary = @"0xKhTmLbOuNdArY";
        [request setValue:[NSString stringWithFormat:@"multipart/form-data; charset=%@; boundary=%@", charset, stringBoundary] forHTTPHeaderField:@"Content-Type"];
        
        
        NSMutableData* httpBodyData = [[[NSMutableData alloc] initWithLength:0] autorelease];
        [httpBodyData appendData:TCUTF8DataFromString(([NSString stringWithFormat:@"--%@\r\n",stringBoundary]))];

        NSString *endItemBoundary = [NSString stringWithFormat:@"\r\n--%@\r\n",stringBoundary];
        NSString *allItemsEndBoundary = [NSString stringWithFormat:@"\r\n--%@--\r\n",stringBoundary];
        
        int keycount = 0;
        for(id key in self.dataDict.keyEnumerator)
        {
            id value = [self.dataDict objectForKey:key];
            if([key isKindOfClass:[NSString class]] && [value isKindOfClass:[NSString class]])
            {
                keycount++;
                NSString* contentDipsotion = [NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",key];
                [httpBodyData appendData:TCUTF8DataFromString(contentDipsotion)];
                [httpBodyData appendData:TCUTF8DataFromString(value)];
                if([_binaryDataArray count]>0 || [_fileDataArray count]>0 || keycount<[_dataDict count])
                {//还有数据要添加
                    [httpBodyData appendData:TCUTF8DataFromString(endItemBoundary)];
                }
                
            }
        }
        
        
        if(_binaryDataArray)
        {
            for(int i=0;i<[_binaryDataArray count];++i)
            {
                NSDictionary* dict = [_binaryDataArray objectAtIndex:i];
                NSString* key = [dict objectForKey:@"key"];
                NSData* data = [dict objectForKey:@"data"];
                NSString* filename = [dict objectForKey:@"fileName"];
                NSString* contenttype = [dict objectForKey:@"contentType"];
                if([key isKindOfClass:[NSString class]] && [data isKindOfClass:[NSData class]])
                {
                    [httpBodyData appendData:TCUTF8DataFromString(([NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n", key, filename]))];
                    [httpBodyData appendData:TCUTF8DataFromString(([NSString stringWithFormat:@"Content-Type: %@\r\n\r\n", contenttype]))];
                    [httpBodyData appendData:data];
                    if([_fileDataArray count]>0 || (i+1)<[_binaryDataArray count])
                    {//还有数据要添加
                        [httpBodyData appendData:TCUTF8DataFromString(endItemBoundary)];
                    }    
                }
            }
        }
        
        if(_fileDataArray)
        {
            for(int i=0;i<[_fileDataArray count];++i)
            {
                NSDictionary* dict = [_fileDataArray objectAtIndex:i];
                NSString* key = [dict objectForKey:@"key"];
                NSString* filepath = [dict objectForKey:@"data"];
                NSString* filename = [dict objectForKey:@"fileName"];
                NSString* contenttype = [dict objectForKey:@"contentType"];
                
                NSData* fileData = [NSData dataWithContentsOfFile:filepath];
                if(fileData==nil)
                {
                    continue;
                }
                [httpBodyData appendData:TCUTF8DataFromString(([NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n", key, filename]))];
                [httpBodyData appendData:TCUTF8DataFromString(([NSString stringWithFormat:@"Content-Type: %@\r\n\r\n", contenttype]))];
                [httpBodyData appendData:fileData];
                
                if((i+1)<[_fileDataArray count])
                    [httpBodyData appendData:TCUTF8DataFromString(endItemBoundary)];
                
            }
        }
        
        [httpBodyData appendData:TCUTF8DataFromString(allItemsEndBoundary)];
        
        [request setHTTPBody:httpBodyData];
        
    }

    //NSURLConnection* connection = [NSURLConnection connectionWithRequest:request delegate:urlConnectionDelegate];
    NSURLConnection* connection = [[NSURLConnection alloc] initWithRequest:request delegate:urlConnectionDelegate startImmediately:NO];
    _urlConnection = connection;
    [_urlConnection retain];
    [connection release];
    return self.urlConnection;
}

- (void)setStringData:(NSString*)data withKey:(NSString*)key
{
    if(_dataDict==nil)
    {
        _dataDict = [[NSMutableDictionary alloc] init];
    }

    [self.dataDict setNonEmptyObject:data forKey:key];
}
- (void)setBinaryData:(NSData*)data withKey:(NSString*)key
{
    [self setBinaryData:data withFilename:@"file" withContentType:nil withKey:key];
}
- (void)setBinaryData:(NSData*)data withFilename:(NSString*)filename withContentType:(NSString*)contentType withKey:(NSString*)key
{
    if(data==nil || key==nil)
        return;
    
    if(_binaryDataArray==nil)
    {
        _binaryDataArray = [[NSMutableArray alloc] init];
    }
    
    if(filename==nil)
        filename = @"file";
    if(contentType==nil)
        contentType = @"application/octet-stream";
    
    NSDictionary *datainfo = [NSDictionary dictionaryWithObjectsAndKeys:data, @"data", contentType, @"contentType", filename, @"fileName", key, @"key", nil];
    for(int i=0;i<[_binaryDataArray count];i++)
    {
        NSDictionary* tmp = [_binaryDataArray objectAtIndex:i];
        if([[tmp objectForKey:@"key"] isEqual:key])
        {
            [_binaryDataArray replaceObjectAtIndex:i withObject:datainfo];
            return;
        }
    }
    //没有重复key
    [_binaryDataArray addObject:datainfo];
}
- (void)setFileData:(NSString*)filepath withKey:(NSString*)key
{
    [self setFileData:filepath withFilename:@"file" withContentType:nil withKey:key];
    
}
- (void)setFileData:(NSString*)filepath withFilename:(NSString*)filename withContentType:(NSString*)contentType withKey:(NSString*)key
{
    if(filepath==nil || key==nil)
        return;
    
    if(_fileDataArray==nil)
    {
        _fileDataArray = [[NSMutableArray alloc] init];
    }    
    
    if(filename==nil)
        filename = @"file";
    if(contentType==nil)
        contentType = @"application/octet-stream";
    
    NSDictionary *fileinfo = [NSDictionary dictionaryWithObjectsAndKeys:filepath, @"data", contentType, @"contentType", filename, @"fileName", key, @"key", nil];
    for(int i=0;i<[_fileDataArray count];i++)
    {
        NSDictionary* tmp = [_binaryDataArray objectAtIndex:i];
        if([[tmp objectForKey:@"key"] isEqual:key])
        {
            [_fileDataArray replaceObjectAtIndex:i withObject:fileinfo];
            return;
        }
    }
    //没有重复key
    [_fileDataArray addObject:fileinfo];
}

- (void)setHeader:(NSString*)value key:(NSString*)key
{
    if(_headerDict==nil)
    {
        _headerDict = [[NSMutableDictionary alloc] init];
    }
    
    [_headerDict setNonEmptyObject:value forKey:key];
}
- (void)setCookie:(NSString*)value key:(NSString*)key
{
    if(_cookieDict==nil)
    {
        _cookieDict = [[NSMutableDictionary alloc] init];
    }
    
    [_cookieDict setNonEmptyObject:value forKey:key];
    
}

#pragma mark NSCopying
- (id)copyWithZone:(NSZone *)zone
{
    [self retain];
    return self;
}

@end
