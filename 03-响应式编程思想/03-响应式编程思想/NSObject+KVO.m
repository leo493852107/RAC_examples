//
//  NSObject+KVO.m
//  03-响应式编程思想
//
//  Created by leo on 17/10/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import "NSObject+KVO.h"
#import "JSKVONotifying_Person.h"

#import <objc/runtime.h>

@implementation NSObject (KVO)

- (void)JS_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context {
    // KVO底层实现：
    // 1.动态创建NSKVONotifying_Person（NSKVONotifying_Person是Person的子类）做KVO
    // 2.修改当前对象的isa指针 -> NSKVONotifying_Person
    // 3.只要调用对象的set方法，就会调用NSKVONotifying_Person的set方法
    // 4.重写NSKVONotifying_Person的set方法，1.[super set:] 2. 通知观察者，告诉你的属性改变了
    
    // 修改isa指针，本质就是改变当前对象的类名
    object_setClass(self, [JSKVONotifying_Person class]);
    
    // 把观察者保存到当前对象里
    
    // 添加关联
    // id object:给哪个对象添加关联属性
    // key 属性名
    // value 关联的值
    objc_setAssociatedObject(self, @"observer", observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    
}

@end
