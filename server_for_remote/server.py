import asyncio

from websockets.asyncio.server import serve

# import keyboard

import time


async def hello(websocket):
    message = await websocket.recv()
    print(f"<<< {message}")

    # await websocket.send(greeting)
    # time.sleep(2)
    # keyboard.press_and_release('right')
    # print(f">>> {greeting}")

async def main():
    async with serve(hello, "localhost", 8765) as server:
        await server.serve_forever()

if __name__ == "__main__":
    asyncio.run(main())