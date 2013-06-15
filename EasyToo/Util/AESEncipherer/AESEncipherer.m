//
//  AESEncipherer.m
//  WeSmile
//
//  Created by Rolf Zhang on 13-4-1.
//  Copyright (c) 2013年 Rolf Zhang. All rights reserved.
//

#import "AESEncipherer.h"

#import "aes.h"
#import "base64.h"

//AES加密
#define  AES_KEY  "18cbd3ced9a56f7w"
#define  AES_KEY_BITS	128

static unsigned char AES_IV[16] = {
	0x00,0x01,0x02,0x03,
	0x04,0x05,0x06,0x07,
	0x08,0x09,0x0A,0x0B,
	0x0C,0x0D,0x0E,0x0F,
};

int PlainLen(int strLen)
{
    if(strLen % 16 != 0)
    {
        return (strLen / 16 + 1) * 16;
    }
    return strLen;
}

@implementation AESEncipherer

+(NSString *)encode:(NSString *)text
{
    int iPlainLen = text.length;
	if(iPlainLen > 1024) { return nil; }
        
	aes_context stAESCtx;
	aes_set_key(&stAESCtx, (unsigned char *)AES_KEY, AES_KEY_BITS);
    
	unsigned char szIVTmp[16] = {0};
	memcpy(szIVTmp,AES_IV,16);
    
	char szCipherTemp[1024] = {0};
	aes_cbc_encrypt(&stAESCtx,szIVTmp, (unsigned char *)[text UTF8String], (unsigned char *)szCipherTemp, iPlainLen);
    
	char *pszBase64 = NULL;
    base64_encode(szCipherTemp, PlainLen(iPlainLen), &pszBase64);
	return [NSString stringWithUTF8String:pszBase64];
}

+(NSString *)decode:(NSString *)cipher
{
    char szPlainText[1024] = {0};
    int iCipher = cipher.length;
	if(iCipher > 1024) { return nil; }
    
	unsigned char szIVTmp[16] = {0};
	memcpy(szIVTmp,AES_IV,16);
    
	//base64解码
	char szPlainTemp[1024] = {0};
	int iPlainLen = base64_decode([cipher UTF8String], szPlainTemp);
	
	aes_context stAESCtx;
	aes_set_key(&stAESCtx, (unsigned char *)AES_KEY, AES_KEY_BITS);
	aes_cbc_decrypt(&stAESCtx,szIVTmp, (unsigned char *)szPlainTemp, (unsigned char *)szPlainText, PlainLen(iPlainLen));
    return [NSString stringWithUTF8String:szPlainText];
}

@end





