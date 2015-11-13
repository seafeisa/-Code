//
//  ViewController.m
//  01-xmlparserDemo
//
//  Created by qingyun on 15/11/13.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"
#import "BookMode.h"
#import "GDataXMLNode.h"



@interface ViewController ()<NSXMLParserDelegate>
@property(nonatomic,strong)NSMutableArray *bookArr;
@property(nonatomic,strong)BookMode *mode;
@property(nonatomic,strong)NSString *tempStr;
@end

@implementation ViewController

-(void)saxCcick{
 //1读取xml path
    NSString *xmlPath=[[NSBundle mainBundle] pathForResource:@"bookstore" ofType:@"xml"];
    NSURL *url=[NSURL fileURLWithPath:xmlPath];
   
    //2创建解析器对象
    NSXMLParser *parser=[[NSXMLParser alloc] initWithContentsOfURL:url];
//3 设置委托
    parser.delegate=self;
  
 //4 开始解析
    if (![parser parse]) {
        NSLog(@"=====解析失败");
    }
}

#pragma mark nsxmlParserDelegate
//解析开始 创建存储对象数组
-(void)parserDidStartDocument:(NSXMLParser *)parser{
    _bookArr=[NSMutableArray array];
}
//解析开始标签的调用，初始化模型，将元素的属性存储到模型
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    if ([elementName isEqualToString:@"book"]) {
        //初始化模型
        _mode=[BookMode new];
        
        _mode.category=attributeDict[@"category"];
    }else if([elementName isEqualToString:@"title"]){
        _mode.lang=attributeDict[@"lang"];
    }

}
//找到内容，内容暂存在中间变量
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
  //内容赋给中间变量
    _tempStr=string;

}

//解析结束标签调用，给模型元素赋值；
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if ([elementName isEqualToString:@"book"]) {
        [_bookArr addObject:_mode];
    }else if(![elementName isEqualToString:@"bookstore"]){
        NSLog(@"====key=%@=====value==%@",elementName,_tempStr);
        //kvc
        [_mode setValue:_tempStr forKey:elementName];
    }
}


//文档解析结束调用
-(void)parserDidEndDocument:(NSXMLParser *)parser{
    NSLog(@"=====%ld",_bookArr.count);
}

//文档解析失败调用
-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    NSLog(@"失败");
}

-(void)domClick{
//1 获取路径xml
    NSURL *urlPath=[[NSBundle mainBundle] URLForResource:@"bookstore" withExtension:@"xml"];
//2xml=====>Data
    NSData *data=[[NSData alloc] initWithContentsOfURL:urlPath];
    
 //3 将data转换成Dom树对象
    NSError *error;
    GDataXMLDocument *Document=[[GDataXMLDocument alloc] initWithData:data options:0 error:&error];
  //取出根元素
   GDataXMLElement *rootElement=[Document rootElement];
  //取出book元素
    NSArray *bArr=[rootElement elementsForName:@"book"];
    
    _bookArr=[NSMutableArray array];
    
    //元素转成mode
    for (GDataXMLElement *element in bArr) {
     _mode=[BookMode new];
        
    //取出属性
    _mode.category=[[element attributeForName:@"category"] stringValue];
    //取出元素 title
     GDataXMLElement *titleElement=[element elementsForName:@"title"][0];
     //title属性 lang
      _mode.lang=[[titleElement attributeForName:@"lang"] stringValue];
      _mode.title=[titleElement stringValue];
     //author
    GDataXMLElement *authorElement=[element elementsForName:@"author"][0];
        _mode.author=[authorElement stringValue];
    //year
    _mode.year=[[element elementsForName:@"year"][0] stringValue];
    //price
    _mode.price=[[element elementsForName:@"price"][0] stringValue];
    [_bookArr addObject:_mode];
    }
    
    NSLog(@"=====%ld",_bookArr.count);
}


-(void)addsuviewe{
    UIButton *btn=[UIButton    buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(100, 100, 100, 40);
    [btn setTitle:@"SAX" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor blueColor]];
    [btn addTarget:self action:@selector(saxCcick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    UIButton *btn1=[UIButton    buttonWithType:UIButtonTypeCustom  ];
    btn1.frame=CGRectMake(100, 160, 100, 40);
    [btn1 setBackgroundColor:[UIColor blueColor]];
    [btn1 setTitle:@"DOM" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(domClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn1];

}


- (void)viewDidLoad {
    [self addsuviewe];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
