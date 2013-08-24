

#import <Foundation/Foundation.h>

@class NetworkRequest;
@class NetworkResponse;

@protocol NetworkEngineDelegate <NSObject>
@required
/*@deprecated*/
- (void)onRequestFinish:(NetworkRequest*)request data:(NSData*)data;
- (void)onRequestFail:(NetworkRequest*)request responseStatusCode:(int)statuscode;

@optional
//服务器返回数据的进度，函数名要改
- (void)onRequestProgress:(NetworkRequest*)request total:(long)total downloaded:(long)downloaded;
//发送post请求的进度
- (void)onSendRequestProgress:(NetworkRequest*)request total:(long)total uploaded:(long)uploaded;
//收到http请求的头
- (void)onReceiveResponse:(NetworkRequest*)request response:(NetworkResponse*)response;

@end
