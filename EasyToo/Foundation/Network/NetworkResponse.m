
#import "NetworkResponse.h"

@implementation NetworkResponse
- (NetworkResponse*)initWithCode:(int)code headers:(NSDictionary*)headers
{
    self = [super init];
    if(self)
    {
        _statusCode = code;
        _headerDict = [[NSDictionary dictionaryWithDictionary:headers] retain];        
    }

    return self;
}
- (void)dealloc
{
    ReleaseAndNil(_headerDict);
    [super dealloc];
}
+ (NetworkResponse*)responseWithCode:(int)code headers:(NSDictionary*)headers
{
    NetworkResponse* res = [[[NetworkResponse alloc] initWithCode:code headers:headers] autorelease];
    return res;
}
- (NSDictionary*) allHeaderFields
{
    return _headerDict;
}
- (int)statusCode
{
    return _statusCode;
}
+ (NSString*)localizedStringForStatusCode:(int)statusCode
{
    return [NSHTTPURLResponse localizedStringForStatusCode:statusCode];
}
@end
