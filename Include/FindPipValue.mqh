//+------------------------------------------------------------------+
//|                                                 FindPipValue.mqh |
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
int getPipValue(int digits) {

  if (digits >= 4) {
    return 10000;
  } else {
    return 100;
  };
};
