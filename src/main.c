#include <raylib.h>

#define VERSION "v0.0.1-b"

bool debug = false;

int main(int argc, char *argv[]) {
    TraceLog(LOG_INFO, "race %s", VERSION);

    if (argc > 1) {
        debug = true;
        TraceLog(LOG_INFO, "DEBUG MODE ACTIVE");
    }

    InitWindow(1000,1000,"race");
    while (!WindowShouldClose()){
        BeginDrawing();
        ClearBackground(debug? GREEN : RAYWHITE);
        DrawText("Hello, world!", 10, 10, 20, DARKGRAY);
        EndDrawing();
    }

    
    CloseWindow();
    return 0;

}