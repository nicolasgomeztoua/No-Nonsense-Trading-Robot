//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void moveSLToBreakEven(int Trade1, int Trade2)
  {

   if(OrderSelect(Trade1, SELECT_BY_TICKET, MODE_HISTORY))
     {
      double SL = OrderOpenPrice();

      if(OrderType() == OP_SELL && OrderClosePrice() <= OrderTakeProfit())
        {

         orderHolder=OrderModify(Trade2, 0, SL, 0, 0, clrNONE);

        }
      if(OrderType() == OP_BUY && OrderClosePrice() >= OrderTakeProfit())
        {
         orderHolder=OrderModify(Trade2, 0, SL, 0, 0, clrNONE);

        }
     }

  }
//+------------------------------------------------------------------+
