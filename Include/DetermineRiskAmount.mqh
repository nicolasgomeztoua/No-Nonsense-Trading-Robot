//+------------------------------------------------------------------+
//|                                      DetermineRiskPercentage.mqh |
//|                                                    Nicolas Gomez |
//|                        https://nicolasnourgomeztoua.netlify.app/ |
//+------------------------------------------------------------------+
#property copyright "Nicolas Gomez"
#property link      "https://nicolasnourgomeztoua.netlify.app/"
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
double determineRiskAmount()
  {
   int currentPeriod = Period();
   double accountBalance =  AccountEquity();

   if(currentPeriod == 1440)
     {
      return (0.02 * accountBalance);
     }
   if(currentPeriod == 240)
     {
      return(0.00333333333 * accountBalance);
     }

   if(currentPeriod == 60)
     {
      return (0.00083333333 * accountBalance);
     }
   if(currentPeriod == 15)
     {
      return (0.00020833333 * accountBalance);
     }
   return NULL;
  }



//+------------------------------------------------------------------+
