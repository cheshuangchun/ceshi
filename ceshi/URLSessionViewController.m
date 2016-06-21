//
//  URLSessionViewController.m
//  ceshi
//
//  Created by csc on 16/3/25.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "URLSessionViewController.h"
#import "AFSecurityPolicy.h"
@interface URLSessionViewController ()<NSURLSessionDataDelegate>
@property (strong, nonatomic) NSArray * trustedCerArr;
@end

@implementation URLSessionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getRequest];
}

-(void)getRequest
{
    
    
    //导入客户端证书
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"server" ofType:@"cer"];
    NSData *data = [NSData dataWithContentsOfFile:cerPath];
    SecCertificateRef certificate = SecCertificateCreateWithData(NULL, (__bridge CFDataRef) data);
    self.trustedCerArr = @[(__bridge_transfer id)certificate];
    

    NSString * url = @"https://www.ulpay.com/ulpaymobile";
    NSURL * nUrl = [NSURL URLWithString:url];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:nUrl];
    [request setHTTPMethod:@"POST"];
    NSDictionary *headerDict=  @{@"deviceOs":@"iPhone OS",
                                 @"apiCode":@"app4080010In",
                                 @"version":@"5",
                                 @"userNo":@"0",
                                 @"platForm":@"3",
                                 @"deviceName":@"iPhone Simulator",
                                 /*@"MCID":@"",*/
                                 @"email":@"",
                                 
                                 @"deviceId":@"CB7C91C942CE42FFAFA84FB34CB8BA39",
                                 
                                 };

    NSDictionary * bodyDic = @{@"fixCurrentType":@"02",@"pageNumber":[NSNumber numberWithInteger:1],@"pageSize":[NSNumber numberWithInteger:1]};
    NSDictionary *dic =[NSDictionary dictionary];
    dic = @{@"body":bodyDic, @"requestHeader":headerDict};
    NSDictionary *theParam = @{@"app5080015In":dic};
    NSData *data1 =    [NSJSONSerialization dataWithJSONObject:theParam options:NSJSONWritingPrettyPrinted error:nil];
    [request setHTTPBody:data1];
    
    //构造Session
//    NSURLSession * session = [NSURLSession sharedSession];
//    //task
//    NSURLSessionDataTask * task =  [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        NSLog(@"response : %@", response);
//    }];
//    [task resume];
    
    //NSURL *testURL = [NSURL URLWithString:nUrl];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request];
    [task resume];
    
    
}

