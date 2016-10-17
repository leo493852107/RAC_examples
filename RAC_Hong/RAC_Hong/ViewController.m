//
//  ViewController.m
//  RAC_Hong
//
//  Created by leo on 17/10/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import "ViewController.h"

#import "ReactiveCocoa.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textField;

/** signal */
@property (nonatomic, strong) RACSignal *signal;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [_textField.rac_textSignal subscribeNext:^(id x) {
//        _label.text = x;
//    }];
    
    // RAC:把一个对象的某个属性绑定一个信号，只要发出信号，就会把信号的内容给对象的属性赋值
    // 给label的text属性绑定了文本框改变的信号
    RAC(self.label, text) = _textField.rac_textSignal;
    
    // KVO
    // RACObserve:快速地监听某个对象的属性改变
    // 返回的是一个信号，对象的某个属性改变的信号
    [RACObserve(self.view, center) subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    
    // 3.
    // 把self转换成弱指针
    @weakify(self);
    // 创建信号
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        @strongify(self);
        NSLog(@"%@", self.view);
        
        return nil;
    }];
    
    _signal = signal;
    
    
    // 4.元组
    // 快速包装一个元组
    RACTuple *tuple = RACTuplePack(@1,@3);
    NSLog(@"%@", tuple);
    
    // 快速解析一个元组对象
    // 等号右边表示解析哪个元组
    // 宏的参数:表示解析成什么
    RACTupleUnpack(NSNumber *num1, NSNumber *num2) = tuple;
    NSLog(@"%@ %@",num1, num2);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
