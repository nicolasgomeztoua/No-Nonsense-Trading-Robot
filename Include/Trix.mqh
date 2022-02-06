//+------------------------------------------------------------------+
//|                                                         Trix.mqh |
//|                                          Nicolas Nour Gomez Toua |
//|                                  https://www.fiverr.com/dajo_77/ |
//+------------------------------------------------------------------+
#property copyright "Nicolas Nour Gomez Toua"
#property link      "https://www.fiverr.com/dajo_77/"
#property strict
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
string TRIX()
  {
   double trixRED = iCustom(Symbol(), Period(), "trixq4x4", 5, 4, 1, 0);
   double trixGreen = iCustom(Symbol(), Period(), "trixq4x4", 5, 4, 0, 0);
   if(trixRED > trixGreen)
     {
      return "SELL";
     }
   if(trixGreen > trixRED)
     {
      return "BUY";
     }
   if(trixGreen == trixRED)
     {
      return "noTrade";
     }
   return NULL;
  }
//+------------------------------------------------------------------+
