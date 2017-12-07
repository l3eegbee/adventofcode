
f1 = @(str)sum( str( str == str( [ 2:end 1 ] ) ) - '0' )
f2 = @(str)sum( str( str == str( [ (length(str)/2+1):end 1:length(str)/2 ] ) ) - '0' )

