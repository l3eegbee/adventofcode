function checksum = soluce_02_02( array )
  
  [ si, sj ] = size( array );
  e = ~eye( si );
  
  checksums = zeros( si, 1 );
  
  rows = mat2cell( array, ones( 1, si ), sj );
  for i = 1:si
    [ X, Y ] = meshgrid( rows{i} );
    d = X./Y;
    checksums( i ) = d( d == floor( d ) & e );
  end
  
  checksum = sum( checksums );
