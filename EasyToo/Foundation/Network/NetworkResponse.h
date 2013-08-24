

#import <Foundation/Foundation.h>
#import "NetworkEngine.h"

@interface NetworkResponse : NSObject
{
    int _statusCode;
    NSDictionary* _headerDict;
    
}
+ (NetworkResponse*)responseWithCode:(int)code headers:(NSDictionary*)headers;
- (NSDictionary*) allHeaderFields;
- (int)statusCode;
+ (NSString*)localizedStringForStatusCode:(int)statusCode;
@end
