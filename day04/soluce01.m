function total = soluce01( data )
total = sum( cellfun( @(str) length (unique (strsplit (str, ' '))) == length (strsplit (str, ' ')), data ) );