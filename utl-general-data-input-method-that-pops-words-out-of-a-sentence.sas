Popping words out of a sentence                                                                                  
                                                                                                                 
A FCMP subroutine is given that pops words off a string and returns                                              
The word and the reduced sentence. Routine pops from                                                             
the beginning and ennd of a string.                                                                              
                                                                                                                 
github                                                                                                           
https://tinyurl.com/ycqntnuz                                                                                     
https://github.com/rogerjdeangelis/utl-general-data-input-method-that-pops-words-out-of-a-sentence               
                                                                                                                 
related to                                                                                                       
https://tinyurl.com/y73owtnb                                                                                     
https://stackoverflow.com/questions/54486078/using-input-properly-with-datalines                                 
                                                                                                                 
INPUT                                                                                                            
=====                                                                                                            
                                                                                                                 
27Feb11 2011 $15,000 $373,700 The Kings Speech 02/26/2012 8.2                                                    
07Mar10 2010 $11,000 $12,647 The Hurt Locker 02/26/2012 7.2                                                      
22Feb09 2009 $15,000 $141,319 Slumdog Millionaire 02/26/2012 8.2                                                 
24Feb08 2008 $25,000 $74,273 No Country for Old Men 02/26/2012 8.2                                               
25Feb07 2007 $90,000 $289,800 The Departed 02/26/2012 8.5                                                        
05Mar06 2006 $6,500 $98,410 Crash 02/26/2012 8.0                                                                 
                                                                                                                 
EXAMPLE OUTPUT                                                                                                   
--------------                                                                                                   
                                                                                                                 
 WORK.HAVE total obs=6                                                                                           
                                                                                                                 
   STR1      STR2      STR3        STR4      STR5                      STR6       STR7                           
                                                                                                                 
  27Feb11    2011    $15,000    $373,700     The Kings Speech          8.2     02/26/2012                        
  07Mar10    2010    $11,000     $12,647     The Hurt Locker           7.2     02/26/2012                        
  22Feb09    2009    $15,000    $141,319     Slumdog Millionaire       8.2     02/26/2012                        
  24Feb08    2008    $25,000     $74,273     No Country for Old Men    8.2     02/26/2012                        
  25Feb07    2007    $90,000    $289,800     The Departed              8.5     02/26/2012                        
  05Mar06    2006     $6,500     $98,410     Crash                     8.0     02/26/2012                        
                                                                                                                 
                                                                                                                 
PROCESS                                                                                                          
=======                                                                                                          
                                                                                                                 
data want;                                                                                                       
 input;                                                                                                          
 array strs $40 str1-str7;                                                                                       
 do idx=1,2,3,4,6,7;                                                                                             
    select(idx);                                                                                                 
       when (1,2,3,4)  call utl_pop(_infile_,strs[idx],"FIRST"); * popsoff word returns reduced _infile_;        
       when (6,7)      call utl_pop(_infile_,strs[idx],"LAST");  * backwards pop;                                
    end; * no need for otherwise;                                                                                
    strs[5]=_infile_;                                                                                            
 end;                                                                                                            
 strs[5]=_infile_;                                                                                               
 keep str:;                                                                                                      
cards4;                                                                                                          
27Feb11 2011 $15,000 $373,700 The Kings Speech 02/26/2012 8.2                                                    
07Mar10 2010 $11,000 $12,647 The Hurt Locker 02/26/2012 7.2                                                      
22Feb09 2009 $15,000 $141,319 Slumdog Millionaire 02/26/2012 8.2                                                 
24Feb08 2008 $25,000 $74,273 No Country for Old Men 02/26/2012 8.2                                               
25Feb07 2007 $90,000 $289,800 The Departed 02/26/2012 8.5                                                        
05Mar06 2006 $6,500 $98,410 Crash 02/26/2012 8.0                                                                 
;;;;                                                                                                             
run;quit;                                                                                                        
                                                                                                                 
