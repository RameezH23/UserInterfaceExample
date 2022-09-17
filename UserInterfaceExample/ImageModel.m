//
//  ImageModel.m
//  UserInterfaceExample
//
//  Created by Eric Larson on 9/2/20.
//  Copyright © 2020 Eric Larson. All rights reserved.
//

#import "ImageModel.h"

@interface ImageModel()
    @property (strong, nonatomic) NSArray* imageNames;
    @property (strong, nonatomic) NSDictionary *Dict;



@end

@implementation ImageModel
@synthesize imageNames = _imageNames;
@synthesize Dict = _Dict;

+(ImageModel*)sharedInstance{
    static ImageModel* _sharedInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[ImageModel alloc] init];
    } );
    return _sharedInstance;
}

-(NSArray*) imageNames{
    if(!_imageNames)
        _imageNames = @[@"Bill",@"Eric",@"Jeff",@"Obama",@"Girafaphent",@"Pals"];
    
    return _imageNames;
}


-(UIImage*)getImageWithName:(NSString*)name{
    UIImage* image = nil;
    
    image = [UIImage imageNamed:name];
    
    return image;
}

-(NSDictionary *)Dict{
    if(!_Dict){
        UIImage *bill = [self getImageWithName:@"Bill"];
        UIImage *eric = [self getImageWithName:@"Eric"];
        UIImage *jeff = [self getImageWithName:@"Jeff"];
        UIImage *obama = [self getImageWithName:@"Obama"];
        UIImage *girafaphent = [self getImageWithName:@"Girafaphent"];
        UIImage *pals = [self getImageWithName:@"Pals"];
        
        _Dict = @{@"Bill":bill, @"Eric":eric, @"Jeff":jeff, @"Success":obama, @"Girafaphent":girafaphent, @"Pals":pals};
    }
        
    return _Dict;
}

-(void)setDict:(NSDictionary *)Dict{
    _Dict = Dict;
}

-(UIImage*)getImageWithIndex:(NSInteger)index {
    if (index == 0)
        return self.Dict[@"Bill"];
    if (index == 1)
        return self.Dict[@"Eric"];
    if (index == 2)
        return self.Dict[@"Jeff"];
    if (index == 3)
        return self.Dict[@"Obama"];
    if (index == 4)
        return self.Dict[@"Girafaphent"];
    if (index == 5)
        return self.Dict[@"Pals"];

    return self.Dict[@"Bill"];
}

-(NSInteger)numberOfImages {
    return self.Dict.count;
}

-(NSString*)getImageNameForIndex: (NSInteger)index {
    if (index == 0)
        return @"Bill";
    if (index == 1)
        return @"Eric";
    if (index == 2)
        return @"Jeff";
    if (index == 3)
        return @"Obama";
    if (index == 4)
        return @"Girafaphent";
    if (index == 5)
        return @"Pals";
    else
        return @"Bill";
}

@end
