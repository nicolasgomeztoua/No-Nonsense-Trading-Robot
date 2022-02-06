string KIJUN(double ATR)
  {
   double KijunSen = iCustom(Symbol(), Period(), "kijun-sen", 15, 9, 1,0);
   
   bool baselineAtrFromPrice = (MathAbs((KijunSen - Close[0])) > ATR);
   

   if(baselineAtrFromPrice)
     {
      return "noTrade";
     }

   if(Close[0] > KijunSen)
     {
      return "BUY";
     }
   if(Close[0] < KijunSen)
     {
      return "SELL";
     }
   return NULL;

  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
