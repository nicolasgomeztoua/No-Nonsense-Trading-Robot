//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool trades_on_symbol(string symbol)
  {
   for(int i=OrdersTotal()-1; OrderSelect(i,SELECT_BY_POS); i--)
      if(OrderSymbol()==symbol && OrderType()<2)
        {
         return true;
        }

   return false;
  }
//+------------------------------------------------------------------+
