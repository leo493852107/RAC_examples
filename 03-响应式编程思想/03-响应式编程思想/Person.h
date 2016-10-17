//
//  Person.h
//  03-响应式编程思想
//
//  Created by leo on 17/10/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    @public
    int _age;
}

/** age */
@property (nonatomic, assign) int age;


@end
