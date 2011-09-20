//
//  Shader.fsh
//  zKids
//
//  Created by Ivan Mochalov on 20.09.11.
//  Copyright 2011 iva-mochalov@yandex.ru. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}
