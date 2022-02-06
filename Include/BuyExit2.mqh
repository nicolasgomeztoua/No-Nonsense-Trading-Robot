//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void buyExit(int Trade1, int Trade2)
  {
   double Kijun = iCustom(Symbol(), Period(), "MA rsi mtf 1_1", 0, 13, 1, 0, 14, 50, 0, 0);
   double trixRED = iCustom(Symbol(), Period(), "trixq4x4", 5, 4, 1, 0);
   double trixGreen = iCustom(Symbol(), Period(), "trixq4x4", 5, 4, 0, 0);
   bool minTrixDif = MathAbs(trixRED) - MathAbs(trixGreen) >= 0.010;
   

   if((trixRED > trixGreen && minTrixDif) || Close[0] < Kijun)
     {
      if(Trade1 > 0 && Trade2 > 0)
        {
         orderHolder =OrderClose(Trade1,OrderLots(),Bid,50,clrNONE);
         orderHolder =OrderClose(Trade2,OrderLots(),Bid,50,clrNONE);
         buyOrderTicket1 = buyOrderTicket2 = 0;
        }
      if(Trade1 == 0 && Trade2 > 0)
        {
         orderHolder =OrderClose(Trade2,OrderLots(),Bid,50,clrNONE);
         buyOrderTicket2 = 0;

        }
     }
  }
//+------------------------------------------------------------------+
