//
//  ViewController.m
//  03-响应式编程思想
//
//  Created by leo on 17/10/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+KVO.h"

@interface ViewController ()

/** person */
@property (nonatomic, strong) Person *p;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *p = [[Person alloc] init];
    _p = p;
    
    // 添加观察者
//    [p addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];

    [p JS_addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    
    // 1.只要p的age属性一改变，就会调用观察者的observeValueForKeyPath
    
    // KVO底层实现：
    // 1.动态创建NSKVONotifying_Person（NSKVONotifying_Person是Person的子类）做KVO
    // 2.修改当前对象的isa指针 -> NSKVONotifying_Person
    // 3.只要调用对象的set方法，就会调用NSKVONotifying_Person的set方法
    // 4.重写NSKVONotifying_Person的set方法，1.[super set:] 2. 通知观察者，告诉你的属性改变了
    
    // 就是去判断有没有调用一个对象的set方法
    
}

#pragma mark - 监听的属性只要一改变就调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%d", _p.age);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _p.age++;
    
//    _p -> _age ++;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
