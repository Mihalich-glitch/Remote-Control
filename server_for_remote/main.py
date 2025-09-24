from fastapi import FastAPI

app = FastAPI()

@app.get('/items/{item_id}')
async def hello(item_id: int):
    return {"hello": item_id}