//
//  PQPerson.m
//  PQMsgForwardDemo
//
//  Created by wenpq on 2019/2/25.
//  Copyright © 2019年 wenpq. All rights reserved.
//

#import "PQPerson.h"
#import <objc/runtime.h>
#import "PQStudent.h"
#import "PQWorker.h"

@implementation PQPerson

void exceptionHandle() {
    //在这里统一处理崩溃，比如获取到当前nav，跳转到一个错误页面
    NSLog(@"wenpq...resolve handle");
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(wolk)) {
        class_addMethod(self, sel, (IMP)exceptionHandle, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    
    if (aSelector == @selector(study:)) {
        PQStudent *student = [[PQStudent alloc] init];
        if ([student respondsToSelector:aSelector]) {
            return student;
        }
    }
    return [super forwardingTargetForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    if (anInvocation.selector == @selector(workWith:)) {
        PQWorker *worker = [[PQWorker alloc] init];
        if ([worker respondsToSelector:anInvocation.selector]) {
            [anInvocation invokeWithTarget:worker];
        }
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(workWith:)) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
    [super doesNotRecognizeSelector:aSelector];
}

@end
