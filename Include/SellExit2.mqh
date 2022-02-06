//+------------------------------------------------------------------+
//|                                                     SellExit.mqh |
//|                                                    Nicolas Gomez |
//|                        https://nicolasnourgomeztoua.netlify.app/ |
//+------------------------------------------------------------------+
#property copyright "Nicolas Gomez"
#property link      "https://nicolasnourgomeztoua.netlify.app/"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void sellExit(int Trade1, int Trade2)
  {
   double trixRED = iCustom(Symbol(), Period(), "trixq4x4", 5, 4, 1, 0);
   
   double Kijun = iCustom(Symbol(), Period(), "MA rsi mtf 1_1", 0, 13, 1, 0, 14, 50, 0, 0);

   double trixGreen = iCustom(Symbol(), Period(), "trixq4x4", 5, 4, 0, 0);

   bool minTrixDif = MathAbs(trixGreen) - MathAbs(trixRED) >= 0.010;


   if((trixRED < trixGreen && minTrixDif) || Close[0] > Kijun)
     {

      if(Trade1 > 0 && Trade2 > 0)
        {
         orderHolder =OrderClose(Trade1,OrderLots(),Ask,50,clrNONE);
         orderHolder =OrderClose(Trade2,OrderLots(),Ask,50,clrNONE);
         sellOrderTicket1 = sellOrderTicket2 = 0;
        }
      if(Trade1 == 0 && Trade2 > 0)
        {
         orderHolder =OrderClose(Trade2,OrderLots(),Ask,50,clrNONE);
         sellOrderTicket2 = 0;

        }
     }
  }
//+------------------------------------------------------------------+
