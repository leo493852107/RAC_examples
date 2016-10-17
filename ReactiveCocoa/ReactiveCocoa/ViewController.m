//
//  ViewController.m
//  ReactiveCocoa
//
//  Created by leo on 17/10/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import "ViewController.h"

#import "ReactiveCocoa.h"
#import "RedView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;

/** age */
@property (nonatomic, assign) int age;

@property (weak, nonatomic) IBOutlet RedView *redView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建一个热门商品的信号
    RACSignal *signaA = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        // 处理信号
        NSLog(@"请求热门商品");
        
        // 发送数据
        [subscriber sendNext:@"热门商品"];
        
        return nil;
    }];
    
    // 创建一个全新商品的信号
    RACSignal *signaB = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        // 处理信号
        NSLog(@"请求全新商品");
        
        // 发送数据
        [subscriber sendNext:@"最新商品"];
        
        return nil;
    }];

    // RAC:就可以判断两个信号有没有都发出内容
    // SignalsFromArray:监听哪些信号的发出
    // 当signals数组中所有的信号都发送sendNext就会触发调用(self)的selector
    // 注意：selector方法的参数不能乱写， 有几个信号就对应几个参数
    // 不需要主动订阅signalA,signalB，方法内部会自动订阅
    [self rac_liftSelector:@selector(updateUIWithHot:New:) withSignalsFromArray:@[signaA,signaB]];
    
}

// 更新UI
- (void)updateUIWithHot:(NSString *)hot New:(NSString *)new {
    NSLog(@"更新UI");
}

- (void)textchange {
    // 5.直接获取文本框文字改变的信号
    [_textField.rac_textSignal  subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
}

- (void)Notification {
    // 4.监听通知
    // 只要发出这个通知，又会转换成一个信号
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardWillShowNotification object:nil] subscribeNext:^(id x) {
        NSLog(@"弹出键盘");
    }];
}

- (void)event {
    // 3.监听事件
    // 只要产生UIControlEventTouchUpInside就会转换成信号
    [[_btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"点击了按钮");
    }];
}

- (void)KVO {
    // 2.KVO
    // 监听哪个对象的属性改变
    // 方法调用者：就是被监听的对象
    // KeyPath:监听的属性
    
    // 把监听到的内容转换成信号
    [[self rac_valuesForKeyPath:@"age" observer:nil] subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // block:只要属性改变就会调用，并且把改变的值传递给你
    self.age++;
}

// 1.RAC替换代理
- (void)delegate {
    // 1.RAC替换代理
    // RAC:判断下一个方法有没有调用，如果调用了就会自动发送一个信号给你
    
    // 把self对象调用viewDidLoad这个方法，转化成一个信号
    // 监听_redView有没有调用btnClick:，如果调用了就会转换成信号
    [[_redView rac_signalForSelector:@selector(btnClick:)] subscribeNext:^(id x) {
        NSLog(@"click red view");
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
