//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string SBVOL()
  {
   double SellVol = iCustom(Symbol(), Period(), "Buy Sell volume 2 mtf & alerts", "Current time frame", 14, 0, 0);

   double BuyVol = iCustom(Symbol(), Period(), "Buy Sell volume 2 mtf & alerts", "Current time frame", 14, 1, 0);

   if(BuyVol != EMPTY_VALUE)
     {
      return "BUY";
     }
   if(SellVol != EMPTY_VALUE)
     {
      return "SELL";
     }
   return NULL;

  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
