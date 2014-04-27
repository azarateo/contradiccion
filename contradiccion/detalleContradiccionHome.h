//
//  detalleContradiccionHome.h
//  contradiccion
//
//  Created by alejandro on 4/4/14.
//  Copyright (c) 2014 azarateo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detalleContradiccionHome : UIViewController

@property (nonatomic, strong) NSString *titulo;
@property (nonatomic, strong) NSString *subtitulo;
@property (nonatomic, strong) IBOutlet UILabel *campoTextoTitulo;
@property (nonatomic, strong) IBOutlet UILabel *campoSubtitulo;


-(void)actualizarUI;


@end
