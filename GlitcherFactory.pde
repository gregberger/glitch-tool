

class GlitcherFactory{
    
   
   public GlitcherInterface getGlitcher(char pressedKey){
     int intkey = pressedKey - 48;
     
     switch (intkey){
        case 1:{
          return new GlitcherOne();
        }
        case 2:{
          return new GlitcherTwo();  
        }
        case 3:{
          return new GlitcherThree();
        }
        case 4:{
          return new GlitcherFour();
        }
        case 5:{
          return new GlitcherFive();
        }
        case 6:{
          return new GlitcherSix();
        }
        case 7:
        case 8:
        case 9:
        case 0:
        default:{
          return new GlitcherOne();
        }
     }  
     
   }
}