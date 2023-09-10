// HelloWorld for MT4GUI 
// Lets include the imports file mt4gui.mqh
#include <mt4gui2.mqh>
  
// global Variable
int hwnd = 0;
int button1 = 0;
  
int OnInit()
  {
    hwnd = WindowHandle(Symbol(),Period()); 
    // Version shall be displayed as comment
    Comment("MT4GUI Version : "+guiVersion());          
    // mark your clients with your apikey - optional - available from version 2.6
    guiVendor("259495BDD3F940996B5FF5475EB0BFFE");
    // In case there have GUI Items on chart, lets remove them all
    guiRemoveAll(hwnd); 
    // Add a button to Chart by 100,100 Coordinate, Width 100 and Height 30
    // Button caption "Click Me"
    button1 = guiAdd(hwnd,"button",100,100,100,30,"Click Me");
    //button2 = guiAdd(hwnd,"button",100,202,100,100,30,"Click Me");
    // Every GUI Item returns a handle
  return(0);
  }
  
  
  
  
int OnDeinit()
  {
   // Very important to cleanup and remove all gui items from chart
   if (hwnd>0) { guiRemoveAll(hwnd);    guiCleanup(hwnd);}
   return(0);
  }
  
  
void OnTick()
{
  // Button GUI Item has Clicked Event to capture
  // You can use "guiIsClicked" command to capture the event
  if (guiIsClicked(hwnd,button1)) PlaySound("ok.wav"); 
}