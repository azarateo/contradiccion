//
//  detalleContradiccionHome.m
//  contradiccion
//
//  Created by alejandro on 4/4/14.
//  Copyright (c) 2014 azarateo. All rights reserved.
//

#import "detalleContradiccionHome.h"

@interface detalleContradiccionHome ()


@end

@implementation detalleContradiccionHome
@synthesize textoTitulo;
@synthesize campoTextoTitulo;



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self actualizarUI];
}
-(void)actualizarUI{
    self.campoTextoTitulo.text = textoTitulo;
}


@end
