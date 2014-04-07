//
//  detalleContradiccionHome.h
//  contradiccion
//
//  Created by alejandro on 4/4/14.
//  Copyright (c) 2014 azarateo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detalleContradiccionHome : UIViewController

@property (nonatomic, strong) NSString *textoTitulo;
@property (nonatomic, strong) IBOutlet UITextField *campoTextoTitulo;

-(void)actualizarUI;


@end
