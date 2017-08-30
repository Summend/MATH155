I=imread ('Fig3.37(a).jpg') ;
w=[1/9 1/9 1/9
1/9 1/9 1/9
1/9 1/9 1 / 9 ] ;
img = conv2 ( double ( I ) ,w, ' same ' ) ;
subplot ( 1 , 2 , 1 )
imshow( uint8 ( I ) )
subplot ( 1 , 2 , 2 )
imshow( uint8 ( img ) )
