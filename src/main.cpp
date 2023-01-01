#include "AppDelegate.hpp"

#include <windows.h>
#include <tchar.h>
// #include <stdlib.h>
// #include <stdio.h>
// #include <unistd.h>
// #include <string>

USING_NS_AX;

// int main(int argc, char** argv)
// {
//     // create the application instance
//     AppDelegate app;
//     return Application::getInstance()->run();
// }

int WINAPI _tWinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPTSTR lpCmdLine, int nCmdShow)
{
    UNREFERENCED_PARAMETER(hPrevInstance);
    UNREFERENCED_PARAMETER(lpCmdLine);

    // create the application instance
#ifdef USE_WIN32_CONSOLE
    AllocConsole();
    freopen("CONIN$", "r", stdin);
    freopen("CONOUT$", "w", stdout);
    freopen("CONOUT$", "w", stderr);
#endif

    // create the application instance
    AppDelegate app;
    int ret = Application::getInstance()->run();

#ifdef USE_WIN32_CONSOLE
    FreeConsole();
#endif
}
