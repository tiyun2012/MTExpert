//+------------------------------------------------------------------+
//|                                              GUIExample.mq4      |
//|                        Copyright 2023, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property strict

input color buttonColor=clrDodgerBlue;
input string buttonText="Click Me";
input color labelColor=clrWhite;
input string labelText="This is a label";

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   CreateButton("MyButton", 10, 10, 100, 30, buttonColor, buttonText);
   CreateLabel("MyLabel", 120, 10, labelColor, labelText);
   
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Create Button                                                    |
//+------------------------------------------------------------------+
void CreateButton(string name, int x, int y, int width, int height, color bgColor, string text)
  {
   ObjectCreate(name, OBJ_RECTANGLE_LABEL, 0, TimeCurrent(), y, TimeCurrent() + PeriodSeconds(), y - height);
   ObjectSetInteger(0, name, OBJPROP_COLOR, bgColor);
   ObjectSetInteger(0, name, OBJPROP_SELECTED, 0);
   ObjectSetInteger(0, name, OBJPROP_SELECTABLE, 0);
   ObjectSetString(0, name, OBJPROP_TEXT, text);
   ObjectSetInteger(0, name, OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetInteger(0, name, OBJPROP_XDISTANCE, x);
   ObjectSetInteger(0, name, OBJPROP_YDISTANCE, y);
  }

//+------------------------------------------------------------------+
//| Create Label                                                     |
//+------------------------------------------------------------------+
void CreateLabel(string name, int x, int y, color fontColor, string text)
  {
   ObjectCreate(name, OBJ_TEXT, 0, TimeCurrent(), y);
   ObjectSetInteger(0, name, OBJPROP_COLOR, fontColor);
   ObjectSetString(0, name, OBJPROP_TEXT, text);
   ObjectSetInteger(0, name, OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetInteger(0, name, OBJPROP_XDISTANCE, x);
   ObjectSetInteger(0, name, OBJPROP_YDISTANCE, y);
  }

//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id, const long &lparam, const double &dparam, const string &sparam)
  {
   if (id == CHARTEVENT_OBJECT_CLICK)
     {
      if (sparam == "MyButton")
        {
         Print("Button was clicked");
         // Your logic after button click
        }
     }
  }

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll();
  }

//+------------------------------------------------------------------+
