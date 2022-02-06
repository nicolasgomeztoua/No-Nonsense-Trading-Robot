//+------------------------------------------------------------------+
//|                                                    Algo NNFX.mq4 |
//|                                                    Nicolas Gomez |
//|                        https://nicolasnourgomeztoua.netlify.app/ |
//+------------------------------------------------------------------+
#property copyright "Nicolas Gomez"
#property link      "https://nicolasnourgomeztoua.netlify.app/"
#property version   "1.00"
#property strict
bool orderHolder;
#include  <../Include/GetMinutesRemaining.mqh>
#include <../Include/ASCTrend.mqh>
#include <../Include/CandleVolatilityIndex.mqh>
#include <../Include/KijunSen.mqh>
#include <../Include/BB_PRC.mqh>
#include <../Include/BuySellVol.mqh>
#include <../Include/DetermineRiskLots.mqh>
#include <../Include/BuyExit2.mqh>
#include <../Include/SellExit2.mqh>
#include <../Include/TradesOnSymbol.mqh>
#include <../Include/MoveSLToBreakEven.mqh>
#include <../Include/FindPipValue.mqh>

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

   Print("Stopping Algo");
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
//Global Variables

int buyOrderTicket1 = 0;
int buyOrderTicket2 = 0;
int sellOrderTicket1 = 0;
int sellOrderTicket2 = 0;



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {

   double AverageTrueRange = iATR(NULL, 0, 14, 0);
   moveSLToBreakEven(buyOrderTicket1, buyOrderTicket2);
   moveSLToBreakEven(sellOrderTicket1, sellOrderTicket2);

   if(!getMinutesRemaining())
     {
      return;
     }


   if(trades_on_symbol(Symbol()))
     {

      buyExit(buyOrderTicket1, buyOrderTicket2);
      sellExit(sellOrderTicket1,sellOrderTicket2);

      return;
     }




   double riskLots = NormalizeDouble(determineRiskLots(Symbol(), AverageTrueRange),2);

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   if("BUY" == ASC() && "BUY" == SBVOL() && "BUY" == BBPRC() && "TRADE" == CVI() && "BUY" == KIJUN(AverageTrueRange))
     {
      double stopLoss = Ask - (1.5 * AverageTrueRange);
      double takeProfit = Ask + AverageTrueRange;
      buyOrderTicket1 = OrderSend(_Symbol, OP_BUY, riskLots, Ask, 50, 0, 0, NULL, 05072001, 0, clrBlue);
      buyOrderTicket2 = OrderSend(_Symbol, OP_BUY, riskLots, Ask, 50, 0, 0, NULL, 05072001, 0, clrBlue);
      orderHolder =OrderModify(buyOrderTicket1, 0, stopLoss, takeProfit, 0, clrNONE);
      orderHolder =OrderModify(buyOrderTicket2, 0, stopLoss, 0, 0, clrNONE);
      return;
     }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   if("SELL" == ASC()&& "SELL" == SBVOL() && "SELL" ==  BBPRC() && "TRADE" == CVI() && "SELL" == KIJUN(AverageTrueRange))
     {
      double stopLoss = Bid + (1.5 * AverageTrueRange);
      double takeProfit = Bid - AverageTrueRange;
      sellOrderTicket1 = OrderSend(_Symbol, OP_SELL, riskLots, Bid, 50, 0, 0, NULL, 05072001, 0, clrRed);
      sellOrderTicket2 = OrderSend(_Symbol, OP_SELL, riskLots, Bid, 50, 0, 0, NULL, 05072001, 0, clrRed);
      orderHolder =OrderModify(sellOrderTicket1,0, stopLoss,takeProfit,0,clrYellow);
      orderHolder =OrderModify(sellOrderTicket2,0, stopLoss, 0, 0, clrYellow);
      return;
     }

  }
//+------------------------------------------------------------------+
