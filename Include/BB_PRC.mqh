//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string BBPRC()
  {
   double BB_Prc = iCustom(Symbol(), Period(), "BB_PRC", 0, 0);
   double BB_Baseline = iCustom(Symbol(), Period(), "BB_PRC", 1, 0);
   
   if(BB_Prc > BB_Baseline)
     {
      Print("BUY");
      return "BUY";
     }
   if(BB_Prc < BB_Baseline)
     {
      return "SELL";
     }
   if(BB_Prc == BB_Baseline)
     {
      return "noTrade";
     }
   return NULL;
  }
//+------------------------------------------------------------------+