#pragma mark - NSURLSessionDelegate
- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
 completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * __nullable credential))completionHandler{
    
    OSStatus err;
    NSURLSessionAuthChallengeDisposition disposition = NSURLSessionAuthChallengePerformDefaultHandling;
    SecTrustResultType  trustResult = kSecTrustResultInvalid;
    NSURLCredential *credential = nil;
    
    //获取服务器的trust object
    SecTrustRef serverTrust = challenge.protectionSpace.serverTrust;
    //将读取的证书设置为serverTrust的根证书
    err = SecTrustSetAnchorCertificates(serverTrust, (__bridge CFArrayRef)self.trustedCerArr);
    
    if(err == noErr){
        //通过本地导入的证书来验证服务器的证书是否可信，如果将SecTrustSetAnchorCertificatesOnly设置为NO，则只要通过本地或者系统证书链任何一方认证就行
        err = SecTrustEvaluate(serverTrust, &trustResult);
    }
    
    if (err == errSecSuccess && (trustResult == kSecTrustResultProceed || trustResult == kSecTrustResultUnspecified)){
        //认证成功，则创建一个凭证返回给服务器
        disposition = NSURLSessionAuthChallengeUseCredential;
        credential = [NSURLCredential credentialForTrust:serverTrust];
    }
    else{
        disposition = NSURLSessionAuthChallengeCancelAuthenticationChallenge;
    }
    
    //回调凭证，传递给服务器
    if(completionHandler){
        completionHandler(disposition, credential);
    }
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data{
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"%@", result);
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task
didCompleteWithError:(nullable NSError *)error{
    if(error){
        NSLog(@"%@", error);
    }
}

//- (BOOL)evaluateServerTrust:(SecTrustRef)serverTrust
//                  forDomain:(NSString *)domain
//{
//    //当使用自建证书验证域名时，需要使用AFSSLPinningModePublicKey或者AFSSLPinningModeCertificate
//    if (domain && self.allowInvalidCertificates && self.validatesDomainName && (self.SSLPinningMode == AFSSLPinningModeNone || [self.pinnedCertificates count] == 0)) {
//        NSLog(@"In order to validate a domain name for self signed certificates, you MUST use pinning.");
//        return NO;
//    }
//    
//    NSMutableArray *policies = [NSMutableArray array];
//    //需要验证域名时，需要添加一个验证域名的策略
//    if (self.validatesDomainName) {
//        [policies addObject:(__bridge_transfer id)SecPolicyCreateSSL(true, (__bridge CFStringRef)domain)];
//    } else {
//        [policies addObject:(__bridge_transfer id)SecPolicyCreateBasicX509()];
//    }
//    
//    //设置验证的策略，可以是多个
//    SecTrustSetPolicies(serverTrust, (__bridge CFArrayRef)policies);
//    //SSLPinningMode为AFSSLPinningModeNone时，allowInvalidCertificates为YES，则代表服务器任何证书都能验证通过；如果它为NO，则需要判断此服务器证书是否是系统信任的证书
//    if (self.SSLPinningMode == AFSSLPinningModeNone) {
//        if (self.allowInvalidCertificates || AFServerTrustIsValid(serverTrust)){
//            return YES;
//        } else {
//            return NO;
//        }
//    } else if (!AFServerTrustIsValid(serverTrust) && !self.allowInvalidCertificates) {
//        return NO;
//    }
//    
//    //获取服务器证书的内容
//    NSArray *serverCertificates = AFCertificateTrustChainForServerTrust(serverTrust);
//    switch (self.SSLPinningMode) {
//        case AFSSLPinningModeNone:
//        default:
//            return NO;
//        case AFSSLPinningModeCertificate: {
//            //AFSSLPinningModeCertificate是直接将本地的证书设置为信任的根证书，然后来进行判断，并且比较本地证书的内容和服务器证书内容是否相同，如果有一个相同则返回YES
//            
//            NSMutableArray *pinnedCertificates = [NSMutableArray array];
//            for (NSData *certificateData in self.pinnedCertificates) {
//                [pinnedCertificates addObject:(__bridge_transfer id)SecCertificateCreateWithData(NULL, (__bridge CFDataRef)certificateData)];
//            }
//            //设置本地的证书为根证书
//            SecTrustSetAnchorCertificates(serverTrust, (__bridge CFArrayRef)pinnedCertificates);
//            
//            //通过本地的证书来判断服务器证书是否可信，不可信，则验证不通过
//            if (!AFServerTrustIsValid(serverTrust)) {
//                return NO;
//            }
//            
//            //判断本地证书和服务器证书的内容是否相同
//            NSUInteger trustedCertificateCount = 0;
//            for (NSData *trustChainCertificate in serverCertificates) {
//                if ([self.pinnedCertificates containsObject:trustChainCertificate]) {
//                    trustedCertificateCount++;
//                }
//            }
//            return trustedCertificateCount > 0;
//        }
//        case AFSSLPinningModePublicKey: {
//            //AFSSLPinningModePublicKey是通过比较证书当中公钥(PublicKey)部分来进行验证，通过SecTrustCopyPublicKey方法获取本地证书和服务器证书，然后进行比较，如果有一个相同，则通过验证
//            NSUInteger trustedPublicKeyCount = 0;
//            NSArray *publicKeys = AFPublicKeyTrustChainForServerTrust(serverTrust);
//            //判断服务器证书的公钥与本地的证书公钥是否相同，相同则客户端认证通过
//            for (id trustChainPublicKey in publicKeys) {
//                for (id pinnedPublicKey in self.pinnedPublicKeys) {
//                    if (AFSecKeyIsEqualToKey((__bridge SecKeyRef)trustChainPublicKey, (__bridge SecKeyRef)pinnedPublicKey)) {
//                        trustedPublicKeyCount += 1;
//                    }
//                }
//            }
//            return trustedPublicKeyCount > 0;
//        }
//    }
//    return NO;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
