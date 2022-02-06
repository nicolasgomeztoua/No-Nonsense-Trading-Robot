//+------------------------------------------------------------------+
//|                                                DetermineRisk.mqh |
//|                                                    Nicolas Gomez |
//|                        https://nicolasnourgomeztoua.netlify.app/ |
//+------------------------------------------------------------------+
#property copyright "Nicolas Gomez"
#property link      "https://nicolasnourgomeztoua.netlify.app/"
#property strict
#include <./DetermineRiskAmount.mqh>
#include <./FindPipValue.mqh>
//+------------------------------------------------------------------+
//| defines                                                          |
//+------------------------------------------------------------------+
// #define MacrosHello   "Hello, world!"
// #define MacrosYear    2010
//+------------------------------------------------------------------+
//| DLL imports                                                      |
//+------------------------------------------------------------------+
// #import "user32.dll"
//   int      SendMessageA(int hWnd,int Msg,int wParam,int lParam);
// #import "my_expert.dll"
//   int      ExpertRecalculate(int wParam,int lParam);
// #import
//+------------------------------------------------------------------+
//| EX5 imports                                                      |
//+------------------------------------------------------------------+
// #import "stdlib.ex5"
//   string ErrorDescription(int error_code);
// #import
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double determineRiskLots(string symbol, double ATR)
  {


   double tickSize = MarketInfo(symbol, MODE_TICKSIZE);
   double tickValue = MarketInfo(symbol, MODE_TICKVALUE);
   double point = MarketInfo(symbol, MODE_POINT);
   double pointValue = (tickValue/(tickSize/point));
   double riskAmount = determineRiskAmount();
   double riskPoints = ATR * getPipValue(Digits()) * 1.5;
   return ((riskAmount / (pointValue * riskPoints)) / 20);




  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
