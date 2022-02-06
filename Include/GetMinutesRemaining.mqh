//+------------------------------------------------------------------+
//|                                          GetMinutesRemaining.mqh |
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
bool getMinutesRemaining()
  {
   int m;
   m=Time[0]+Period()*60-CurTime();
   m=(m-m%60)/60;

   switch(Period())
     {
      case 1440:
         return m < 5;
      case 240:
         return m <3;
      case 60:
         return m < 2;
      case 15:
         return m < 1;
     }

   return false;
  }
//+------------------------------------------------------------------+
