/*ChuckJour c;


2::second => now;


<<<c.getInport(0)>>>;

while (true)
      1::second => now;
  */
  
  ChuckJour c;
  
  
  2::second => now;
  
  for (0 => int i; i < 2; i++){
      c.createInPort(8089+i);   
  }
  <<<c.getInport(0)>>>;
  
  while (true)
      1::second => now;