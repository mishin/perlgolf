use Modern::Perl;
use Test::More;
use IPC::Open3;

my @testcases = (
    {
        in => '         
         
         
    b    
   bwb   
         
         
         
         
',
        out => "6 5\n"
    },
    {
        in => '         
         
         
         
   bwb   
    b    
         
         
         
',
        out => "4 5\n"
    },
    {
        in => '         
         
         
    b    
    wb   
    b    
         
         
         
',
        out => "5 4\n"
    },
    {
        in => '         
         
         
    b    
   bw    
    b    
         
         
         
',
        out => "5 6\n"
    },
    {
        in => '         
         
wb       
b        
         
         
         
         
         
',
        out => "2 1\n"
    },
    {
        in => '         
         
b        
wb       
         
         
         
         
         
',
        out => "5 1\n"
    },
    {
        in => '         
         
b        
w        
b        
         
         
         
         
',
        out => "4 2\n"
    },
    {
        in => '         
         
         
         
         
        b
       bw
         
         
',
        out => "8 9\n"
    },
    {
        in => '         
         
         
         
         
       bw
        b
         
         
',
        out => "5 9\n"
    },
    {
        in => '         
         
         
         
        b
        w
        b
         
         
',
        out => "6 8\n"
    },
    {
        in => '   wb    
   b     
         
         
         
         
         
         
         
',
        out => "1 3\n"
    },
    {
        in => '  bw     
   b     
         
         
         
         
         
         
         
',
        out => "1 5\n"
    },
    {
        in => '  bwb    
         
         
         
         
         
         
         
         
',
        out => "2 4\n"
    },
    {
        in => ' wb      
 b       
         
         
         
         
         
         
         
',
        out => "1 1\n"
    },
    {
        in => '         
         
         
         
         
         
         
     b   
    bw   
',
        out => "9 7\n"
    },
    {
        in => '         
         
         
         
         
         
         
     b   
     wb  
',
        out => "9 5\n"
    },
    {
        in => '         
         
         
         
         
         
         
         
    bwb  
',
        out => "8 6\n"
    },
    {
        in => '         
         
         
         
         
         
         
       b 
      bw 
',
        out => "9 9\n"
    },
    {
        in => 'wb       
         
         
         
         
         
         
         
         
',
        out => "2 1\n"
    },
    {
        in => 'w        
b        
         
         
         
         
         
         
         
',
        out => "1 2\n"
    },
    {
        in => '       bw
         
         
         
         
         
         
         
         
',
        out => "2 9\n"
    },
    {
        in => '        w
        b
         
         
         
         
         
         
         
',
        out => "1 8\n"
    },
    {
        in => '         
         
         
         
         
         
         
         
wb       
',
        out => "8 1\n"
    },
    {
        in => '         
         
         
         
         
         
         
b        
w        
',
        out => "9 2\n"
    },
    {
        in => '         
         
         
         
         
         
         
        b
        w
',
        out => "9 8\n"
    },
    {
        in => '         
         
    b    
   bwb   
   bwb   
         
         
         
         
',
        out => "6 5\n"
    },
    {
        in => '         
         
         
   bwb   
   bwb   
    b    
         
         
         
',
        out => "3 5\n"
    },
    {
        in => '         
         
    b    
    wb   
   bwb   
    b    
         
         
         
',
        out => "4 4\n"
    },
    {
        in => '         
         
    b    
   bwb   
    wb   
    b    
         
         
         
',
        out => "5 4\n"
    },
    {
        in => '         
         
    b    
   bw    
   bwb   
    b    
         
         
         
',
        out => "4 6\n"
    },
    {
        in => '         
         
    b    
   bwb   
   bw    
    b    
         
         
         
',
        out => "5 6\n"
    },
    {
        in => '         
         
wb       
wb       
b        
         
         
         
         
',
        out => "2 1\n"
    },
    {
        in => '         
b        
w        
wb       
b        
         
         
         
         
',
        out => "3 2\n"
    },
    {
        in => '         
         
        b
       bw
       bw
         
         
         
         
',
        out => "6 9\n"
    },
    {
        in => '         
         
        b
       bw
        w
        b
         
         
         
',
        out => "5 8\n"
    },
    {
        in => '  bww    
   bb    
         
         
         
         
         
         
         
',
        out => "1 6\n"
    },
    {
        in => '  bwwb   
   b     
         
         
         
         
         
         
         
',
        out => "2 5\n"
    },
    {
        in => '         
         
         
         
         
         
         
   bb    
   wwb   
',
        out => "9 3\n"
    },
    {
        in => '         
         
         
         
         
         
         
    b    
  bwwb   
',
        out => "8 4\n"
    },
    {
        in => 'wwb      
 b       
         
         
         
         
         
         
         
',
        out => "2 1\n"
    },
    {
        in => 'ww       
bb       
         
         
         
         
         
         
         
',
        out => "1 3\n"
    },
    {
        in => '         
         
         
         
         
         
        b
        w
       bw
',
        out => "8 8\n"
    },
    {
        in => '         
         
         
         
         
         
         
       bw
       bw
',
        out => "7 9\n"
    },
    {
        in => '         
         
         
   bbb   
  bwwwb  
   bwb   
         
         
         
',
        out => "7 5\n"
    },
    {
        in => '         
         
         
   b b   
  bwwwb  
   bwb   
    b    
         
         
',
        out => "4 5\n"
    },
    {
        in => '         
         
         
   bbb   
  bwwwb  
   bw    
    b    
         
         
',
        out => "6 6\n"
    },
    {
        in => '         
         
         
    bb   
  bwwwb  
   bwb   
    b    
         
         
',
        out => "4 4\n"
    },
    {
        in => '         
         
   b b   
  bw wb  
  bwwwb  
   bwb   
    b    
         
         
',
        out => "4 5\n"
    },
    {
        in => '         
         
   bbb   
  bw wb  
  bwwwb  
   bwb   
    b    
         
         
',
        out => "4 5\n"
    },
    {
        in => '         
         
   bbb   
  bwwwb  
  bw wb  
   bwb   
    b    
         
         
',
        out => "5 5\n"
    },
    {
        in => '   bwb   
   bwb   
   bwb   
bbbwwwbbb
wwww wwww
bbbbwbbbb
   bwb   
   bwb   
   bwb   
',
        out => "5 5\n"
    },
    {
        in => '   bbb   
   bwb   
   bwb   
bbbwwwbbb
bwww wwwb
bbbbwbbbb
   bwb   
   bwb   
   bbb   
',
        out => "5 5\n"
    },
    {
        in => '         
         
         
bbbb bbbb
bwwwwwwwb
bbbbbbbbb
         
         
         
',
        out => "4 5\n"
    },
    {
        in => '         
  bbbbb  
 bwwwwwb 
 bwb bwb 
 bwb bwb 
 bwbbbwb 
 bwwwwwb 
  bbbbb  
         
',
        out => "4 5\n"
    },
    {
        in => 'wb       
         
   b     
  bwb    
  bwwb   
    b    
         
       bw
       bw
',
        out => "2 1\n6 4\n7 9\n"
    },
    {
        in => '         
         
   bwb   
  bwbwb  
  bw wb  
   bbb   
         
         
         
',
        out => "2 5\n5 5\n"
    },
    {
        in => '         
         
   b b   
  bwbwb  
  bw wb  
   b b   
         
         
         
',
        out => "5 5\n"
    },
    {
        in => '         
         
   b b   
  bwbwb  
  bw wb  
   bwb   
   bwb   
    b    
         
',
        out => "5 5\n"
    },
    {
        in => '         
    w    
   bwb   
  bwbwb  
  bw wb  
   bbb   
         
         
         
',
        out => "5 5\n"
    },
    {
        in => '   ww    
   bb    
         
  bb     
  wwb    
   b     
         
       b 
       ww
',
        out => ""
    },
    {
        in => '         
         
   bwb   
  bwwwb  
  bw wb  
   bbb   
         
         
         
',
        out => ""
    },
);

my ( $in, $out, $err );
open $err, '>', '/dev/null';
foreach my $testcase (@testcases) {
    open3( $in, $out, $err, 'perl go_golf.pl' );
    print $in $testcase->{in};
    close $in;
    is( join( '', <$out> ), $testcase->{out}, "$testcase->{in} output" );
    is( join( '', <$err> ), '', "$testcase->{in} error" );
}

done_testing();
