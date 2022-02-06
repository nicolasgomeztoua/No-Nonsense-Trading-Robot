string CVI()
  {
   double CVI = iCustom(Symbol(), Period(), "candle_volatility_index", "-----------Main Inputs------------", 0, 10, 0, 0);
   double CVI_Baseline = iCustom(Symbol(), Period(), "candle_volatility_index", "-----------Main Inputs------------", 0, 10, 1, 0);
   
   if(CVI > CVI_Baseline)
     {
      return "TRADE";
     }
   if(CVI == CVI_Baseline)
     {
      return "noTrade";
     }
   return NULL;
  }
//+------------------------------------------------------------------+
