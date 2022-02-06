//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string ASC()
  {
   double ASCTrendBuy = iCustom(Symbol(), Period(), "ASCTrend1sig", 4, 300, 1, 0);
   double ASCTrendBuyPrev = iCustom(Symbol(), Period(), "ASCTrend1sig", 4, 300, 1, 1);
   double ASCTrendSell = iCustom(Symbol(), Period(), "ASCTrend1sig", 4, 300, 0, 0);
   double ASCTrendSellPrev = iCustom(Symbol(), Period(), "ASCTrend1sig", 4, 300, 0, 1);

   if(ASCTrendBuy > 0 || ASCTrendBuyPrev > 0)
     {
      return "BUY";
     }
   else
      if(ASCTrendSell > 0 || ASCTrendSellPrev > 0)
        {
         return "SELL";
        }
      else
        {
         return "noTrade";
        }
   return NULL;
  }
//+------------------------------------------------------------------+
